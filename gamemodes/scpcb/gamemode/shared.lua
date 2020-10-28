local GM = GM or GAMEMODE

GM.Name	    = "SCP: Containment Breach";
GM.Author   = "Bilwin";
GM.Email    = "bilwin@minerva.pw";
GM.Website  = "minerva.pw";
GM.Version  = "0.1";

scp_cb = scp_cb or {};
scp_cb.plugins = scp_cb.plugins or {};

scp_cb.prefix = scp_cb.prefix or "cb_"

-- @function error
-- Description: Lmao this is shit

function error(message)
    print("[ERROR] " .. message);
end

function GM:PlayerButtonDown(player, button)
    -- 107
    if button == 107 then
        player:LagCompensation( true )
        local data = {}
            data.start = player:GetShootPos()
            data.endpos = data.start + player:GetAimVector() * 96
            data.filter = player
        local trace = util.TraceLine(data).Entity
        player:LagCompensation( false )

        if (trace.InteractDelay or 0) < CurTime() then
            if not IsValid(trace) or not whitelist_interacts[trace:GetClass()] then return end
            if blacklist_interacts[trace:GetModel()] then
                if SERVER then
                    trace:Fire("Toggle")
                end

                trace.InteractDelay = CurTime() + 3

                return
            end

            if button_list[trace:GetModel()].status then
                trace:EmitSound(button_list[trace:GetModel()].sound_true)

                net.Start("SCP.CB.InteractItem")
                    net.WriteEntity(trace)
                net.SendToServer()
            else
                trace:EmitSound(button_list[trace:GetModel()].sound_false)
            end

            trace.InteractDelay = CurTime() + 3

            return
        end
    end
end
-- @function scp_cb:Message
-- Description: Allows the server to send a stream of messages to clients

function scp_cb:Message(type, message)
    if not type then error("No type") end
    if not message then error("No message") end

    if type == 1 then
        type = "[NOTICE]";
    elseif type == 2 then
        type = "[WARNING]";
    elseif type == 3 then
        type = "[MODULE]";
    end

    print(type .. " " .. message);

    type = nil;
end

scp_cb:Message(1, "Shared is loaded");