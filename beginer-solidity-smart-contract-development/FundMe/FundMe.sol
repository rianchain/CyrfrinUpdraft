// algorithm smart contracts:
// Get funds from users
// Withdrawl funds
// Set a minimum funding value in usd

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;


    function fund() public payable {
        // Allow users to send $
        // Have a minimum sent in $
        // msg.value.getConversionRate();
        // uint256 amountInUsd = msg.value.getConversionRate();
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough ETH. At least Minimum deposit is 1 ETH!"); // 1e18 = 1 eth = 100000000000000000
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    function withdraw() public {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);

        payable(msg.sender).transfer(address(this).balance);    }

    

}
