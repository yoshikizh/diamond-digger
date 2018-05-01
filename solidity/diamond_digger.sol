pragma solidity ^0.4.18;

import "./contract_base.col";

/**
 * @title 以台挖钻核心逻辑
 */
contract ContractDiamondDigger is ContractBase {
  
  /**
   * 钻石结构
   * hash - 唯一hash值
   * karat - 克拉 1-64
   * created_time - 被挖出的时间
   * created_block_hash - 产生于哪个区块
   * belongs_to_account - 所属账号
   * on_market - 是否被放置在交易市场
   * on_market_ether - 在交易市场上的标价(单位 ether)
   */
  struct Diamond {
    bytes64 id,
    uint8 karat,
    uint32 created_time,
    uint256 created_block_hash,
    address belongs_to_account,
    bool on_market,
    uint on_market_ether
  }

  /**
   * 道具结构
   * id - 0-255
   * name - 名称
   * description - 描述
   * created_time - 获得得时间
   * belongs_to_account - 所属账号
   */
  struct ItemInfo {
    uint8 id,
    bytes256 name,
    string description
  }

  /**
   * 道具结构
   * id - 0-255
   * created_time - 获得得时间
   * belongs_to_account - 所属账号
   */
  struct Item {
    uint8 id,
    uint32 created_time,
    address belongs_to_account
  }

  /**
   * 账号结构
   * nickname - 玩家昵称
   * last_digging_time - 上一次挖钻时间
   * cooling_time - 当前玩家冷却时间 单位: 秒 (固定时间 or 根据使用道具动态?)
   */
  struct Account {
    bytes256 nickname;
    uint32 last_digging_time;
    uint16 cooling_time;
  }

  // 普通账户的相关映射，用于获取账户数据 (eg: g 开头为全局变量)
  mapping (address => Account) g_user_accounts_mapping;
  mapping (address => Diamond) g_user_diamonds_mapping;
  mapping (address => Item) g_user) g_items_mapping;

  // 存储道具信息(仅初始化时一次性存储)
  ItemInfo[] iteminfos = [];

  // 定义web3.js event
  event afterCreateAccount();

  /**
   * 构造函数
   * 创建一些初始化数据
   */
  function ContractDiamondDigger(){
    iteminfos.push(ItemInfo(0,"道具0","道具0描述"))
    iteminfos.push(ItemInfo(1,"道具1","道具1描述"))
    iteminfos.push(ItemInfo(1,"道具2","道具2描述"))
  }

  /**
   * @title 注册账号
   * @params account_address 外部账号地址
   * @params nickname 昵称
   */
  function addUser(address account_address, bytes256 nickname) internal {
    Account account = Account(nickname, 0, 0);
    g_user_accounts_mapping[account_address] = account;
  }

  function getUserAccount(address account) internal {

  }

  function getUserItmes() internal{

  }

  function getUserDiamonds() internal{

  }

  function(){

  }
}