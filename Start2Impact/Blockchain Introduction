// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fundraising {
    uint public donatedAmount;
    address public owner;
    uint public goalAmount;
    uint public donorsCount;
    bool public isClosed;
    
    // Traccia le donazioni per indirizzo e orario
    mapping(address => uint) public donations;
    mapping(address => uint) public donationTimestamps;
    
    // Evento per tracciare le donazioni, il completamento e i prelievi della raccolta fondi
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

    // Modifier per controllare che solo il proprietario possa chiamare certe funzioni
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    // Modifier per controllare che la raccolta fondi sia ancora aperta
    modifier fundraisingOpen() {
        require(!isClosed, "Fundraising is now closed");
        _;
    }

    function donate() public payable fundraisingOpen {
        require(msg.value > 0, "You must donate an amount greater than 0");

        // Add the donated amount to the donated amount
        donatedAmount += msg.value;
        if (donations[msg.sender] == 0) {
            donorsCount++; // Conta solo nuovi donatori unici
        }
        donations[msg.sender] += msg.value;

        // Registra il timestamp della donazione
        donationTimestamps[msg.sender] = block.timestamp;

        // Emette un evento con il timestamp
        emit DonationReceived(msg.sender, msg.value, block.timestamp, donatedAmount);
        // If we have reached the goal, we close the fundraising
        if (donatedAmount >= goalAmount) {
            isClosed = true;
            emit FundraisingClosed(donatedAmount, donorsCount, true);
        }
    }

    function withdraw() public onlyOwner {
        // require(msg.sender == owner, "Only the owner can withdraw");
        // require(!isClosed, "Fundraising is already closed"); se il prelievo deve avvenire solo dopo la chiusura della raccolta
        uint amount = address(this).balance;
        require(amount > 0, "No funds available");
        // Prima effettua i cambiamenti di stato
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
    // Funzione per controllare se l'obiettivo è stato raggiunto
    function isGoalReached() public view returns (bool) {
        return donatedAmount >= goalAmount;
    }
    // Funzione che restituisce il saldo attuale del contratto
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
