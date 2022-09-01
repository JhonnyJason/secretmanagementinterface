############################################################
import * as h from "./secretmanagementhandlers"


############################################################
export getNodeId = (req, res) ->
    try
        response = await h.getNodeId(req.body.authCode)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export createAuthCode = (req, res) ->
    try
        response = await h.createAuthCode(req.body.publicKey, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return


############################################################
export openSecretSpace = (req, res) ->
    try
        response = await h.openSecretSpace(req.body.authCode, req.body.publicKey, req.body.closureDate, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export deleteSecretSpace = (req, res) ->
    try
        response = await h.deleteSecretSpace(req.body.publicKey, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export getSecretSpace = (req, res) ->
    try
        response = await h.getSecretSpace(req.body.publicKey, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return


############################################################
export setSecret = (req, res) ->
    try
        response = await h.setSecret(req.body.publicKey, req.body.secretId, req.body.secret, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export getSecret = (req, res) ->
    try
        response = await h.getSecret(req.body.publicKey, req.body.secretId, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export deleteSecret = (req, res) ->
    try
        response = await h.deleteSecret(req.body.publicKey, req.body.secretId, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return


############################################################
export openSubSpace = (req, res) ->
    try
        response = await h.openSubSpace(req.body.publicKey, req.body.fromId, req.body.closureDate,req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export getSubSpace = (req, res) ->
    try
        response = await h.getSubSpace(req.body.publicKey, req.body.fromId, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export deleteSubSpace = (req, res) ->
    try
        response = await h.deleteSubSpace(req.body.publicKey, req.body.fromId, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return


############################################################
export shareSecretTo = (req, res) ->
    try
        response = await h.shareSecretTo(req.body.publicKey, req.body.shareToId, req.body.secretId, req.body.secret, req.body.oneTimeSecret, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export getSecretFrom = (req, res) ->
    try
        response = await h.getSecretFrom(req.body.publicKey, req.body.fromId, req.body.secretId, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export deleteSharedSecret = (req, res) ->
    try
        response = await h.deleteSharedSecret(req.body.publicKey, req.body.sharedToId, req.body.secretId, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return


############################################################
export addNotificationHook = (req, res) ->
    try
        response = await h.addNotificationHook(req.body.publicKey, req.body.type, req.body.targetId, req.body.notifyURL,  req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export getNotificationHooks = (req, res) ->
    try
        response = await h.getNotificationHooks(req.body.publicKey, req.body.targetId, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export deleteNotificationHook = (req, res) ->
    try
        response = await h.deleteNotificationHook(req.body.publicKey, req.body.notificationHookId, req.body.timestamp, req.body.signature, req.body.nonce)
        res.send(response)
    catch err then res.send({error: err.stack})
    return


############################################################
export setRequestableServer = (req, res) ->
    try
        response = await h.setRequestableServer(req.body.authCode, req.body.serverURL, req.body.serverNodeId)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

