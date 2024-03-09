local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo một bảng UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = playerGui

-- Biến để theo dõi trạng thái của nút và bảng
local isOn = false
local rectangleFrame = nil

-- Tạo một nút chứa hình chữ nhật
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 50) -- Kích thước của nút
ToggleButton.Position = UDim2.new(0, 10, 0, 10) -- Vị trí
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ mặc định khi tắt
ToggleButton.Text = "Toggle" -- Văn bản của nút
ToggleButton.Parent = ScreenGui

-- Hàm để tạo hoặc ẩn bảng
local function ToggleRectangleFrame()
    if isOn then
        if not rectangleFrame then
            -- Nếu bảng chưa tồn tại, tạo mới
            rectangleFrame = Instance.new("Frame")
            rectangleFrame.Size = UDim2.new(0, 200, 0, 100)
            rectangleFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
            rectangleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            rectangleFrame.BorderSizePixel = 2
            rectangleFrame.Parent = ScreenGui

            -- Tạo một nút trên bảng để tăng tốc độ
            local SpeedButton = Instance.new("TextButton")
            SpeedButton.Size = UDim2.new(0, 100, 0, 50)
            SpeedButton.Position = UDim2.new(0.5, -50, 0.75, -25)
            SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
            SpeedButton.Text = "Increase Speed"
            SpeedButton.Parent = rectangleFrame
            SpeedButton.MouseButton1Click:Connect(function()
                player.Character.Humanoid.WalkSpeed = 300
            end)
        end
    else
        -- Nếu nút được tắt, ẩn bảng
        if rectangleFrame then
            rectangleFrame:Destroy()
            rectangleFrame = nil
        end
    end
end

-- Hàm để bật hoặc tắt khi nhấn nút
local function Toggle()
    isOn = not isOn
    ToggleRectangleFrame() -- Gọi hàm để tạo hoặc ẩn bảng
    if isOn then
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh lá cây khi bật
    else
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
    end
end

-- Gắn hàm vào sự kiện Click của nút
ToggleButton.MouseButton1Click:Connect(Toggle)
