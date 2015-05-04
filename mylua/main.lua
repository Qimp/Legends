local runtime = require "jass.runtime"

runtime.console = true
runtime.error_handle = function(msg)
    print("---------------------------------------")
    print("              LUA ERROR!!              ")
    print("---------------------------------------")
    print(tostring(msg) .. "\n")
    print(debug.traceback())
    print("---------------------------------------")
end


print("sssssssss")
-- 配置
require "UnitCfg.lua"
require "GlobalFunc.lua"
gfun.log( "s132131231313" )
-- 初始化注册事件
require "RegisterEvent.lua"
initRegisterEvent()
-- 物品
require "ItemManager.lua"
for k = 1,3 do
    ItemManager:createItem( |I000|, 0, 26390, -27979+100, 1000 )
    ItemManager:createItem( |I001|, 0, 26390, -27979+100, 1000 )
    ItemManager:createItem( |I002|, 0, 26390, -27979+100, 1000 )
    ItemManager:createItem( |I003|, 0, 26390, -27979+100, 1000 )
    ItemManager:createItem( |I004|, 0, 26390, -27979+100, 1000 )
    ItemManager:createItem( |I005|, 0, 26390, -27979+100, 1000 )
end
-- 单位
require "PlayerManager.lua"
require "UnitManager.lua"
DamageManager:init()
UnitManager:createMonster( 11, gfun.ID(|h007|), 26517, -27670 , 0 )
PlayerManager:createPlayer( 0 )
PlayerManager:createPlayer( 1 )
require "ces.lua"
registerMyMsg()
