############################################################
service = null
export setService = (serviceToSet) -> service = serviceToSet

############################################################
export getNodeId = (authCode) ->
    result = await service.getSignedNodeId(authCode)    
    sNIE = result.serverNodeId?
    tSE = result.timestamp?
    sE = result.signature?
    sNIIS = typeof result.serverNodeId == "string"
    tSIN = typeof result.timestamp == "number"
    sIS = typeof result.signature == "string"

    if sNIE and tSE and sE and sNIIS and tSIN and sIS then return result
    ###
    {
        "publicKey": "...",
        "timestamp": "...",
        "signature": "..."
    }
    ###
    throw new Error("Service returned wrong signedNodeId Object format.")

############################################################
export createAuthCode = (publicKey, timestamp, signature, nonce) ->
    authCode = await service.generateAuthCodeFor(publicKey)
    if typeof authCode == "string" then return {authCode}
    ###   
    {
        "authCode": "..."
    }
    ###
    throw new Error("Service returned wrong authCode type.")




############################################################
export openSecretSpace = (authCode, publicKey, closureDate, timestamp, signature, nonce) ->
    await service.openSecretSpace(authCode, publicKey, closureDate)
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
export deleteSecretSpace = (publicKey, timestamp, signature, nonce) ->
    await service.deleteSecretSpace(publicKey)
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
export openSubSpace = (publicKey, fromId, closureDate, timestamp, signature, nonce) ->
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
export deleteSubSpace = (publicKey, fromId, timestamp, signature, nonce) ->
    await service.deleteSubSpaceFor(publicKey, fromId)
    return {ok:true}


############################################################
export shareSecretTo = (publicKey, shareToId, secretId, secret, oneTimeSecret, timestamp, signature, nonce) ->
    await service.shareSecretTo(publicKey, shareToId, secretId, secret, oneTimeSecret)
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
export addNotificationHook = (publicKey, type, targetId, notifyURL, timestamp, signature, nonce) ->
    notificationHookId = await service.addNotificationHook(publicKey, type, targetId, notifyURL)
    if typeof notificationHookId != "string" then throw new Error("Service did not return a string for the notificationHookId.")
    return {notificationHookId}

export getNotificationHooks = (publicKey, targetId, timestamp, signature, nonce) ->
    notificationHooks = await service.getNotificationHooks(publicKey, targetId)
    if !Array.isArray(notificationHooks) then throw new Error("Service did not return an Array for the notificationHooks.")
    return {notificationHooks}

export deleteNotificationHook = (publicKey, notificationHookId, timestamp, signature, nonce) ->
    await service.deleteNotificationHook(publicKey, notificationHookId)
    return {ok: true}


############################################################
export setRequestableServer = (authCode, serverURL, serverNodeId) ->
    await service.setRequestableServer(serverURL, serverNodeId)
    return {ok: true}

