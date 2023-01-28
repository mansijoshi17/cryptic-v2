// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./CrypticAgreement.sol";

contract CrypticAgreementFactory is Ownable {
    mapping(address => address[]) private agreemets;

    event agreementCreated(address agreement);

    function createAgreement(
        string memory name,
        string memory cid,
        string memory status
    ) public returns (address) {
        CrypticAgreement agreementContract = new CrypticAgreement(
            name,
            cid,
            msg.sender,
            status
        );
        agreemets[msg.sender].push(address(agreementContract));
        emit agreementCreated(address(agreementContract));
        return address(agreementContract);
    }

    function getAgrrements(address userAddress)
        public
        view
        returns (address[] memory)
    {
        return agreemets[userAddress];
    }
}
