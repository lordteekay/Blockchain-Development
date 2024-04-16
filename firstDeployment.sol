// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    uint256 public num;
    function store(uint256 _num) public  {
        num = _num * 3;
    }
    //Using the pure and view you can't modify the state of the function and doesn't use gas
    function IDC() public view returns (uint256) {
        return num;
    }
    function WTF() public pure returns (uint256) {
        return (1+1);
    }
    function Nvm() public pure returns (string memory) {
        return "I just said Never mind";
    }
} 
contract TF {
    string name = "My name is Teekay";
    function GTF() public view returns(string memory) {
        return name;
    }
    
    struct stranger{
        string name;
        uint256 age;
    }
    stranger public personA = stranger({name:"Tokunbo Adebayo",age:13});
    stranger[] public people;
    function addPerson(string memory _name, uint256 _age) public {
        people.push(stranger(_name,_age));
    }
}
contract MessUp {
    struct Students{
        string name;
        uint256 age;
        string bestSubject;
    }
    mapping(string => string) public favouriteSubj;
    Students[] public student;
    function addStudent(string memory _name,uint256 _age,string memory _bestSubbject) public {
        student.push(Students( _name, _age,_bestSubbject));
        favouriteSubj[_name]=_bestSubbject;
    }
    function studentLen() public view returns (uint256) {
       return student.length;
    }
    //This one will continue to give zero because it's not updating dynamically.
    uint256 public num = student.length;
}