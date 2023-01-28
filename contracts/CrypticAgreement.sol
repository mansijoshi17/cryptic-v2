// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

contract CrypticAgreement is Ownable {
    string name;
    string cid;
    address creator;
    string status;

    mapping(address => bool) public signed;
    address[] members;
    uint256 signedMembers;

    constructor(
        string memory _name,
        string memory _cid,
        address _creator,
        string memory _status
    ) {
        name = _name;
        cid = _cid;
        creator = _creator;
        status = _status;
    }

    function addMembers(address[] memory _members) public {
        require(msg.sender == creator, "Only owner can add members");
        for (uint256 i = 0; i < _members.length; i++) {
            signed[address(_members[i])] = false;
            members.push(_members[i]);
        }
    }

    function checkMember(address memberAddress) public view returns (bool) {
        bool containsMember = false;
        for (uint256 i = 0; i < members.length; i++) {
            if (members[i] == memberAddress) {
                containsMember = true;
            }
        }
        return containsMember;
    }

    function signAgreement(address signer) public {
        bool containsMember = checkMember(signer);
        require(containsMember, "You are not member of this agreement");
        require(!signed[signer], "You have already signed agreement");
        signed[signer] = true;
        signedMembers = signedMembers + 1;
    }

    function checkAgreementStatus() public view returns (string memory) {
        if (signedMembers == members.length) {
            return "Signed";
        } else {
            return "Unsigned";
        }
    }

    function getMembers() public view returns (address[] memory) {
        return members;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function getCid() public view returns (string memory) {
        return cid;
    }

    function setCid(string memory _cid) public {
        cid = _cid;
    }

    function getOwner() public view returns (address) {
        return creator;
    }
}
