local EM = EVENT_MANAGER

local addon = "BlastbonesNoiseMaker"
local blastbonesId = 117757
local sound = SOUNDS.STATS_PURCHASE

EM:RegisterForEvent(addon .. "Init", EVENT_ADD_ON_LOADED, function(_, addonName)
    if addonName ~= addon then return end

    EM:UnregisterForEvent(addon .. "Init", EVENT_ADD_ON_LOADED)

    EM:RegisterForEvent("BlastbonesNoiseMaker", EVENT_COMBAT_EVENT, function()
        PlaySound(sound)
    end)

    EM:AddFilterForEvent("BlastbonesNoiseMaker", EVENT_COMBAT_EVENT,
        REGISTER_FILTER_ABILITY_ID, blastbonesId,
        REGISTER_FILTER_SOURCE_COMBAT_UNIT_TYPE, COMBAT_UNIT_TYPE_PLAYER_PET,
        REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_DAMAGE
    )
end)
