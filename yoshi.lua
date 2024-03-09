local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Tạo một bảng UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Tạo một nút chứa hình chữ nhật
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 150, 0, 50) -- Kích thước của nút
ToggleButton.Position = UDim2.new(0, 10, 0, 10) -- Vị trí
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ mặc định khi tắt
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Màu chữ
ToggleButton.TextSize = 20 -- Kích thước chữ
ToggleButton.Font = Enum.Font.SourceSansBold -- Phông chữ
ToggleButton.Text = "Toggle Speed" -- Văn bản của nút
ToggleButton.BorderSizePixel = 0 -- Không có viền
ToggleButton.AutoButtonColor = false -- Tắt màu nền tự động khi nhấn
ToggleButton.Parent = ScreenGui

-- Biến để theo dõi trạng thái của nút
local isOn = false
local initialWalkSpeed = character.Humanoid.WalkSpeed
local increasedSpeed = 500

-- Hàm để tăng tốc độ của người chơi
local function IncreaseSpeed()
    character.Humanoid.WalkSpeed = increasedSpeed
    print("Player speed increased to " .. increasedSpeed)
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

-- Sự kiện để kiểm tra khi nhân vật chết
character.Humanoid.Died:Connect(function()
    ToggleButton.Visible = false -- Ẩn nút khi nhân vật chết
end)
