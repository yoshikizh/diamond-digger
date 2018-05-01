pragma solidity ^0.4.18;

/**
 * @title 以太挖钻交前端web3.js的api
 */
contract DiamondDiggerApi is ContractDiamondDigger {
  
  /**
   * @title 注册(如不免费阶段则有消费ether)
   * @params account_address 普通账号地址
   * @params nickname 昵称
   * @dev checkUserEnterFee 为验证是否免门票或者账号是否足够支付门票
   */
  function register(address account_address, bytes256 nickname) external checkUserEnterFee() {
    addUser(account_address, nickname);

    // callback 前端注册成功 event
    afterCreateAccount();
  }

  /**
   * @title 登录
   * @params account_address 普通账号地址
   * 登录后返回 账号信息,账号道具,账号钻石等信息 (Todo: 还有其他信息？具体看界面设计)
   */
  function register(address account_address, bytes256 nickname) external views returns(Account account, Item[] user_items, Diamond[] user_diamonds ) {

  }  

  /**
   * @title 开始挖钻
   * @params account_address 普通账号地址
   * @params item_id 使用道具的ID (用于提高成功率)
   * @dev 返回是否挖钻成功 若是成功则返回 64位 diamond_id
   */
  function startDigDiamond(address account_address, uint8 item_id) external returns(bool result, bytes64 diamond_id){

  }

  /**
   * @title 钻石存储到账号(有消费)
   * @params account_address 普通账号地址
   * @params diamond_id 钻石ID (64位hash)
   * @dev 返回是否存储成功
   */
  function saveDiamondToAccount(address account_address, bytes64 diamond_id) external returns(bool) {

  }

  /**
   * @title 钻石放置到交易市场(Todo: 批量放置如何传值，因为每个钻石ID不同)
   * @params account_address 普通账号地址
   * @params diamond_id 钻石ID (64位hash)
   * @params sell_price 出价
   */
  function setOnDiamonsOnMarket(address account_address, bytes64 diamond_id, uint sell_price) external returns(bool) {

  }

  /**
   * @title 钻石下架交易市场
   * @params account_address 普通账号地址
   * @params diamond_id 钻石ID (64位hash)
   */
  function setDownDiamonsOnMarket(address account_address, uint32 diamond_num) external returns(bool) {

  }

  /**
   * @title 购买钻石 (Todo: 批量购买如何传值，因为每个钻石ID不同)
   * @params account_address 普通账号地址
   * @params diamond_id 钻石ID (64位hash)
   * @dev
   *  验证1: 检查当前调用者账号余额是否足够购买
   *  验证2: 检查钻石是否在交易市场(避免买到没有在交易市场的钻石)
   */
  function buyDiamond(address account_address, bytes64 diamond_id) external returns(bool) {

  }

  /**
   * @title 压钻
   * @params account_address 普通账号地址
   * @params diamonds 钻石ID列表
   * @params item_id 使用道具的ID (用于提高成功率)
   * @dev 多颗钻石压成一颗更高级的钻石
   *  验证: 道具和钻石是否存在于当前账号中，并且没有被放置在交易市场
   *  
   */
  function compressDiamond(address account_address, bytes64[] diamonds, uint8 item_id) external returns(bool) {

  }



}