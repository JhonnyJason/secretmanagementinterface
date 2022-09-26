############################################################
import {
    NUMBER, STRING, STRINGHEX, STRINGHEX32, STRINGHEX64,
    STRINGHEX128, BOOLEAN, ARRAY, assertStructureAndTypes,
    NUMBERORNULL,STRINGORNULL
} from "./checkStructureAndTypes.js"

############################################################
service = null
export setService = (serviceToSet) -> service = serviceToSet

############################################################
ok = true

############################################################
SecretObjectFormat = {
    referencePointHex: STRINGHEX64
    encryptedContentHex: STRINGHEX
}

############################################################
#region Basic

############################################################
getNodeIdResponse = {
    serverNodeId: STRINGHEX64
    timestamp: NUMBER
    signature: STRINGHEX128
}
############################################################
export getNodeId = (req) ->
    response = await service.getSignedNodeId(req)
    try assertStructureAndTypes(response, getNodeIdResponse)
    catch err then throw new Error("Error: service.getSignedNodeId - response format: #{err.message}")
    return response

############################################################
export createAuthCode = (req) ->
    await service.generateAuthCodeFor(req)
    return {ok}

#endregion


############################################################
#region Secret Spaces

############################################################
getSecretSpaceResponse = SecretObjectFormat 

############################################################
export openSecretSpace = (req) ->
    await service.openSecretSpace(req)
    return {ok}

############################################################
export getSecretSpace = (req) ->
    response = await service.getSecretSpace(req)
    try assertStructureAndTypes(response, getSecretSpaceResponse)
    catch err then throw new Error("Error: service.getSecretSpace - response format: #{err.message}")
    return response

############################################################
export deleteSecretSpace = (req) ->
    await service.deleteSecretSpace(req)
    return {ok}

#endregion


############################################################
#region Secrets

############################################################
getSecretResponse = SecretObjectFormat

############################################################
export setSecret = (req) ->
    await service.setSecret(req)
    return {ok}

############################################################
export getSecret = (req) ->
    response = await service.getSecret(req)
    try assertStructureAndTypes(response, getSecretResponse)
    catch err then throw new Error("Error: service.getSecret - response format: #{err.message}")
    return response
    
############################################################
export deleteSecret = (req) ->
    await service.deleteSecret(req)
    return {ok}

#endregion


############################################################
#region Sub Spaces

############################################################
getSubSpaceResponse = SecretObjectFormat

############################################################
export openSubSpace = (req) ->
    await service.createSubSpaceFor(req)
    return {ok}

############################################################
export getSubSpace = (req) ->
    response = await service.getSubSpace(req)
    try assertStructureAndTypes(response, getSubSpaceResponse)
    catch err then throw new Error("Error: service.getSubSpace - response format: #{err.message}")
    return response

############################################################
export deleteSubSpace = (req) ->
    await service.deleteSubSpaceFor(req)
    return {ok}

#endregion


############################################################
#region Shared Secrets

############################################################
getSecretFromResponse = SecretObjectFormat

############################################################
export shareSecretTo = (req) ->
    await service.shareSecretTo(req)
    return {ok}

############################################################
export getSecretFrom = (req) ->
    response = await service.getSecretFrom(req)
    try assertStructureAndTypes(response, getSecretFromResponse)
    catch err then throw new Error("Error: service.getSecretFrom - response format: #{err.message}")
    return response
    
############################################################
export deleteSharedSecret = (req) ->
    service.deleteSharedSecret(req)
    return {ok}

#endregion


############################################################
#region Notifications

############################################################
addNotificationHookResponse = {
    id: STRINGHEX32,
    type: STRING,
    url: STRING,
    error: STRINGORNULL
}

############################################################
getNotificationHookResponse = {
    notificationHooks: ARRAY
}

############################################################
export addNotificationHook = (req) ->
    response = await service.addNotificationHook(req)
    try assertStructureAndTypes(response, addNotificationHookResponse)
    catch err then throw new Error("Error: service.addNotificationHook - response format: #{err.message}")
    return response

export getNotificationHooks = (req) ->
    response = await service.getNotificationHooks(req)
    try assertStructureAndTypes(response, getNotificationHookResponse)
    catch err then throw new Error("Error: service.getNotificationHooks - response format: #{err.message}")
    return response
    
export deleteNotificationHook = (req) ->
    await service.deleteNotificationHook(req)
    return {ok}

#endregion
