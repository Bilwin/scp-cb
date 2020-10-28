-- source: https://steamcommunity.com/sharedfiles/filedetails/?id=395498330

if SERVER then
    util.AddNetworkString("SCP.CB.StaminaDrowning");
    util.AddNetworkString("SCP.CB.StaminaSpawn");

    net.Receive("SCP.CB.StaminaDrowning", function(len, player)
        local dmg = DamageInfo()
        dmg:AddDamage(10)
        dmg:SetDamageType(DMG_DROWN)
        dmg:SetAttacker(player)
        dmg:SetInflictor(player)
        
        player:TakeDamageInfo(dmg)
    end)

    hook.Add("PlayerSpawn", "SCP.CB.StaminaReset", function(player)
        net.Start("SCP.CB.StaminaSpawn")
            net.WriteFloat(GetConVarNumber(scp_cb.prefix .. "nstamina_max"))
            net.WriteFloat(GetConVarNumber(scp_cb.prefix .. "nstamina_regenmul"))
            net.WriteFloat(GetConVarNumber(scp_cb.prefix .. "nstamina_decaymul"))
        net.Send(player)

        player:SetRunSpeed(200);
        player:SetWalkSpeed(91);
        player:SetJumpPower(0);
    end)
end

if CLIENT then
    net.Receive("SCP.CB.StaminaSpawn", function(len)
        local MaxStamina = net.ReadFloat()
        local RegenMul = net.ReadFloat()
        local DecayMul = net.ReadFloat()
        
        LocalPlayer().Stamina = MaxStamina
        LocalPlayer().MaxStamina = MaxStamina
        LocalPlayer().StaminaDecay = DecayMul
        LocalPlayer().StaminaRegen = RegenMul

        MaxStamina = nil;
        RegenMul = nil;
        DecayMul = nil;
    end)

    hook.Add("CreateMove", "SCP.CB.StaminaDrain", function(cmd)
        local NewButtons = cmd:GetButtons()
        local Change = FrameTime() * 2
        
        if not first then
            LocalPlayer().Stamina = 22
            LocalPlayer().MaxStamina = 22
            LocalPlayer().StaminaDecay = 1
            LocalPlayer().StaminaRegen = 1
            
            LocalPlayer().NextRegen = 0
            LocalPlayer().WaterTick = 0
            
            first = true
        end

        if cmd:KeyDown(IN_SPEED) and ( cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) ) and (LocalPlayer():GetVelocity():Length() > 100) and ( LocalPlayer():OnGround() or LocalPlayer():WaterLevel() ~= 0 ) and !LocalPlayer():InVehicle() then
            if LocalPlayer().Stamina <= 0 then
                NewButtons = NewButtons - IN_SPEED
            else
                LocalPlayer().Stamina = math.Clamp(LocalPlayer().Stamina - Change * LocalPlayer().StaminaDecay,0,LocalPlayer().MaxStamina)
                LocalPlayer().NextRegen = CurTime() + 1.25
            end
        end

        if LocalPlayer():WaterLevel() == 3 then
            LocalPlayer().NextRegen = CurTime() + 1.25
    
            if LocalPlayer().Stamina ~= 0 then
                LocalPlayer().Stamina = math.Clamp(LocalPlayer().Stamina - Change*0.25*LocalPlayer().StaminaDecay ,0,LocalPlayer().MaxStamina)
            else
                if LocalPlayer().WaterTick <= CurTime() then
                    net.Start("SCP.CB.StaminaDrowning")
                        net.WriteFloat(1)
                    net.SendToServer()
                        
                    LocalPlayer().WaterTick = CurTime() + 1
                end
            end
        end

        if LocalPlayer().NextRegen then
            if LocalPlayer().NextRegen < CurTime() then
                if (cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT)) then
                    LocalPlayer().Stamina = math.Clamp(LocalPlayer().Stamina + ( Change * 0.1 * LocalPlayer().StaminaRegen ) ,0,LocalPlayer().MaxStamina)
                else
                    LocalPlayer().Stamina = math.Clamp(LocalPlayer().Stamina + ( Change * 0.5 * LocalPlayer().StaminaRegen ) ,0,LocalPlayer().MaxStamina)
                end
            end
        end

        cmd:SetButtons(NewButtons)
    end)
end