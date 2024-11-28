// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {

    uint256 private myFavoriteNumber;

    struct Seseorang {
        uint256 umur;
        string name;
    }

    Seseorang[] public listOfWarga;

    // Seseorang public tedy = Seseorang({favoriteNumber: 88, name: "tedy"});


    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    function addSeseorang(string memory _name, uint256 _umur) public {
        listOfWarga.push( Seseorang(_umur, _name) );
    }
 }