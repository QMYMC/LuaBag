Object:subClass("ItemGrid")

ItemGrid.obj = nil
ItemGrid.imgIcon = nil
ItemGrid.Text = nil

function ItemGrid:Init(father,posX,posY)
    self.obj = ABManager:LoadRes("ui", "ItemGrid")
    self.obj.transform:SetParent(father, false)
    self.obj.transform.localPosition = Vector3(posX, posY, 0)
    self.imgIcon = self.obj.transform:Find("imgIcon"):GetComponent(typeof(Image))
    self.Text = self.obj.transform:Find("Text (TMP)"):GetComponent(typeof(TMP_Text))

end

function ItemGrid:InitData(data)
    local itemData = ItemData[data.id]
    local strs = string.split(itemData.Icon, "_")
    local spriteAtlas = ABManager:LoadRes("ui", strs[1], typeof(SpriteAtlas))
    self.imgIcon.sprite = spriteAtlas:GetSprite(strs[2])
    self.Text.text = data.num
end

function ItemGrid:Destroy()
    GameObject.Destroy(self.obj)
    self.obj=nil
end