local skynet = require "skynet"
local socket = require "socket"

local WATCHDOG
local host
local send_request

local CMD = {}
local REQUEST = {}
local client_fd

function CMD.start( conf )
    local fd = conf.client
    local gate = conf.gate
    WATCHDOG = conf.watchdog
    skynet.fork(function (  )
        while true do
            socket.write(client_fd, "heartbeat")
            skynet.sleep(500)
        end
    end)
    client_fd = fd
    skynet.call(gate, "lua", "forward", fd)
end

function CMD.disconnect(  )
    skynet.exit()
end

skynet.start(function (  )
    skynet.dispatch("lua", function (_,_, cmd, ... )
        local f = CMD[cmd]
        skynet.ret(skynet.pack(f(...)))
    end)
end)