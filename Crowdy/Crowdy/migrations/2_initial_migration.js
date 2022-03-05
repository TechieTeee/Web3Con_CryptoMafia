const Crowdy = artifacts.require("Crowdy");

module.exports = function(deployer) {
  deployer.deploy(Crowdy);
};