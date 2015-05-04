function registerMyMsg()
    local tri = CreateTrigger()
    TriggerRegisterPlayerEvent(tri, Player(0), EVENT_PLAYER_END_CINEMATIC)
    TriggerAddAction(tri, function()
        gfun.log("ssssssssss")
    end)
end
