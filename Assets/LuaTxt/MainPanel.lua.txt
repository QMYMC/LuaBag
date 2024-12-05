BasePanel:subClass("MainPanel")

function MainPanel:Init(name)
    self.base.Init(self, name)
    if self.isInitEvent == false then
        print(124314113)
        print(self:GetControl("ButtonRole", "Image"))
        self:GetControl("ButtonRole", "Button").onClick:AddListener(
            function()
                self:BtnRoleClick()
            end)
            self.isInitEvent=true
    end

    
end

function MainPanel:BtnRoleClick()
    BagPanel:ShowMe("BagPanel")
end