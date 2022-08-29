############################################################
service = null
export setService = (serviceToSet) -> service = serviceToSet


############################################################
export addNodeId = (authCode, publicKey, closureDate, timestamp, signature, nonce) ->
    await service.addNodeId(authCode, publicKey, closureDate)
    return {ok:true}

############################################################
export getSecretSpace = (publicKey, timestamp, signature, nonce) ->
    secretObj = await service.getSecretSpace(publicKey)
    rE = secretObj.referencePointHex?
    eCE = secretObj.encryptedContentHex?
    rIS = typeof secretObj.referencePointHex == "string"
    eCIS = typeof secretObj.encryptedContentHex == "string"
    if rE and eCE and rIS and eCIS then return secretObj
    ###   
    {
        "referencePointHex": "...",
        "encryptedContentHex": "..."
    }
    ###
    throw new Error("Service returned wrong secret object format.")

############################################################
export removeNodeId = (publicKey, timestamp, signature, nonce) ->
    await service.removeNodeId(publicKey)
    return {ok:true}


############################################################
export setSecret = (publicKey, secretId, secret, timestamp, signature, nonce) ->
    await service.setSecret(publicKey, secretId, secret)
    return {ok:true}

############################################################
export getSecret = (publicKey, secretId, timestamp, signature, nonce) ->
    secretObj = await service.getSecret(publicKey, secretId)
    rE = secretObj.referencePointHex?
    eCE = secretObj.encryptedContentHex?
    rIS = typeof secretObj.referencePointHex == "string"
    eCIS = typeof secretObj.encryptedContentHex == "string"
    if rE and eCE and rIS and eCIS then return secretObj
    ###   
    {
        "referencePointHex": "...",
        "encryptedContentHex": "..."
    }
    ###
    throw new Error("Service returned wrong secret object format.")
    
############################################################
export deleteSecret = (publicKey, secretId, timestamp, signature, nonce) ->
    await service.deleteSecret(publicKey, secretId)
    return {ok:true}


############################################################
export startAcceptingSecretsFrom = (publicKey, fromId, closureDate, timestamp, signature, nonce) ->
    await service.createSubSpaceFor(publicKey, fromId, closureDate)
    return {ok:true}

############################################################
export getSubSpace = (publicKey, fromId, timestamp, signature, nonce) ->
    secretObj = await service.getSubSpace(publicKey, fromId)
    rE = secretObj.referencePointHex?
    eCE = secretObj.encryptedContentHex?
    rIS = typeof secretObj.referencePointHex == "string"
    eCIS = typeof secretObj.encryptedContentHex == "string"
    if rE and eCE and rIS and eCIS then return secretObj
    ###   
    {
        "referencePointHex": "...",
        "encryptedContentHex": "..."
    }
    ###
    throw new Error("Service returned wrong secret object format.")

############################################################
export stopAcceptingSecretsFrom = (publicKey, fromId, timestamp, signature, nonce) ->
    await service.removeSubSpaceFor(publicKey, fromId)
    return {ok:true}


############################################################
export shareSecretTo = (publicKey, shareToId, secretId, secret, timestamp, signature, nonce) ->
    await service.shareSecretTo(publicKey, shareToId, secretId, secret)
    return {ok:true}

############################################################
export getSecretFrom = (publicKey, fromId, secretId, timestamp, signature, nonce) ->
    secretObj = await service.getSecretFrom(publicKey, fromId, secretId)
    rE = secretObj.referencePointHex?
    eCE = secretObj.encryptedContentHex?
    rIS = typeof secretObj.referencePointHex == "string"
    eCIS = typeof secretObj.encryptedContentHex == "string"
    if rE and eCE and rIS and eCIS then return secretObj
    ###   
    {
        "referencePointHex": "...",
        "encryptedContentHex": "..."
    }
    ###
    throw new Error("Service returned wrong secret object format.")
    
############################################################
export deleteSharedSecret = (publicKey, sharedToId, secretId, timestamp, signature, nonce) ->
    service.deleteSharedSecret(sharedToId, publicKey, secretId)
    return {ok:true}


############################################################
export addNotificationHook = (publicKey, type, specific, timestamp, signature, nonce) ->
    await service.addNotificationHook(publicKey, type, specific)
    return {ok: true}

############################################################
export getAuthCode = (publicKey, timestamp, signature, nonce) ->
    authCode = await service.generateAuthCodeFor(publicKey)
    if typeof authCode == "string" then return {authCode}
    ###   
    {
        "authCode": "..."
    }
    ###
    throw new Error("Service returned wrong authCode type.")

############################################################
export addFriendServer = (authCode, serverURL, serverNodeId) ->
    await service.addFriendServer(serverURL, serverNodeId)
    return {ok: true}

############################################################
export getNodeId = (authCode) ->
    result = await service.getSignedNodeId()    
    pKE = result.publicKey?
    tSE = result.timestamp?
    sE = result.signature?
    pKEIS = typeof result.publicKey == "string"
    tSEIS = typeof result.timestamp == "string"
    sEIS = typeof result.signature == "string"
    if pKE and tSE and sE and pKEIS and tSEIS and sEIS then return result
    ###
    {
        "publicKey": "...",
        "timestamp": "...",
        "signature": "..."
    }
    ###
    throw new Error("Service returned wrong signedNodeId Object format.")


