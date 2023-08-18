require("hardhat-deploy");

require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    Mumbai: {
      live: true,
      chainId: 80001,
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [],
    },
  },
  namedAccounts: {
    deployer: 0,
  },

  etherscan: {
    apiKey: {
      polygonMumbai: "",
    },
  },

  polygonscan: {
    apiKey: "",
    customChains: [
      {
        network: "polygonscan",
        chainId: 80001,
        urls: {
          apiURL: "https://api-testnet.polygonscan.com/",
          browserURL: "https://mumbai.polygonscan.com/",
        },
      },
    ],
  },
  solidity: "0.8.9",
};
