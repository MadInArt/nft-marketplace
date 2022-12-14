module.exports = {
  contracts_directory: "./contracts",
  contracts_build_directory: "./contracts/abi",
  networks: {
    development: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 7545,            // Standard Ethereum port (default: none)
      network_id: "*"      // Any network (default: none)
    }
  },
  // Configure your compilers
  compilers: {
    solc: {
      version: "^0.8.17",      // Fetch exact version from solc-bin (default: truffle's version)
      parser: "solcjs",
      optimizer: {
        enabled: "true",
        runs: 200
      }
    }
  }
};
