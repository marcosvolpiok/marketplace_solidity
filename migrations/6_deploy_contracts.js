const Customers = artifacts.require('Customers')

module.exports = async function(deployer, network, accounts) {
  await deployer.deploy(Customers)
  const customers = await Customers.deployed()

}
