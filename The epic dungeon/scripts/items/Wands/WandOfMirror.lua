--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local wand = require "scripts/lib/wand"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

return wand.init{ 
    desc  = function()  
        return {
           image     = 18,
            name      = "Жезл илюзий",
            info      = "При использовании этот жезл создаст твою илюзию. Цена 30 маны."
        }
end, 

    activate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Mirror")

        RPD.permanentBuff(item:getUser(), "Mirror")

    end,

    deactivate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Mirror")
    end,

cast = function(self,thisItem,lvl)
local level = RPD.Dungeon.level

        local hero = RPD.Dungeon.hero
        print(self, cause)

            local mob = RPD.MobFactory:mobByName("Bee")
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
--                mob:setPos(pos)
--level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero));
local image  = thisItem:getUser():makeClone();
RPD.Wands.wandOfBlink:appear( image, pos );
    end
end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "none"
end,

getMana = function()
return 30
end,

getManaMes = function()
return "-- не хватает маны"
end
}