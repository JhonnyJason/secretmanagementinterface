############################################################
scihandlers.addNodeId = (publicKey, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}

    ###
    return result


############################################################
scihandlers.getSecretSpace = (publicKey, timestamp, signature) ->
    result = {}
    ###
    
{
    "referencePoint": "...",
    "encryptedContent": "..."
}

    ###
    return result


############################################################
scihandlers.getSecret = (publicKey, secretId, timestamp, signature) ->
    result = {}
    ###
    
{
    "referencePoint": "...",
    "encryptedContent": "..."
}

    ###
    return result


############################################################
scihandlers.setSecret = (publicKey, secretId, secret, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}

    ###
    return result


############################################################
scihandlers.deleteSecret = (publicKey, secretId, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}

    ###
    return result


############################################################
scihandlers.startAcceptingSecretsFrom = (publicKey, fromId, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}

    ###
    return result


############################################################
scihandlers.stopAcceptingSecretsFrom = (publicKey, fromId, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}


    ###
    return result


############################################################
scihandlers.shareSecretTo = (publicKey, shareToId, secretId, secret, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}

    ###
    return result


############################################################
scihandlers.deleteSharedSecret = (publicKey, sharedToId, secretId, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}


    ###
    return result


############################################################
scihandlers.addSyncHook = (publicKey, secretId, serverURL, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}


    ###
    return result


############################################################
scihandlers.addNotificationHook = (publicKey, type, specific, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}


    ###
    return result


############################################################
scihandlers.getAuthCode = (publicKey, timestamp, signature) ->
    result = {}
    ###
    
{
    "ok": true
}

    ###
    return result


############################################################
scihandlers.addFriendServer = (authCode, serverURL, serverNodeId) ->
    result = {}
    ###
    
{
    "ok": true
}


    ###
    return result


############################################################
scihandlers.getNodeId = (authCode) ->
    result = {}
    ###
    
{
    "publicKey": "...",
    "timestamp": "...",
    "signature": "..."
}

    ###
    return result


