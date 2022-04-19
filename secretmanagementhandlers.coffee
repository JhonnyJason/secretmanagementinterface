############################################################
service = null
export setService = (serviceToSet) -> service = serviceToSet

############################################################
export addNodeId = (publicKey, timestamp, signature) ->
    await service.addNodeId(publicKey)
    return {ok:true}
    

############################################################
export removeNodeId = (publicKey, timestamp, signature) ->
    await service.removeNodeId(publicKey)
    return {ok:true}


############################################################
export getSecretSpace = (publicKey, timestamp, signature) ->
    secretObj = await service.getEncryptedSecretSpace(publicKey)
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
export getSecret = (publicKey, secretId, timestamp, signature) ->
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
export setSecret = (publicKey, secretId, secret, timestamp, signature, req) ->
    urlToSync = service.getURLToSync(publicKey)
    if urlToSync? then syncToURL(req)
    await service.setSecret(publicKey, secretId, secret)
    return {ok:true}


############################################################
export deleteSecret = (publicKey, secretId, timestamp, signature, reqData) ->
    await service.deleteSecret(publicKey, secretId)
    return {ok:true}


############################################################
export startAcceptingSecretsFrom = (publicKey, fromId, timestamp, signature, reqData) ->
    await service.addSubSpaceFor(publicKey, fromId)
    return {ok:true}


############################################################
export stopAcceptingSecretsFrom = (publicKey, fromId, timestamp, signature) ->
    await service.removeSubSpaceFor(publicKey, fromId)
    return {ok:true}


############################################################
export shareSecretTo = (publicKey, shareToId, secretId, secret, timestamp, signature) ->
    await service.shareSecretTo(publicKey, shareToId, secretId, secret)
    return {ok:true}


############################################################
export deleteSharedSecret = (publicKey, sharedToId, secretId, timestamp, signature) ->
    service.deleteSharedSecret(sharedToId, publicKey, secretId)
    return {ok:true}

############################################################
export addNotificationHook = (publicKey, type, specific, timestamp, signature) ->
    await service.addNotificationHook(publicKey, type, specific)
    return {ok: true}


############################################################
export getAuthCode = (publicKey, timestamp, signature) ->
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


