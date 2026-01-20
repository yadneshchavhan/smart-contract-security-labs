// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract FrontRunningVulnerable {
    address public highestBidder;
    uint256 public highestBid;

    function bid() external payable {
        require(msg.value > highestBid, "low bid");
        highestBid = msg.value;
        highestBidder = msg.sender;
    }
}
