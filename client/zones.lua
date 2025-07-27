local zones = lib.load("config.shared.zones")

---@description [OPTIMIZATION] zones are classes, this means that the functions and data inside are cached individually in the class (cached universal function for all)
local function onEnter(self)
    local result = lib.callback.await("mnr_police:server:EnteredZone", self.name) ---@description Check to validate the action, we use name of zone class to take the data server side (for security)
    
    if not result then return end
    
    ---@todo Init Points
end

local function onExit(self)
    TriggerServerEvent("mnr_police:server:ExitedZone", self.name) ---@description Nothing to check or secure, we just clean server side cache and delete access

    ---@todo Delete Points
end

for name, data in pairs(zones) do
    lib.zones.box({
        name = name,
        coords = vec3(data.coords.x, data.coords.y, data.coords.z),
        size = data.size,
        rotation = data.coords.w,
        debug = data.debug,
        onEnter = onEnter,
        onExit = onExit,
    })
end