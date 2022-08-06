pragma solidity ^0.8.0;

import "./ownable.sol";

contract Products is Ownable {
  struct Product {
    uint256 id;
    uint256 id_shop;
    uint8 status;
    string title;
    string description;
    string images;
    string combinations;
    uint256 created_at;
    uint256 updated_at;
  }

  Product[] public products;

  function getProducts() public view returns(Product[] memory){
    return products;
  }

  function createProduct(uint256 _id_shop, uint8 _status, string memory _description, string memory _title, string memory _images, string memory _combinations) external onlyOwner {
    products.push(Product(products.length, _id_shop, _status, _description, _title, _images, _combinations, block.timestamp, block.timestamp));
  }  

  function getProductsByShop(uint256 _id) public view returns(Product[] memory) {
    Product[] memory result = new Product[](products.length);
    uint counter = 0;
    for (uint i = 0; i < products.length; i++) {
      if (_id == products[i].id_shop) {
        result[counter] = products[i];
        counter++;
      }
    }

    return result;
  }
}