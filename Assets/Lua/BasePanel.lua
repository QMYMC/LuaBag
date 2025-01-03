--利用面向对象
Object:subClass("BasePanel")

BasePanel.panelObj = nil
BasePanel.controls = {}
BasePanel.isInitEvent = false

function BasePanel:Init(name)
    if self.panelObj == nil then
        self.panelObj = ABManager:LoadRes("ui", name, typeof(GameObject))
        print(self.panelObj)
        self.panelObj.transform:SetParent(Canvas, false)
        local allControls = self.panelObj:GetComponentsInChildren(typeof(UIBehaviour))
        --找到所有UI控件，存起来
        for i = 0, allControls.Length - 1 do
            local controlName = allControls[i].name
            if string.find(controlName, "Button") ~= nil or string.find(controlName, "Toggle") ~= nil or string.find(controlName, "SV") ~= nil or string.find(controlName, "Text") ~= nil or string.find(controlName, "img") ~= nil then
                local typeName = allControls[i]:GetType().Name
                --最终的存储形式
                --{btnRole={Toggle=控件，Image=控件}}
                if self.controls[controlName] ~= nil then
                    --通过自定义索引的形式，加一个新的“成员变量”
                    self.controls[controlName][typeName] = allControls[i]
                else
                    self.controls[controlName] = { [typeName] = allControls[i] }
                end
            end
        end
    end
end

--
function BasePanel:GetControl(name,typeName)
    if self.controls[name] ~= nil then
        local sameNameControls = self.controls[name]
        if sameNameControls[typeName] ~= nil then
            return sameNameControls[typeName]
        end
    end
    return nil
end

function BasePanel:ShowMe(name)
    self:Init(name)
    self.panelObj:SetActive(true)
end

function BasePanel:HideMe()
    self.panelObj:SetActive(false)
end
