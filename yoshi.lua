-- Wait for the player to be loaded
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Get the Humanoid of the character
local humanoid = character:WaitForChild("Humanoid")

-- Key bindings
local flyKey = Enum.KeyCode.F -- Change this to any key you want

-- Function to toggle flying
local isFlying = false
local function toggleFly()
    isFlying = not isFlying
    if isFlying then
        humanoid.PlatformStand = true
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
    else
        humanoid.PlatformStand = false
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
    end
end

-- Listen for the fly key press
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == flyKey then
        toggleFly()
    end
end)
