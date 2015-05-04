PlayerManager = {}
PlayerManager.m_keyId = 0 -- 玩家独立id 如果相同则不能游戏
PlayerManager.m_heroList = {} -- 玩家英雄列表
PlayerManager.m_heroDataList = {} -- 玩家英雄数据列表
PlayerManager.m_UIList = {} -- 全屏界面列表
-- 获取英雄
function PlayerManager:getHero(playerId)
    return self.m_heroList[playerId]
end
-- 获取英雄数据
function PlayerManager:getHeroData(playerId)
    return self.m_heroDataList[playerId]
end
-- 加入一个英雄和数据
function PlayerManager:addHero( playerId, heroData )
    local unit = heroData:getUnit() 
    self.m_heroList[playerId] = heroData:getUnit() 
    self.m_heroDataList[playerId] = heroData 
end
-- 获取UI
function PlayerManager:getUI(playerId)
    return self.m_UIList[playerId]
end
function PlayerManager:addFullScreenUI( playerId, ui )
    self.m_UIList[playerId] = ui 
end
-- 生成玩家的专属id
function PlayerManager:createPlayerKeyId( playerId )
    local heroUnit = self.m_heroList[playerId]
    if heroUnit then
        local heroHandle = GetHandleId(heroUnit)
        local id = heroHandle + GetRandomInt(1,10000) + os.time()
        return id
    end
end
-- 设置玩家专属id
function PlayerManager:setPlayerKeyId( id )
    id = id or 0
    self["m_keyId"] = id
end
-- 创建一个新玩家
function PlayerManager:createPlayer( playerId )
    local heroData = UnitManager:createHero( playerId, gfun.ID(|H000|), 26517, -27670 , 0 , EM_JOB_TYPE.ATTACK, EM_SEX_TYPE.MEN )
    self:addHero( playerId, heroData )
    self:addFullScreenUI( playerId, UIFullScreen.create(playerId) )
    -- 生成并设置专属id
    local keyId = self:createPlayerKeyId( playerId )
    self:setPlayerKeyId( keyId )
end
