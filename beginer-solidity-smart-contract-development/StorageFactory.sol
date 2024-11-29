// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// hanya mengimport satu contract yaitu SimpleStorage saja di SimpleStorage.sol
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    // deklarasi contract yang kita import dengan penamaan baru
    SimpleStorage public simpleStorage;


    function createSimpleStorageContract() public {
        // logika kode untuk membuat contract dari simpleStorage.sol
        simpleStorage = new SimpleStorage();
    }    

}