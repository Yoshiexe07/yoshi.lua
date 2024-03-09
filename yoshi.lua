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
ToggleButton.Text = "Toggle Flying (Speed: 40)" -- Văn bản của nút
ToggleButton.BorderSizePixel = 0 -- Không có viền
ToggleButton.AutoButtonColor = false -- Tắt màu nền tự động khi nhấn
ToggleButton.Parent = ScreenGui

-- Biến để theo dõi trạng thái của nút và tốc độ bay
local isFlyingEnabled = false
local flySpeed = 40

-- Hàm để bật hoặc tắt khả năng bay của nhân vật khi nhấn nút
local function ToggleFlying()
    isFlyingEnabled = not isFlyingEnabled
    if isFlyingEnabled then
        character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Physics)
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh khi bật
    else
        character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.GettingUp)
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
    end
end

-- Gắn hàm vào sự kiện Click của nút
ToggleButton.MouseButton1Click:Connect(ToggleFlying)
