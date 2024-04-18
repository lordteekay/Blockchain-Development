// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract StudentData {
    uint public gibberish;
    // Creating a datatype for the students
    struct Students{
        string name;
        uint256 age;
        string favouriteSubject;
    }
    //Creating an array of student
    Students[] public student;
    //Varable to know the number of student
    uint256 public numOfStudents;
    //mapping into the student data and get their favourite course
    mapping (string => string) public FavouriteSubject;

    //A function to add student into the array
    function addStudent(string memory _name,uint256 _age,string memory _favouriteSubject) public returns (uint256) {
        student.push(Students(_name,_age,_favouriteSubject));
        FavouriteSubject[_name] = _favouriteSubject;
        return numOfStudents = student.length;

    }
    //Function will be later override that's why the virtual keyword is added
    function Nonsense(uint256 _gibberish) public virtual {
        gibberish = _gibberish;
    }
    function retrieve() public view returns(uint256) {
        return gibberish;
    }
}