// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;



contract StorageFactory {


    SimpleStorage public simpleStorage;


    function createSimpleStorageContract() public {
        // logika kode untuk membuat contract dari simpleStorage.sol
        simpleStorage = new SimpleStorage();
    }    

}