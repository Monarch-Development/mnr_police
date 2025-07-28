local zones = lib.load("config.shared.zones")

local function onEnter(self)
    local result = lib.callback.await("mnr_police:server:ZoneAction", false, self.name)

    if not result then return end

    ---@todo Init Points
end

local function onExit(self)
    local result = lib.callback.await("mnr_police:server:ZoneAction", false, self.name)

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