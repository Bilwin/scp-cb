if SERVER then
    hook.Add("PlayerSpawn", "SCP.CB.JumpReset", function(player)
        player:SetJumpPower(0);
    end)
end

if CLIENT then
    hook.Add("CreateMove", "SCP.CB.Blink", function(cmd)
        if cmd:KeyDown(IN_JUMP) then
            EyesClosed = true
        end
    end)

    hook.Add( "KeyRelease", "SCP.CB.Blink", function(player, key)
        if ( key == IN_JUMP ) then
            if EyesClosed then
                EyesClosed = false
            end
        end
    end)

    hook.Add("Think", "SCP.CB.Blink", function()
        if EyesClosed then
            LocalPlayer():ConCommand("+blink")
        else 
            LocalPlayer():ConCommand("-blink")
        end
    end)
end