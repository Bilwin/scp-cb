local scp_interact = Material("scp/hud/handsymbol.png", "noclamp smooth");
local heli_a = false
local car_b = false

hook.Add("PlayerPostThink", "SCP.CB.Escape", function(player)
    for _, v in pairs( ents.FindInSphere(player:GetPos(), 5) ) do
        if v:GetModel() == "models/kali/vehicles/bo2/aircraft/uh-60 blackhawk stealth m134.mdl" then
            heli_a = true
        else
            heli_a = false
        end
    end
end)

if CLIENT then
    hook.Add("HUDPaint", "SCP.CB.InfoEscape", function()
        local data = {}
            data.start = LocalPlayer():GetShootPos()
            data.endpos = data.start + LocalPlayer():GetAimVector() * 96
            data.filter = LocalPlayer()
        local target = util.TraceLine(data).Entity

        if ( target.InteractDelay or 0) > CurTime() then return end

        if ( IsValid(target) ) then
            if (target:GetModel() == "models/kali/vehicles/cod4/uaz_469.mdl") and not car_b then 
                surface.SetDrawColor(255, 255, 255, 255)
                surface.SetMaterial(scp_interact)
                surface.DrawTexturedRect(ScrW()/2, ScrH()/2 + 10 * math.sin(CurTime() * 2), ScrW()*.030, ScrH()*.05)
                return 
            end
        end
    end)

    hook.Add("HUDPaint", "SCP.CB.EscapeHud", function()
        if heli_a then
            net.Start("SCP.CB.Escape")
                net.WriteEntity(LocalPlayer())
            net.SendToServer()

            hook.Remove("HUDPaint", "SCP.CB.EscapeHud")
        end
    end)
end

if SERVER then
    util.AddNetworkString("SCP.CB.Escape");

    net.Receive("SCP.CB.Escape", function()
        local player = net.ReadEntity();
        
        if IsValid(player) then
            player:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0, 255 ), 4, 4 )
            player:Freeze(true)

            timer.Simple(6, function()
                player:Freeze(false)
            end)
        end
    end)

    hook.Add("PlayerIsInteracting", "SCP.CB.EscapeInteracting", function(player)
        player:LagCompensation( true )
        local data = {}
            data.start = player:GetShootPos()
            data.endpos = data.start + player:GetAimVector() * 96
            data.filter = player
        local trace = util.TraceLine(data).Entity
        player:LagCompensation( false )

        if IsValid(trace) and trace:GetModel() == "models/kali/vehicles/cod4/uaz_469.mdl" then

            if IsValid(player) then
                player:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0, 255 ), 4, 4 )
                player:Freeze(true)

                timer.Simple(6, function()
                    player:Freeze(false)
                end)
            end

            car_b = true
        end
    end)
end