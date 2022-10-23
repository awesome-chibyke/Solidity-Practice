// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract SimpleStorage{

    bool public hasFavoriteNumber = true;
    uint favoriteNumber = 5;
    string favouriteNumberInText = "Five";
    address myAddress = 0x2614f7fa4E504358d8B1515f4f356c6DB9B4603B;
    bytes32 favoriteByte = "cat";

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    //create a mapping to hold the people
    mapping(string => uint) public peoplesMap;

    People public persons = People({favoriteNumber:1, name:'Agbo Chibueze'});
    People[] public peoples;

    function storeNumber(uint _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function addPeople(uint256 _favoriteNumber, string memory _name) public {
        peoples.push(People(_favoriteNumber, _name));
        peoplesMap[_name] = _favoriteNumber;
    }

}