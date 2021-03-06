local skynet = require "skynet"
local socket = require "socket"

function echo( id, addr )
    socket.start(id)
    while true do
        local str = socket.read(id)
        if str then
            skynet.error("客户端："..id, "发送内容："..str)
            socket.write(id, str)
        else
            socket.close(id)
            skynet.error("客户端："..id, "["..addr.."]", "断开连接")
            return
        end
    end
end

-- 服务入口
skynet.start(function (  )
    local id = assert(socket.listen(skynet.getenv "app_server" ))
    socket.start(id, function ( id, addr )
        skynet.error("客户端："..id, " ["..addr.."]", "已连接")
        skynet.fork(echo, id, addr)
    end)
end)