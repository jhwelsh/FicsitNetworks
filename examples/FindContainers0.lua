-- Discovers all container-type components visible on the network (including across routers)
-- and prints their nick, UUID, and inventory slot count.

local containerClasses = {
    classes.Build_StorageContainerMk1_C,
    classes.Build_StorageContainerMk2_C,
    classes.Build_IndustrialContainer_C,
    classes.Build_LiquidTank_C,
    classes.Build_PipeStorageTank_C,
    classes.Build_StoragePlayer_C,
}

local found = {}

for _, cls in ipairs(containerClasses) do
    if cls then
        local results = component.findComponent(cls)
        for _, id in ipairs(results) do
            found[id] = true
        end
    end
end

local ids = {}
for id in pairs(found) do
    ids[#ids + 1] = id
end

if #ids == 0 then
    print("No containers found on network.")
    return
end

print(string.format("Found %d container(s):", #ids))
print(string.rep("-", 60))

for _, id in ipairs(ids) do
    local ok, proxy = pcall(component.proxy, id)
    if ok and proxy then
        local nick = proxy:getNick() or "(no nick)"
        local slotCount = 0
        local invOk, inventories = pcall(function() return proxy:getInventories() end)
        if invOk and inventories then
            for _, inv in ipairs(inventories) do
                slotCount = slotCount + inv.size
            end
        end
        print(string.format("  Nick: %-30s Slots: %d", nick, slotCount))
        print(string.format("  UUID: %s", id))
    end
end
