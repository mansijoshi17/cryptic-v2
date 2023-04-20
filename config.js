// Mainnet

export const crypticVaultContractEthAddress =
  "0x36276FA62C84DE4C5f93854124a224E3BDd3407a";

export const crypticAgreementFactoryEthAddress =
  "0x8F2321dBF70530E5a04A3b4BeBC82489b0b21B1c";

export const shortAddress = (addr) =>
  addr.length > 10 && addr.startsWith("0x")
    ? `${addr.substring(0, 6)}...${addr.substring(addr.length - 4)}`
    : addr;
