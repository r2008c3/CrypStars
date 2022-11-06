# CrypStars
私たちのサービス、「CrypStars」は、DAOにおける実績を可視化します。

近年、DAO（分散型自律組織）での活動が注目を集めています。多くのDAOはオープンで、様々な人がプロジェクトに挑戦する機会が提供されています。一方で、多くの人が参加できる可能性は、プロジェクトへの参加希望者が提示する個人のスキルや実績の事実確認にかかる労力を増やす事となりました。参加希望者、DAOの運営の両者の橋渡しが求められています。

私たちは、DAOにおける実績をNFTとして表現することで、この課題解決をめざします。私達のサービス「CrypStars」は、DAOでの活動実績を保証できるメンバー（プロジェクト運営等）が、実績NFTのミントを承認するプロセスを設けており、実績に対する信頼性を高める工夫をしています。また、NFT内には、どんなプロジェクトに何の役職でどの期間参加したかが記述されており、プロジェクト運営が承認したこれらの内容を、他者に対して客観的に提示することが出来ます。

新たなプロジェクトに参加を希望するユーザは、これらの実績NFTを提示することで、自身の活動実績を示すことが可能となります。

# 各ディレクトリについて
## client

## contract
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



## sequence
CrypStarsのコンセプトを示した動作手順です。
Mermaidで記述されており、GitHub上で閲覧可能です。

