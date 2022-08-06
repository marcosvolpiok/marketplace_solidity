pragma solidity ^0.8.0;

import "./ownable.sol";

contract Orders is Ownable {
  struct Order {
    uint256 id_shop;
    uint256 id_customer;
    uint256 id_cart;
    uint8 status;
    uint8 total_amount;
    uint256 created_at;
    uint256 updated_at;
  }

  Order[] public orders;

  function getOrders() public view returns(Order[] memory){
    return orders;
  }


  function createOrder(uint256 _id_shop, uint256 _id_customer, uint256 _id_cart) external onlyOwner {
    /* TO DO
    make the sum from cart and calculate total amount
    */
    uint8 total_amount = 0;
    orders.push(Order(_id_shop, _id_customer, _id_cart, 0, total_amount, block.timestamp, block.timestamp));
  }
  

  function getOrdersByCustomer(uint256 _id) public view returns(Order[] memory) {
    Order[] memory result = new Order[](orders.length);
    uint counter = 0;
    for (uint i = 0; i < orders.length; i++) {
      if (_id == orders[i].id_customer) {
        result[counter] = orders[i];
        counter++;
      }
    }

    return result;
  }

  function getOrdersByShop(uint256 _id) public view returns(Order[] memory) {
    Order[] memory result = new Order[](orders.length);
    uint counter = 0;
    for (uint i = 0; i < orders.length; i++) {
      if (_id == orders[i].id_shop) {
        result[counter] = orders[i];
        counter++;
      }
    }

    return result;
  }  
}