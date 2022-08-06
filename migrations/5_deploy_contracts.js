const Products = artifacts.require('Products')

module.exports = async function(deployer, network, accounts) {
  await deployer.deploy(Products)
  const products = await Products.deployed()

}
