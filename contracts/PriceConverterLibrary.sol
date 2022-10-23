// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverterLibrary {

    function getPrice() public view returns(int256, uint8){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (
            /*uint80 roundID*/,
            int256 price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();

        uint8 Decimal = priceFeed.decimals();
        return(price, Decimal);
    }

    function getConvertionRate(uint256 _ethAmount) public view returns(uint){
        (int256 usdPriceOfEther,) = getPrice();
        uint256 amountInUsd = (uint256(usdPriceOfEther * 1e10) * _ethAmount) / 1e18;
        return amountInUsd;
    }

}