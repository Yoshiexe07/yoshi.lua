local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Tạo một bảng UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Tạo một bảng chứa hình chữ nhật
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Màu xám cho bảng
Frame.Visible = false -- Bảng ban đầu sẽ ẩn đi
Frame.Parent = ScreenGui

-- Tạo một nút bật / tắt cho bảng
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 50)
ToggleButton.Position = UDim2.new(0, 50, 0, 100)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
ToggleButton.Text = "Toggle"
ToggleButton.Parent = Frame

-- Tạo một nút tăng tốc độ cho người chơi
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(0, 100, 0, 50)
SpeedButton.Position = UDim2.new(0, 50, 0, 10)
SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh
SpeedButton.Text = "Increase Speed"
SpeedButton.Parent = Frame

-- Tạo một nút để làm người chơi bay lên
local FlyButton = Instance.new("TextButton")
FlyButton.Size = UDim2.new(0, 100, 0, 50)
FlyButton.Position = UDim2.new(0, 50, 0, 60)
FlyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Màu xanh dương
FlyButton.Text = "Fly"
FlyButton.Parent = Frame

-- Biến để theo dõi trạng thái của bảng
local isOn = false

-- Hàm để bật hoặc tắt bảng
local function Toggle()
    isOn = not isOn
    Frame.Visible = isOn
    if isOn then
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh khi bật
    else
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
    end
end

-- Hàm để tăng tốc độ của người chơi
local function IncreaseSpeed()
    character.Humanoid.WalkSpeed = 300
end

-- Hàm để làm người chơi bay lên
local function Fly()
    character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
end

-- Gắn hàm vào sự kiện Click của các nút
ToggleButton.MouseButton1Click:Connect(Toggle)
SpeedButton.MouseButton1Click:Connect(IncreaseSpeed)
FlyButton.MouseButton1Click:Connect(Fly)
