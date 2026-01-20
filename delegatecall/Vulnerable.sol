// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DelegatecallVulnerable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function execute(address target, bytes calldata data) external {
        target.delegatecall(data);
    }
}
