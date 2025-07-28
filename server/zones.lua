local zones = require "config.shared.zones"

local function inside(coords, name)
    local zone = zones[name]
    if not zone then
        return false
    end

    local relative = coords - zone.coords
    local heading = zone.rotation or 0.0

    local rad = math.rad(-heading)
    local cosH = math.cos(rad)
    local sinH = math.sin(rad)

    local localX = relative.x * cosH - relative.y * sinH
    local localY = relative.x * sinH + relative.y * cosH
    local localZ = relative.z

    local halfSize = zone.size / 2

    return math.abs(localX) <= halfSize.x and math.abs(localY) <= halfSize.y and math.abs(localZ) <= halfSize.z
end

lib.callback.register("mnr_police:server:ZoneAction", function(source, name)
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)
    local isInside = inside(playerCoords, name)

    return isInside
end)