// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 Simplified oracle example:
 - Reads spot price directly
 - No TWAP / no averaging
*/
interface IDEX {
    function getSpotPrice() external view returns (uint256);
}

contract OracleManipulationVulnerable {
    IDEX public dex;
    uint256 public liquidationThreshold = 1500; // USD

    constructor(address _dex) {
        dex = IDEX(_dex);
    }

    function canLiquidate(uint256 ethAmount) external view returns (bool) {
        uint256 price = dex.getSpotPrice(); // manipulable
        return ethAmount * price < liquidationThreshold;
    }
}
