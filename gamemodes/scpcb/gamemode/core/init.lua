local GM = GM or GAMEMODE

if SERVER then
    function GM:CanPlayerSuicide(player)
        return false
    end
    
    function GM:PlayerSpray(player)
        return true
    end

    function GM:PlayerCanPickupItem(player, ent)
        return false
    end

    function GM:PlayerSpawn(client)
        client:SetCanZoom(false)
        client:SetCanWalk(false)
        client:AllowFlashlight(false)
    end

    function GM:PlayerNoClip(player)
        return true
    end

    function GM:PlayerUse(client, entity)
        return false
    end
end

scp_cb:Message(1, "core/init is loaded");