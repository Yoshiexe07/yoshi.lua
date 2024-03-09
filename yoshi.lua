-- Tạo một bảng UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Tạo một nút chứa hình chữ nhật
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 150, 0, 50) -- Kích thước của nút
ToggleButton.Position = UDim2.new(0, 10, 0, 10) -- Vị trí
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ mặc định khi tắt
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Màu chữ
ToggleButton.TextSize = 20 -- Kích thước chữ
ToggleButton.Font = Enum.Font.SourceSansBold -- Phông chữ
ToggleButton.Text = "Toggle Admin Infinite Yield" -- Văn bản của nút
ToggleButton.BorderSizePixel = 0 -- Không có viền
ToggleButton.AutoButtonColor = false -- Tắt màu nền tự động khi nhấn
ToggleButton.Parent = ScreenGui

-- Biến để theo dõi trạng thái của nút
local isAIYEnabled = false

-- Hàm để bật hoặc tắt Admin Infinite Yield khi nhấn nút
local function ToggleAIY()
    isAIYEnabled = not isAIYEnabled
    if isAIYEnabled then
        require(game:GetService("ReplicatedStorage"):WaitForChild("Admin"):WaitForChild("MainModule")):SetAdmin(true)
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh khi bật
    else
        require(game:GetService("ReplicatedStorage"):WaitForChild("Admin"):WaitForChild("MainModule")):SetAdmin(false)
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
    end
end

-- Gắn hàm vào sự kiện Click của nút
ToggleButton.MouseButton1Click:Connect(ToggleAIY)
