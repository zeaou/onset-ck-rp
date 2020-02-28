local anim_drop = "PICKUP_LOWER"
drop_list = {}

function CreateDropItem(player, item_id)
    local x, y, z = GetPlayerLocation(player)
    local ph = GetPlayerHeading(player)
    local Vx, Vy, Vz = GetPlayerForward(player)

    local item = GetItems(item_id)

    local obj = CreateObject(item.model, x, y, z)
    local hand_pos = item.hand_pos

    local new_item = {
        ["player"] = player, 
        ["model"] = item.model, 
        ["pos"] = { x, y, z },
    }

    table.insert(drop_list, new_item)

    if(isnil(hand_pos)) then
        SetObjectAttached(obj, ATTACH_PLAYER, player, 8, -3, -8, 0.0, 0, 0, "hand_l")
    else
        SetObjectAttached(obj, ATTACH_PLAYER, player, 
            hand_pos['x'], 
            hand_pos['y'], 
            hand_pos['z'], 
            hand_pos['rx'],  
            hand_pos['ry'], 
            hand_pos['rz'], 
            "hand_l"
        )
    end

    SetPlayerAnimation(player, anim_drop)

    os.sleep(1.6)

    SetObjectDetached(obj)
    SetObjectLocation(obj, x + (Vx * 200), y + (Vy * 100), z - 100)
    SetObjectRotation(obj, 0, ph, 0)
end

function GetPlayerForward(playerid)
	local deg = GetPlayerHeading(playerid)
	local rad = math.rad(deg)
	local x = math.cos(rad)
	local y = math.sin(rad)
	return x, y, 0
end

function drop_item(player, item_id) 
    CreateDropItem(player, item_id)
    RemovePlayerItem(player, player, item_id, 1)
end
AddRemoteEvent("drop_item", drop_item)

function cmd_commands()
    for i,v in ipairs(drop_list) do
        print(i, v['model'], v['pos'])
    end
end
AddCommand("test", cmd_commands)