// algorithm smart contracts:
// Get funds from users
// Withdrawl funds
// Set a minimum funding value in usd

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FundMe {

    uint256 public minimumUsd = 10;

    function fund() public payable {
        // Allow users to send $
        // Have a minimum sent in $
        require(msg.value >= minimumUsd, "Didn't send enough ETH. At least Minimum deposit is 1 ETH!"); // 1e18 = 1 eth = 100000000000000000
    }

    function withdraw() public {

    }

}
