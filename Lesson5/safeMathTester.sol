// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract safeMathTester {
    uint8 public bigNumber =254;
    function add() public {
        unchecked{bigNumber+=1;} 
    }
}