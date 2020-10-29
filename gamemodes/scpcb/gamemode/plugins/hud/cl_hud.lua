local gradient = Material("gui/gradient_up");
local vignette = Material("scp/hud/vignette.png", "noclamp smooth");
local scp_stamina = Material("scp/hud/scphudstamina");
local scp_blink = Material("scp/hud/scphudblink");
local scp_bars = Material("scp/hud/scphudarmorbars.jpg", "noclamp smooth");
local scp_interact = Material("scp/hud/handsymbol.png", "noclamp smooth");
local Clamp = math.Clamp;
local GM = GM or GAMEMODE;

local scp_health_w = 61;

local hideElements = {
    ["CHudHealth"]          = true,
    ["CHudBattery"]         = true,
    ["CHudSuitPower"]       = true,
    ["CHudAmmo"]            = true,
    ["CHudSecondaryAmmo"]   = true,
    ["CHudCrosshair"]       = true
}

function scp_cb:ScreenMessage(text, delay)
end

hook.Add("HUDShouldDraw", "SCP.CB.HudHide", function(name)
    if hideElements[name] then return false end
end)

hook.Add("HUDPaint", "SCP.CB.BasicHud", function()
    if not tobool( GetConVarNumber(scp_cb.prefix.."hud_enabled") ) then return end
    if not LocalPlayer():Alive() then return end

	surface.SetDrawColor(0, 0, 0, 255)
	surface.SetMaterial(vignette)
	surface.DrawTexturedRect(0, 0, ScrW(), ScrH())

    surface.SetDrawColor(255, 255, 255, 11);
    surface.SetMaterial(gradient);
    surface.DrawTexturedRect(ScrW()*.04, ScrH()/1.15, ScrW()*.157, ScrH()*.025);
    surface.DrawTexturedRect(ScrW()*.04, ScrH()/1.1, ScrW()*.157, ScrH()*.025);

    surface.SetDrawColor(255, 255, 255, 55);
    surface.DrawOutlinedRect( ScrW()*.04, ScrH()/1.15, ScrW()*.157, ScrH()*.025, 2 );
    surface.DrawOutlinedRect( ScrW()*.04, ScrH()/1.1, ScrW()*.157, ScrH()*.025, 2 );

	surface.SetDrawColor(255, 255, 255, 255)
	surface.SetMaterial(scp_blink)
	surface.DrawTexturedRect(ScrW()*.015, ScrH()/1.15, ScrW()*.020, ScrH()*.035)

	surface.SetMaterial(scp_stamina)
	surface.DrawTexturedRect(ScrW()*.015, ScrH()/1.1, ScrW()*.020, ScrH()*.035)

    --[[surface.SetDrawColor(255, 0, 0, 55);
    surface.DrawOutlinedRect( ScrW()*.015, ScrH()/1.15, ScrW()*.020, ScrH()*.035, math.floor( math.sin( CurTime() * 5 ) * 5 ) + .5 );]]

    if Clamp(LocalPlayer().Stamina, 0, 22) < 7 then
        surface.SetDrawColor(255, 0, 0, 55);
        surface.DrawOutlinedRect( ScrW()*.015, ScrH()/1.1, ScrW()*.020, ScrH()*.035, math.floor( math.sin( CurTime() * 5 ) * 5 ) + .5 );
    end

    surface.SetDrawColor(255, 255, 255, 222)
    surface.SetMaterial(scp_bars)

    for i=2,Clamp(23 * Clamp((SCPBlink_GetBlinkTimeLeft() / GetConVarNumber(scp_cb.prefix .. "blinking_interval")), 0, 1), 0, 22) do
        surface.DrawTexturedRect(ScrW()*.0265 + ScrW()*.0074 * i, ScrH()/1.147, ScrW()*.007, ScrH()*.02)
    end

    surface.SetDrawColor(125, 125, 125, 222)

    for i=2,Clamp(LocalPlayer().Stamina, 0, 22) do
        surface.DrawTexturedRect(ScrW()*.0265 + ScrW()*.0074 * i, ScrH()/1.097, ScrW()*.007, ScrH()*.02)
    end
end)

hook.Add("HUDPaint", "SCP.CB.InfoNode", function()
	local data = {}
		data.start = LocalPlayer():GetShootPos()
		data.endpos = data.start + LocalPlayer():GetAimVector() * 96
		data.filter = LocalPlayer()
	local target = util.TraceLine(data).Entity

    if ( target.InteractDelay or 0) > CurTime() then return end

    if ( IsValid(target) and whitelist_interacts[target:GetClass()] ) then

        if (target:GetClass() == "prop_door_rotating") then 
            surface.SetDrawColor(255, 255, 255, 255)
            surface.SetMaterial(scp_interact)
            surface.DrawTexturedRect(ScrW()/2, ScrH()/2 + 10 * math.sin(CurTime() * 2), ScrW()*.030, ScrH()*.05)
            return 
        end

        if button_list[target:GetModel()].hand_color then
            surface.SetDrawColor(button_list[target:GetModel()].hand_color)
        else
            surface.SetDrawColor(255, 255, 255, 255)
        end

        surface.SetMaterial(scp_interact)
        surface.DrawTexturedRect(ScrW()/2, ScrH()/2 + 10 * math.sin(CurTime() * 2), ScrW()*.030, ScrH()*.05)
    end
end)

function GM:ScoreboardShow()
end

function GM:ScoreboardHide()
end