local zones = lib.load("config.shared.zones")

---@description [OPTIMIZATION] zones are classes, this means that the functions and data inside are cached individually in the class (cached universal function for all)
local function onEnter(self)
    ---@description Check to validate actions, we use name of zone to take data of it server side (for security)
    local result = lib.callback.await("mnr_police:server:EnteredZone", false, self.name)

    if not result then return end

    ---@todo Init Points
end

local function onExit(self)
    ---@description Nothing to check, we clean server side cache and remove access
    TriggerServerEvent("mnr_police:server:ExitedZone", self.name)

    ---@todo Delete Points
end

for name, data in pairs(zones) do
    lib.zones.box({
        name = name,
        coords = data.coords,
        size = data.size,
        rotation = data.rotation,
        debug = data.debug,
        onEnter = onEnter,
        onExit = onExit,
    })
end