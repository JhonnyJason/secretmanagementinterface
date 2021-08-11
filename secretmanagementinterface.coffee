secretmanagementinterface = {}

############################################################
secretmanagementinterface.addNodeId = (publicKey, timestamp, signature) ->
    requestObject = { publicKey, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/addNodeId"
    return @postData(requestURL, requestObject)

secretmanagementinterface.getSecretSpace = (publicKey, timestamp, signature) ->
    requestObject = { publicKey, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/getSecretSpace"
    return @postData(requestURL, requestObject)

secretmanagementinterface.getSecret = (publicKey, secretId, timestamp, signature) ->
    requestObject = { publicKey, secretId, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/getSecret"
    return @postData(requestURL, requestObject)

secretmanagementinterface.setSecret = (publicKey, secretId, secret, timestamp, signature) ->
    requestObject = { publicKey, secretId, secret, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/setSecret"
    return @postData(requestURL, requestObject)

secretmanagementinterface.deleteSecret = (publicKey, secretId, timestamp, signature) ->
    requestObject = { publicKey, secretId, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/deleteSecret"
    return @postData(requestURL, requestObject)

secretmanagementinterface.startAcceptingSecretsFrom = (publicKey, fromId, timestamp, signature) ->
    requestObject = { publicKey, fromId, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/startAcceptingSecretsFrom"
    return @postData(requestURL, requestObject)

secretmanagementinterface.stopAcceptingSecretsFrom = (publicKey, fromId, timestamp, signature) ->
    requestObject = { publicKey, fromId, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/stopAcceptingSecretsFrom"
    return @postData(requestURL, requestObject)

secretmanagementinterface.shareSecretTo = (publicKey, shareToId, secretId, secret, timestamp, signature) ->
    requestObject = { publicKey, shareToId, secretId, secret, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/shareSecretTo"
    return @postData(requestURL, requestObject)

secretmanagementinterface.deleteSharedSecret = (publicKey, sharedToId, secretId, timestamp, signature) ->
    requestObject = { publicKey, sharedToId, secretId, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/deleteSharedSecret"
    return @postData(requestURL, requestObject)

secretmanagementinterface.addSyncHook = (publicKey, secretId, serverURL, timestamp, signature) ->
    requestObject = { publicKey, secretId, serverURL, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/addSyncHook"
    return @postData(requestURL, requestObject)

secretmanagementinterface.addNotificationHook = (publicKey, type, specific, timestamp, signature) ->
    requestObject = { publicKey, type, specific, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/addNotificationHook"
    return @postData(requestURL, requestObject)

secretmanagementinterface.getAuthCode = (publicKey, timestamp, signature) ->
    requestObject = { publicKey, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/getAuthCode"
    return @postData(requestURL, requestObject)

secretmanagementinterface.addFriendServer = (authCode, serverURL, serverNodeId) ->
    requestObject = { authCode, serverURL, serverNodeId }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/addFriendServer"
    return @postData(requestURL, requestObject)

secretmanagementinterface.getNodeId = (authCode) ->
    requestObject = { authCode }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["secretmanagementinterface"]+"/getNodeId"
    return @postData(requestURL, requestObject)

#endregion

    
module.exports = secretmanagementinterface