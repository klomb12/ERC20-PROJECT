const salomoncoin = artifacts.require("salomoncoin");

module.exports = function (deployer) {
  deployer.deploy(salomoncoin);
};
