# Token-NFT Swap

The Token-NFT Swap project introduces a swap contract that enables NFT owners to list their NFTs for sale with a specified amount of tokens. Token owners can then swap the designated tokens for the listed NFTs.

## Goals of the Project

The primary goal of the Token-NFT Swap project is to:

- **Target the DeFi Aspect:** Address the decentralized finance (DeFi) aspect of the blockchain ecosystem by integrating the ERC20 and ERC721 standards, along with an intermediary Swap contract.

## Technicalities of the Project

- **Comprehensive Documentation Using Natspec:** The project is extensively documented using Natspec, providing thorough explanations of the functions and overall functionality of the Swap contract.

- **Unit Tests with ethers.js:** The codebase features comprehensive unit tests written using `ethers.js`, ensuring the proper functionality of the implemented swap mechanisms.

- **Deployment and Verification on Mumbai Polygon Testnet:** The project has been deployed and verified on the Mumbai Polygon testnet. You can find the verified contract address on PolygonScan at the following link: [Mumbai Polygon Testnet Contract](https://mumbai.polygonscan.com/address/0x4b602F87C2E13F642486B50FAD908c7C9f15E72B)

- **Swapping ERC20-ERC721 Process:**

  1. The NFT owner registers the NFT for sale with a specified token amount in the Swap Contract.
  2. The NFT owner approves the Swap Contract to handle the NFT.
  3. The token owner approves the Swap Contract to handle the token amount required for the NFT purchase.
  4. The token owner calls the `swap(..)` function, specifying the desired NFT to purchase.
  
If the approved token amount matches the NFT's registered sale price, ownership of the NFT is swapped to the token owner, as well the previous NFT owner receive the specified token amount.

**Note:** The Token-NFT Swap project focuses on the DeFi landscape by enabling token-NFT swaps via a well-documented and tested contract. It is designed to showcase the integration of different standards and contract interactions within the blockchain ecosystem.


## Installation

### Cloning the Repository

You can clone the repository and install its dependencies to start using the provided smart contracts.

```bash
$ git clone https://github.com/0xAdnanH/Token-NFT-Swap.git
$ cd ./Token-NFT-Swap
$ npm install
```

### Instructions

#### Compile

To Compile the contract run:

```bash
$ npx hardhat compile
```

#### Tests

To run the unit tests:

```bash
$ npx hardhat test
```
