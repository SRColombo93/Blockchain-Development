// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fundraising {
    uint public donatedAmount;
    address public owner;
    uint public goalAmount;
    uint public donorsCount;
    bool public isClosed;
    
    // Track donations by address and time
    mapping(address => uint) public donations;
    mapping(address => uint) public donationTimestamps;
    
    // Event to track donations, completion and fundraising withdrawals
    event DonationReceived(address indexed donor, uint amount,  uint timestamp, uint totalRaised);
    event FundraisingClosed(uint totalAmount, uint totalDonators, bool goalReached);
    event FundsWithdrawn(address indexed owner, uint amount);

    constructor (uint _goalAmount) {
        require(_goalAmount > 0, "Goal amount must be greater than 0");
        owner = msg.sender;
        goalAmount = _goalAmount;
        isClosed = false;
        donatedAmount = 0;
        donorsCount = 0;
    }

    // Modifier to control that only the owner can call certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    // Modifier to check that the fundraiser is still open
    modifier fundraisingOpen() {
        require(!isClosed, "Fundraising is now closed");
        _;
    }

    function donate() public payable fundraisingOpen {
        require(msg.value > 0, "You must donate an amount greater than 0");

        // Add the donated amount to the donated amount
        donatedAmount += msg.value;
        if (donations[msg.sender] == 0) {
            donorsCount++; // Count only new unique donors
        }
        donations[msg.sender] += msg.value;

        // Record the timestamp of the donation
        donationTimestamps[msg.sender] = block.timestamp;

        // Issue an event with the timestamp
        emit DonationReceived(msg.sender, msg.value, block.timestamp, donatedAmount);
        // If we have reached the goal, we close the fundraising
        if (donatedAmount >= goalAmount) {
            isClosed = true;
            emit FundraisingClosed(donatedAmount, donorsCount, true);
        }
    }

    function withdraw() public onlyOwner {
        // require(msg.sender == owner, "Only the owner can withdraw");
        // require(!isClosed, "Fundraising is already closed"); if the withdrawal should only take place after the close of the collection
        uint amount = address(this).balance;
        require(amount > 0, "No funds available");
        // Make status changes first
        emit FundsWithdrawn(owner, amount);
        // Transfer the balance to the owner
        payable(owner).transfer(amount);
    }

    function closeFundraising() public onlyOwner {
        // require(msg.sender == owner, "Only the owner can close the fundraising");
        require(!isClosed, "Fundraising is already closed");
        isClosed = true;
        emit FundraisingClosed(donatedAmount, donorsCount, donatedAmount >= goalAmount);
}
    // Function to check if the goal has been reached
    function isGoalReached() public view returns (bool) {
        return donatedAmount >= goalAmount;
    }
    // Function that returns the current contract balance
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
