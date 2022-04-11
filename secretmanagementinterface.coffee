############################################################
export addNodeId = (sciURL, publicKey, timestamp, signature) ->
    requestObject = { publicKey, timestamp, signature }
    requestURL = sciURL+"/addNodeId"
    return postData(requestURL, requestObject)

export getSecretSpace = (sciURL, publicKey, timestamp, signature) ->
    requestObject = { publicKey, timestamp, signature }
    requestURL = sciURL+"/getSecretSpace"
    return postData(requestURL, requestObject)

export getSecret = (sciURL, publicKey, secretId, timestamp, signature) ->
    requestObject = { publicKey, secretId, timestamp, signature }
    requestURL = sciURL+"/getSecret"
    return postData(requestURL, requestObject)

export setSecret = (sciURL, publicKey, secretId, secret, timestamp, signature) ->
    requestObject = { publicKey, secretId, secret, timestamp, signature }
    requestURL = sciURL+"/setSecret"
    return postData(requestURL, requestObject)

export deleteSecret = (sciURL, publicKey, secretId, timestamp, signature) ->
    requestObject = { publicKey, secretId, timestamp, signature }
    requestURL = sciURL+"/deleteSecret"
    return postData(requestURL, requestObject)

export startAcceptingSecretsFrom = (sciURL, publicKey, fromId, timestamp, signature) ->
    requestObject = { publicKey, fromId, timestamp, signature }
    requestURL = sciURL+"/startAcceptingSecretsFrom"
    return postData(requestURL, requestObject)

export stopAcceptingSecretsFrom = (sciURL, publicKey, fromId, timestamp, signature) ->
    requestObject = { publicKey, fromId, timestamp, signature }
    requestURL = sciURL+"/stopAcceptingSecretsFrom"
    return postData(requestURL, requestObject)

export shareSecretTo = (sciURL, publicKey, shareToId, secretId, secret, timestamp, signature) ->
    requestObject = { publicKey, shareToId, secretId, secret, timestamp, signature }
    requestURL = sciURL+"/shareSecretTo"
    return postData(requestURL, requestObject)

export deleteSharedSecret = (sciURL, publicKey, sharedToId, secretId, timestamp, signature) ->
    requestObject = { publicKey, sharedToId, secretId, timestamp, signature }
    requestURL = sciURL+"/deleteSharedSecret"
    return postData(requestURL, requestObject)

export addSyncHook = (sciURL, publicKey, secretId, serverURL, timestamp, signature) ->
    requestObject = { publicKey, secretId, serverURL, timestamp, signature }
    requestURL = sciURL+"/addSyncHook"
    return postData(requestURL, requestObject)

export addNotificationHook = (sciURL, publicKey, type, specific, timestamp, signature) ->
    requestObject = { publicKey, type, specific, timestamp, signature }
    requestURL = sciURL+"/addNotificationHook"
    return postData(requestURL, requestObject)

export getAuthCode = (sciURL, publicKey, timestamp, signature) ->
    requestObject = { publicKey, timestamp, signature }
    requestURL = sciURL+"/getAuthCode"
    return postData(requestURL, requestObject)

export addFriendServer = (sciURL, authCode, serverURL, serverNodeId) ->
    requestObject = { authCode, serverURL, serverNodeId }
    requestURL = sciURL+"/addFriendServer"
    return postData(requestURL, requestObject)

export getNodeId = (sciURL, authCode) ->
    requestObject = { authCode }
    requestURL = sciURL+"/getNodeId"
    return postData(requestURL, requestObject)
