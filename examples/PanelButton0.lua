-- This example shows how to find a module in a panel by scanning all the slots.
-- This is not the most efficient way to find a module, but it can be useful 
-- if you don't know the exact coordinates of the module you want to interact with.

local panel = component.proxy(component.findComponent("BasePanel1")[1])

for y = 0, 9 do
    for x = 0, 9 do
        local m = panel:getModule(x, y, 0)
        if m then
            print("Found! x="..x.." y="..y.." -> "..tostring(m))
        end
    end
end
print("Scan done")