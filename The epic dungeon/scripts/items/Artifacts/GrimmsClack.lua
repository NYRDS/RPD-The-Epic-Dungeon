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
           image     = 6,
            imageFile = "items/ArtifactsMod.png",
            name      = "Плащ маэстро Гримма",
            info      = "Это плащ состоит из нескольких сшитых между собой чёрных с одной стороны и красных с другой лент.",
            stackable = true,
            upgradable    = false,
            isArtifact    = true,
            price     = 0
             }
    end,   
activate = function(self, item, hero)
--item:getUser():getSprite():createHeroSpriteDef(RPD.item("ClothArmor"))
--item:getUser():getSprite():heroUpdated(RPD.Dungeon.hero)
if RPD.Dungeon.hero ~= nil then
self.data.activationCount = (self.data.activationCount or 0) + 1
        RPD.permanentBuff(RPD.Dungeon.hero, "DarckMantel")
end
     end,

deactivate = function(self, item, hero)
        RPD.removeBuff(RPD.Dungeon.hero, "DarckMantel")
    end
}