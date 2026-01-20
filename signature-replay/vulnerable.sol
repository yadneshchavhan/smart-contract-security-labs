// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SignatureReplayVulnerable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function execute(
        address to,
        uint256 amount,
        bytes calldata signature
    ) external {
        bytes32 hash = keccak256(abi.encode(to, amount));
        address signer = recover(hash, signature);
        require(signer == owner, "invalid signature");

        payable(to).transfer(amount);
    }

    function recover(bytes32 hash, bytes memory sig)
        internal
        pure
        returns (address)
    {
        bytes32 ethHash =
            keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));

        (bytes32 r, bytes32 s, uint8 v) = split(sig);
        return ecrecover(ethHash, v, r, s);
    }

    function split(bytes memory sig)
        internal
        pure
        returns (bytes32 r, bytes32 s, uint8 v)
    {
        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }
    }

    receive() external payable {}
}
