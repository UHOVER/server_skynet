local Skynet = require("skynet")
local Log = require("log")

function __init__(  )
    Skynet.newservice('debug_console', Skynet.getenv('CONSOLE_PORT'))
    -- local test_addr = Skynet.newservice('test')

    -- Log.info('test_addr: <%s>', tostring(test_addr))
    -- Log.info('my_addr: <%d>', Skynet.self())

    -- Skynet.kill(test_addr)

    -- test proto
    -- Skynet.newservice("prototest")

    -- test socket
    -- Skynet.newservice("sockettest")

    Skynet.exit()
end

Skynet.start(__init__)