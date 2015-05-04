require "Global.lua"
CJ = require "jass.common"
setmetatable( _ENV, { __index = getmetatable( CJ ).__index } )
local bj_MAX_PLAYER_SLOTS = 15
function TriggerRegisterAnyUnitEventBJ( trig, whichEvent )
    for i = 0, bj_MAX_PLAYER_SLOTS do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), whichEvent, null)
    end
end
gfun = {}
-- 深拷贝
function clone(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs(object) do
            new_table[_copy(key)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end
-- 创建类
function class(classname, super)
    local superType = type(super)
    local cls
    if superType ~= "function" and superType ~= "table" then
        superType = nil
        super = nil
    end
    if superType == "function" or (super and super.__ctype == 1) then
        -- inherited from native C++ Object
        cls = {}
        if superType == "table" then
            -- copy fields from super
            for k,v in pairs(super) do cls[k] = v end
            cls.__create = super.__create
            cls.super = super
        else
            cls.__create = super
        end
        cls.ctor = function() end
        cls.__cname = classname
        cls.__ctype = 1
        function cls.new(...)
            local instance = cls.__create(...)
            -- copy fields from class to native object
            for k,v in pairs(cls) do instance[k] = v end
            instance.class = cls
            instance:ctor(...)
            return instance
        end
    else
        -- inherited from Lua Object
        if super then
            cls = clone(super)
            cls.super = super
        else
            cls = {ctor = function() end}
        end
        cls.__cname = classname
        cls.__ctype = 2 -- lua
        cls.__index = cls
        function cls.new(...)
            local instance = setmetatable({}, cls)
            instance.class = cls
            instance:ctor(...)
            return instance
        end
    end
    return cls
end
-- 把id转换为字符串
function gfun.objectId(id)
	return string.char(id/0x1000000) 
		.. string.char(id/0x10000%0x100) 
		.. string.char(id/0x100%0x100) 
		.. string.char(id%0x100)
end
-- 把字符串转为ID
function gfun.ID( str )
    return str
end
-- 打印
function gfun.log( str )
    DisplayTextToPlayer( Player(0), 0, 0, str )
end
-- 获取玩家id
function gfun.getPlayerIdByUnit( u )
    local thePlayer = GetOwningPlayer( u )
    return GetPlayerId( thePlayer )
end
-- 获取table的长度
function gfun.getTableLen( tab )
    local i = 0
    if tab and type(tab) == "table" then
        for k,v in pairs(tab) do
            i = i + 1
        end
    end
    return i
end
function gfun.distanceBetweenUnits( u1, u2)
    return SquareRoot(( GetUnitX(u2) - GetUnitX(u1) ) * ( GetUnitX(u2) - GetUnitX(u1) ) + ( GetUnitY(u2) - GetUnitY(u1) ) * ( GetUnitY(u2) - GetUnitY(u1) ))
end
function gfun.distanceBetweenXY( x1, y1, x2, y2 )
    return SquareRoot(( x2 - x1 ) * ( x2 - x1 ) + ( y2 - y1 ) * ( y2 - y1 ))
end
function gfun.arcBetweenUnits( u1, u2)
    return Atan2(GetUnitY(u2) - GetUnitY(u1), GetUnitX(u2) - GetUnitX(u1))
end
function gfun.arcBetweenXY( x1, y1, x2, y2 )
    return Atan2(y2 - y1, x2 - x1)
end
-- 创建textTag
function gfun.createTextTagForPlayer (s, u ,z, a, color)
    local t = CreateTextTag()
    SetTextTagText(t, s, 0.023 )
    SetTextTagPermanent( t, false )
    SetTextTagPos(t, GetUnitX(u), GetUnitY(u), z)
    SetTextTagLifespan( t, a )
    SetTextTagFadepoint( t, a )
    SetTextTagVelocity( t, 0.1*Cos(1.570795), 0.1*Sin(1.570795) )
    SetTextTagVisibility( t, true )
    SetTextTagColor( t, color.m_r, color.m_g, color.m_b, color.m_a )
end
-- 获取职业字符串
function gfun.getJobTypeStr( jobType )
    local strList = { "战士", "法师", "道士" }
    return strList[jobType] or ""
end
-- 获取性别字符串
function gfun.getSexStr( sexType )
    local strList = { "男","女" }
    return strList[sexType] or ""
end
-- 提示错误
function gfun.showErrorStr( id, str)
    if Player(id) == GetLocalPlayer() then
        ClearTextMessages()
    end
    local errorStr = string.format( "|cFFFF0000%s|r", str  )
    DisplayTimedTextToPlayer( Player(id), 1.10, 0.00, 5, errorStr)
end
