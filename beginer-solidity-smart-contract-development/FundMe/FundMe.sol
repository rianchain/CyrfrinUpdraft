// algorithm smart contracts:
// Get funds from users
// Withdrawl funds
// Set a minimum funding value in usd

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 10;

    function fund() public payable {
        // Allow users to send $
        // Have a minimum sent in $
        require(msg.value >= minimumUsd, "Didn't send enough ETH. At least Minimum deposit is 1 ETH!"); // 1e18 = 1 eth = 100000000000000000
    }

    function withdraw() public {

    }

    function getPrice() public {
        // Address of ETH/USD : 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
    }

    function getConversionRate() public {

    }

}
