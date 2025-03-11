// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract TokenTestERC20 is ERC20, Ownable {
    constructor(address initialOwner) ERC20("TokenTestERC20", "TKN") Ownable(initialOwner) {
        mint(msg.sender, 100*(10 ** 18));
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
