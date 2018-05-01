pragma solidity ^0.4.18;

/**
 * @title 合约基础类
 * @dev 仅仅实现一些基础的验证逻辑
 */
contract ContractBase {
  
  // 合约所有者
  address public owner;

  // 入场费(如需)
  uint private constant ENTER_FEE = 0.001 ether;

  /**
   * @dev 初始化时设定合约所有者为创建者
   */
  function ContractBase() public {
    owner = msg.sender;
  }

  /**
   * @dev 验证所有者
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev 验证门票
   */
  modifier checkUserEnterFee() {
    // TODO 是否免门票条件验证

    require(!free_enter && sender.value >= ENTER_FEE);
    _;
  }
}