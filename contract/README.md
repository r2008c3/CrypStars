# CrypStars Contract
---

CrypStars has two contract files.

### CrypStars.sol
This is main contract that inherited ERC721URIStorage to mint NFT, get tokenURI and minted NFT infomation on each addres.

#### Functions
- mintNFT (mint new NFT)
- tokenURI (get tokenURI)
- getAllMintedNFTs (get all Minted NFT info on each address)

---

### MintApprove.sol
This contract allows each DAO can set new project and allowed address to mint.

#### Functions
- allowMint (DAO allow each address to mint)
- setDAO (make new DAO)
- setProject (make new project)



