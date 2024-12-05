--首先应该先把Json表从AB包中加载
local txt = ABManager:LoadRes("json", "ItemData", typeof(TextAsset))

local itemList = Json.decode(txt.text)
ItemData = {}
for _, value in pairs(itemList) do
    ItemData[value.Id] = value
end
print(ItemData[1].Tips)
