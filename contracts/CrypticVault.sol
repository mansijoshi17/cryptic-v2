// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "./CrypticVaultToken.sol";

contract CrypticVault is Ownable {
    struct emergencyAlert {
        address user;
        string subject;
        string message;
    }

    mapping(address => bool) private loginStatus;
    mapping(address => mapping(address => bool)) private transferStatus;
    mapping(address => address) private users;
    mapping(address => string[]) private members;

    mapping(address => uint256) private tokenIds;
    mapping(address => emergencyAlert) private alerts;
    mapping(address => string[]) private documents;
    mapping(address => string[]) private notes;

    event TokenCreated(address, address);
    event TokenTransfered(address, address, address, uint256);

    function getLoginStatus(address caller) public view returns (bool) {
        return loginStatus[caller];
    }

    function createToken(string memory name, string memory symbol) public {
        address _address = address(new CrypticVaultToken(name, symbol)); // Created Token contract.
        // here add if else if conditions with argument module and store the address in their relevent variable.
        emit TokenCreated(msg.sender, _address);
    }

    function bulkMintERC721(
        address tokenAddress,
        uint256 start,
        uint256 end
    ) public {
        for (uint256 i = start; i < end; i++) {
            CrypticVaultToken(tokenAddress).safeMint(msg.sender);
        }
        loginStatus[msg.sender] = true;
        // Remove the next line. Will do that step in create token function.
        users[msg.sender] = tokenAddress;
        // Here we will also have token address to set the token Id of particular token's.
        setTokenId(msg.sender, end - 1);
    }

    function transferToken(
        address from,
        address payable to,
        address token,
        uint256 amount
    ) public {
        CrypticVaultToken(token).transferTokens(from, to, token, amount);
        transferStatus[from][to] = true;
        emit TokenTransfered(from, to, token, amount);
    }

    function getTokenAddress(address userAddress)
        public
        view
        returns (address)
    {
        return users[userAddress];
    }

    function storeDocuments(address userAddress, string memory cid) public {
        documents[userAddress].push(cid);
    }

    function getDocuments(address userAddress)
        public
        view
        returns (string[] memory)
    {
        return documents[userAddress];
    }

    function createMembers(address userAddress, string memory cid) public {
        members[userAddress].push(cid);
    }

    function getMembers(address userAddress)
        public
        view
        returns (string[] memory)
    {
        return members[userAddress];
    }

    function createEmergencyAlert(
        address userAddress,
        string memory subject,
        string memory message
    ) public {
        emergencyAlert storage newAlert = alerts[userAddress];
        newAlert.user = userAddress;
        newAlert.subject = subject;
        newAlert.message = message;
    }

    function getEmergencyAlert(address userAddress)
        public
        view
        returns (emergencyAlert memory)
    {
        return alerts[userAddress];
    }

    function setTokenId(address userAddress, uint256 tokenId) public {
        tokenIds[userAddress] = tokenId;
    }

    function getTokenId(address userAddress) public view returns (uint256) {
        return tokenIds[userAddress];
    }

    function getTransferStatus(address adminAddress, address memberAddress)
        public
        view
        returns (bool)
    {
        return transferStatus[adminAddress][memberAddress];
    }

    function createNotes(address userAddress, string memory cid) public {
        notes[userAddress].push(cid);
    }

    function getNotes(address userAddress)
        public
        view
        returns (string[] memory)
    {
        return notes[userAddress];
    }

    function findAndReplace(
        string memory oldCid,
        string memory newCid,
        address userAddress
    ) public returns (bool) {
        for (uint256 i = 0; i < notes[userAddress].length; i++) {
            string memory noteCid = notes[userAddress][i];
            if (
                keccak256(abi.encodePacked(noteCid)) ==
                keccak256(abi.encodePacked(oldCid))
            ) {
                notes[userAddress][i] = newCid;
                return true;
            }
        }
        return false;
    }
}
