// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./libraries/Base64.sol";
import "hardhat/console.sol";

contract JobCredential is ERC721URIStorage {
    struct NftAttributes {
        string name;
        string imageURL;
        address minterAddress;
    }
    NftAttributes[] JobNfts;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(address => uint[]) mintedNFTs;
    mapping(uint => NftAttributes) nftInfo; //tokenId => nftAttributes

    event Mint(address _minter, uint _timeStamp);
    event TransferNFT(address _to, address _from, uint timeStamp);

    constructor(string memory JobPoap, string memory JBC)
        ERC721(JobPoap, JBC)
    {}

    function mintJobCredential(string memory _name, string memory _imageURI)
        public
    {
        uint256 newIds = _tokenIds.current();
        console.log(newIds);
        _tokenIds.increment();
        JobNfts.push(
            NftAttributes({
                name: _name,
                imageURL: _imageURI,
                minterAddress: msg.sender
            })
        );
        //Todo: addressごとにtokenIdsの配列が追加されているか下記の挙動チェック
        //Todo: 新しいaddressの時には、mappingが追加され、既存のaddressの時にはuint[]に追加される
        mintedNFTs[msg.sender].push(newIds);
        _safeMint(msg.sender, newIds);
        emit Mint(msg.sender, block.timestamp);
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        override
        returns (string memory)
    {
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        JobNfts[_tokenId].name,
                        " -- NFT #: ",
                        Strings.toString(_tokenId),
                        '", "description": "Job Credential", "image": "ipfs://',
                        JobNfts[_tokenId].imageURL,
                        '"}'
                    )
                )
            )
        );
        string memory output = string(
            abi.encodePacked("data:application/json;base64,", json)
        );
        return output;
    }

    function getAllMintedNFTs(address _checkedAddress)
        public
        view
        returns (uint[] memory)
    {
        return (mintedNFTs[_checkedAddress]);
    }
}
