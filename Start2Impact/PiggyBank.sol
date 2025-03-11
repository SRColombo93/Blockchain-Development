Sviluppa un singolo smart contract con le conoscenze maturate nella teoria, ipotizzando che si tratti di un prototipo a uso esclusivamente personale. Non sarà dunque necessario gestire account diversi.

DETTAGLI SPECIFICI

Il contratto sarà il cuore del salvadanaio, e in particolare dovrà contenere:

Una variabile che rappresenti il saldo totale
Una variabile di tipo “address" che rappresenti l’indirizzo del proprietario del salvadanaio, istanziata nel momento in cui viene creato il contratto
Una funzione che permetta di donare Ether al contratto, aggiornando il saldo
Una funzione che permetta, solo al proprietario del salvadanaio, di prelevare gli Ether nel contratto
Nota bene: per poter inviare Ethereum verso un contratto, è necessario aggiungere la parola chiave “payable” alla funzione che viene chiamata per effettuare la donazione!

--------------------------------------------------


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PiggyBank {
    uint public totalBalance;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function donate() public payable {
        // Add the donated amount to the total balance
        totalBalance += msg.value;
    }

    function withdraw() public {
        // Only the owner can withdraw
        require(owner == msg.sender, "Only the owner can withdraw");
        // Transfer all remaining balance to the owner
        payable(owner).transfer(address(this).balance);
        // Reset the total balance
        totalBalance = 0;
    }
}
