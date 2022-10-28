// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract JobCredential is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(uint => address) minterAddress; //tokenId => minterAddress
    mapping(uint => address) ownerAddress; //tokenId => ownerAddress

    constructor(string memory JobCredential, string memory JBC)
        ERC721(JobCredential, JBC)
    {}

    modifier onlyOwner(uint _tokenId) {
        require(
            ownerAddress[_tokenId] == msg.sender,
            "Ownable: caller is not the owner"
        );
        _;
    }

    function mintJobCredential(string memory URI) public {
        uint256 newIds = _tokenIds.current();
        minterAddress[newIds] = msg.sender;
        ownerAddress[newIds] = msg.sender;
        _tokenIds.increment();
        _safeMint(msg.sender, newIds);
        _setTokenURI(newIds, URI);
    }

    function checkOwnerMinter(uint _tokenId) public view returns (bool) {
        return (minterAddress[_tokenId] == ownerAddress[_tokenId]);
    }

    function transfer(address _to, uint _tokenId) public onlyOwner(_tokenId) {
        ownerAddress[_tokenId] = msg.sender;
        transferFrom(msg.sender, _to, _tokenId);
    }
}
