[![hackmd-github-sync-badge](https://hackmd.io/EtJSEnxjTVOOvRJdWGJlYw/badge)](https://hackmd.io/EtJSEnxjTVOOvRJdWGJlYw)
###### tags: `documentation` `sci`

# [secretmanagementinterface](https://github.com/JhonnyJason/secretmanagementinterface) v0.3


### /addNodeId
If there is no `secretSpace` for this `nodeId` it creates an empty object as its `secretSpace`.
#### request
```json
{
    "publicKey": "",
    "timestamp": "",
    "signature": ""
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
    "signature": ""
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
The `secretId` may also be in the form of `fromId.secretId` then we would retreive the according shared secret.

#### request
```json
{
    "publicKey": "",
    "secretId": "",
    "timestamp": "",
    "signature": ""
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
Also looks at the `sharedTo` array of this secret to determine the other `nodeId`s who shall also receive an update.
Then encrypts it for each of those `nodeId`s and writes it inot their sub-space if it exists.

It does not produce an error if there is a `nodeId` on the `sharedTo` array which does not accept our secret.
#### request
```json
{
    "publicKey": "",
    "secretId": "",
    "secret": "",
    "timestamp": "",
    "signature": ""
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
The `secretId` may also be in the form of `fromId.secretId` then we would delete the according shared secret.

#### request
```json
{
    "publicKey": "",
    "secretId": "",
    "timestamp": "",
    "signature": ""
}
```
#### response
```json
{
    "ok": true
}
```


### /startAcceptingSecretsFrom
Now we will create the empty Object a sub-space which goes by the key `fromId` within our `secretSpace`.
Only now the `fromId` may write secrets into this sub-space.
#### request
```json
{
    "publicKey": "",
    "fromId": "",
    "timestamp": "",
    "signature": ""
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
All shared secrets in there are lost.
#### request
```json
{
    "publicKey": "",
    "fromId": "",
    "timestamp": "",
    "signature": ""
}
```
#### response
```json
{
    "ok": true
}

```

### /shareSecretTo
This will write the secret into the sub-space of the `shareToId` if it exists.
*Note this `shareToId` may also be given in the way of `servername.domain.tld:shareToId`.*

#### request
```json
{
    "publicKey": "",
    "shareToId": "",
    "secretId": "",
    "secret": "",
    "timestamp": "",
    "signature": ""
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
    "signature": ""
}
```
#### response
```json
{
    "ok": true
}

```

### /addSyncHook
Whenever a `/setSecret` for the specific `secretId` is called it would also send the same request to the SecretManager at the specified `serverURL`. 
*Note: This `serverURL` must be known to the SecretManager!*

#### request
```json
{
    "publicKey": "",
    "secretId": "",
    "serverURL": "",
    "timestamp": "",
    "signature": ""
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
    "signature": ""
}
```
#### response
```json
{
    "ok": true
}

```

### /getAuthCode
This request lets the server share the current authCode to the requestors `secretSpace`.
*Note: we need to accept secrets from the SecretManager first!*

#### request
```json
{
    "publicKey": "",
    "timestamp": "",
    "signature": ""
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

