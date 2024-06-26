// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
        function getPrice() internal  view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        //price of eth in terms of usd
        (,int256 answer,,,)=priceFeed.latestRoundData();
        return uint256(answer/1e8);

        
    }
    function getVersion() internal  view returns(uint256) {
        AggregatorV3Interface versionFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return versionFeed.version();
    }
    function getDescription() internal  view returns (string memory)  {
         AggregatorV3Interface descriptioneFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return descriptioneFeed.description();
        
    }
    function getConversion(uint256 _ethAmount) internal  view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice*_ethAmount)*1e18;
        return ethAmountInUsd;
    }
}