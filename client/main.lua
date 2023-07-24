local isOpen = false
local RadialMenuItems = {}
local inSubMenu = false
local forceClose = false
local subMenuItems = {}
local dynamicMenuItems = {}
local function loadMenuItems()
    for k,v in pairs(Config.DefaultMenu) do
        RadialMenuItems[#RadialMenuItems+1] = v
    end
    for k,v in pairs(dynamicMenuItems) do
        RadialMenuItems[#RadialMenuItems+1] = v
    end
end
local function newMenu(data)
    subMenuItems = {}
    SendNUIMessage({
        action = "setRadialMenu",
        data = data
    })
    subMenuItems = data
    inSubMenu = true
end
local function closeRadialMenu()
    SendNUIMessage({
        action = "setVisible",
        data = false
    })
    SetNuiFocus(false, false)
    isOpen = false
    inSubMenu = false
    RadialMenuItems = {}
end
local function openRadialMenu()
    if forceClose then
        Wait(500)
        forceClose = false
        return
    end
    isOpen = true
    if IsPauseMenuActive() or IsScreenFadingIn() or IsScreenFadingIn() then
        return
    end
    if not inSubMenu then
        RadialMenuItems = {}
        loadMenuItems()
    end
    SendNUIMessage({
        action = "setVisible",
        data = true
    })
    SendNUIMessage({
        action = "setRadialMenu",
        data = RadialMenuItems
    })
    SetNuiFocus(true, true)
    SetCursorLocation(0.5, 0.5)
end
local function AddOption(data, id)
    id = #dynamicMenuItems + 1
    dynamicMenuItems[id] = data
end

local function RemoveOption(id)
    for k,v in pairs(dynamicMenuItems) do
        if v.id == id then
            table.remove(dynamicMenuItems, k)
        end
    end
end
RegisterCommand('radialmenu', function(src, args, raw)
    if isOpen then
        closeRadialMenu()
    else
        openRadialMenu()
    end
end, false)
RegisterKeyMapping('radialmenu', 'Open Radial Menu', 'keyboard', Config.Keybind)
RegisterNUICallback('closeRadial', function(data,cb)
    closeRadialMenu()
    cb('ok')
end)
RegisterNUICallback('selectItem', function(inData, cb)
    local index = inData.index
    local selectedButton = inData.selectedButton
    local itemData = {}
    if selectedButton then 
        if not inSubMenu then
            itemData = RadialMenuItems[index+1].items[selectedButton+1]
        else
            itemData = subMenuItems[index+1].items[selectedButton+1]
        end
    else
        if not inSubMenu then
            itemData = RadialMenuItems[index+1]
        else
            itemData = subMenuItems[index+1]
        end
    end
    if itemData.items then
        newMenu(itemData.items)
        return
    end
    -- local itemData = inData.itemData
    if itemData then
        if itemData.action then
            -- itemData.action(itemData)
            print("action not supported", itemData.action)
        elseif itemData.type == 'client' then
            TriggerEvent(itemData.event, itemData)
        elseif itemData.type == 'server' then
            TriggerServerEvent(itemData.event, itemData)
        elseif itemData.type == 'command' then
            ExecuteCommand(itemData.event)
        end
    end

    if itemData.shouldClose then
        closeRadialMenu()
        forceClose = true
    end
    cb('ok')
end)

exports('AddOption', AddOption)
exports('RemoveOption', RemoveOption)
