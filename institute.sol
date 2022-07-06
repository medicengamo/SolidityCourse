// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract institute{
    address owner;
    mapping(address => uint[]) marksBulletin;

    constructor() {
        console.log("Owner contract deployed by:", msg.sender);
        owner = msg.sender; 
    }

    function setMark(address  student, uint mark) public isOwner upZero(mark){
        marksBulletin[student].push(mark);            
    }
    function viewAverage(address student) public view returns (uint){
        uint average = 0;
        uint sum = 0;

        if(marksBulletin[student].length > 0 ){           
            uint[] memory marks = marksBulletin[student];    
            for (uint i=0; i < marks.length; i++) {
                sum += marks[i]; 
            }     
            average = sum / marksBulletin[student].length;
        }
        else{
            console.log("Student has not marks.");
        }
        return average;         
    }

    modifier isOwner() {        
        require(msg.sender == owner, "Caller is not owner");
        _;
    }
    modifier upZero(uint mark){
        require(mark > 0);
        _;
    }
}
