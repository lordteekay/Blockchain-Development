// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// Importing the student data
import "./StudentData.sol";

//Creating an inheritance from the Student Data
contract ExtraData is StudentData{
    //Overidding the Nonsense Function
    function Nonsense(uint256 _gibberish) public override  {
        gibberish = _gibberish +5;
    }
}