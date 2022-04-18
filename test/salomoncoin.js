const salomoncoin = artifacts.require("salomoncoin");
global.expect = require('chai').expect;

contract('salomoncoin', () => {
    it('should deploy smart contract properly', async  () => {
        const contract = await salomoncoin.deployed();
        console.log(salomoncoin.address);
        assert(salomoncoin.address !== '');
       
      });
      
});

contract('salomoncoin', accounts => {
  beforeEach(async function(){
  //
  token = await salomoncoin.deployed(210000);
  
  });
  it('should return the total supply', async () => {
  const supply = await token.totalSupply();
  const transfer = web3.utils.toBN(web3.utils.toBN(web3.utils.toWei(supply)));
  console.log(transfer);
  });
  it('should transfer token', async () => {
  const transfer = web3.utils.toBN(300);
  const receipt = await token.transfer(accounts[3], transfer);
  const balance1 = await token.balanceOf(accounts[0]);

  expectEvent(receipt, 'Transfer', {
  from: accounts[0],
  to: accounts[3]
  });
  });
  });


