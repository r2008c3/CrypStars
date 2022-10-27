// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract JobCredential is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(uint => address) minterAddress; //tokenId => minterAddress
    mapping(uint => address) ownerAddress; //tokenId => ownerAddress

    constructor() ERC721("JobCredential", "JBC") {}

    function mintJobCredential() public {
        uint256 newIds = _tokenIds.current();
        _safeMint(msg.sender, newIds);
        _setTokenURI(newIds, "URI");
        _tokenIds.increment();
    }

    function checkOwnerMinter(uint _tokenIds) public view returns (bool) {
        return (minterAddress[_tokenIds] == ownerAddress[_tokenIds]);
    }
}
