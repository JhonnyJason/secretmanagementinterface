############################################################
export addNodeId = (req, res) ->
    try
        response = await h.addNodeId(req.body.publicKey, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export removeNodeId = (req, res) ->
    try
        response = await h.removeNodeId(req.body.publicKey, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export getSecretSpace = (req, res) ->
    try
        response = await h.getSecretSpace(req.body.publicKey, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export getSecret = (req, res) ->
    try
        response = await h.getSecret(req.body.publicKey, req.body.secretId, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export setSecret = (req, res) ->
    try
        response = await h.setSecret(req.body.publicKey, req.body.secretId, req.body.secret, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export deleteSecret = (req, res) ->
    try
        response = await h.deleteSecret(req.body.publicKey, req.body.secretId, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export startAcceptingSecretsFrom = (req, res) ->
    try
        response = await h.startAcceptingSecretsFrom(req.body.publicKey, req.body.fromId, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export stopAcceptingSecretsFrom = (req, res) ->
    try
        response = await h.stopAcceptingSecretsFrom(req.body.publicKey, req.body.fromId, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export shareSecretTo = (req, res) ->
    try
        response = await h.shareSecretTo(req.body.publicKey, req.body.shareToId, req.body.secretId, req.body.secret, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export deleteSharedSecret = (req, res) ->
    try
        response = await h.deleteSharedSecret(req.body.publicKey, req.body.sharedToId, req.body.secretId, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export addSyncHook = (req, res) ->
    try
        response = await h.addSyncHook(req.body.publicKey, req.body.secretId, req.body.serverURL, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export addNotificationHook = (req, res) ->
    try
        response = await h.addNotificationHook(req.body.publicKey, req.body.type, req.body.specific, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export getAuthCode = (req, res) ->
    try
        response = await h.getAuthCode(req.body.publicKey, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export addFriendServer = (req, res) ->
    try
        response = await h.addFriendServer(req.body.authCode, req.body.serverURL, req.body.serverNodeId)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
export getNodeId = (req, res) ->
    try
        response = await h.getNodeId(req.body.authCode)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

