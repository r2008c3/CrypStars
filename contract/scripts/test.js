const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory(
    "JobCredential"
  );
  const nftContract = await nftContractFactory.deploy("JobCredential", "JBC");
  await nftContract.deployed();
  console.log("Contract deployed to:", nftContract.address);
  // makeAnEpicNFT 関数を呼び出す。NFT が Mint される。
  let txn = await nftContract.mintJobCredential("Hero", "URI");
  // Minting が仮想マイナーにより、承認されるのを待つ。
  await txn.wait();
  // makeAnEpicNFT 関数をもう一度呼び出す。NFT がまた Mint される。
  txn = await nftContract.mintJobCredential(
    "Cambera",
    "bafybeialnwedobbr5akj3whodduyii5kojmksgqxalqwhcfwod5p3vboui"
  );
  await txn.wait();
  // makeAnEpicNFT 関数をもう一度呼び出す。NFT がまた Mint される。
  txn = await nftContract.mintJobCredential("Third", "URI");
  await txn.wait();
  // Minting が仮想マイナーにより、承認されるのを待つ。
  txn = await nftContract.getAllMintedNFTs(
    "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266"
  );
  console.log(txn);
  txn = await nftContract.getAllMintedNFTs(
    "0x8a791620dd6260079bf849dc5567adc3f2fdc318"
  );
  console.log(txn);
};
const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};
runMain();
