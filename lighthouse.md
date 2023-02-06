### LightHouse

We have use Lighthouse for the 1) perpetual storage of digital data of Cryptic Vault as well as 2) All the data are Encrypted through Lighthouse before uploading it on IPFS

```
 async function storeDriveFilesWithLighthouse(e) {
    setLoading(true);
    const file = e.target.files[0];
    let token = await getToken();
    let sig = await encryptionSignature();
    const response = await lighthouse.uploadEncrypted(
      e,
      sig.publicKey,
      process.env.REACT_APP_LIGHTHOUSE_API_KEY,
      token
    );
    console.log(response);

    let files = await makeFileObjects(
      {
        file: response.data.Hash,
        name: file.name.substring(0, file.name.indexOf(".")).toString(),
        type: file.type,
      },
      "CrypticVault"
    );
    let cid = await storeJsonFiles(files);

    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    const accounts = await provider.listAccounts();
    const crypticVaultCon = new ethers.Contract(
      crypticVaultContractEthAddress,
      crypticVault,
      signer
    );
    let role = localStorage.getItem("role");
    let tansactionCreateDocument;
    if (role == "admin") {
      tansactionCreateDocument = await crypticVaultCon.storeDocuments(
        accounts[0],
        cid
      );
    } else {
      tansactionCreateDocument = await crypticVaultCon.storeDocuments(
        localStorage.getItem("admin"),
        cid
      );
    }

    let tx = await tansactionCreateDocument.wait();
    if (tx) {
      setLoading(false);
      setIsUpdated(!isUpdated);
      toast.success("Successfully Uploaded!");
    }
  }

```

```

const getDocumentsFromLightHouse = async () => {
    try {
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const signer = provider.getSigner();
      const crypticVaultCon = new ethers.Contract(
        crypticVaultContractEthAddress,
        crypticVault,
        signer
      );
      let arr = [];

      let cids = await crypticVaultCon.getDocuments(
        localStorage.getItem("admin")
      );

      for (var i = 0; i < cids.length; i++) {
        const meta = await axios.get(
          `https://${cids[i]}.ipfs.w3s.link/CrypticVault`
        );

        let token = await getToken();
        let sig = await encryptionSignature();

        const keyObject = await lighthouse.fetchEncryptionKey(
          meta.data.file,
          sig.publicKey,
          token
        );

        const fileType = meta.data.type;
        const decrypted = await lighthouse.decryptFile(
          meta.data.file,
          keyObject.data.key,
          fileType
        );

        const url = URL.createObjectURL(decrypted);
        console.log(url);

        arr[i] = {
          file: url,
          name: meta.data.name,
          type: meta.data.type,
        };
      }
      setDocFiles(arr);
    } catch (err) {
      console.log(err);
    }
  };

```