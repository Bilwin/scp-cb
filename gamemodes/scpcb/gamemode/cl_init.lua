local GM = GM or GAMEMODE

include('shared.lua');
include('core/shared.lua');

-- Modules loading
local function LoadModules()
    local root = "scpcb/gamemode/plugins/"
    local _, folders = file.Find(root .. "*", "LUA")

    for _, folder in SortedPairs(folders, true) do
        for _, File in SortedPairs(file.Find(root .. folder .. "/sh_*.lua", "LUA"), true) do
            include(root .. folder .. "/" .. File)
        end

        for _, File in SortedPairs(file.Find(root .. folder .. "/cl_*.lua", "LUA"), true) do
            include(root .. folder .. "/" .. File)
        end
    end
end

LoadModules()

scp_cb:Message(1, "cl_init is loaded");