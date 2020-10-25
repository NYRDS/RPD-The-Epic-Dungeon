--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"


return item.init{
    desc  = function ()
        return {
            image     = 18,
            imageFile = "items/ArtifactsMod.png",
            name      = "Дудочка крысолова",
            info      = "На этой магической дудочке сможет сыграть лишь профессионал.",
            stackable = true,
            price     = 10
        }
    end
}
