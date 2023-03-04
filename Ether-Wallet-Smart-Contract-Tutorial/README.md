# Ether Wallet

In this simple tutorial, we'll build a simple Ether wallet smart contract in order to review some fundamental concepts about sending and receiving funds from smart contract.

<p align="center">
  <img src="https://user-images.githubusercontent.com/22610163/221370598-9c796df9-e71f-41c4-a6ad-5b4827a30c1e.png" {width=30px height=300px}>
</p>

# Contract Architecture Overview

### Requirements

**1-)** Anyone can send in Ether.

**2-)** Only the owner can withdraw Ether.


| Variables | Functions	|
|-----------|--------------|
| owner 	| withdraw()   |
|       	| receive()	|
|       	| getBalance() |

### Line By Line Explanations

**1.)** First of all, we should set solidity version at line#1:

	pragma solidity ^0.8.11;

**2.)** We define our contract at line#3:
    
	contract EtherWallet {
    	...
	}
    
**3.)** This is the line#4:

	address payable public owner;
   
We define a state variable for the owner because only the owner is able to withdraw funds from the wallet so the only way for our code to know who the owner is. And, our state variable name is owner as given above.

- **address** is variable type and it refers to an Ethereum address.

- **payable** basically functions and addresses are declaired payable can receive ether. Thus, it's very important that this owner be payable since he's going to be withdrawing funds and receiving that ether into his account.

- **public** means this variable is visible to other functions inside the smart contract also outside the smart contract. And also solidity compiler generate getter functions automatically for public variables.

 **4.)** A constructor function so basically a constructor function is called one time during the lifecycle of a smart contract and that is at the time when the contract is deployed to the blockchain. So the constructor is called one time and it's a good opportunity to run any sort of initialization code and in this example we'll be using this opportunity to set the owner address and here is our constructor at line#6:
 
 	constructor() {
      owner = payable(msg.sender);
 	}

**Explanation of line#7:** message is a global variable that is available within a solidity program and message.sender will basically give us an ethereum address of the the address or the entity the person who is deploying this contract at the given time okay so this will be the the owner's address now by default message.sender is not payable so that's why we have to convert it or cast it to a payable type in order to set the owner variable since we've said that the owner variable is of type payable

**5.)** Now, let's discover the receive function.

	receive() external payable {}

Allow our smart contract to receive ether or receive funds coming into it so it's a type of default function that allows the smart contract to receive funds so as long as there's no call data or any kind of parameters sent in with the function that is sending ether to the contract then receive will be invoked and will allow the contract to receive funds and so another good point here is that sometimes it can be confusing to talk about sending funds to a smart contract because usually we're used to sending funds from one wallet to another wallet well a smart contract can actually act like a wallet in a certain way in that it can it's able to receive and hold funds just like any normal wallet would so that's why we can create a smart contract that can act as a savings account or as a type of wallet which we're doing in this case okay so that's all this function is doing it's allowing our smart contract to receive funds to receive ether, another interesting point to note about the receive function is that it doesn't require the function keyword so it's sort of special in that way.

**6.)** Here is our withdraw function. It's often used in solidity programming to denote a function parameter as opposed to a state variable or a variable inside of a function so it's just sort of a convention which you can use or not.

	function withdraw(uint _amount) external {  
    	require(msg.sender == owner, "Only the owner can call this method.");
    	payable(msg.sender).transfer(_amount);
	}
    
**7.)** getBalance function:

	function getBalance() external view returns (uint) {
    	return address(this).balance;
	}

- **Explanation of line#17:** to query the balance of the smart contract at any given time, external means but basically external functions are part of the contract interface and that means that they can be called from other outside contracts and also via transactions for example by other third-party applications,,, view means that this function is read-only essentially it means that it is allowed to read information from the blockchain but not in any way change it or modify,,, uint unsigned integer

- **Explanation of line#18:** so address this refers to the address of the current smart contract in other words the address of the ether wallet smart contract,,, dot balance the property dot balance simply gives us the balance or the amount of ether that this contract holds

if we look back at our account and we had selected the first account that means this is our owner account now we have slightly less than 100 ether so what happened here why did our balance go down well anything you do on the ethereum blockchain costs gas which means there's there's a cost to executing any kind of code on the blockchain


the contract is working as expected um it's a simple wallet not much to it but i think it was just important to go through this simple exercise to sort of solidify some of the core concepts around sending money receiving money and how that works with contracts.


## Citation
If you use this code for your publications, please cite it as:

	@ONLINE{vdtcbs,
    	author = "Ahmet Özlü",
    	title  = "Ethereum Smart Contract Samples",
    	year   = "2023",
    	url	= "https://github.com/ahmetozlu/ethereum-smart-contract-samples/tree/main/Ether-Wallet-Smart-Contract-Tutorial"
	}

## Author
Ahmet Özlü

## License
This system is available under the MIT license. See the LICENSE file for more info.

