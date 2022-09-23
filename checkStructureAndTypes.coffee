############################################################
# types Enumeration
export NUMBER = 0
export STRING = 1
export STRINGHEX = 2
export STRINGHEX32 = 3
export STRINGHEX64 = 4
export STRINGHEX128 = 5
export BOOLEAN = 6
export ARRAY = 7

############################################################
assertionFunctions = new Array(8)

############################################################
#region hexHelpers
hexChars = "0123456789abcdefABCDEF"
hexMap = {}
hexMap[c] = true for c in hexChars

#endregion

############################################################
#region all Assertion Functions
assertionFunctions[NUMBER] = (arg) ->
    if typeof arg != "number" then throw new Error("Not a number!")
    return 

assertionFunctions[STRING] = (arg) ->
    if typeof arg != "string" then throw new Error("Not a string!")
    return 

assertionFunctions[STRINGHEX] = (arg) ->
    if typeof arg != "string" then throw new Error("Not a string!")
    for c in arg when !hexMap[c]? then throw new Error("Not a HexString!")
    return

assertionFunctions[STRINGHEX32] = (arg) ->
    if typeof arg != "string" then throw new Error("Not a string!")
    for c in arg when !hexMap[c]? then throw new Error("Not a HexString!")
    if arg.length != 32 then throw new Error("HexString length was not 32 characters!")
    return

assertionFunctions[STRINGHEX64] = (arg) ->
    if typeof arg != "string" then throw new Error("Not a string!")
    for c in arg when !hexMap[c]? then throw new Error("Not a HexString!")
    if arg.length != 64 then throw new Error("HexString length was not 64 characters!")
    return

assertionFunctions[STRINGHEX128] = (arg) ->
    if typeof arg != "string" then throw new Error("Not a string!")
    for c in arg when !hexMap[c]? then throw new Error("Not a HexString!")
    if arg.length != 128 then throw new Error("HexString length was not 128 characters!")
    return

assertionFunctions[BOOLEAN] = (arg) ->
    if typeof arg != "boolean" then throw new Error("Not a boolean!")
    return

assertionFunctions[ARRAY] = (arg) ->
    if !Array.isArray(arg) then throw new Error("Not an array!")
    return

#endregion

############################################################
export assertStructureAndTypes = (body, argumentTypes) ->
    bodyKeys = Object.keys(body)
    argKeys = Object.keys(argumentTypes)
    
    if bodyKeys.length != argKeys.length then throw new Error("Error: The Number of parameters in the body, did not match the expected number.")
    
    for key,i in bodyKeys
        if key != argKeys[i] then throw new Error("Error: parameter @ index: #{i} did go by the expected key of #{argKeys[i]} - the detected key was: #{key}!")

    for label,arg of body
        type = argumentTypes[label]
        try assertionFunctions[type](arg)
        catch err then throw new Error("Error: unexpected format of parameter #{label} - #{err.message}")
    return