// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {

    uint256 private myFavoriteNumber;

    struct Seseorang {
        uint256 umur;
        string name;
    }

    // dynamic arrays variable untuk menyimpan banyak data tak terhingga
    Seseorang[] public listOfWarga;

    // mapping untuk memetakan string ke angka (memasukan nama = hasilnya umur berupa angka)
    mapping(string => uint256) public namaToUmur;


    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }
    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    function addSeseorang(string memory _name, uint256 _umur) public {
        listOfWarga.push( Seseorang(_umur, _name) );
        namaToUmur[_name] = _umur;
    }
 }

 contract SimpleStorage2 {
    string public text = "Hello Nigga";
 }