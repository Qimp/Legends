require "PlayerManager.lua"
CameraManager = {}
CameraManager.m_equipRect = Rect(-299900,-30180,-28400,29650)
CameraManager.m_equipCameraList = {} -- 全屏装备镜头
CameraManager.m_forceTimerList = {} -- 强制镜头timerList
-- 重置玩家镜头
function CameraManager.resetPlayerCamera( id )
    local hero = PlayerManager.m_heroList[id]
    local posX = 10000
    local posY = 5000
    if hero then
        local pos = GetUnitLoc(hero)
        posX = GetLocationX(pos)
        posY = GetLocationY(pos)
        RemoveLocation(pos)
    end
    if GetLocalPlayer() == Player(id) then
        ResetToGameCamera(0)
        PanCameraToTimed(posX, posY, 0)
    end
end
-- 设置玩家在装备区可见
function CameraManager:setVisibleById( playerId )
    local r = self.m_equipRect
    local f = CreateFogModifierRect(Player(playerId), FOG_OF_WAR_VISIBLE, r, false, false)
    FogModifierStart(f)
end
-- 加入全屏装备镜头
function CameraManager:addEquipCameraById( playerId )
    local camera = CreateCameraSetup()
    self.m_equipCameraList[playerId] = camera
    CameraSetupSetField(camera, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    CameraSetupSetField(camera, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    CameraSetupSetField(camera, CAMERA_FIELD_ANGLE_OF_ATTACK, 270.0, 0.0)
    CameraSetupSetField(camera, CAMERA_FIELD_TARGET_DISTANCE, 960.0, 0.0)
    CameraSetupSetField(camera, CAMERA_FIELD_ROLL, 0.0, 0.0)
    CameraSetupSetField(camera, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    CameraSetupSetField(camera, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    CameraSetupSetDestPosition(camera, -29275.00, 29100.0 - playerId*4000, 0.0)
end
-- 解除镜头锁定
function CameraManager:unlockCameraAtEquip( playerId )
    local lockTimer = self.m_forceTimerList[playerId]
    if lockTimer then
        gfun.log("装备镜头解除")
        PauseTimer( lockTimer )
        DestroyTimer( lockTimer )
        self.m_forceTimerList[playerId] = nil
    end
end
-- 锁定镜头到装备界面
function CameraManager:lockCameraAtEquip( playerId )
    self:unlockCameraAtEquip( playerId )
    local lockTimer = CreateTimer()
    self.m_forceTimerList[playerId] = lockTimer
    gfun.log("装备镜头锁定")
    TimerStart( lockTimer, 0.03, true, function()
        if (GetLocalPlayer() == Player(playerId)) then
            CameraSetupApplyForceDuration(self.m_equipCameraList[playerId], true, 0)
        end
    end)
end
-- 初始化
function CameraManager:init()
    for id = 0, 7 do
        self:addEquipCameraById( id )
        self:setVisibleById( id )
    end
end
