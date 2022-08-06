pragma solidity ^0.8.0;

import "./ownable.sol";

contract CartProducts is Ownable {
  struct CartProduct {
    uint256 id_cart;
    uint256 id_product;
    string combination;
    uint256 created_at;
    uint256 updated_at;
  }

  CartProduct[] public cartProducts;

  function createCartProduct(uint256 _id_shop, uint256 _id_product, string memory _combination) external onlyOwner {
    cartProducts.push(CartProduct(_id_shop, _id_product, _combination, block.timestamp, block.timestamp));
  }
  

  function getCartProductProductsByCart(uint256 _id) public view returns(CartProduct[] memory) {
    CartProduct[] memory result = new CartProduct[](cartProducts.length);
    uint counter = 0;
    for (uint i = 0; i < cartProducts.length; i++) {
      if (_id == cartProducts[i].id_cart) {
        result[counter] = cartProducts[i];
        counter++;
      }
    }

    return result;
  }

  
}