-- NetworkRouter1.lua
-- Lists and sums the contents of BaseCt0, reached via NwRtrTransit router

local found = component.findComponent("BaseCt0")
if not found or not found[1] then
    print("ERROR: Could not find BaseCt0")
    return
end
local container = component.proxy(found[1])

print("=== BaseCt0 Contents ===")

local totals = {}
local grandTotal = 0

local inventories = container:getInventories()
for _, inv in ipairs(inventories) do
    for i = 0, inv.size - 1 do
        local stack = inv:getStack(i)
        if stack and stack.item and stack.count > 0 then
            local name = stack.item.type and stack.item.type.name or tostring(stack.item.type)
            totals[name] = (totals[name] or 0) + stack.count
            grandTotal = grandTotal + stack.count
        end
    end
end

for name, count in pairs(totals) do
    print(string.format("  %-40s %d", name, count))
end

print(string.rep("-", 50))
print(string.format("  %-40s %d", "TOTAL ITEMS", grandTotal))
