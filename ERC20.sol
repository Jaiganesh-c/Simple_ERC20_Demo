// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    uint256 public tokenPrice = 0 ether;
    address owner;

    constructor(uint256 initialsupply) ERC20("My Token","MVT") {
        _mint(msg.sender, initialsupply);
        owner = msg.sender;
    }

    function getOwner() public view returns(address){
        return owner;

    }
    function transferTokens(address recipient, uint256 amount) public returns(bool){
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function mintTokens(uint256 amount) public payable {
        require(msg.value >= amount * tokenPrice, " Payment required to mint Token");
        //require(msg.sender == owner,"Only owner can mint");
        _mint(msg.sender, amount);
    }


}
