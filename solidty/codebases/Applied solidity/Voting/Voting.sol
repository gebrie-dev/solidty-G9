// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
        mapping(address => bool) hasVoted;
        mapping(address => bool) votes;
    }

    // Public array to store proposals
    Proposal[] public proposals;

    // Mapping to track authorized members
    mapping(address => bool) public members;

    // Event to be emitted when a new proposal is created
    event ProposalCreated(uint proposalId);

    // Event to be emitted when a vote is cast
    event VoteCast(uint proposalId, address voter);

    // Event to be emitted when a proposal is executed
    event ProposalExecuted(uint proposalId);

    // Constructor to initialize the list of authorized members
    constructor(address[] memory _members) {
        // Add the deployer to the members list
        members[msg.sender] = true;

        // Add the provided addresses to the members list
        for (uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
    }

    // Modifier to restrict access to members only
    modifier onlyMembers() {
        require(members[msg.sender], "Not an authorized member");
        _;
    }

    // External function to create a new proposal
    function newProposal(address _target, bytes calldata _data) external onlyMembers {
        // Create a new proposal with yesCount and noCount initialized to 0
        Proposal storage newProposal = proposals.push();
        newProposal.target = _target;
        newProposal.data = _data;
        newProposal.yesCount = 0;
        newProposal.noCount = 0;
        newProposal.executed = false;

        // Emit the ProposalCreated event
        emit ProposalCreated(proposals.length - 1);
    }

    // External function to cast a vote on a proposal
    function castVote(uint proposalId, bool support) external onlyMembers {
        // Ensure the proposalId is valid
        require(proposalId < proposals.length, "Invalid proposal ID");

        // Get the proposal
        Proposal storage proposal = proposals[proposalId];

        // Check if the voter has voted before
        if (proposal.hasVoted[msg.sender]) {
            // If the vote is different from the previous vote, update the counts
            if (proposal.votes[msg.sender] != support) {
                if (support) {
                    proposal.noCount -= 1;
                    proposal.yesCount += 1;
                } else {
                    proposal.yesCount -= 1;
                    proposal.noCount += 1;
                }
            }
        } else {
            // If the voter hasn't voted before, just increment the relevant count
            if (support) {
                proposal.yesCount += 1;
            } else {
                proposal.noCount += 1;
            }
            proposal.hasVoted[msg.sender] = true;
        }

        // Record the voter's vote
        proposal.votes[msg.sender] = support;

        // Emit the VoteCast event
        emit VoteCast(proposalId, msg.sender);

        // Execute the proposal if it has 10 yes votes and is not already executed
        if (proposal.yesCount >= 10 && !proposal.executed) {
            executeProposal(proposalId);
        }
    }

    // Internal function to execute a proposal
    function executeProposal(uint proposalId) internal {
        Proposal storage proposal = proposals[proposalId];
        
        // Ensure the proposal has not been executed yet
        require(!proposal.executed, "Proposal already executed");

        // Mark the proposal as executed
        proposal.executed = true;

        // Execute the proposal
        (bool success, ) = proposal.target.call(proposal.data);
        require(success, "Proposal execution failed");

        // Emit the ProposalExecuted event
        emit ProposalExecuted(proposalId);
    }
}

