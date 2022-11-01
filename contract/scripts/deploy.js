const hre = require("hardhat");

async function main() {
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const ONE_YEAR_IN_SECS = 365 * 24 * 60 * 60;
  const unlockTime = currentTimestampInSeconds + ONE_YEAR_IN_SECS;

  const lockedAmount = hre.ethers.utils.parseEther("0.05");

  const JobCredential = await hre.ethers.getContractFactory("JobCredential");
  const jobCredential = await JobCredential.deploy("JobPoap", "JBP");

  await jobCredential.deployed();

  console.log(`MintFactory is deployed to ${jobCredential.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
