local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Tốc độ ban đầu của người chơi
local initialWalkSpeed = character.Humanoid.WalkSpeed

-- Tạo một bảng UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Tạo một nút chứa hình chữ nhật
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 50) -- Kích thước của nút
ToggleButton.Position = UDim2.new(0, 10, 0, 10) -- Vị trí
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ mặc định khi tắt
ToggleButton.Text = "Toggle" -- Văn bản của nút
ToggleButton.Parent = ScreenGui

-- Biến để theo dõi trạng thái của nút
local isOn = false

-- Hàm để tăng tốc độ của người chơi
local function IncreaseSpeed()
    character.Humanoid.WalkSpeed = 300
    print("Player speed increased to 300")
end

-- Hàm để quay lại tốc độ ban đầu của người chơi
local function RestoreSpeed()
    character.Humanoid.WalkSpeed = initialWalkSpeed
    print("Player speed restored to initial value")
end

-- Hàm để bật hoặc tắt tăng tốc độ của người chơi khi nhấn nút
local function Toggle()
    isOn = not isOn
    if isOn then
        -- Tăng tốc độ khi nhấn nút
        IncreaseSpeed()
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh khi bật
    else
        -- Quay lại tốc độ ban đầu khi nhấn nút
        RestoreSpeed()
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
    end
end

-- Gắn hàm vào sự kiện Click của nút
ToggleButton.MouseButton1Click:Connect(Toggle)
