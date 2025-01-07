// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {

    uint256 internal myFavoriteNumber;

    struct Seseorang {
        uint256 umur;
        string name;
    }

    // dynamic arrays variable untuk menyimpan banyak data tak terhingga
    Seseorang[] public listOfWarga;

    // mapping untuk memetakan string ke angka (memasukan nama = hasilnya umur berupa angka)
    mapping(string => uint256) public namaToUmur;


    // fungsi virtual untuk menurunkan fungsi kepada files lain agar dapat di modif
    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }
    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    function addSeseorang(string memory _name, uint256 _umur) public {
        listOfWarga.push( Seseorang(_umur, _name) );
        // nameToUmur untuk memasukan nama yang akan menampikan umur di variable namaToUmur
        namaToUmur[_name] = _umur;
    }
 }

 contract SimpleStorage2 {
    string public text = "Hello Nigger";
 }