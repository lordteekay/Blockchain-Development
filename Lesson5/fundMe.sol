// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
 import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    uint256 public mininumUSD = 50*1e18; 
    //Creating an array of addresses that funded this project
    address[] public funders;   
    //Mapping each amount a sender send
    mapping(address=>uint256) public addressToAmountFunded;

    address public owner;
    //Creating a constructor for the owner to be able to withdraw the funds
    constructor( ) {
        owner = msg.sender;
    }



    // The payable keyword makes this function accept ether
    function fund() public payable   {
        //msg.value helps us to know the value of ether someone is sending,require keyword is also a checker for the value of ether and can also accept error-
        //message for the checker
        require (msg.value.getConversion()>=mininumUSD, "Not enough ether"); // ether stored in Wei, 1Ether=1e18Wei
        //Adding into the array of the funders
        funders.push(msg.sender);
        //Map each address to the amount funded
        addressToAmountFunded[msg.sender] = msg.value;
        
    }
    function withdraw() public onlyOwner {
        //using a for loop to iterate through the arrar of addresses
        for (uint256 funderIndex=0; funderIndex<funders.length; funderIndex++) 
        {
            //Getting the first address into an a variable
            address funder = funders[funderIndex];
            //Empty the fund in the address
            addressToAmountFunded[funder] = 0;
        }
        //reseting the array
        funders = new address[](0);
        /*Withdrawing the funds,msg.sender=address just an address but here we need a payable address which is payable(msg.sender)*/
        /*Using the send keyword*/
        //bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //require(sendSuccess,"send failed");
        /*Using call is the most preferrable way to withdraw now*/
        (bool callSuccess,) = payable (msg.sender).call{value:address(this).balance}("");
        require (callSuccess,"Call failed");
    }
    //Creating a modifier for the owner to be able to withdraw the funds,where the _ mean it should run the rest of the code
    modifier onlyOwner{
        require(msg.sender == owner, "Sender is not the owner!");
        _;
    }

}