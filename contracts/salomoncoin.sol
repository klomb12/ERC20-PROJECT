// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// interface du contract

interface IERC20 {
function totalSupply() external view returns (uint256);
function balanceOf(address account) external view returns (uint256);
function allowance(address owner, address spender) external view returns (uint256);
function transfer(address recipient, uint256 amount) external returns (bool);
function approve(address spender, uint256 amount) external returns (bool);
function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
function Ownable() external view returns (address);
function Contractaddress() external view returns (address);
event Transfer(address indexed from, address indexed to, uint256 value);
event Approval(address indexed owner, address indexed spender, uint256 value);
}

// debut du contract ER20
contract salomoncoin is IERC20 {
string public constant name = "salomoncoin"; //Le nom de votre token
string public constant symbol = "SLM"; //Le Symbole
uint8 public constant decimals = 18; //La divisibilité
event Approval(address indexed tokenOwner,bytes32 indexed spender, uint tokens);
event Transfer(address indexed from,bytes32 indexed to, uint tokens);
mapping(address => uint256) balances;
mapping(address => mapping (address => uint256)) allowed;
uint256 _totalSupply = 2100000; //La quantité maximal
using SafeMath for uint256;

constructor() {
    balances[msg.sender] = _totalSupply;
}
function totalSupply() public override view returns (uint256) {
return balances[msg.sender];
}
function Ownable() public override view returns (address) {
return msg.sender;
}
function Contractaddress() public override view returns (address) {
return address(this);
}

function balanceOf(address tokenOwner) public override view returns (uint256) {
return balances[tokenOwner];
}

function transfer(address receiver, uint256 numTokens) public override returns (bool) {
require(numTokens <= balances[msg.sender]);
balances[msg.sender] = balances[msg.sender].sub(numTokens);
balances[receiver] = balances[receiver].add(numTokens);
emit Transfer(msg.sender, receiver, numTokens);
return true;
}

function approve(address delegate, uint256 numTokens) public override returns (bool) {
allowed[msg.sender][delegate] = numTokens;
emit Approval(msg.sender, delegate, numTokens);
return true;
}

function allowance(address owner, address delegate) public override view returns (uint) {
return allowed[owner][delegate];
}

function transferFrom(address owner, address buyer, uint256 numTokens) public override returns
(bool) {
require(numTokens <= balances[owner]);
require(numTokens <= allowed[owner][msg.sender]);
balances[owner] = balances[owner].sub(numTokens);
allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
balances[buyer] = balances[buyer].add(numTokens);
emit Transfer(owner, buyer, numTokens);
return true;
}
}
library SafeMath {
function sub(uint256 a, uint256 b) internal pure returns (uint256) {
assert(b <= a);
return a - b;
}

function add(uint256 a, uint256 b) internal pure returns (uint256) {
uint256 c = a + b;
assert(c >= a);
return c;
}
}

