pragma solidity ^0.8.0;

import "./ownable.sol";

contract OrderProducts is Ownable {
  struct OrderProduct {
    uint256 id_order;
    uint256 id_product;
    string combination;
    uint256 created_at;
    uint256 updated_at;
  }

  OrderProduct[] public orderProducts;

  function createOrderProduct(uint256 _id_shop, uint256 _id_product, string memory _combination) external onlyOwner {
    orderProducts.push(OrderProduct(_id_shop, _id_product, _combination, block.timestamp, block.timestamp));
  }
  

  function getOrderProductsByOrder(uint256 _id) public view returns(OrderProduct[] memory) {
    OrderProduct[] memory result = new OrderProduct[](orderProducts.length);
    uint counter = 0;
    for (uint i = 0; i < orderProducts.length; i++) {
      if (_id == orderProducts[i].id_order) {
        result[counter] = orderProducts[i];
        counter++;
      }
    }

    return result;
  }

  
}