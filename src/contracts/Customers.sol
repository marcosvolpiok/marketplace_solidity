pragma solidity ^0.8.0;

import "./ownable.sol";

contract Customers is Ownable {
  struct Customer {
    uint256 id;
    string first_name;
    string last_name;
    string phisical_address;
    address wallet_address;
    uint8 status;
    uint256 created_at;
    uint256 updated_at;
  }

  Customer[] public customers;

  function getCustomers() public view returns(Customer[] memory){
    return customers;
  }

  function createCustomer(string memory _first_name, string memory _last_name, string memory _phisical_address) public {
    customers.push(Customer(customers.length, _first_name, _last_name, _phisical_address, msg.sender, 0, block.timestamp, block.timestamp));
  }
}