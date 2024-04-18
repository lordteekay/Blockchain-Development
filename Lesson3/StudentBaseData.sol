// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./StudentData.sol";

contract BaseData {
    StudentData[] public studentDataArray;
    uint256 public numOfAddress;
    function createData() public returns(uint) {
        // StudentData studentData = new StudentData();
        // studentDataArray.push(studentData);
        studentDataArray.push(new StudentData());
        return numOfAddress=studentDataArray.length;
    }

    function studentAdd(uint256 _studentIndex, uint256 _studentDataNum) public {
        StudentData studentData = studentDataArray[_studentIndex];
        studentData.Nonsense(_studentDataNum);
    }
    function studentGet(uint256 _studentIndex ) public view returns(uint256) {
        StudentData studentData = studentDataArray[_studentIndex];
        return studentData.retrieve();
    } 
}
