[![hackmd-github-sync-badge](https://hackmd.io/EtJSEnxjTVOOvRJdWGJlYw/badge)](https://hackmd.io/EtJSEnxjTVOOvRJdWGJlYw)
###### tags: `documentation` `sci`

# [secretmanagementinterface](https://github.com/JhonnyJason/secretmanagementinterface) v0.3


### /addNodeId
If there is no `secretSpace` for this `nodeId` it creates an empty object as its `secretSpace`.
If there is a `closureDate` defined this `nodeId` is temporary and will be deleted at the specified date.
Also if we have a `closureDate` defined and a `secretSpace` already exists for this `nodeId` we will cause an error.

All of this will only work having a valid `authCode`. This way we could limit the creation of `secretSpaces` to Users we trust and want to have using our servers.

#### request
```json
{
    "authCode": "",
    "publicKey": "",
    "closureDate": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "ok": true
}
```

### /removeNodeId
This will remove the certain NodeId with all its `secretSpace` and sub-spaces.

#### request
```json
{
    "publicKey": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "ok": true
}
```

### /getSecretSpace
Returns the encrypted version of the whole `secretSpace`.
#### request
```json
{
    "publicKey": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "referencePoint": "...",
    "encryptedContent": "..."
}
```

### /getSubSpace
Returns the encrypted version of the specified `subSpace`.
#### request
```json
{
    "publicKey": "",
    "fromId": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "referencePoint": "...",
    "encryptedContent": "..."
}
```



### /getSecret
Returns the encrypted secret of the given `secretId`.

#### request
```json
{
    "publicKey": "",
    "secretId": "",
    "timestamp": "",
    "signature": "",
    "nonce", ""
}
```
#### response
```json
{
    "referencePoint": "...",
    "encryptedContent": "..."
}
```

### /setSecret
Encryptes the given `secret` and stores it at `secretId` within the owners' `secretSpace`.

It still is recommended to also encrypt the secret beforen sending it. (As we should not completely trust SSL using CAs.)

#### request
```json
{
    "publicKey": "",
    "secretId": "",
    "secret": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "ok": true
}
```

### /deleteSecret
Deletes the given `secretId` from the `secretSpace`.

#### request
```json
{
    "publicKey": "",
    "secretId": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "ok": true
}
```

### /startAcceptingSecretsFrom

Now we will create the empty Object for a foreign subSpace which goes by the key `fromId` within our `secretSpace`.
Only now the `fromId` may write secrets into this foreign subSpace.

*Note: could be renamed as openSubSpaceFor*

#### request
```json
{
    "publicKey": "",
    "fromId": "",
    "closureDate": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "ok": true
}
```

### /stopAcceptingSecretsFrom
This will remove the Object which goes by the key `fromId` within our `secretSpace`.
All shared secrets in there are lost. And the `fromId` could not provide any secrets for us.

*Note: could be renamed as closeSubSpaceFor*

#### request
```json
{
    "publicKey": "",
    "fromId": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "ok": true
}

```

### /getSecretFrom
Returns the encrypted secret shared to us by `fromId` having the id `secretId`.

#### request
```json
{
    "publicKey": "",
    "fromId": "",
    "secretId": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "referencePoint": "...",
    "encryptedContent": "..."
}
```


### /shareSecretTo
This will write the secret into the sub-space of the `shareToId` if it exists.

#### request
```json
{
    "publicKey": "",
    "shareToId": "",
    "secretId": "",
    "secret": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "ok": true
}
```

### /deleteSharedSecret
This will delete the specified `secretId` if it exists in the available subs-space of the `sharedToId`.

#### request
```json
{
    "publicKey": "",
    "sharedToId": "",
    "secretId": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "ok": true
}

```
#### response
```json
{
    "ok": true
}

```

### /addNotificationHook
 TODO: define
 
#### request
```json
{
    "publicKey": "",
    "type": "",
    "specific": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```

#### response
```json
{
    "ok": true
}

```

### /getAuthCode
This request creates an authCode for a certain action.
The `authCode` will be shared to the requestor.

*Note: we need to accept secrets from the SecretManager first!*

#### request
```json
{
    "action": "",
    "publicKey": "",
    "timestamp": "",
    "signature": "",
    "nonce": ""
}
```
#### response
```json
{
    "ok": true
}
```

### /addFriendServer
This request lets us add another server to which the SecretManager would speak to.

#### request
```json
{
    "authCode": "",
    "serverURL": "",
    "serverNodeId": ""
}
```
#### response
```json
{
    "ok": true
}

```

### /getNodeId
Returns the `nodeId` of the SecretManager.

#### request
```json
{
    "authCode": ""
}
```
#### response
```json
{
    "publicKey": "...",
    "timestamp": "...",
    "signature": "..."
}
```

