// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {SimpleStorage} from "./SimpleStorage.sol";

// inheritence contract
contract AddFiveStorage is SimpleStorage {

    // fungsi overide untuk terhbung dan mengambil fungsi turunan dari SimpleStorage untuk di modifikasi
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }

}