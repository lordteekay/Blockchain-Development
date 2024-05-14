const ethers = require("ethers");
const fs = require("fs");
require("dotenv").config();
async function main() {
  //A connection to the blockchain
  const provider = new ethers.JsonRpcProvider(process.env.RPC_URL);
  //A private key to sign contract on the blockchain
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);
  const abi = fs.readFileSync("./StudentData_sol_StudentData.abi", "utf-8");
  const binary = fs.readFileSync("./StudentData_sol_StudentData.bin", "utf-8");

  //ContractFactory an object we use to deploy a contract
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
  console.log("Deploying our smart contract,please hold for a sec...");
  //We wait till the contract deployed
  //   const contract = await contractFactory.deploy();
  const contract = await contractFactory.deploy({ gasPrice: 24000000000 });
  console.log(contract);
  console.log("worked");
}
main()
  .then(() => process.exit(0))
  .catch(() => {
    console.error("error");
    process.exit(1);
  });
