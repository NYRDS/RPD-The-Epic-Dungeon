--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local hero = RPD.Dungeon.hero
return item.init{
    desc  = function ()
        return {
            image         = 0,
            imageFile     = "items/Runes.png",
            name          = "Руна стада",
            info          = "Эта руна мигает тёмно-фиолетовым цветом. На ней имеются искусстно вырезанные заклятья. При использовании эта руна призовёт стадо волшебных овец.",
            stackable     = true,
            defaultAction = "Wand_ACZap",
            price         = 50,
            upgradable    = true
        }
    end,
    actions = function() return {"АКТИВИРОВАТЬ"} end,

    cellSelected = function(self, thisItem, action, cell,item)
thisItem:detach(RPD.Dungeon.hero:getBelongings().backpack) 

        if action == "АКТИВИРОВАТЬ" then 
local wand = RPD.ItemFactory:itemByName("WandOfFlock")
wand:mobWandUse(thisItem:getUser(), cell)

for i = 1, thisItem:level() do
local wand = RPD.ItemFactory:itemByName("WandOfFlock")
wand:mobWandUse(thisItem:getUser(), cell)

end

end
end,
    execute = function(self, item, hero, action)
        if action == "АКТИВИРОВАТЬ" then
            item:selectCell( "АКТИВИРОВАТЬ" ,"Выбирите клетку.")
        end
end,
  bag = function(self, item)
        return "ScrollHolder"
    end

}
