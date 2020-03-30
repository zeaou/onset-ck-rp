function OnPlayerJoin(player)
    SetCarList(player)
    SetClothingPreset(player)
    SetWeaponsList(player)
    SetPosPresetList(player)
    SetSkeletalMesh(player)
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function SetCarList(player)
    local ListTable = { }
    local arg = 0
    

    for i, v in ipairs(_CarsList) do
        arg = arg + 1
        
        ListTable[arg] = {
            v.name,
            v.id,
        }
    end
    CallRemoteEvent(player, "SetCarList", ListTable)
end

function SetClothingPreset(player)
    local ListTable = { }
    local arg = 0
    

    for i, v in ipairs(_Preset_clothing) do
        arg = arg + 1
        
        ListTable[arg] = {
            v.name,
            i,
        }
    end
    CallRemoteEvent(player, "SetClothingPreset", ListTable)
end

function SetWeaponsList(player)
    local ListTable = { }
    local arg = 0
    

    for i, v in ipairs(_WeaponsList) do
        arg = arg + 1
        
        ListTable[arg] = {
            v.name,
            i,
        }
    end
    CallRemoteEvent(player, "SetWeaponsList", ListTable)
end

function SetPosPresetList(player)
    local ListTable = { }
    local arg = 0
    
    for i, v in ipairs(_PosPresetList) do
        arg = arg + 1
        
        ListTable[arg] = {
            v.name,
            i,
        }
    end
    CallRemoteEvent(player, "SetPosPresetList", ListTable)
end

function SetSkeletalMesh(player)
    local ListTable = { }
    local arg = 0
    
    CallRemoteEvent(player, "SetSkeletalMesh", _Registe_SkeletalMesh_player)
end


function GetPosByName(name , player, target)
    local name = tonumber(name)
    local list = _PosPresetList[name]
    admin_tp_to_pos(target, list['x'], list['y'], list['z'])
end