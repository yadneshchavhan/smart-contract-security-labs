// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LogicV1 {
    address public owner;

    function initialize(address _owner) public {
        owner = _owner;
    }

    function privilegedAction() public view returns (string memory) {
        require(msg.sender == owner, "not owner");
        return "admin action";
    }
}
