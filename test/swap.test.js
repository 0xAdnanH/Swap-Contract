const { expect } = require("chai");
const { ethers } = require("hardhat");

let swapContract;
let tokenContract;
let NFTcontract;
let token1Contract;
let tokenOwner;
let nftOwner;

before(async () => {
  [tokenOwner, nftOwner] = await ethers.getSigners();
  const tokenFactory = await ethers.getContractFactory("BaseToken");
  const tokenFactory1 = await ethers.getContractFactory("BaseToken1");
  const NFTFactory = await ethers.getContractFactory("BaseNFT");
  const swapfactory = await ethers.getContractFactory("SwapContract");
  tokenContract = await tokenFactory.deploy("token", "USDC");
  token1Contract = await tokenFactory1.deploy("token1", "MATIC");
  NFTcontract = await NFTFactory.deploy("Non-Fungible-Tokens", "NFT");
  swapContract = await swapfactory.deploy();
});

describe("Constructor Test", () => {
  it("should assign correct params", async () => {
    expect(await tokenContract.name()).to.equal("token");
  });
});
describe("Minting functions", () => {
  it("should mint token successfully", async () => {
    await tokenContract.mintToken(tokenOwner, 2000);
    expect(await tokenContract.balanceOf(tokenOwner)).to.equal(2000);
  });
  it("should mint nft successfully", async () => {
    await NFTcontract.mintNFT(nftOwner, 1);
    await NFTcontract.mintNFT(nftOwner, 25);
    await NFTcontract.mintNFT(nftOwner, 50);
    expect(await NFTcontract.balanceOf(nftOwner)).to.equal(3);
    expect(await NFTcontract.ownerOf(1)).to.equal(nftOwner.address);
    expect(await NFTcontract.ownerOf(25)).to.equal(nftOwner.address);
    expect(await NFTcontract.ownerOf(50)).to.equal(nftOwner.address);
  });
});

describe("Swap Function Test", () => {
  it("should swap successfully ", async () => {
    await tokenContract.connect(tokenOwner).approve(swapContract, 1000);
    await NFTcontract.connect(nftOwner).approve(swapContract, 1);
    await swapContract
      .connect(nftOwner)
      .nftToSell(1, NFTcontract, 500, tokenContract);

    await swapContract
      .connect(tokenOwner)
      .swap(1, NFTcontract, tokenContract, 500);
    expect(await tokenContract.balanceOf(tokenOwner)).to.equal(1500);
    expect(await tokenContract.balanceOf(nftOwner)).to.equal(500);
    expect(await NFTcontract.ownerOf(1)).to.equal(tokenOwner.address);
  });
  it("should revert if tokenOwner passed a different tokenAddress", async () => {
    await tokenContract.connect(tokenOwner).approve(swapContract, 100);
    await NFTcontract.connect(nftOwner).approve(swapContract, 25);
    await swapContract
      .connect(nftOwner)
      .nftToSell(25, NFTcontract, 100, token1Contract);

    await expect(
      swapContract.connect(tokenOwner).swap(25, NFTcontract, tokenContract, 100)
    ).to.be.revertedWith("Token amount is zero or not matching the price");
  });
  it("should revert if tokenOwner balance is less than tokenAmount to be payed", async () => {
    await tokenContract.connect(tokenOwner).approve(swapContract, 100);
    await NFTcontract.connect(nftOwner).approve(swapContract, 25);
    await swapContract
      .connect(nftOwner)
      .nftToSell(25, NFTcontract, 2500, tokenContract);

    await expect(
      swapContract
        .connect(tokenOwner)
        .swap(25, NFTcontract, tokenContract, 2500)
    ).to.be.revertedWith("Insufficient balance");
  });
});
