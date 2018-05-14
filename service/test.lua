local Skynet = require("skynet")

local Log = require("log")

local function __init__(  )
    Log.info('this is a test')
    local obj = Skynet.newservice('test1')
    print('obj_addr: ', obj)

    Skynet.send(obj, 'lua', 'test_send', 'hello world')

    local ret = Skynet.call(obj, 'lua', 'test_call', 1, 2)
    print(ret.code, ret.sum)
    -- Skynet.exit()

end

Skynet.start(__init__)
