// testing using ZKSYNC TESTNET


// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


library PriceConverter {


    function getPrice() internal  view returns (uint256) {
        // Address of ETH/USD ZKSYNC : 0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF
        // ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF);
        (
        , // uint80 roundID
        int256 price,
        , // uint256 startedAt
        , // uint256 updatedAt
        // uint80 answeredInRound
    ) = priceFeed.latestRoundData();
    return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256){
        // msg.value.getConversionRate();
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        return ethAmountInUsd;
    }

    function getVersion() internal view returns (uint256) {
        return AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF).version();
    }

}

