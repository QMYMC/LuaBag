PlayerData = {}

PlayerData.equips = {}
PlayerData.items = {}
PlayerData.gems = {}

function PlayerData:Init()
    table.insert(self.equips, { id = 1, num = 1 })
    table.insert(self.equips, { id = 2, num = 2 })
    table.insert(self.items, { id = 3, num = 23 })
    table.insert(self.items, { id = 4, num = 34 })
    table.insert(self.gems, { id = 5, num = 56 })
    table.insert(self.gems, { id = 6, num = 65 })
end
PlayerData:Init()
