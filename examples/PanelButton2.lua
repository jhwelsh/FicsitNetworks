-- This example shows how to use a panel button to toggle the standby state of a machine, 
-- and how to change the button's color based on the machine's state.

-- The button's color is updated both when the button is pressed and on a regular interval,
-- to ensure it stays in sync with the machine's state even if it is changed by other means.



local machine = component.proxy(component.findComponent("BaseConstruct0")[1])
local panel   = component.proxy(component.findComponent("BasePanel1")[1])
local button  = panel:getModule(0, 0, 0)

event.listen(button)

local function updateColor()
    if machine.standby then
        button:setColor(1, 0, 0, 1)
    else
        button:setColor(0, 1, 0, 1)
    end
end

-- Set correct color on startup
updateColor()

while true do
    -- Wait up to 1 second for an event, then re-sync anyway
    local e, sender = event.pull(1)

    if sender == button and e == "Trigger" then
        machine.standby = not machine.standby
    end

    -- Always sync color to actual machine state
    updateColor()
end