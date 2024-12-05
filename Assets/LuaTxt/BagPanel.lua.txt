BasePanel:subClass("BagPanel")

BagPanel.Content = nil

BagPanel.items = {}

BagPanel.nowType = -1

function BagPanel:Init(name)
    self.base.Init(self, name)

    if self.isInitEvent == false then
        --找到没有挂在UI控件的 对象 还是需要手动去找
        self.Content = self:GetControl("SVBag", "ScrollRect").transform:Find("Viewport"):Find("Content")
        --加事件
        --关闭按钮
        self:GetControl("ButtonClose", "Button").onClick:AddListener(function()
            self:HideMe()
        end)
        --单选框事件
        --切页签
        --toggle 对应委托 是 UnityAction<bool>
        self:GetControl("ToggleEquip", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(1)
            end
        end)
        self:GetControl("ToggleItem", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(2)
            end
        end)
        self:GetControl("ToggleGem", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(3)
            end
        end)

        self.isInitEvent = true
    end
end

function BagPanel:ShowMe(name)
    self.base.ShowMe(self, name)
    if self.nowType == -1 then
        self:ChangeType(2)
    end
end

function BagPanel:HideMe()
    self.panelObj:SetActive(false)
end


function BagPanel:ChangeType(type)
    if self.nowType==type then
        return
    end

    --更新前销毁老格子
    for i = 1, #self.items do
        self.items[i]:Destroy()
    end
    self.items={}

    --根据传入的type悬着显示的数据
    local nowItems = nil
    if type == 1 then
        nowItems = PlayerData.equips
    elseif type == 2 then
        nowItems = PlayerData.items
    else
        nowItems = PlayerData.gems
    end

    for i = 1, #nowItems do
        --根据数据，创建一个格子对象
        local grid = ItemGrid:new()
        --实例化对象，设置位置
        grid:Init(self.Content, ((i - 1) % 4 * (137 + 4) + 9.5), -(math.floor((i - 1) / 4) * (137 + 4) + 5.2))
        --初始化信息
        grid:InitData(nowItems[i])
        --把他存起来
        table.insert(self.items,grid)

    end
end