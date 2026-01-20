// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AccessControlVulnerable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setOwner(address newOwner) public {
        owner = newOwner;
    }

    function sensitiveAction() public view returns (string memory) {
        require(msg.sender == owner, "not owner");
        return "secret action executed";
    }
}
