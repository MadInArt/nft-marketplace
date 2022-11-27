const CryptoBirds = artifacts.require("CryptoBirds");

contract("CryptoBirds", (account) => {
  let  contract;

  before(async ()=> {
    contract = await CryptoBirds.deployed();
  })

  describe("Deployment", ()=> {
    it("deploy successfully", async () => {
      const address = contract.address;
      assert.notEqual(address, "");
      assert.notEqual(address, null);
      assert.notEqual(address, undefined);
      assert.notEqual(address, 0x0);
    });

    it("has a name", async ()=> {
      const name = await contract.name();
      assert.equal(name, "CryptoBirds");
    });

    it("has a symbol", async ()=> {
      const name = await contract.symbol();
      assert.equal(name, "CBIRDS");
    })
  })

  describe("minting", async() => {
    it("creates a new token", async ()=> {
      const mintingResult = await contract.mint('https...');
      const totalSupply = await contract.totalSupply();
      assert.equal(totalSupply, 1);
      // minting success
      const event = mintingResult.logs[0].args;
      assert.equal(event.from, '0x0000000000000000000000000000000000000000', 'from is the contract address');
      assert.equal(event.to, account[0], 'to is a msg sender');
      // minting failure
      await contract.mint('https...').should.be.rejected;
    })
  })

  describe("indexing", async() => {
    it("list CryptoBrds", async ()=> {
      await contract.mint('https...1');
      await contract.mint('https...2');
      await contract.mint('https...3');
      const totalSupply = await contract.totalSupply();
      let result = [];

      for(i = 1; i<= totalSupply; i++) {
          const bird = await contract._cryptoBirds(i - 1);
          result.push(bird);
      }

      let expectedResult = ['https...1','https...2','https...3','https...4'];
      assert.equal(result.join(','), expectedResult.join(','))
    })
  })
});