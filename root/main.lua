package.path = package.path .. './libs/?.lua'

local json = require("dkjson")

print(json.encode("{a: 1}"))
