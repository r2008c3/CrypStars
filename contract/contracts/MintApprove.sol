// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/utils/Counters.sol";

contract MintApprove {
    struct DAO {
        string name;
        address DAOAddress;
        uint256 DAOId;
    }
    struct Project {
        string projectName;
        mapping(address => bool) mintApproved;
    }

    DAO[] daos;

    using Counters for Counters.Counter;
    Counters.Counter private _DAOIds; // DAO struct's id
    Counters.Counter private _projectIds; // Project struct's id

    mapping(string => uint256) DAONameToNumber; // verify DAO id from name
    mapping(uint256 => address) DAOAdminAddress; // verify DAO admin address from DAO id
    mapping(address => uint256) AddressToId; // verify DAO id from admin address
    mapping(string => uint256) nameToProjectId; // verify Project id from name
    mapping(uint256 => Project) idToProjects; // verify Project infomation from id

    // check if msg.sender is admin address
    modifier onlyDAO(uint256 DAONum) {
        require(msg.sender == DAOAdminAddress[DAONum]);
        _;
    }

    // allow member to mint Project NFT
    function allowMint(address _allowedAddress, string memory _projectName)
        public
        onlyDAO(AddressToId[msg.sender])
    {
        uint256 projectId = nameToProjectId[_projectName];
        idToProjects[projectId].mintApproved[_allowedAddress] = true;
    }

    // make new DAO & set DAO infomation
    function setDAO(string memory _name) public {
        uint256 newId = _DAOIds.current();
        DAO memory newDAO = DAO({
            name: _name,
            DAOAddress: msg.sender,
            DAOId: newId
        });
        _DAOIds.increment();
        daos.push(newDAO);
        DAONameToNumber[daos[newId].name] = newId;
        DAOAdminAddress[newId] = msg.sender;
        AddressToId[msg.sender] = newId;
    }

    // make new project & set project information
    function setProject(string memory _projectName) public {
        uint256 newId = _projectIds.current();
        Project storage newProject = idToProjects[newId];
        newProject.projectName = _projectName;
        _projectIds.increment();
        nameToProjectId[_projectName] = newId;
    }
}
