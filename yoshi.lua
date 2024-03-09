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
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        if isFlyingEnabled then
            humanoid.PlatformStand = true -- Cho phép bay
            humanoid.HipHeight = 0 -- Giảm cao độ của dải hông để tránh việc nhân vật rơi khi bay
            ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh khi bật
        else
            humanoid.PlatformStand = false -- Vô hiệu hóa bay
            humanoid.HipHeight = 2 -- Khôi phục cao độ của dải hông
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
        end
    end
end

-- Gắn hàm vào sự kiện Click của nút
ToggleButton.MouseButton1Click:Connect(ToggleFlying)
