// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title BaseToken
 * @dev This contract extends the ERC20 token standard and provides a function to mint tokens.
 */
contract BaseToken is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}

    /**
     * @dev Mints new tokens and assigns them to the specified recipient.
     * @param recipient The address that will receive the minted tokens.
     * @param amount The amount of tokens to mint.
     */
    function mintToken(address recipient, uint256 amount) public {
        _mint(recipient, amount);
    }
}

/**
 * @title BaseNFT
 * @dev This contract extends the ERC721 token standard and provides a function to mint NFTs.
 */
contract BaseNFT is ERC721 {
    constructor(
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) {}

    /**
     * @dev Mints a new NFT and assigns it to the specified recipient with the given tokenId.
     * @param recipient The address that will receive the minted NFT.
     * @param tokenId The unique identifier for the minted NFT.
     */
    function mintNFT(address recipient, uint256 tokenId) public {
        _mint(recipient, tokenId);
    }
}

/**
 * @title BaseToken1
 * @dev This contract also extends the ERC20 token standard and provides a function to mint tokens.
 * It serves as an example of another contract with similar functionality.
 */
contract BaseToken1 is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}

    /**
     * @dev Mints new tokens and assigns them to the specified recipient.
     * @param recipient The address that will receive the minted tokens.
     * @param amount The amount of tokens to mint.
     */
    function mintToken(address recipient, uint256 amount) public {
        _mint(recipient, amount);
    }
}
