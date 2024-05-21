// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address[] public members;
    mapping(address => bool) public isExistingMember;

    constructor() {
        members.push(msg.sender);
        isExistingMember[msg.sender] = true;
    }

    function addMember(address newMember) external {
        require(isExistingMember[msg.sender], "Only existing members can add new members");
        members.push(newMember);
        isExistingMember[newMember] = true;
    }

    function removeLastMember() external {
        require(isExistingMember[msg.sender], "Only existing members can remove members");
        require(members.length > 1, "Cannot remove the last member");
        
        address lastMember = members[members.length - 1];
        members.pop();
        isExistingMember[lastMember] = false;
    }

    function isMember(address memberAddress) public view returns (bool) {
        return isExistingMember[memberAddress];
    }
}
