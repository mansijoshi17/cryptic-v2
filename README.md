## Cryptic : Privacy proof eSignature, Decentralized Digital Vault!

![MicrosoftTeams-image (70)](https://user-images.githubusercontent.com/54347081/216899865-a67a3649-06fc-4e62-ad5f-b87af1c5b50b.png)

## Cryptic is perpetual data storage, management and privacy proof multiuser eSignature Dapp

### Key Features:

1. Cryptic Sign

- Multiuser eSignature to Agreements

2. Cryptic Vault

- Perpetual data Storage
- NFT based Access
- Information Inheritance
- Data Encryption on Top of IPFS

### What problem we are solving:

1. Currently we are using docusign to sign agreements digitally. But in that users personal data and agreements gets stored on the centrealised database. So here we have built cryptic sign which totally decentralised. User can add agreements with sign placeholders and then can share the link with the member of that agreement. Only added whitelisted members will be able to access the link. Members will sign the agreement using that sharabale link.

2. If something happens to a person or in case of death families are not aware of a) How much crypto person is having and especially how to get access to it b) Millions of dollars worth of insurance are unclaimed because families don't know if there was any medical insurance or life insurance. c) Property will deed etc

3. no central point of failure and censorship resistance. Currently, we store our data on Dropbox, Google Drive, etc but there are chances that someone from the internal team can access our data so we have encrypted data using SHA 256 and the encrypted hash is getting stored on IPFS

4. Persistent storage & Perpetual storage: Physical copy of data may get lost or damaged due to any reason but data stored on IPFS and Pinned using Filecoin are totally secure and everlasting. Even if the big bang happens on eath, data on the File coin will be accessible from other planets through satellite node which Protocol Labs team is planning :)

### Contracts on Filecoin Virtual Machine:

**1) Cryptic Agreement Contract :** https://explorer.glif.io/address/0x9fB5823006B53BfB3E315A20AC269EF1Fa60F5f5/?network=hyperspacenet

**2) Cryptic Vault Contract :** https://explorer.glif.io/address/0xe8B699840a81cfC5228958612D3A34F36B415f2b/?network=hyperspacenet

## It includes:

**1) Sign In with Admin and Member:** Admin can create token from sign with admin which will be used for membership. and in login with member, member can login with admin address which will check that member have that admin's nft or not.

<img width="1440" alt="Screenshot 2023-02-05 at 6 50 13 PM" src="https://user-images.githubusercontent.com/54347081/216821725-25f8fd0e-592f-495d-aeb0-7b4326f79207.png">

**1) Crypic Sign to Agreements:** User can add agreements with sign placeholders and then can share the link with the member of that agreement. Only added whitelisted members will be able to access the link. Members will sign the agreement using that sharabale link.

<img width="1440" alt="Screenshot 2023-02-05 at 6 46 38 PM" src="https://user-images.githubusercontent.com/54347081/216821833-112f78a9-fa4f-47ae-93d1-f1d1223bed55.png">

<img width="1440" alt="Screenshot 2023-02-05 at 6 53 45 PM" src="https://user-images.githubusercontent.com/54347081/216821853-8592c989-83bc-4001-a1c9-103bb1d1f5bb.png">

**3) Decentralized Encrypted Perpetual Storage :** In Drive we can store different type of file which will stored encrypted on IPFS.

<img width="1440" alt="Screenshot 2023-02-05 at 6 44 31 PM" src="https://user-images.githubusercontent.com/54347081/216821883-97550906-be14-4aa6-89e0-b9ca4eeaaaec.png">

**4) Members:** Add Members to give access of your digital vault.

<img width="1434" alt="Screenshot 2023-02-05 at 6 45 06 PM" src="https://user-images.githubusercontent.com/54347081/216821916-50f7d724-6784-4fe7-971d-234585b12c62.png">

**5) Emergency Alert:** Set Emergency alert email message to notify the member about access permission.

<img width="1440" alt="Screenshot 2023-02-05 at 6 45 25 PM" src="https://user-images.githubusercontent.com/54347081/216821939-cb8bc515-df12-4372-b302-b11e362b9a16.png">

**6) Access Permission:** There are three ways to give access permission. 1) Give access right away which will transfer token and send email to the particular member right away 2) Emergency Transfer is set number of days the when transfer should be executed, if admin is not active from defined days. 3) On selected date is token should be transfered on particular date.

<img width="1440" alt="Screenshot 2023-02-05 at 6 45 43 PM" src="https://user-images.githubusercontent.com/54347081/216821969-d7f8a916-a069-4201-9fd8-b372c0b918ef.png">

**7) Encrypted Notes:** In notes, added notes will be stored encrypted on IPFS.

<img width="1440" alt="Screenshot 2023-02-05 at 6 46 11 PM" src="https://user-images.githubusercontent.com/54347081/216821987-eb8a7d9c-88e6-4aba-81cd-a9cf0a05344f.png">

### Filecoin Virtual Machine

```
require("@nomicfoundation/hardhat-toolbox");
require("hardhat-deploy");
require("hardhat-deploy-ethers");
require("./tasks");
require("dotenv").config();


const PRIVATE_KEY = process.env.REACT_APP_PRIVATE_KEY;

module.exports = {
  solidity: "0.8.4",
  defaultNetwork: "hyperspace",
  networks: {
    hardhat: {},
    hyperspace: {
      chainId: 3141,
      url: "https://api.hyperspace.node.glif.io/rpc/v1",
      accounts: [PRIVATE_KEY],
    },
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts",
  },
};

```

### LightHouse

https://github.com/mansijoshi17/cryptic-v2/blob/master/lighthouse.md

### Spheron 

https://github.com/mansijoshi17/cryptic-v2/blob/master/spheron.md



