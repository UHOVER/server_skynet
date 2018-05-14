local Skynet = require("skynet")
local Log = require("log")

function __init__(  )
    Skynet.newservice('debug_console', Skynet.getenv('CONSOLE_PORT'))
    
    -- test socket client
    Skynet.newservice("socketclient")

    Skynet.exit()
end

Skynet.start(__init__)