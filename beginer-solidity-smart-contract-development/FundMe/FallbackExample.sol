// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FallbackExample {
    uint256 public result;


    receive() external payable {
        if (msg.value > 0) {
            result++;
        }
    }
    
}

// function bawaan ini untuk menerima ether dengan hanya mengirim ether tanpa harus menggunakan function