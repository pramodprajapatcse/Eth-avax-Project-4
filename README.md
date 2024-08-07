# ETH-AVAX-Project-4
# DegenToken

DegenToken is an ERC20 token deployed on the Avalanche Fuji Test Network. This token includes a simple store where users can redeem their tokens for store items. The token also includes basic functionalities such as minting, burning, and transferring tokens.

## Overview

DegenToken is implemented using the OpenZeppelin ERC20 contract. The contract includes the following features:

- **Minting**: Only the contract owner can mint new tokens.
- **Burning**: Any token holder can burn their tokens.
- **Transfer**: A player can transfer tokens to other players.
- **Balance**: Player can check their balance.
- **RedeemTokens**: A player can redeem the store items by paying specific price.

## Contract Details

- **Token Name**: Degen
- **Token Symbol**: DGN
- **Initial Supply**: 0 DGN

## Functions

### Owner-Only Functions

1. **mint(address to, uint amount)**
   - Mints new tokens and assigns them to the specified address.
   - Only callable by the contract owner.

### Public Functions

1. **RedeemTokens(uint itemId)**
   - Redeems tokens for a store item. The token price of the item is transferred from the caller to the owner.
   - Callable by any user with sufficient token balance.

2. **burn(uint amount)**
   - Burns a specified amount of tokens from the caller's balance.
   - Callable by any user.

3. **PlayerInventory(address player)**
   - Shows the redeem Items by the player in his inventory.
   - it returns Item-Name,Item-Amounts,Item-Price.

## Deployment

This contract is deployed on the Avalanche Fuji Test Network. 

To interact with the contract using Remix:

1. **Open Remix**: Go to [Remix IDE](https://remix.ethereum.org/).
2. **Load Contract**: Copy and paste the contract code into a new file in Remix.
3. **Install OpenZeppelin**: Ensure you have imported the OpenZeppelin ERC20 contract.
4. **Compile Contract**: Use the Solidity compiler to compile the contract.
5. **Deploy Contract**: Deploy the contract using the "Injected Web3" environment in Remix and connect your wallet configured for the Avalanche Fuji Test Network.



## Authors

- Pramod Prajapat - [Your Contact Information](https://twitter.com/pramodprajapat)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.


This README provides a clear and concise overview of your DegenToken project without including the actual contract code, ensuring it is user-friendly and easy to understand.
