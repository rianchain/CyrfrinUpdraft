// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {

    function sayNigga() public pure returns(string memory) {
        return "FUck Nigga!";
    }

}