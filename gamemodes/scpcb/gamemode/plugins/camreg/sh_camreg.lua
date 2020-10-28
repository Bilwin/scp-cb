if CLIENT then
	local AngleA = 0
	local AngleB = 0
	local AngleC = 0
	local AngleD = 0
	local AngleY = 0
	local AngleZ = 0

	local camangle_table = {}

	hook.Add( "CalcView", "SCP.CB.ViewBob", function( player, pos, ang, fov )
		if player:GetMoveType() ~= MOVETYPE_NOCLIP  then
			local v = {}
			v.pos = pos
			v.ang = ang
			v.fov = fov
			
			if player:KeyDown(IN_FORWARD) or player:KeyDown(IN_BACK) or player:KeyDown(IN_MOVELEFT) or player:KeyDown(IN_MOVERIGHT) then
				AngleZ = AngleZ + (10 / 1) * FrameTime()
			end
		
			if player:KeyDown(IN_FORWARD) then
				if AngleA < 1.5 then
					AngleA = AngleA
				end
			else
				if AngleA > 0 then
					AngleA = AngleA
				end
			end
			
			if player:KeyDown(IN_BACK) then
				if AngleA > -1.5 then
					AngleA = AngleA
				end
			else
				if AngleA < 0 then
					AngleA = AngleA
				end
			end
			
			if player:KeyDown(IN_MOVELEFT) then
				if AngleC > -1.5 then
					AngleC = AngleC
				end
			else
				if AngleC < 0 then
					AngleC = AngleC
				end
			end
			
			if player:KeyDown(IN_MOVERIGHT) then
				if AngleC < 1.5 then
					AngleC = AngleC
				end
			else
				if AngleC > 0 then
					AngleC = AngleC
				end
			end

			player.OLDANG = v.ang
			player.OLDPOS = v.pos
			v.ang.pitch = v.ang.pitch + AngleA * 1
			v.ang.roll = v.ang.roll + AngleC * 1
			v.pos.z = v.pos.z - math.cos(AngleZ * 1)

			local frameTime = FrameTime();

			local approachTime = frameTime * 2;
			local curTime = CurTime();
			local info = { speed = .5, yaw = 0.5 * ( 1 + 4 * .1 ), roll = 0.1 * ( 1 + 40 * 0 ) }
			
			if (!camangle_table.HeadbobAngle) then
				camangle_table.HeadbobAngle = 0;
			end;
			
			if (!camangle_table.HeadbobInfo) then
				camangle_table.HeadbobInfo = info;
			end;
			
			camangle_table.HeadbobInfo.yaw = math.Approach(camangle_table.HeadbobInfo.yaw, info.yaw, approachTime);
			camangle_table.HeadbobInfo.roll = math.Approach(camangle_table.HeadbobInfo.roll, info.roll, approachTime);
			camangle_table.HeadbobInfo.speed = math.Approach(camangle_table.HeadbobInfo.speed, info.speed, approachTime);
			camangle_table.HeadbobAngle = camangle_table.HeadbobAngle + (camangle_table.HeadbobInfo.speed * frameTime);
			
			local yawAngle = math.sin(camangle_table.HeadbobAngle);
			local rollAngle = math.cos(camangle_table.HeadbobAngle);
			
			ang.y = ang.y + (yawAngle * camangle_table.HeadbobInfo.yaw);
			ang.r = ang.r + (rollAngle * camangle_table.HeadbobInfo.roll);

			local velocity = player:GetVelocity();
			
			if (!camangle_table.VelSmooth) then camangle_table.VelSmooth = 0; end;
			if (!camangle_table.WalkTimer) then camangle_table.WalkTimer = 0; end;
			
			camangle_table.VelSmooth = math.Clamp(camangle_table.VelSmooth * 0.9 + velocity:Length() * 0.1, 0, 700)
			camangle_table.WalkTimer = camangle_table.WalkTimer + camangle_table.VelSmooth * FrameTime() * 0.05
			
			ang.p = ang.p + math.cos(camangle_table.WalkTimer * 0.5) * camangle_table.VelSmooth * 0.000002 * camangle_table.VelSmooth;
			ang.r = ang.r + math.sin(camangle_table.WalkTimer) * camangle_table.VelSmooth * 0.000002 * camangle_table.VelSmooth;
			ang.y = ang.y + math.cos(camangle_table.WalkTimer) * camangle_table.VelSmooth * 0.000002 * camangle_table.VelSmooth;
		end
	end )
end