local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo một bảng UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = playerGui

-- Tạo một nút chứa hình chữ nhật để bật/tắt bảng
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 50) -- Kích thước của nút
ToggleButton.Position = UDim2.new(0, 10, 0, 10) -- Vị trí
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ mặc định khi tắt
ToggleButton.Text = "Toggle" -- Văn bản của nút
ToggleButton.Parent = ScreenGui

-- Biến để theo dõi trạng thái của bảng
local isPanelVisible = false

-- Tạo một bảng chứa hai nút
local Panel = Instance.new("Frame")
Panel.Size = UDim2.new(0, 200, 0, 100) -- Kích thước của bảng
Panel.Position = UDim2.new(0, 10, 0, 70) -- Vị trí
Panel.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Màu nền
Panel.Visible = false -- Bảng ẩn ban đầu
Panel.Parent = ScreenGui

-- Tạo một nút trong bảng để tăng tốc độ của người chơi
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(0, 100, 0, 50) -- Kích thước của nút
SpeedButton.Position = UDim2.new(0, 10, 0, 10) -- Vị trí
SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Màu xanh dương
SpeedButton.Text = "Increase Speed" -- Văn bản của nút
SpeedButton.Parent = Panel

-- Tạo một nút trong bảng để kích hoạt noclip cho người chơi
local NoclipButton = Instance.new("TextButton")
NoclipButton.Size = UDim2.new(0, 100, 0, 50) -- Kích thước của nút
NoclipButton.Position = UDim2.new(0, 10, 0, 60) -- Vị trí
NoclipButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh lá cây
NoclipButton.Text = "Toggle Noclip" -- Văn bản của nút
NoclipButton.Parent = Panel

-- Hàm để bật hoặc tắt bảng khi nhấn nút
local function TogglePanel()
    isPanelVisible = not isPanelVisible
    Panel.Visible = isPanelVisible

    if isPanelVisible then
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh lá cây khi bật
    else
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
    end
end

-- Hàm để tăng tốc độ của người chơi lên 300
local function IncreaseSpeed()
    player.Character.Humanoid.WalkSpeed = 300
end

-- Hàm để kích hoạt noclip cho người chơi
local function ToggleNoclip()
    -- Code để kích hoạt noclip tại đây
    print("Noclip activated!")
end

-- Gắn hàm vào sự kiện Click của nút bật/tắt bảng
ToggleButton.MouseButton1Click:Connect(TogglePanel)

-- Gắn hàm vào sự kiện Click của nút tăng tốc độ
SpeedButton.MouseButton1Click:Connect(IncreaseSpeed)

-- Gắn hàm vào sự kiện Click của nút kích hoạt noclip
NoclipButton.MouseButton1Click:Connect(ToggleNoclip)
