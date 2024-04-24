// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//This might bring out an error on the Vscode because it was initially written on remix and not all the compilers are here.
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe {
    uint256 public mininumUSD = 50*1e18; 
    //Creating an array of addresses that funded this project
    address[] public funders;   
    //Mapping each amount a sender send
    mapping(address=>uint256) public amountFunded;
    // The payable keyword makes this function accept ether
    function fund() public payable   {
        //msg.value helps us to know the value of ether someone is sending,require keyword is also a checker for the value of ether and can also accept error-
        //message for the checker
        require (getConversion(msg.value)>=mininumUSD, "Not enough ether"); // ether stored in Wei, 1Ether=1e18Wei
        //Adding into the array of the funders
        funders.push(msg.sender);
        //Map each address to the amount funded
        amountFunded[msg.sender] = msg.value;
        
    }
    function getPrice() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        //price of eth in terms of usd
        (,int256 answer,,,)=priceFeed.latestRoundData();
        return uint256(answer/1e8);

        
    }
    function getVersion() public view returns(uint256) {
        AggregatorV3Interface versiionFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return versiionFeed.version();
    }
    function getDescription() public view returns (string memory)  {
         AggregatorV3Interface descriptioneFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return descriptioneFeed.description();
        
    }
    function getConversion(uint256 _ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice*_ethAmount)*1e18;
        return ethAmountInUsd;
    }
} 