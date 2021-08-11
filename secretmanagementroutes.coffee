############################################################
sciroutes.addNodeId = (req, res) ->
    try
        response = await h.addNodeId(req.body.publicKey, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.getSecretSpace = (req, res) ->
    try
        response = await h.getSecretSpace(req.body.publicKey, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.getSecret = (req, res) ->
    try
        response = await h.getSecret(req.body.publicKey, req.body.secretId, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.setSecret = (req, res) ->
    try
        response = await h.setSecret(req.body.publicKey, req.body.secretId, req.body.secret, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.deleteSecret = (req, res) ->
    try
        response = await h.deleteSecret(req.body.publicKey, req.body.secretId, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.startAcceptingSecretsFrom = (req, res) ->
    try
        response = await h.startAcceptingSecretsFrom(req.body.publicKey, req.body.fromId, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.stopAcceptingSecretsFrom = (req, res) ->
    try
        response = await h.stopAcceptingSecretsFrom(req.body.publicKey, req.body.fromId, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.shareSecretTo = (req, res) ->
    try
        response = await h.shareSecretTo(req.body.publicKey, req.body.shareToId, req.body.secretId, req.body.secret, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.deleteSharedSecret = (req, res) ->
    try
        response = await h.deleteSharedSecret(req.body.publicKey, req.body.sharedToId, req.body.secretId, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.addSyncHook = (req, res) ->
    try
        response = await h.addSyncHook(req.body.publicKey, req.body.secretId, req.body.serverURL, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.addNotificationHook = (req, res) ->
    try
        response = await h.addNotificationHook(req.body.publicKey, req.body.type, req.body.specific, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.getAuthCode = (req, res) ->
    try
        response = await h.getAuthCode(req.body.publicKey, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.addFriendServer = (req, res) ->
    try
        response = await h.addFriendServer(req.body.authCode, req.body.serverURL, req.body.serverNodeId)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.getNodeId = (req, res) ->
    try
        response = await h.getNodeId(req.body.authCode)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

