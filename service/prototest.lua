local skynet = require "skynet"
local protobuf = require "protobuf"

local function __init__(  )
    protobuf.register_file("./resource/protos/Person.pb")
    skynet.error("注册协议文件： Person.pb")
    local tab = {
        name = "uhover",
        id = 101,
    }
    local stringbuf = protobuf.encode("cs.Person", tab)

    local data = protobuf.decode("cs.Person", stringbuf)
    skynet.error("数据编码: name = "..data.name.." id = "..data.id)
end

skynet.start(__init__)