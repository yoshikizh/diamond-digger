pragma solidity ^0.4.18;

import "./contract_base.col";

/**
 * @title 以台挖钻核心逻辑
 */
contract ContractDiamondDigger is ContractBase {
  
  /**
   * 钻石结构
   * token - 唯一hash值
   * karat - 克拉 1-64
   * created_time - 被挖出的时间
   * created_block_hash - 产生于哪个区块
   * digger_account_address - 挖出人账号地址
   */
  struct Diamond {
    bytes64 token_id,
    uint8 karat,
    uint32 created_time,
    uint256 created_block_hash,
    address digger_account_address
  }

  /**
   * 道具种类结构
   * item_type_id - 0-255
   * name - 名称
   * description - 描述
   */
  struct ItemType {
    uint8 item_type_id,
    bytes256 name,
    string description
  }

  /**
   * 道具结构
   * token_id - 唯一hash值
   * created_time - 获得得时间
   * created_block_hash - 产生于哪个区块
   * item_type_id - 对应道具种类(挖钻同时概率性获得不同种类道具)
   */
  struct Item {
    bytes64 token_id,
    uint32 created_time,
    uint256 created_block_hash
    unit8 item_type_id;
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

  // 钻石存储结构
  Diamond[] g_diamonds = [];

  // 道具存储结构
  Item[] g_items = [];

  // 存储道具信息(仅初始化时一次性存储)
  ItemInfo[] g_iteminfos = [];

  // mapping (address => Diamond[]) g_owner_to_diamonds_mapping;
  // mapping (address => Item[]) g_user) g_owner_to_items_mapping;

  // 钻石所属账户 (diamonds 数组 index 作为 key)
  mapping (uint256 => address) g_diamond_index_to_owner_mapping;

  // 道具所属账户 (items 数组 index 作为 key)
  mapping (uint256 => address) g_item_index_to_owner_mapping;

  // 定义web3.js event
  event afterCreateAccount();

  /**
   * 构造函数
   * 创建一些初始化数据
   */
  function ContractDiamondDigger(){
    g_iteminfos.push(ItemInfo(0,"道具0","道具0描述"))
    g_iteminfos.push(ItemInfo(1,"道具1","道具1描述"))
    g_iteminfos.push(ItemInfo(1,"道具2","道具2描述"))
  }

  /**
   * @title 添加用户
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