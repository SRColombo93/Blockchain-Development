// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract GameAssets is ERC1155, Ownable {

    string public name = "My Game Assets";
    uint256 public constant SPADA = 1;
    uint256 public constant SCUDO = 2;
    uint256 public constant ORO = 3;
    uint256 public constant ARGENTO = 4;

    constructor(address initialOwner) ERC1155("https://crimson-rapid-donkey-354.mypinata.cloud/ipfs/QmSXhbH9eepMtkeqLoRRU3S7T5GncKEY5FJK72aU34xgbi/{id}.json") Ownable(initialOwner) {
        mint (msg. sender, SPADA, 1, "");
        mint (msg. sender, SCUDO, 1, "");
        mint (msg. sender, ORO, 100,"");
        mint (msg. sender, ARGENTO, 100,"");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
