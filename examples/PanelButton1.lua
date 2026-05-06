-- This example shows how to use a panel button to toggle the standby mode of a machine.
-- The button's color is updated both when the button is pressed and on a regular interval,
-- to ensure it stays in sync with the machine's state even if it is changed by other means.


local machine = component.proxy(component.findComponent("BaseConstruct0")[1])
local panel   = component.proxy(component.findComponent("BasePanel1")[1])
local button  = panel:getModule(0, 0, 0)

event.listen(button)

while true do
    local e, sender, name = event.pull()

    if sender == button and e == "Trigger" then
        machine.standby = not machine.standby

        if machine.standby then
            button:setColor(1, 0, 0, 1)
        else
            button:setColor(0, 1, 0, 1)
        end
    end
end