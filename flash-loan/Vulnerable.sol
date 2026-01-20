// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract FlashLoanVulnerable {
    mapping(address => uint256) public deposits;

    function deposit() external payable {
        deposits[msg.sender] += msg.value;
    }

    function borrow(uint256 amount) external {
        require(address(this).balance >= amount, "insufficient pool");
        payable(msg.sender).transfer(amount);
    }

    receive() external payable {}
}
