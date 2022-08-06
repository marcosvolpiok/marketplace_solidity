const Carts = artifacts.require('Carts')

module.exports = async function(deployer, network, accounts) {
  await deployer.deploy(Carts)
  const carts = await Carts.deployed()

}
