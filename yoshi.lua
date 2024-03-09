local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo một bảng UI chứa nút và các thao tác
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = playerGui
ScreenGui.Enabled = false -- Ban đầu ẩn bảng

-- Tạo một nút để bật/tắt bảng
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 50) -- Kích thước của nút
ToggleButton.Position = UDim2.new(0, 10, 0, 10) -- Vị trí
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ mặc định khi tắt
ToggleButton.Text = "Toggle Menu" -- Văn bản của nút
ToggleButton.Parent = ScreenGui

-- Biến để theo dõi trạng thái của nút
local isMenuVisible = false

-- Hàm để hiện hoặc ẩn bảng khi nhấn nút
local function ToggleMenu()
    isMenuVisible = not isMenuVisible
    ScreenGui.Enabled = isMenuVisible

    -- Đổi màu của nút tùy thuộc vào trạng thái của bảng
    if isMenuVisible then
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh lá cây khi bật
    else
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
    end
end

-- Gắn hàm vào sự kiện Click của nút
ToggleButton.MouseButton1Click:Connect(ToggleMenu)

-- Tạo một bảng UI để chứa các nút trong menu
local MenuFrame = Instance.new("Frame")
MenuFrame.Size = UDim2.new(0, 200, 0, 150)
MenuFrame.Position = UDim2.new(0, 10, 0, 70)
MenuFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MenuFrame.Parent = ScreenGui

-- Tạo nút để tăng tốc độ của người chơi
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(0, 180, 0, 40)
SpeedButton.Position = UDim2.new(0, 10, 0, 10)
SpeedButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.Text = "Increase Speed"
SpeedButton.Parent = MenuFrame

-- Tạo nút để kích hoạt noclip
local NoclipButton = Instance.new("TextButton")
NoclipButton.Size = UDim2.new(0, 180, 0, 40)
NoclipButton.Position = UDim2.new(0, 10, 0, 60)
NoclipButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NoclipButton.Text = "Toggle Noclip"
NoclipButton.Parent = MenuFrame

-- Hàm để tăng tốc độ của người chơi
local function IncreaseSpeed()
    player.Character.Humanoid.WalkSpeed = 300
end

-- Gắn hàm vào sự kiện Click của nút tăng tốc độ
SpeedButton.MouseButton1Click:Connect(IncreaseSpeed)

-- Biến để theo dõi trạng thái của noclip
local isNoclipEnabled = false

-- Hàm để bật/tắt noclip
local function ToggleNoclip()
    isNoclipEnabled = not isNoclipEnabled
    if isNoclipEnabled then
        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    else
        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end

-- Gắn hàm vào sự kiện Click của nút noclip
NoclipButton.MouseButton1Click:Connect(ToggleNoclip)
