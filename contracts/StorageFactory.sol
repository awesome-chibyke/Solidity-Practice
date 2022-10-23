// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

import "./SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public simpleStorageArray;

    function callSimpleStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    //call the storeNumber function inside the simple storage
    function sFstoreNumber(uint _index, uint _favortieNumber) public {
        //create a variable of the simplestorage type
        SimpleStorage simpleStorage = simpleStorageArray[_index];
        //call the storenumber fruntion inside the simpleStorage contract
        simpleStorage.storeNumber(_favortieNumber);
    }

    //call the storeNumber function inside the simple storage
    function sFretrieve(uint _index) public view returns(uint) {
        //create a variable of the simplestorage type
        SimpleStorage simpleStorage = simpleStorageArray[_index];
        //call the storenumber fruntion inside the simpleStorage contract
        return simpleStorage.retrieve();
    }

}