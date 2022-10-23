// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

import "./PriceConverterLibrary.sol";

contract FundMe{

    using PriceConverterLibrary for uint256;

    address public owner;
    uint256 minimumAmountInUsd = 50 * 1e18;
    constructor(){
        owner = msg.sender;
    }

    mapping(address => uint256) public paymentDetails;

    function sendInFunds() public payable {
        require(msg.value.getConvertionRate() > minimumAmountInUsd, "Value sent is lower than the minimum amount allowed");
        paymentDetails[msg.sender] += msg.value;
    }

    function withdrawFunds(address payable _to, uint256 _amount) public payable {
        require(msg.sender == owner, "Access Denied");
        require(_amount > 0, "Invalid amount supplied");
        require(paymentDetails[msg.sender] <= _amount, "Insufficient balance");
        paymentDetails[msg.sender] -= _amount;

        //_to.transfer(_amount);

        //bool sendStatus = _to.send(_amount);
        //require(sendStatus, "Transfer via send function failed");

        (bool callStatus, ) = _to.call{value:_amount}("");
        require(callStatus, "Transfer via send function failed");

    }

}