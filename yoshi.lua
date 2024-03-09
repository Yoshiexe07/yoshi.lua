local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")

local isBoosted = false

local function toggleBoost()
    isBoosted = not isBoosted
    if isBoosted then
        humanoid.WalkSpeed = 500
    else
        humanoid.WalkSpeed = 16 -- Tốc độ bình thường của nhân vật (có thể thay đổi nếu cần)
    end
end

local button = Instance.new("TextButton")
button.Text = "Toggle Speed Boost"
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.MouseButton1Click:Connect(toggleBoost)
button.Parent = game:GetService("StarterGui"):WaitForChild("ScreenGui")
