const OrderProducts = artifacts.require('OrderProducts')

module.exports = async function(deployer, network, accounts) {
  await deployer.deploy(OrderProducts)
  const orderProducts = await OrderProducts.deployed()

}
