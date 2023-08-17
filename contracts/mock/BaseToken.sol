// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
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
