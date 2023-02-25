// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11; // set solidity version

contract EtherWallet { // define our contract
    address payable public owner; // state variable for the owner because we said that only the owner to be able to widtradw fnds from the wallet so the only way for our code  to know who the owner is. address is variable type and it irefers to an ethereum addres. payable: basicla functions and addresses are declaired payable can receive ether. public means this vairable is visible to other functions inside the smart contract also outside the smart contract.And also solidity compiler generate getter functions automatically for public vairables.

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Only the owner can call this method.");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
