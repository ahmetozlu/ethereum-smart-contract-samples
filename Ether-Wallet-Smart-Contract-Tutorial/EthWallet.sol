// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11; // set solidity version

contract EtherWallet { // define our contract
    address payable public owner; // state variable for the owner because we said that only the owner to be able to widtradw fnds from the wallet so the only way for our code  to know who the owner is. address is variable type and it irefers to an ethereum addres. payable: basicla functions and addresses are declaired payable can receive ether. so it's very important that this owner be payable since he's going to be withdrawing funds and receiving that ether into his account. public means this vairable is visible to other functions inside the smart contract also outside the smart contract.And also solidity compiler generate getter functions automatically for public vairables.

    constructor() { // a constructor function so basically a constructor function is called one time during the lifecycle of a smart contract and that is at the time when the contract is deployed to the blockchain.. so the constructor is called one time and it's a good opportunity to run any sort of initialization code and in this example we'll be using this opportunity to set the owner address
        owner = payable(msg.sender); // message is a global variable that is available within a solidity program and message.sender will basically give us an ethereum address of the the address or the entity the person who is deploying this contract at the given time okay so this will be the the owner's address now by default message.sender is not payable so that's why we have to convert it or cast it to a payable type in order to set the owner variable since we've said that the owner variable is of type payable


    }

    receive() external payable {} // allow our smart contract to receive ether or receive funds coming into it so // it's a type of default function that allows the smart contract to receive funds so as long as there's no call data or any kind of parameters sent in with the function that is sending ether to the contract then receive will be invoked and will allow the contract to receive funds and so another good point here is that sometimes it can be confusing to talk about sending funds to a smart contract because usually we're used to sending funds from one wallet to another wallet well a smart contract can actually act like a wallet in a certain way in that it can it's able to receive and hold funds just like any normal wallet would so that's why we can create a smart contract that can act as a savings account or as a type of wallet which we're doing in this case okay so that's all this function is doing it's allowing our smart contract to receive funds to receive ether // another interesting point to note about the receive function is that it doesn't require the function keyword so it's sort of special in that way


    function withdraw(uint _amount) external {  // it's often used in solidity programming to denote a function parameter as opposed to a state variable or a variable inside of a function so it's just sort of a convention which you you can use or not
        require(msg.sender == owner, "Only the owner can call this method.");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) { // to query the balance of the smart contract at any given time,,,,, external means but basically external functions are part of the contract interface and that means that they can be called from other outside contracts and also via transactions for example by other third-party applications,,, view means that this function is read-only essentially it means that it is allowed to read information from the blockchain but not in any way change it or modify,,, uint unsigned integer

        return address(this).balance; //  so address this refers to the address of the current smart contract in other words the address of the ether wallet smart contract,,, dot balance the property dot balance simply gives us the balance or the amount of ether that this contract holds
    }
}
