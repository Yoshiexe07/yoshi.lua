local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Tốc độ ban đầu của người chơi
local initialWalkSpeed = character.Humanoid.WalkSpeed

-- Lưu trữ trạng thái của nút vào dữ liệu cục bộ
local playerData = game:GetService("DataStoreService"):GetDataStore("PlayerData")
local isOn = playerData:GetAsync("ToggleButtonState_" .. player.UserId) or false

-- Tạo một bảng UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Tạo một nút chứa hình chữ nhật
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 150, 0, 50) -- Kích thước của nút
ToggleButton.Position = UDim2.new(0, 10, 0, 10) -- Vị trí
ToggleButton.BackgroundColor3 = isOn and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0) -- Màu xanh khi bật, màu đỏ khi tắt
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Màu chữ
ToggleButton.TextSize = 20 -- Kích thước chữ
ToggleButton.Font = Enum.Font.SourceSansBold -- Phông chữ
ToggleButton.Text = "Toggle Speed" -- Văn bản của nút
ToggleButton.BorderSizePixel = 0 -- Không có viền
ToggleButton.AutoButtonColor = false -- Tắt màu nền tự động khi nhấn
ToggleButton.Parent = ScreenGui

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
    -- Lưu trạng thái mới của nút vào dữ liệu cục bộ
    playerData:SetAsync("ToggleButtonState_" .. player.UserId, isOn)
end

-- Gắn hàm vào sự kiện Click của nút
ToggleButton.MouseButton1Click:Connect(Toggle)
