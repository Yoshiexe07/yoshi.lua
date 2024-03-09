local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo một bảng UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = playerGui

-- Tạo một bảng hình chữ nhật có thể di chuyển được
local DraggableFrame = Instance.new("Frame")
DraggableFrame.Size = UDim2.new(0, 200, 0, 100) -- Kích thước của bảng
DraggableFrame.Position = UDim2.new(0, 10, 0, 10) -- Vị trí
DraggableFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Màu nền của bảng
DraggableFrame.Active = true
DraggableFrame.Draggable = true -- Có thể di chuyển bằng chuột
DraggableFrame.Parent = ScreenGui

-- Tạo nút để bật / tắt bảng
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 50) -- Kích thước của nút
ToggleButton.Position = UDim2.new(0, 10, 1, -60) -- Vị trí
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ mặc định khi tắt
ToggleButton.Text = "YOSHI HUB" -- Văn bản của nút
ToggleButton.Parent = ScreenGui

-- Biến để theo dõi trạng thái của bảng
local isPanelVisible = false

-- Hàm để bật hoặc tắt bảng khi nhấn nút
local function TogglePanel()
    isPanelVisible = not isPanelVisible
    DraggableFrame.Visible = isPanelVisible
    ToggleButton.BackgroundColor3 = isPanelVisible and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
end

-- Gắn hàm vào sự kiện Click của nút
ToggleButton.MouseButton1Click:Connect(TogglePanel)

-- Tạo nút bên trong bảng để tăng tốc độ người chơi
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(0, 100, 0, 50) -- Kích thước của nút
SpeedButton.Position = UDim2.new(0, 10, 0, 10) -- Vị trí
SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Màu xanh
SpeedButton.Text = "Increase Speed" -- Văn bản của nút
SpeedButton.Parent = DraggableFrame

-- Hàm để tăng tốc độ của người chơi khi nhấn nút
local function IncreaseSpeed()
    player.Character.Humanoid.WalkSpeed = 300
    print("Player speed increased to 300")
end

-- Gắn hàm vào sự kiện Click của nút bên trong bảng
SpeedButton.MouseButton1Click:Connect(IncreaseSpeed)

-- Tạo nút bên trong bảng để làm cho người chơi bay lên
local FlyButton = Instance.new("TextButton")
FlyButton.Size = UDim2.new(0, 100, 0, 50) -- Kích thước của nút
FlyButton.Position = UDim2.new(0, 10, 0, 70) -- Vị trí
FlyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- Màu vàng
FlyButton.Text = "Fly" -- Văn bản của nút
FlyButton.Parent = DraggableFrame

-- Hàm để làm cho người chơi bay lên khi nhấn nút
local function EnableFly()
    player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    player.Character.Humanoid:Move(Vector3.new(0, 50, 0))
    print("Player is flying")
end

-- Gắn hàm vào sự kiện Click của nút bên trong bảng
FlyButton.MouseButton1Click:Connect(EnableFly)
