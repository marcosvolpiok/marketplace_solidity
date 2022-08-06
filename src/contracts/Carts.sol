pragma solidity ^0.8.0;

import "./ownable.sol";

contract Carts is Ownable {
  struct Cart {
    uint256 id_shop;
    uint256 id_customer;
    uint8 status;
    uint256 created_at;
    uint256 updated_at;
  }

  Cart[] public carts;

  function getCarts() public view returns(Cart[] memory){
    return carts;
  }


  function createCart(uint256 _id_shop, uint256 _id_customer) external onlyOwner {
    carts.push(Cart(_id_shop, _id_customer, 0, block.timestamp, block.timestamp));
  }
  

  function getCartsByCustomer(uint256 _id) public view returns(Cart[] memory) {
    Cart[] memory result = new Cart[](carts.length);
    uint counter = 0;
    for (uint i = 0; i < carts.length; i++) {
      if (_id == carts[i].id_customer) {
        result[counter] = carts[i];
        counter++;
      }
    }

    return result;
  }

  
}