# Ether Wallet

In this simple tutorial, we'll build a simple Ether wallet smart contract in order to review some fundamental concepts about sending and receiving funds to in from smart contract.

<p align="center">
  <img src="https://user-images.githubusercontent.com/22610163/221370598-9c796df9-e71f-41c4-a6ad-5b4827a30c1e.png" {width=30px height=300px}>
</p>

# Contract Architecture Overview

### Requirements

**1-)** Anyone can send in Ether.

**2-)** Only the owner can withdraw Ether.


| Variables | Functions    |
|-----------|--------------|
| owner     | withdraw()   |
|           | receive()    |
|           | getBalance() |


if we look back at our account and we had selected the first account that means this is our owner account now we have slightly less than 100 ether so what happened here why did our balance go down well anything you do on the ethereum blockchain costs gas which means there's there's a cost to executing any kind of code on the blockchain


contract is working as expected um it's a simple wallet not much to it but i think it was just important to go through this simple exercise to sort of solidify some of the core concepts around sending money receiving money and how that works with contracts.


## Citation
If you use this code for your publications, please cite it as:

    @ONLINE{vdtcbs,
        author = "Ahmet Özlü",
        title  = "Ethereum Smart Contract Samples",
        year   = "2023",
        url    = "https://github.com/ahmetozlu/ethereum-smart-contract-samples/tree/main/Ether-Wallet-Smart-Contract-Tutorial"
    }

## Author
Ahmet Özlü

## License
This system is available under the MIT license. See the LICENSE file for more info.
