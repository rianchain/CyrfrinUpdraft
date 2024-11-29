// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {


    SimpleStorage public simpleStorage;


    function createSimpleStorageContract() public {
        // logika kode untuk membuat contract dari simpleStorage.sol
        simpleStorage = new SimpleStorage();
    }    

}