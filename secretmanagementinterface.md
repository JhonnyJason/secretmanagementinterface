[![hackmd-github-sync-badge](https://hackmd.io/EtJSEnxjTVOOvRJdWGJlYw/badge)](https://hackmd.io/EtJSEnxjTVOOvRJdWGJlYw)
###### tags: `documentation` `sci`

# [secretmanagementinterface](https://github.com/JhonnyJason/secretmanagementinterface) v0.3

For further reference what the Secret Management is all about [read this](https://hackmd.io/PZjpRfzPSBCqS-8K54x2jA).

## Basic

### /getNodeId
Returns the `serverNodeId` of the Secret Manager service.

Requires an `authCode` to actually do something.

For general public requests we use the `authCode` of `deadbeefcafebabedeadbeefcafebabedeadbeefcafebabedeadbeefcafebabe`.
This is the default on any new Instance - it is recommended to switch the publicly known `authCode` frequently in production.

#### request
```javascript
{
    authCode: STRINGHEX64
}
```

#### response
```javascript
{
    serverNodeId: STRINGHEX64,
    timestamp: NUMBER,
    signature: STRINGHEX128
}
```

### /createAuthCode
This request creates an `authCode` for a certain action.

The `authCode` will be shared to the requestor.
Therefore we need to accept secrets from the SecretManager first.

Actions that require authCodes:
- `getNodeId`
- `setRequestableServer`
- `deleteRequestableServer`
- `openSecretSpace`


#### request
```javascript
{
    action: STRING,
    publicKey: STRINGHEX64,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    ok: true
}
```


## Secret Spaces

### /openSecretSpace
If there is no `secretSpace` for this `nodeId` it creates an new `SecretSpace` object.
If there is a `closureDate` defined it will be closed(removed) at the specified date.

If we have a `closureDate` defined and a `secretSpace` already exists for this `nodeId` we will reply with an error.

We must have a valid `authCode`. This way we could limit the creation of `secretSpaces` to people we trust.


- `authCode` is to be generated by a user who already has access to the server via `/createAuthCode` specifying the `createSecretSpace` option (32byte as hex encoded string)
- `publicKey` or `nodeId` will be the id of the secretSpace - only a person proofing ownership of the right `privateKey` has access to modify, delete and read the `secretSpace` (32byte as hex encoded string)
- `closureDate` defines the exact time the secretSpace will automatically be deleted. May be `null` (=never be deleted) or `+4hours` (=will be deleted in 4 hours) or `+4days` (=will be deleted in 4 days) or `+4month` (=will be deleted in 4 month) or `+4years` (=will be deleted in 4 years) or a valid Unix Timestamp of an exact date to close the space.

#### request
```javascript
{
    authCode: STRINGHEX64,
    publicKey: STRINGHEX64,
    closureDate: NUMBER,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    ok: true
}
```

### /getSecretSpace
Returns the encrypted version of the whole `secretSpace`.

#### request
```javascript
{
    publicKey: STRINGHEX64,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    referencePoint: STRINGHEX64,
    encryptedContent: STRINGHEX
}
```

### /deleteSecretSpace
This will remove the `secretSpace` and all it's `subSpaces` effectivly deleting the according `nodeId` from the server.

#### request
```javascript
{
    publicKey: STRINGHEX64,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    ok: true
}
```
## Secrets

### /setSecret
Encryptes the given `secret` and stores it at `secretId` within the owners' `secretSpace`.

It still is recommended to also encrypt the secret beforen sending it. (As we should not completely trust SSL using CAs.)

#### request
```javascript
{
    publicKey: STRINGHEX64,
    secretId: STRING,
    secret: STRING,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    ok: true
}
```

### /getSecret
Returns the encrypted secret of the given `secretId`.

#### request
```javascript
{
    publicKey: STRINGHEX64,
    secretId: STRING,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce, NUMBER
}
```
#### response
```javascript
{
    referencePoint: STRINGHEX64,
    encryptedContent: STRINGHEX
}
```

### /deleteSecret
Deletes the given `secretId` from the `secretSpace`.

#### request
```javascript
{
    publicKey: STRINGHEX64,
    secretId: STRING,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    ok: true
}
```

## Sub Spaces

### /openSubSpace

If it does not exist it will create a new `subSpace` which goes by the key `fromId` within our `subSpaces`.
Now the `fromId` may write secrets into this `subSpace`.

Also the `subSpace` may be temporary. Therefore we should specify a `closureDate` as not `null`.

#### request
```javascript
{
    publicKey: STRINGHEX64,
    fromId: STRINGHEX64,
    closureDate: NUMBER,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    ok: true
}
```


### /getSubSpace
Returns the encrypted version of the specified `subSpace`.

#### request
```javascript
{
    publicKey: STRINGHEX64,
    fromId: STRINGHEX64,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    referencePoint: STRINGHEX64,
    encryptedContent: STRINGHEX
}
```

### /deleteSubSpace
This will delete the object which goes by the key `fromId` within our `subSpaces`.
All shared secrets in there are lost. And the `fromId` could not share any secrets to us.

#### request
```javascript
{
    publicKey: STRINGHEX64,
    fromId: STRINGHEX64,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    ok: true
}

```
## Shared Secrets

### /shareSecretTo
This will write the secret into the `subSpace` of the `shareToId` if it exists.

We also may specify `isOneTimeSecret = true`. This means that the `shareToId` picks the secret up once - then it would be automatically deleted.

#### request
```javascript
{
    publicKey: STRINGHEX64,
    shareToId: STRINGHEX64,
    secretId: STRING,
    secret: STRING,
    isOneTimeSecret: BOOLEAN,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    ok: true
}
```

### /getSecretFrom
Returns the encrypted secret shared to us by `fromId` having the id `secretId`.

#### request
```javascript
{
    publicKey: STRINGHEX64,
    fromId: STRINGHEX64,
    secretId: STRING,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    referencePoint: STRINGHEX64,
    encryptedContent: STRINGHEX
}
```

### /deleteSharedSecret
This will delete the specified `secretId` if it exists in the available `subSpace` of the `sharedToId`.

#### request
```javascript
{
    publicKey: STRINGHEX64,
    sharedToId: STRINGHEX64,
    secretId: STRING,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    ok: true
}

```

## Notifications

### /addNotificationHook
This creates a hook to notify a `requestableServer` of some action.
You may add multiple notificationHooks on the same target.

We have type `log` which uses every action on the `targetId` to send a `logNotification`.
Then we have the types `event onGet`, `event onSet` and `event onDelete` which would only send the specific action as an `eventNotification`. 

The `targetId` is either `this`, `secrets.mySpecificSecretId`, `subSpaces.deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef` or
`subSpaces.deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.secretIdSharedToMe`.

Last but not least important is the `notifyURL` where the specific notification is being sent to.

The response is the `notificationHookObject`. Containing the `id` which is the `notificationHookId`to be used for deleting, the `type` as given by the request and the `url` as more handy version for the given `notifyURL`.
Also there is an optional `error` field which will indicat if there is something wrong. If it isn't defined then there is no error. 

*Note: when the `notificationHook` is being created, an initial notification is fired to determin the initial error content*

#### request
```javascript
{
    publicKey: STRINGHEX64,
    type: STRING,
    targetId: STRING,
    notifyURL: STRING,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```

#### response
```javascript
{
    id: STRINGHEX32,
    type: STRING,
    url: STRING,
    error: STRINGORUNDEFINED
}

```

### /getNotificationHooks
This retrieves the all `notificationHookObject`s of the specified `targetId`.  

#### request
```javascript
{
    publicKey: STRINGHEX64,
    targetId: STRING,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```

#### response
```javascript
{
    notificationHooks: ARRAY    
}
```

### /deleteNotificationHook
The notification hook is identified by it's `id` specified here as `notificationHookId`.

#### request
```javascript
{
    publicKey: STRINGHEX64,
    notificationHookId: STRINGHEX32,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```

#### response
```javascript
{
    ok: true
}

```

## Requestable Servers
*Note: the API exists however it must be reasoned more about how this feature will be used exactly and if it is necessary even.*

### /setRequestableServer
#### request
```javascript
{
    authCode: STRINGHEX64,
    serverURL: STRING,
    serverNodeId: STRINGHEX64,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    ok: true
}

```

### /getRequestableServer
#### request
```javascript
{
    serverURL: STRING,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```
#### response
```javascript
{
    serverURL: STRING
    serverNodeId: STRINGHEX64
}

```

### /deleteRequestableServer
#### request
```javascript
{
    authCode: STRINGHEX64,
    serverURL: STRING,
    timestamp: NUMBER,
    signature: STRINGHEX128,
    nonce: NUMBER
}
```

#### response
```javascript
{
    ok: true
}

```