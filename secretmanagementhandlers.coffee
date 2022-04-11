############################################################
export addNodeId = (publicKey, timestamp, signature) ->
    secretStore.addNodeId(publicKey)
    return {ok:true}
    

############################################################
export removeNodeId = (publicKey, timestamp, signature) ->
    secretStore.removeNodeId(publicKey)
    return {ok:true}


############################################################
export getSecretSpace = (publicKey, timestamp, signature) ->
    encryptedSpace = await secretHandler.getEncryptedSecretSpace(publicKey)
    return encryptedSpace


############################################################
export getSecret = (publicKey, secretId, timestamp, signature) ->
    secret = secretStore.getSecret(publicKey, secretId)
    return secret


############################################################
export setSecret = (publicKey, secretId, secret, timestamp, signature) ->
    await secretHandler.setSecret(publicKey, secretId, secret)
    return {ok:true}


############################################################
export deleteSecret = (publicKey, secretId, timestamp, signature) ->
    secretStore.deleteSecret(publicKey, secretId)
    return {ok:true}


############################################################
export startAcceptingSecretsFrom = (publicKey, fromId, timestamp, signature) ->
    await secretStore.addSubSpaceFor(publicKey, fromId)
    return {ok:true}


############################################################
export stopAcceptingSecretsFrom = (publicKey, fromId, timestamp, signature) ->
    await secretStore.removeSubSpaceFor(publicKey, fromId)
    return {ok:true}


############################################################
export shareSecretTo = (publicKey, shareToId, secretId, secret, timestamp, signature) ->
    await secretHandler.shareSecretTo(publicKey, shareToId, secretId, secret)
    return {ok:true}


############################################################
export deleteSharedSecret = (publicKey, sharedToId, secretId, timestamp, signature) ->
    secretStore.deleteSharedSecret(sharedToId, publicKey, secretId)
    return {ok:true}


############################################################
export addSyncHook = (publicKey, secretId, serverURL, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}


    ###
    return result


############################################################
export addNotificationHook = (publicKey, type, specific, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}


    ###
    return result


############################################################
export getAuthCode = (publicKey, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}

    ###
    return result


############################################################
export addFriendServer = (authCode, serverURL, serverNodeId) ->
    result = {}
    ###
    
{
    "ok": true
}


    ###
    return result


############################################################
export getNodeId = (authCode) ->
    result = {}
    ###
    
{
    "publicKey": "...",
    "timestamp": "...",
    "signature": "..."
}

    ###
    return result


