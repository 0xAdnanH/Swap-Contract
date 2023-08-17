// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

/**
 * @title SwapContract
 * @dev This contract facilitates the swapping of ERC721 tokens for ERC20 tokens.
 */
contract SwapContract {
    // Mapping to store the price of ERC721 tokens for different token addresses and IDs
    mapping(address => mapping(uint256 => mapping(address => uint256)))
        public nftPrice;

    /**
     * @dev Allows an owner of an ERC721 token to set its selling price.
     * @param _tokenId The ID of the ERC721 token.
     * @param _nftAddress The address of the ERC721 contract.
     * @param _price The price in ERC20 tokens at which the ERC721 token will be sold.
     * @param _tokenAddress The address of the ERC20 token used for pricing.
     */
    function nftToSell(
        uint256 _tokenId,
        address _nftAddress,
        uint256 _price,
        address _tokenAddress
    ) external {
        require(
            IERC721(_nftAddress).ownerOf(_tokenId) == msg.sender,
            "Not owner of this token"
        );

        nftPrice[_nftAddress][_tokenId][_tokenAddress] = _price;
    }

    /**
     * @dev Allows a user to swap ERC721 tokens for ERC20 tokens based on the set price.
     * @dev _tokenAmount parameter was added to avoid Front running.
     * @param _tokenId The ID of the ERC721 token to be swapped.
     * @param _nftAddress The address of the ERC721 contract.
     * @param _tokenAddress The address of the ERC20 token used for swapping.
     * @param _tokenAmount The amount of ERC20 tokens required for the swap.
     */
    function swap(
        uint256 _tokenId,
        address _nftAddress,
        address _tokenAddress,
        uint256 _tokenAmount
    ) external {
        require(
            IERC20(_tokenAddress).balanceOf(msg.sender) >= _tokenAmount,
            "Insufficient balance"
        );
        require(
            _tokenAmount == nftPrice[_nftAddress][_tokenId][_tokenAddress] &&
                _tokenAmount != 0,
            "Token amount is zero or not matching the price"
        );
        address ownerOfTokenId = IERC721(_nftAddress).ownerOf(_tokenId);
        IERC20(_tokenAddress).transferFrom(
            msg.sender,
            ownerOfTokenId,
            _tokenAmount
        );
        IERC721(_nftAddress).transferFrom(ownerOfTokenId, msg.sender, _tokenId);
    }
}
