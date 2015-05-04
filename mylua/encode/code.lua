
local json = require "json"

-- 字符加密对应表
local s_encodeMap = 
    {
        ["0"] = {"+","k","|"},
        ["1"] = {")","l","?"},
        ["2"] = {"p","m",">"},
        ["3"] = {"q","n","<"},
        ["4"] = {"r","y","N"},
        ["5"] = {"s","i","M"},
        ["6"] = {"!","j","D"},
        ["7"] = {"@","$","K"},
        ["8"] = {"#","o","P"},
        ["9"] = {"c","f","I"},
        ["\""] = {"d","t","U"},
        [":"] = {"g","w","Y"},
        ["{"] = {"h","&","Z"},
        ["["] = {"x","*","L"},
        ["]"] = {"a","u","X"},
        ["}"] = {"^","v","A"},
        [","] = {"-","(","O"},
        ["_"] = {"e","b","Q"}
    }

-- 生成解密对应decodeMap
local function initDecodeMap(encodeMap)
    local temp = {}
    for key, valueList in pairs(encodeMap) do
        for k, keyStr in ipairs(valueList) do
            temp[keyStr] = key
        end
    end
    return temp
end
local s_encodeMap = initDecodeMap(s_encodeMap)



-- 数据持久化管理

DataSLManager = {}


-- 解密单个字符
function DataSLManager.decodeSingle(ch)
    return s_decodeMap[ch]
end
-- 解密字符串
function DataSLManager.decodeString( strDe )
    local len = string.len(strDe)
    local str = ""
    for pos = 1, len do
        ch = string.sub(strDe,pos,pos)        
        str = string.format("%s%s",str, DataSLManager.decodeSingle(ch) )
    end
    return str
end
-- 加密单个字符
function DataSLManager.encodeSingle(ch)
    local n = math.random(1,3)      -- 随机函数要改
    return s_encodeMap[ch][n]
end
-- 加密字符串
function DataSLManager.encodeString( strEn )
    local len = string.len(strEn)
    local ch = nil
    local str = ""
    for pos = 1, len do
        ch = string.sub(strEn,pos,pos)        
        str = string.format("%s%s",str, DataSLManager.encodeSingle(ch) )
    end
    return str
end
-- 生成json字符串
function DataSLManager.encodeJson( list )
    return json.encode(list)
end
-- 解密json字符串
function DataSLManager.encodeJson( jsonStr )
    return json.decode(jsonStr)
end
-- 提取一件物品的信息
function DataSLManager.getItemInfo( itemData )
    local info = {}

    info["_1"] = 0  -- 物品索引
    info["_2"] = {} -- 装备极品属性
    info["_3"] = 0  -- 物品的剩余数量

end
-- 提取一个玩家的所有信息
function DataSLManager:getPlayerInfo( playerId )
    local info = {}

    local baseInfo = {}     -- 记录基本信息
    baseInfo["_1"] = 0      -- 等级
    baseInfo["_2"] = 0      -- 职业
    baseInfo["_3"] = 0      -- 性别
    baseInfo["_4"] = 0      -- 经验
    baseInfo["_5"] = 0      -- id值
    baseInfo["_6"] = 0      -- 金钱
    baseInfo["_7"] = 0      -- 木材

    local bagInfo = {}      -- 背包物品
    for i = 1, 40 do
        
    end

end

















