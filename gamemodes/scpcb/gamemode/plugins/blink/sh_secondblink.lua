AddCSLuaFile()
AddCSLuaFile("cl_blink.lua")

if SERVER then
	local function SCP_Error(str)
		local errorTable = {}
		
		for i = 1, (#str / 511 + 1) do
			table.insert(errorTable, (#errorTable + 1), string.sub(str, ((i - 1) * 511 + 1), math.min((i * 511), #str)))
		end
		
		if (#errorTable > 0) then
			errorTable[#errorTable] = errorTable[#errorTable] .. "\n"
		end
		
		ErrorNoHalt(unpack(errorTable))
	end
	
	SCP_Mod_BlinkStates = {}
	
	util.AddNetworkString("scp_blinkState")
	
	net.Receive("scp_blinkState", function(len, ply)
		local id = net.ReadInt(32)
		local isBlinking = net.ReadBool()
		
		if ents.GetByIndex(id):IsValid() then
			SCP_Mod_BlinkStates[id] = isBlinking
		else
			SCP_Mod_BlinkStates[id] = nil
		end
	end)
	
	local function UpdateBlinking(ent)
		local ent = ent
		
		local HasBlinked = true
		local ReadyToOpen = true
		local BlinkTime = CurTime() - math.Rand(0, GetConVarNumber(scp_cb.prefix .. "blinking_duration"))
		local BlinkAlphaMult = 1
		local LastUpdate = CurTime()
		
		ent.SCP_Blinking_HasBlinked = true
		ent.SCP_Blinking_ReadyToOpen = true
		ent.SCP_Blinking_BlinkTime = CurTime()
		ent.SCP_Blinking_BlinkAlphaMult = 1
		
		while true do
			if (not ent:IsValid()) then return end
			if (GetConVarNumber(scp_cb.prefix .. "blinking_enabled_npcs") == 0) then
				ent.SCP_Blinking_HasBlinked = nil
				ent.SCP_Blinking_ReadyToOpen = nil
				ent.SCP_Blinking_BlinkTime = nil
				ent.SCP_Blinking_BlinkAlphaMult = nil
				
				return
			end
			
			local deltaTime = CurTime() - LastUpdate
			local DT = CurTime() - BlinkTime
			local duration = GetConVarNumber(scp_cb.prefix .. "blinking_duration")
			local closedRatio = GetConVarNumber(scp_cb.prefix .. "blinking_eyesClosedRatio")
			local closeDuration = duration * (1 - math.Clamp(closedRatio, 0, 1))
			
			if (not ReadyToOpen) then
				if (closedRatio < 1) then
					BlinkAlphaMult = math.Clamp((BlinkAlphaMult - 2 * deltaTime * game.GetTimeScale() / closeDuration), 0, 1)
				else
					BlinkAlphaMult = 0
				end
				
				if (BlinkAlphaMult <= 0) then
					HasBlinked = true
				end
				
				if (not HasBlinked) then
					ReadyToOpen = false
					BlinkTime = CurTime()
				elseif (DT >= closeDuration) then
					ReadyToOpen = true
					BlinkTime = CurTime()
				else
					ReadyToOpen = false
				end
			else
				local interval = GetConVarNumber(scp_cb.prefix .. "blinking_interval")
				
				if (closedRatio < 1) then
					BlinkAlphaMult = math.Clamp((BlinkAlphaMult + 2 * deltaTime * game.GetTimeScale() / closeDuration), 0, 1)
				else
					BlinkAlphaMult = 0
				end
				
				HasBlinked = false
				
				ReadyToOpen = (DT < interval)
			end
			
			SCP_Mod_BlinkStates[ent:EntIndex()] = (BlinkAlphaMult <= 0)
			
			LastUpdate = CurTime()
			
			ent.SCP_Blinking_HasBlinked = HasBlinked
			ent.SCP_Blinking_ReadyToOpen = ReadyToOpen
			ent.SCP_Blinking_BlinkTime = BlinkTime
			ent.SCP_Blinking_BlinkAlphaMult = BlinkAlphaMult
			
			local tickrate = GetConVarNumber(scp_cb.prefix .. "blinking_npc_tickrate")
			
			if (tickrate <= 0) then
				tickrate = 100
			end
			
			coroutine.wait(1 / tickrate)
		end
	end
	
	local function Think()
		local PlayerEnabled = (GetConVarNumber(scp_cb.prefix .. "blinking_enabled") != 0)
		local NPCEnabled = (GetConVarNumber(scp_cb.prefix .. "blinking_enabled_npcs") != 0)
		
		if NPCEnabled then
			for k, v in ipairs(ents.GetAll()) do
				if v:IsNPC() then
					if ((not v.SCP_Blinking_Coroutine) or (coroutine.status(v.SCP_Blinking_Coroutine) == "dead")) then
						v.SCP_Blinking_Coroutine = coroutine.create(UpdateBlinking)
					end
					
					local hadNoErrors, args = coroutine.resume(v.SCP_Blinking_Coroutine, v)
					
					if (not hadNoErrors) then
						SCP_Error("[ERROR] " .. args)
					end
				end
			end
		end
		
		local valuesToDelete = {}
		
		for k, v in pairs(SCP_Mod_BlinkStates) do
			if isnumber(k) then
				local entity = ents.GetByIndex(k)
				
				if entity:IsValid() then
					if entity:IsPlayer() then
						if (not PlayerEnabled) then
							valuesToDelete[k] = true
						end
					elseif entity:IsNPC() then
						if (not NPCEnabled) then
							valuesToDelete[k] = true
						end
					end
				else
					valuesToDelete[k] = true
				end
			else
				valuesToDelete[k] = true
			end
		end
		
		for k, v in pairs(valuesToDelete) do
			SCP_Mod_BlinkStates[k] = nil
		end
	end
	
	hook.Add("Think", "SCP_Blinking_Think", Think)
end