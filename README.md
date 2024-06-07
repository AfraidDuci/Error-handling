README for StoreInventory Contract
# Overview
The StoreInventory contract is designed to manage the inventory of a store on the Ethereum blockchain. It provides functionalities to add, update, and remove inventory items, along with the ability to transfer ownership of the contract. This smart contract ensures that all modifications are only made by the owner of the contract, utilizing Solidity's require, revert, and assert statements for state validation and error handling.

# Features
## Owner Authentication: 
Ensures that only the owner can interact with core functionalities of the contract.
## Add or Update Inventory: 
Allows the owner to add new items or update existing ones in the inventory.
Remove Inventory Items: Provides functionality for the owner to remove items from the inventory if they exist.
## Query Inventory:
Public function to check the quantity of any item in the inventory.
Reduce Item Quantity: Allows the owner to reduce the quantity of an item, with proper checks to ensure that the operation is valid.
## Validate Inventory:
Uses assert to check for invariants within the contract to ensure internal states are consistent.
Transfer Ownership: Allows the current owner to transfer ownership of the contract to another address.

# Functions
setItem(string memory item, uint quantity)
Modifiers: onlyOwner
Description: Adds a new item or updates an existing item in the inventory. The item name must not be empty, and the quantity must be greater than zero.
getItem(string memory item)
Returns: uint representing the quantity of the item.
Description: Retrieves the quantity of an item from the inventory.
removeItem(string memory item)
Modifiers: onlyOwner
Description: Removes an item from the inventory. If the item does not exist or has a quantity of zero, the transaction is reverted with an appropriate error message.
reduceItemQuantity(string memory item, uint quantity)
Modifiers: onlyOwner
Description: Reduces the quantity of an item. If the specified reduction quantity is greater than the available quantity, the transaction will fail.
validateInventory(string memory item)
Description: Asserts that the inventory quantity for an item does not exceed 1000 units. This is an invariant check within the system.
transferOwnership(address newOwner)
Modifiers: onlyOwner
Description: Transfers ownership of the contract to another address. The new owner address must not be the zero address.
Usage
To use this contract, deploy it to an Ethereum-compatible network using tools like Remix, Truffle, or Hardhat. Once deployed, the owner (deployer) can manage the inventory using the provided functions. Other users can query the inventory but cannot modify it.

## Development and Testing
To develop and test this contract:

Clone the repository containing the contract.
Install dependencies (if any).
Use a development framework like Truffle or Hardhat for testing. Set up local test environments using Ganache.
Write and run tests to ensure that all functionalities work as expected and handle edge cases appropriately.

## License
This project is licensed under the MIT License.

Ensure that you are in compliance with the license and understand the limitations it imposes. Always test smart contracts extensively on test networks before deploying to the main network.