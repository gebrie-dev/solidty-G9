// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;
    mapping(address => bool) public hasVotedMapping;

    function createVote(Choices choice) external {
        require(!hasVotedMapping[msg.sender], "Address has already voted");

        Vote memory newVote = Vote({
            choice: choice,
            voter: msg.sender
        });
        votes.push(newVote);
        hasVotedMapping[msg.sender] = true;
    }

    function getVoteIndex(address voter) internal view returns (uint) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return i;
            }
        }
        revert("Vote not found");
    }

    function hasVoted(address voter) external view returns (bool) {
        uint voteIndex = getVoteIndex(voter);
        return true;
    }

    function findChoice(address voter) external view returns (Choices) {
        uint voteIndex = getVoteIndex(voter);
        return votes[voteIndex].choice;
    }

    function changeVote(Choices newChoice) external {
        uint voteIndex = getVoteIndex(msg.sender);
        votes[voteIndex].choice = newChoice;
    }
}
