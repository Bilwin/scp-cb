local LastTextEntryGetFocus = NULL
local LastTextEntryLoseFocus = NULL
local PlayerIsTyping = 0
local IsBlinking = false
local HasBlinked = true
local ReadyToOpen = true
local BlinkTime = CurTime()
local BlinkTimeLeft = 0
local BlinkAlphaMult = 1
local BlinkAlpha = 0
local EyesClosed = false

function SCPBlink_GetLastBlinkTime()
	return (BlinkTime + 0)
end

function SCPBlink_GetBlinkTimeLeft()
	return (BlinkTimeLeft + 0)
end

function SCPBlink_GetBlinkAlphaMult()
	return (BlinkAlphaMult + 0)
end

function SCPBlink_EyesClosed()
	return (EyesClosed and true)
end

function SCPBlink_SetBlinkAlphaMult(value)
	if (GetConVarNumber(scp_cb.prefix .. "blinking_enabled") != 0) then
		BlinkAlphaMult = math.Clamp(value, 0, 1)
		BlinkAlpha = 255 * (1 - BlinkAlphaMult)
		EyesClosed = (BlinkAlphaMult <= 0)
	end
end

function SCPBlink_SetBlinking(value)
	if value then
		IsBlinking = true
	else
		IsBlinking = false
	end
end

local function SCPBlink_DrawEyes()
	local ply = LocalPlayer()
	if ply:IsValid() then
		if ply:Alive() then
			cam.Start2D()
			
			draw.RoundedBox(0, 0, 0, ScrW(), ScrH(), Color(0, 0, 0, BlinkAlpha))
			
			cam.End2D()
		end
	end
end

local function SCPBlink_OnTextEntryGetFocus(panel)
	if ((panel != LastTextEntryGetFocus) or (panel == LastTextEntryLoseFocus)) then
		PlayerIsTyping = PlayerIsTyping + 1
		
		LastTextEntryGetFocus = panel
		
		if (panel == LastTextEntryLoseFocus) then
			LastTextEntryLoseFocus = NULL
		end
	end
end

local function SCPBlink_OnTextEntryLoseFocus(panel)
	if ((panel != LastTextEntryLoseFocus) or (panel == LastTextEntryGetFocus)) then
		PlayerIsTyping = PlayerIsTyping - 1
		
		if (PlayerIsTyping < 0) then
			PlayerIsTyping = 0
		end
		
		LastTextEntryLoseFocus = panel
		
		if (panel == LastTextEntryGetFocus) then
			LastTextEntryGetFocus = NULL
		end
	end
end

local function SCPBlink_Blink(ply, cmd)
	if (ply != LocalPlayer()) then return end
	
	if (string.lower(cmd) == "+blink") then
		IsBlinking = true
	elseif (string.lower(cmd) == "-blink") then
		IsBlinking = false
	end
end

concommand.Add("+blink", SCPBlink_Blink)
concommand.Add("-blink", SCPBlink_Blink)

local PrevControlDown = false
local PrevEyesClosed = true

local LastUpdate = CurTime()

local function SCPBlink_Think()
	local deltaTime = CurTime() - LastUpdate
	
	LastUpdate = CurTime()
	
	if (GetConVarNumber(scp_cb.prefix .. "blinking_enabled") != 0) then
		local controlDown = false
		
		if ((PlayerIsTyping <= 0) and (not gui.IsGameUIVisible()) and (not gui.IsConsoleVisible())) then
			controlDown = input.IsButtonDown(GetConVarNumber(scp_cb.prefix .. "blinking_control"))
			
			if controlDown then
				if (not PrevControlDown) then
					IsBlinking = true
				end
			else
				if PrevControlDown then
					IsBlinking = false
				end
			end
		else
			controlDown = PrevControlDown
		end
		
		PrevControlDown = controlDown
		
		local ply = LocalPlayer()
		if ply:IsValid() then
			if ply:Alive() then
				local DT = CurTime() - BlinkTime
				local duration = GetConVarNumber(scp_cb.prefix .. "blinking_duration")
				local closedRatio = GetConVarNumber(scp_cb.prefix .. "blinking_eyesClosedRatio")
				local closeDuration = duration * (1 - math.Clamp(closedRatio, 0, 1))
				local realDeltaTime = deltaTime * game.GetTimeScale()
				
				if (IsBlinking or (not ReadyToOpen)) then
					if (closeDuration > (2 * realDeltaTime)) then
						BlinkAlphaMult = math.Clamp((BlinkAlphaMult - 2 * realDeltaTime / closeDuration), 0, 1)
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
					
					BlinkTimeLeft = 0
				else
					local interval = GetConVarNumber(scp_cb.prefix .. "blinking_interval")
					if (closeDuration > (2 * realDeltaTime)) then
						BlinkAlphaMult = math.Clamp((BlinkAlphaMult + 2 * deltaTime * game.GetTimeScale() / closeDuration), 0, 1)
					else
						BlinkAlphaMult = 1
					end
					
					HasBlinked = false
					
					BlinkTimeLeft = (interval - DT)
					ReadyToOpen = (DT < interval)
				end
				
				BlinkAlpha = 255 * (1 - BlinkAlphaMult)
				EyesClosed = (BlinkAlphaMult <= 0)
				
				if (EyesClosed != PrevEyesClosed) then
					net.Start("scp_blinkState")
					net.WriteInt(LocalPlayer():EntIndex(), 32)
					net.WriteBool(EyesClosed)
					net.SendToServer()
				end
			else
				HasBlinked = true
				ReadyToOpen = true
				BlinkTime = CurTime()
				BlinkTimeLeft = 0
				BlinkAlphaMult = 1
				BlinkAlpha = 0
				EyesClosed = true
				
				if (not PrevEyesClosed) then
					net.Start("scp_blinkState")
					net.WriteInt(ply:EntIndex(), 32)
					net.WriteBool(true)
					net.SendToServer()
				end
			end
		end
	else
		HasBlinked = true
		ReadyToOpen = true
		BlinkTime = CurTime()
		BlinkTimeLeft = 0
		BlinkAlphaMult = 1
		BlinkAlpha = 0
		EyesClosed = false
		
		if PrevEyesClosed then
			net.Start("scp_blinkState")
			net.WriteInt(ply:EntIndex(), 32)
			net.WriteBool(false)
			net.SendToServer()
		end
	end
	
	PrevEyesClosed = EyesClosed
end

hook.Add("PreDrawHUD", "SCPBlink_DrawEyes", SCPBlink_DrawEyes)
hook.Add("OnTextEntryGetFocus", "SCPBlink_OnTextEntryGetFocus", SCPBlink_OnTextEntryGetFocus)
hook.Add("OnTextEntryLoseFocus", "SCPBlink_OnTextEntryLoseFocus", SCPBlink_OnTextEntryLoseFocus)
hook.Add("Think", "SCPBlink_Think", SCPBlink_Think)