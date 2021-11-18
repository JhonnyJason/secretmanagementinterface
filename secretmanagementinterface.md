###### tags: `documentation` `design`

# Secret Management

What we want and need:
---

- [x] Central lightweight service (on our own servers!) to safely store our secrets - the `secretManager`
- [x] The `secretManager` shall not know our secrets - especially not have them being arbitrarily readable
- [x] Only when knowing the `privateKey` one may request a nodes' secrets
- [x] Only when knowing the `privateKey` one may read a nodes' secrets
- [x] Only when knowing the `privateKey` one may have the authority to manipulate a nodes' secrets
- [x] A node may share any secrets with another node
- [x] A node may decide if it accepts secrets form another node
- [x] The possibility to create a self-destructing temporary node
- [ ] Loggin activities of the keys - accessible only with the `privateKey`
- [ ] Decentralitation/Resilience - reduntant Servers running to ensure availabilty
- [ ] Federation - communication with alien Servers

What we ultimately want is to replace oldschool account management (username/email/password) with this rather anonymous SecretsManagement.
The thought Applications of the future shall not have to deal with accounts - having their username passwords etc. stored in their own Database.
The Application simply shall not care about who is requesting what. 

So we decouple Accounts from Applications - as same as UI from Services.
The general Vision in the background looks something like this:

- Choose or build/optimize your own UIs
- Choose or build/optimize your own Services
- Decide which UI shall use which Services
- Use your secrets seemlessly across any of those UIs and Services
- Avoid overcomplicated OAuth and the dependency on Google, Github, Facbook and the likes

## The Basic Behaviour

Any PWA(=UI) or Service or other thingy (e.G CLI) in general is regarded simply as a node. For any new node a keypair is generated the `publicKey` which we also call `nodeId`. (For the sake of simplicity we use ed25519-keys)

From the perspective of the secret Manager this `nodeId` has its own unique `secretSpace` where all secrets for this node are stored.
Every secret stored is encrypted by using the nodes' `publicKey` in such a way only the node may decrypt the secret again.

- node creation -> (publicKey, privateKey)
- notify secretManager of existence -> send publicKey to secretManager -> creates secretSpace
- store secret -> encrypt(secret) -> send to secretManager -> verify authority -> encrypt(receivedSecret) -> store in relevant secretSpace
- retrieve secret -> request secretManager for secret -> verify authority -> send back encryptedSecret from secreSpace -> decrypt(encryptedSecret)

![](https://hackmd.io/_uploads/r1_tKYRPY.jpg)

## The SecretSpace
The `secretSpace` is just a JS object with keys and their content. Were we distinguish 2 kinds of secrets.

### Native Secret
Here the key is the secrets' `secretId` ("allmightySecret").
```json
{
    "allmightySecret": {
        "secret": {referencePoint, encryptedContent}
    }
}
```
### Shared Secret
Here the first key is the `fromId` (the `nodeId` from whom we got the secret from). Its content is merely the sub-space for `fromId` where this node could set secrets for us. Inside this sub-space Object we have the specific secret by its `secretId` ("allmightySecret").

```json
{
    "9a16ce79c30b3b6b11b9c28e33e64e0d5d270cffebaf12d4c878552ddb2634e5": {
        "allmightySecret": {referencePoint, encryptedContent}
    }
}    
```

### The SecretId
As the `secretId` is not directly subject to any encryption, so it might be advisable to not disclose too much information there and rather use the hash of a human readable identifier for its value.

For now this is not implicitely being done.

## Secret Sharing
For our `secretSpace` labeled with our `nodeId` only we have the authority to write anything.

![](https://hackmd.io/_uploads/B1U_tYRwF.jpg)

### Accepting Secrets From Another Node
If we want to allow another node to share secrets to us we first need to create a sub-space labeled as their `nodeId`. This `nodeId` we also call `fromId` in this context.

Now within that sub-space the `fromId` has the authority to store secrets for us. Also those secrets would be asymetrically encrypted using our `publicKey`.

### Writing Shared Secrets
Now the other `nodeId` could decide at any time to write, overwrite and delete any secrets within this sub-space.
Our node would be the only one who could decrypt it using it's own `privateKey`.

### Stop Accepting Secrets
At anytime we could stop accepting secrets from this `nodeId`. Then we would simply delete this sub-space and all secrets therein would be immediately lost. 

## Signature
To verify validity of every request we use ed25519 signatures.
Every request must come from a node with it's `publicKey` which directly defines the full scope of authority. Thus the one signature on the request is the only thing required for authentication.

To mitigate most brutish replay attacks we also use the specific SCI-endpoint and a timestamp witin the signed content.
Also we store the latest signatures used for the time while the timestamp is valid, so not even a fast replay attack is possible. This is necessary because the we have a timeframe of validity of the timestamp which is greater than 0.

---

## Decentralitation/Resilience - reduntant Servers running to ensure availabilty
- Redundancy of Running service
- Load Balancing
- Redundancy of Data Storage

//TODO: research

## Federation - communication with alien Servers
//TODO: research

## Logging activities of the Keys
This is important for breach detection.
Important is to save the logs in a different context in such a way that it is accessible independently of potentially breached keys.

Nice: When having full logs we donot need really any backup as in case of a breach the logs would enable us to reproduce the latest uncorrupted state. 


---

## Secret Manager Service
Central part of this is the [secret-manager-service](https://github.com/JhonnyJason/secret-manager-service).
It provides this SCI to savely store these secrets for these nodes.

Anyone is encouraged to check out the code and run their own secretManager. While my first one is also one publicly accessible at https://secrets.extensivlyon.coffee

It is important to notice that this service could be easily DDOSed. As for every request it would at least verify a signature in pure JS.

## Crypto Utils

There is the [secret-manager-crypto-utils](https://www.npmjs.com/package/secret-manager-crypto-utils) package available. This includes all relavant crypto primitives.
If you want to check out the code and the algorithms [this](https://github.com/JhonnyJason/secret-manager-crypto-utils-sources/tree/master/source) would be the place where to start.

## Secret Manager Client

There is the [secret-manager-client](https://www.npmjs.com/package/secret-manager-client) package available which implements the full client-side of the secretManager SCI.

This serves the purpose to be used in  the applications if it is in the browser, as a NodeJS service or NodejS CLI which needs the secretManager.
If you are interested in the code go [here](https://github.com/JhonnyJason/secret-manager-client-sources/tree/master/source)

## Secret Cockpit
There is a tool available to analyse secrets of your nodes and manage them in hopefully the most flexible way.

- [Live Tool Online](https://secrets-cockpit.extensivlyon.coffee)
- [Documentation](https://hackmd.io/wPTUeTzwQ3q9uXhuKHf3Cg?view)
- [The Code](https://github.com/JhonnyJason/secret-cockpit)

---

## [From Interface Specification:](https://hackmd.io/EtJSEnxjTVOOvRJdWGJlYw?view)

---

{%hackmd EtJSEnxjTVOOvRJdWGJlYw %}

---

## [From Specification Testing:](https://hackmd.io/vUaiSwD3TRyKRURPEnyQSw?view)

---

{%hackmd vUaiSwD3TRyKRURPEnyQSw %}
