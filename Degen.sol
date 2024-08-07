// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    address public owner;

    struct StoreItem {
        string ItemName;
        uint Price;
    }
    StoreItem[] public storeItems;
    mapping(address => mapping(uint => uint)) public redeemedItems;

    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender;

        storeItems.push(StoreItem("Sword", 100));
        storeItems.push(StoreItem("Shield", 150));
        storeItems.push(StoreItem("Health Potion", 50));
        storeItems.push(StoreItem("Degen NFT", 200));
        storeItems.push(StoreItem("Degen Gems", 100));
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function mint(address to, uint amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint amount) public {
        _burn(msg.sender, amount);
    }

    function RedeemTokens(uint itemId) external {
        require(itemId < storeItems.length, "Invalid item ID");
        uint itemPrice = storeItems[itemId].Price;
        require(balanceOf(msg.sender) >= itemPrice, "Insufficient balance");

        _burn(msg.sender, itemPrice);
        redeemedItems[msg.sender][itemId] += 1;
    }

    function PlayerInventory(address player) external view returns (string[] memory, uint[] memory, uint[] memory) {
        uint itemCount = storeItems.length;
        uint[] memory itemQuantities = new uint[](itemCount);
        uint redeemedItemCount = 0;

        for (uint i = 0; i < itemCount; i++) {
            itemQuantities[i] = redeemedItems[player][i];
            if (itemQuantities[i] > 0) {
                redeemedItemCount++;
            }
        }

        string[] memory itemNames = new string[](redeemedItemCount);
        uint[] memory itemAmounts = new uint[](redeemedItemCount);
        uint[] memory itemPrices = new uint[](redeemedItemCount);
        uint index = 0;

        for (uint i = 0; i < itemCount; i++) {
            if (itemQuantities[i] > 0) {
                itemNames[index] = storeItems[i].ItemName;
                itemAmounts[index] = itemQuantities[i];
                itemPrices[index] = storeItems[i].Price;
                index++;
            }
        }
        return (itemNames, itemAmounts, itemPrices);
    }
}
