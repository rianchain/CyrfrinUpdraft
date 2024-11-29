// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// hanya mengimport satu contract yaitu SimpleStorage saja di SimpleStorage.sol
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    // deklarasi contract yang kita import dengan penamaan baru
    SimpleStorage[] public listOfSimpleStorageContracts;
    // address[] public listOfSimpleStorageAddresses;
     


    function createSimpleStorageContract() public {
        // logika kode untuk membuat contract dari simpleStorage.sol
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }    

    function sfStore(uint256 _simpleStorageindex, uint256 _newSimpleStorageNumber) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageindex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }

}