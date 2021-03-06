function GetNearestPickUp(MaxDist)
    local x, y, z = GetPlayerLocation()
    local pickup

    for _,v in pairs(GetStreamedPickups()) do
        local px, py, pz = GetPickupLocation(v)
        local GetDistance3D = GetDistance3D(x, y, z, px, py, pz)
        
        if GetDistance3D < MaxDist then
            local type = GetPickupPropertyValue(v, "type")

            pickup = {
                ["type"] = type,
                ["id"] = v
            }

            break;
        end

    end

    if( pickup ~= nil) then
        return pickup
    end
    return false
end
