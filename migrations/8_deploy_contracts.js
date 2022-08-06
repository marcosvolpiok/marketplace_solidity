const CartProducts = artifacts.require('CartProducts')

module.exports = async function(deployer, network, accounts) {
  await deployer.deploy(CartProducts)
  const cartProducts = await CartProducts.deployed()

}
