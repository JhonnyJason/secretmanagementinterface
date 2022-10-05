############################################################
import * as h from "./secretmanagementhandlers"
import { performance } from "node:perf_hooks"

############################################################
import {
    NUMBER, STRING, STRINGHEX, STRINGHEX32, STRINGHEX64,
    STRINGHEX128, BOOLEAN, ARRAY, assertStructureAndTypes,
    NUMBERORNULL
} from "./checkStructureAndTypes.js"

############################################################
authenticateRequest = null
export setAuthenticationFunction = (fun) -> authenticateRequest = fun

############################################################
#region Basic

############################################################
getNodeIdArguments = {
    authCode: STRINGHEX64
}
############################################################
createAuthCodeArguments = {
    publicKey: STRINGHEX64
    action: STRING
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}

############################################################
export getNodeId = (req, res) ->
    start = performance.now()

    try assertStructureAndTypes(req.body, getNodeIdArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.getNodeId(req)
    catch err then return res.send({error: err.message})
    
    end = performance.now()
    diffMS = end - start
    console.log("/getNodeId took #{diffMS}ms")

    return res.send(response)

############################################################
export createAuthCode = (req, res) ->
    start = performance.now()
    
    try assertStructureAndTypes(req.body, createAuthCodeArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.createAuthCode(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/createAuthCode took #{diffMS}ms")
    
    return res.send(response)


#endregion


############################################################
#region Secret Spaces

############################################################
openSecretSpaceArguments = {
    authCode: STRINGHEX64
    publicKey: STRINGHEX64
    closureDate: NUMBERORNULL
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}
############################################################
getSecretSpaceArguments = {
    publicKey: STRINGHEX64
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}
############################################################
deleteSecretSpaceArguments = {
    publicKey: STRINGHEX64 
    timestamp: NUMBER 
    signature: STRINGHEX128 
    nonce: NUMBER
}

############################################################
export openSecretSpace = (req, res) ->
    start = performance.now()
    
    try assertStructureAndTypes(req.body, openSecretSpaceArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.openSecretSpace(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/openSecretSpace took #{diffMS}ms")
    
    return res.send(response)

############################################################
export getSecretSpace = (req, res) ->
    start = performance.now()
    
    try assertStructureAndTypes(req.body, getSecretSpaceArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.getSecretSpace(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/getSecretSpace took #{diffMS}ms")
    
    return res.send(response)

############################################################
export deleteSecretSpace = (req, res) ->
    start = performance.now()

    try assertStructureAndTypes(req.body, deleteSecretSpaceArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.deleteSecretSpace(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/deleteSecretSpace took #{diffMS}ms")
    
    return res.send(response)

#endregion


############################################################
#region Secrets

############################################################
setSecretArguments = {
    publicKey: STRINGHEX64
    secretId: STRING
    secret: STRING
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}
############################################################
getSecretArguments = {
    publicKey: STRINGHEX64
    secretId: STRING
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}
############################################################
deleteSecretArguments = {
    publicKey: STRINGHEX64
    secretId: STRING
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}

############################################################
export setSecret = (req, res) ->
    start = performance.now()

    try assertStructureAndTypes(req.body, setSecretArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.setSecret(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/setSecret took #{diffMS}ms")

    return res.send(response)

############################################################
export getSecret = (req, res) ->
    start = performance.now()

    try assertStructureAndTypes(req.body, getSecretArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.getSecret(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/getSecret took #{diffMS}ms")
    
    return res.send(response)

############################################################
export deleteSecret = (req, res) ->
    start = performance.now()

    try assertStructureAndTypes(req.body, deleteSecretArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.deleteSecret(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/deleteSecret took #{diffMS}ms")
    
    return res.send(response)

#endregion


############################################################
#region Sub Spaces

############################################################
openSubSpaceArguments = {
    publicKey: STRINGHEX64
    fromId: STRINGHEX64
    closureDate: NUMBERORNULL
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}
############################################################
getSubSpaceArguments = {
    publicKey: STRINGHEX64
    fromId: STRINGHEX64
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}
############################################################
deleteSubSpaceArguments = {
    publicKey: STRINGHEX64
    fromId: STRINGHEX64
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}

############################################################
export openSubSpace = (req, res) ->
    start = performance.now()

    try assertStructureAndTypes(req.body, openSubSpaceArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.openSubSpace(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/openSubSpace took #{diffMS}ms")
    
    return res.send(response)

############################################################
export getSubSpace = (req, res) ->
    start = performance.now()
    
    try assertStructureAndTypes(req.body, getSubSpaceArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.getSubSpace(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/getSubSpace took #{diffMS}ms")
    
    return res.send(response)

############################################################
export deleteSubSpace = (req, res) ->
    start = performance.now()
    
    try assertStructureAndTypes(req.body, deleteSubSpaceArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.deleteSubSpace(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/deleteSubSpace took #{diffMS}ms")
    
    return res.send(response)
    

#endregion


############################################################
#region Shared Secrets

############################################################
shareSecretToArguments = {
    publicKey: STRINGHEX64
    shareToId: STRINGHEX64
    secretId: STRING
    secret: STRING
    isOneTimeSecret: BOOLEAN
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}
############################################################
getSecretFromArguments = {
    publicKey: STRINGHEX64
    fromId: STRINGHEX64
    secretId: STRING
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}
############################################################
deleteSharedSecretArguments = {
    publicKey: STRINGHEX64
    sharedToId: STRINGHEX64
    secretId: STRING
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}

############################################################
export shareSecretTo = (req, res) ->
    start = performance.now()
    
    try assertStructureAndTypes(req.body, shareSecretToArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.shareSecretTo(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/shareSecretTo took #{diffMS}ms")
    
    return res.send(response)

############################################################
export getSecretFrom = (req, res) ->
    start = performance.now()
    
    try assertStructureAndTypes(req.body, getSecretFromArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.getSecretFrom(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/getSecretFrom took #{diffMS}ms")
   
    return res.send(response)

############################################################
export deleteSharedSecret = (req, res) ->
    start = performance.now()

    try assertStructureAndTypes(req.body, deleteSharedSecretArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.deleteSharedSecret(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/deleteSharedSecret took #{diffMS}ms")
    
    return res.send(response)

#endregion


############################################################
#region Notifications

############################################################
addNotificationHookArguments = {
    publicKey: STRINGHEX64
    type: STRING
    targetId: STRING
    notifyURL: STRING
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}
############################################################
getNotificationHooksArguments = {
    publicKey: STRINGHEX64
    targetId: STRING
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}
############################################################
deleteNotificationHookArguments = {
    publicKey: STRINGHEX64
    notificationHookId: STRINGHEX32
    timestamp: NUMBER
    signature: STRINGHEX128
    nonce: NUMBER
}

############################################################
export addNotificationHook = (req, res) ->
    start = performance.now()

    try assertStructureAndTypes(req.body, addNotificationHookArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.addNotificationHook(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/addNotificationHook took #{diffMS}ms")

    return res.send(response)

############################################################
export getNotificationHooks = (req, res) ->
    start = performance.now()

    try assertStructureAndTypes(req.body, getNotificationHooksArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.getNotificationHooks(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/getNotificationHooks took #{diffMS}ms")
    
    return res.send(response)

############################################################
export deleteNotificationHook = (req, res) ->
    start = performance.now()
    try assertStructureAndTypes(req.body, deleteNotificationHookArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.deleteNotificationHook(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/deleteNotificationHook took #{diffMS}ms")
    
    return res.send(response)

#endregion
