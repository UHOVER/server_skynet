local Skynet = require("skynet")
require("skynet.manager")

local CMD = {}

function CMD.test_send( s )
    print('test_send: ', s)
end

function CMD.test_call( a, b )
    print('test_call: ', a, b)
    Skynet.retpack({code = 200, sum = a + b})
end

function CMD.test_wln( s )
    print('test_wln: ', s)
end

Skynet.dispatch('lua', function ( session, source, cmd, ... )
    print(session, source, cmd)
    local f = assert(CMD[cmd])
    f(...)
end)

local ser_name = ...
local function __init__(  )

    if ser_name ~= nil then
        print('ser_name:', ser_name) 
        Skynet.register(ser_name)
    end
    print('boot')
end

Skynet.start(__init__)