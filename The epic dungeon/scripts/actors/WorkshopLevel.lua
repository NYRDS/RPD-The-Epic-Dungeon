--[[
    Created by mike.
    DateTime: 25.10.18 22:21
    This file is part of pixel-dungeon-remix
]]



local RPD = require "scripts/lib/commonClasses"
local actor = require "scripts/lib/actor"

return actor.init({
activate = function()
local wnd = RPD.new(RPD.Objects.Ui.WndStory,"Недоделанная локация. Ближайшие 5 уровней будут бредом.")
       RPD.GameScene:show(wnd)
end,
    act = function()
  
        local levelSize = RPD.Dungeon.level:getLength()
        local cell = math.random(levelSize)-1
        if not RPD.Dungeon.level.solid[cell] then
            RPD.placePseudoBlob( RPD.PseudoBlobs.Freezing, cell)
        end
        return true
    end,
    actionTime = function()
        return 1
    end
})
