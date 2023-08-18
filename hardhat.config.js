require("hardhat-deploy");

require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    Mumbai: {
      live: true,
      chainId: 80001,
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [
        "8e61e7662cc2bb10af0f30a4c8f284d0b4bdde2e1502574802eddbc6ace47aff",
      ],
    },
  },
  namedAccounts: {
    deployer: 0,
  },

  etherscan: {
    apiKey: {
      polygonMumbai: "CCSKPAJJ874Y2Z537J4SFISNAP5C65PYP8",
    },
  },

  polygonscan: {
    apiKey: "CCSKPAJJ874Y2Z537J4SFISNAP5C65PYP8",
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
