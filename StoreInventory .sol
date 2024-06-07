// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StoreInventory {
    address public owner;
    mapping(string => uint) public inventory;

    constructor() {
        owner = msg.sender;  // Set the owner of the contract to the deployer
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // Function to add or update inventory
    function setItem(string memory item, uint quantity) public onlyOwner {
        require(bytes(item).length > 0, "Item name cannot be empty");
        require(quantity > 0, "Quantity must be greater than zero");

        inventory[item] = quantity;
    }

    // Function to get the quantity of an item
    function getItem(string memory item) public view returns (uint) {
        return inventory[item];
    }

    // Function to remove an item from inventory
    function removeItem(string memory item) public onlyOwner {
        if (inventory[item] <= 0) {
            revert("Item does not exist");
        }else{
        delete inventory[item];

        }            
    }

    // Function to reduce the quantity of an item
    function reduceItemQuantity(string memory item, uint quantity) public onlyOwner {
        require(inventory[item] >= quantity, "Insufficient quantity");
        
        if (inventory[item] == quantity) {
            delete inventory[item];
        } else {
            inventory[item] -= quantity;
        }
    }

    // A function that uses assert to ensure inventory is consistent
    function validateInventory(string memory item) public view {
        // Assert is used here to check for internal errors or invariants
        assert(inventory[item] <= 1000);  
    }

    // Function to transfer ownership
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        owner = newOwner;
    }
}