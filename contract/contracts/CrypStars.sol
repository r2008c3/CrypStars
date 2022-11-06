// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./libraries/Base64.sol";
import "./MintApprove.sol";

contract JobCredential is ERC721URIStorage, MintApprove {
    struct NftAttributes {
        string name;
        string imageURL;
        address minterAddress;
    }

    NftAttributes[] JobNfts;

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    mapping(address => uint[]) mintedNFTs; //verify minted NFTs from address

    event Mint(address _minter, uint _timeStamp);
    event TransferNFT(address _to, address _from, uint timeStamp);

    constructor(string memory CrypStars, string memory CPS)
        ERC721(CrypStars, CPS)
    {}

    // check if msg.sender is approved to mint
    modifier onlyApproved(uint _projectId) {
        require(idToProjects[_projectId].mintApproved[msg.sender]);
        _;
    }

    // mint NFTs
    function mintNFT(
        string memory _name,
        string memory _imageURI,
        string memory _projectName
    ) public onlyApproved(nameToProjectId[_projectName]) {
        uint256 newIds = _tokenIds.current();
        _tokenIds.increment();
        JobNfts.push(
            NftAttributes({
                name: _name,
                imageURL: _imageURI,
                minterAddress: msg.sender
            })
        );

        mintedNFTs[msg.sender].push(newIds);
        _safeMint(msg.sender, newIds);
        emit Mint(msg.sender, block.timestamp);
    }

    // get NFT URI
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

    //get all NFT informations in specific address
    function getAllMintedNFTs(address _checkedAddress)
        public
        view
        returns (uint[] memory)
    {
        return (mintedNFTs[_checkedAddress]);
    }
}
