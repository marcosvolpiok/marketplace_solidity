const Orders = artifacts.require('Orders')

module.exports = async function(deployer, network, accounts) {
  await deployer.deploy(Orders)
  const orders = await Orders.deployed()

}
