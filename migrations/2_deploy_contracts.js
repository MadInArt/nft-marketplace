const CryptoBirds = artifacts.require("CryptoBirds");

module.exports = function (deployer) {
  deployer.deploy(CryptoBirds);
};
