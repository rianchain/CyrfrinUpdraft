// algorithm smart contracts:
// Get funds from users
// Withdrawl funds
// Set a minimum funding value in usd

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public MINIMUM_USD = 5 * 10 ** 18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }


    function fund() public payable {
        
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough ETH. At least Minimum deposit is 1 ETH!"); // 1e18 = 1 eth = 100000000000000000
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    function withdraw() public onlyOwner() {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            // code 
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0); 
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed!");
        
    }

    modifier onlyOwner() {
        // require(msg.sender == i_owner, "Sender is not the owner!");
        if(msg.sender != i_owner) {revert NotOwner();}
        _;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }

}
