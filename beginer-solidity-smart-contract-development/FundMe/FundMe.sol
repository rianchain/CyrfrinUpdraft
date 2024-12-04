// algorithm smart contracts:
// Get funds from users
// Withdrawl funds
// Set a minimum funding value in usd

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 5000000000000000;
    address public funders;


    function fund() public payable {
        // Allow users to send $
        // Have a minimum sent in $
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enough ETH. At least Minimum deposit is 1 ETH!"); // 1e18 = 1 eth = 100000000000000000
    }

    function withdraw() public {

    }

    function getPrice() public view returns (uint256) {
        // Address of ETH/USD : 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (
        , // uint80 roundID
        int256 price,
        , // uint256 startedAt
        , // uint256 updatedAt
        // uint80 answeredInRound
    ) = priceFeed.latestRoundData();
    return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}
