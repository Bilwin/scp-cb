AddCSLuaFile("cl_init.lua");

AddCSLuaFile("shared.lua");
include('shared.lua');

AddCSLuaFile("core/shared.lua");
include('core/shared.lua');

include('core/init.lua');

-- Assets including
resource.AddFile( "materials/scp/hud/scphudarmorbars.jpg" );
resource.AddFile( "materials/scp/hud/vignette.png" );

resource.AddFile( "materials/scp/hud/scphealth.vtf" );
resource.AddFile( "materials/scp/hud/scphudarmor.vtf" );
resource.AddFile( "materials/scp/hud/scphudblink.vtf" );
resource.AddFile( "materials/scp/hud/scphudbullet.vtf" );
resource.AddFile( "materials/scp/hud/scphudstamina.vtf" );
resource.AddFile( "materials/scp/hud/handsymbol.png" );

resource.AddFile( "materials/scp/hud/scphudblink.vmt" );
resource.AddFile( "materials/scp/hud/scphudbullet.vmt" );
resource.AddFile( "materials/scp/hud/scphudstamina.vmt" );
resource.AddFile( "materials/scp/hud/scphealth.vmt" );
resource.AddFile( "materials/scp/hud/scphudarmor.vmt" );

resource.AddFile( "sound/scpcb/Button.ogg" );
resource.AddFile( "sound/scpcb/Button2.ogg" );
resource.AddFile( "sound/scpcb/KeycardUse1.ogg" );
resource.AddFile( "sound/scpcb/KeycardUse2.ogg" );
resource.AddFile( "sound/scpcb/LeverFlip.ogg" );
resource.AddFile( "sound/scpcb/PickItem0.ogg" );
resource.AddFile( "sound/scpcb/PickItem1.ogg" );
resource.AddFile( "sound/scpcb/PickItem2.ogg" );
resource.AddFile( "sound/scpcb/PickItem3.ogg" );
resource.AddFile( "sound/scpcb/ScannerUse1.ogg" );
resource.AddFile( "sound/scpcb/ScannerUse2.ogg" );

-- Modules loading
local fol = "scpcb/gamemode/plugins/"
local files, folders = file.Find(fol .. "*", "LUA")

for _, v in pairs(files) do
    if string.GetExtensionFromFilename(v) ~= "lua" then continue end
    include(fol .. v)
end

for _, folder in SortedPairs(folders, true) do
    if folder == "." or folder == ".." then continue end

    for _, File in SortedPairs(file.Find(fol .. folder .. "/sh_*.lua", "LUA"), true) do
        AddCSLuaFile(fol .. folder .. "/" .. File)
        include(fol .. folder .. "/" .. File)
        scp_cb.plugins[folder] = true
        scp_cb:Message(3, folder .. "/" .. File.." is loaded");
    end

    for _, File in SortedPairs(file.Find(fol .. folder .. "/sv_*.lua", "LUA"), true) do
        include(fol .. folder .. "/" .. File)
        scp_cb.plugins[folder] = true
        scp_cb:Message(3, folder .. "/" .. File .. " is loaded");
    end

    for _, File in SortedPairs(file.Find(fol .. folder .. "/cl_*.lua", "LUA"), true) do
        AddCSLuaFile(fol .. folder .. "/" .. File)
        scp_cb.plugins[folder] = true
        scp_cb:Message(3, folder .. "/" .. File.." is loaded");
    end
end

util.AddNetworkString("SCP.CB.InteractItem")

net.Receive("SCP.CB.InteractItem", function()
    local entity = net.ReadEntity()

    if ( entity:GetModel():find("*") ) then
        entity:Fire("Use")
    elseif ( blacklist_interacts[entity:GetModel()] ) then
        entity:Fire("Toggle")
    end
end)

scp_cb:Message(1, "Init is loaded");