// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
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