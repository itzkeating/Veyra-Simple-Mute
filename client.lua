local muted = {}

RegisterCommand("mute", function(_, args)
    local target = tonumber(args[1])
    if not target then
        TriggerEvent("chat:addMessage", {
            args = {"SYSTEM", "Usage: /mute [server id]"}
        })
        return
    end
    muted[target] = true
    if GetResourceState("pma-voice") == "started" then
        exports["pma-voice"]:addMutePlayer(target)
    end
    TriggerEvent("chat:addMessage", {
        args = {"VOICE", "Muted player [" .. target .. "]"}
    })
end)

RegisterCommand("unmute", function(_, args)
    local target = tonumber(args[1])
    if not target then
        TriggerEvent("chat:addMessage", {
            args = {"SYSTEM", "Usage: /unmute [server id]"}
        })
        return
    end
    muted[target] = nil
    if GetResourceState("pma-voice") == "started" then
        exports["pma-voice"]:removeMutePlayer(target)
    end
    TriggerEvent("chat:addMessage", {
        args = {"VOICE", "Unmuted player [" .. target .. "]"}
    })
end)