import { postData } from "thingy-network-base"


############################################################
export getNodeId = (sciURL, authCode) ->
    requestObject = { authCode }
    requestURL = sciURL+"/getNodeId"
    return postData(requestURL, requestObject)

export createAuthCode = (sciURL, publicKey, action, timestamp, signature, nonce) ->
    requestObject = { publicKey, timestamp, action, signature, nonce }
    requestURL = sciURL+"/createAuthCode"
    return postData(requestURL, requestObject)


############################################################
export openSecretSpace = (sciURL, authCode, publicKey, closureDate, timestamp, signature, nonce) ->
    requestObject = { authCode, publicKey, closureDate, timestamp, signature, nonce }
    requestURL = sciURL+"/openSecretSpace"
    return postData(requestURL, requestObject)

export deleteSecretSpace = (sciURL, publicKey, timestamp, signature, nonce) ->
    requestObject = { publicKey, timestamp, signature, nonce }
    requestURL = sciURL+"/deleteSecretSpace"
    return postData(requestURL, requestObject)

############################################################
export getSecretSpace = (sciURL, publicKey, timestamp, signature, nonce) ->
    requestObject = { publicKey, timestamp, signature, nonce }
    requestURL = sciURL+"/getSecretSpace"
    return postData(requestURL, requestObject)

export getSubSpace = (sciURL, publicKey, fromId, timestamp, signature, nonce) ->
    requestObject = { publicKey, fromId, timestamp, signature, nonce }
    requestURL = sciURL+"/getSubSpace"
    return postData(requestURL, requestObject)


############################################################
export getSecret = (sciURL, publicKey, secretId, timestamp, signature, nonce) ->
    requestObject = { publicKey, secretId, timestamp, signature, nonce }
    requestURL = sciURL+"/getSecret"
    return postData(requestURL, requestObject)

export setSecret = (sciURL, publicKey, secretId, secret, timestamp, signature, nonce) ->
    requestObject = { publicKey, secretId, secret, timestamp, signature, nonce }
    requestURL = sciURL+"/setSecret"
    return postData(requestURL, requestObject)

export deleteSecret = (sciURL, publicKey, secretId, timestamp, signature, nonce) ->
    requestObject = { publicKey, secretId, timestamp, signature, nonce }
    requestURL = sciURL+"/deleteSecret"
    return postData(requestURL, requestObject)


############################################################
export openSubSpace = (sciURL, publicKey, fromId, closureDate, timestamp, signature, nonce) ->
    requestObject = { publicKey, fromId, closureDate, timestamp, signature, nonce }
    requestURL = sciURL+"/openSubSpace"
    return postData(requestURL, requestObject)

export deleteSubSpace = (sciURL, publicKey, fromId, timestamp, signature, nonce) ->
    requestObject = { publicKey, fromId, timestamp, signature, nonce }
    requestURL = sciURL+"/deleteSubSpace"
    return postData(requestURL, requestObject)


############################################################
export getSecretFrom = (sciURL, publicKey, fromId, secretId, timestamp, signature, nonce) ->
    requestObject = { publicKey, fromId, secretId, timestamp, signature, nonce }
    requestURL = sciURL+"/getSecretFrom"
    return postData(requestURL, requestObject)

export shareSecretTo = (sciURL, publicKey, shareToId, secretId, secret, oneTimeSecret, timestamp, signature, nonce) ->
    requestObject = { publicKey, shareToId, secretId, secret, oneTimeSecret, timestamp, signature, nonce }
    requestURL = sciURL+"/shareSecretTo"
    return postData(requestURL, requestObject)

export deleteSharedSecret = (sciURL, publicKey, sharedToId, secretId, timestamp, signature, nonce) ->
    requestObject = { publicKey, sharedToId, secretId, timestamp, signature, nonce }
    requestURL = sciURL+"/deleteSharedSecret"
    return postData(requestURL, requestObject)


############################################################
export addNotificationHook = (sciURL, publicKey, type, targetId, notifyURL, timestamp, signature, nonce) ->
    requestObject = { publicKey, type, targetId, notifyURL, timestamp, signature, nonce }
    requestURL = sciURL+"/addNotificationHook"
    return postData(requestURL, requestObject)

export getNotificationHooks = (sciURL, publicKey, targetId, timestamp, signature, nonce) ->
    requestObject = { publicKey, targetId, timestamp, signature, nonce }
    requestURL = sciURL+"/getNotificationHooks"
    return postData(requestURL, requestObject)

export deleteNotificationHook = (sciURL, publicKey, notificationHookId , timestamp, signature, nonce) ->
    requestObject = { publicKey, notificationHookId, timestamp, signature, nonce }
    requestURL = sciURL+"/deleteNotificationHook"
    return postData(requestURL, requestObject)


############################################################
export setRequestableServer = (sciURL, authCode, serverURL, serverNodeId) ->
    requestObject = { authCode, serverURL, serverNodeId }
    requestURL = sciURL+"/setRequestableServer"
    return postData(requestURL, requestObject)

##TODO requestable Server stuff
