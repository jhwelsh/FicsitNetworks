-- This example shows how to find a module in a panel by scanning all the slots.

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