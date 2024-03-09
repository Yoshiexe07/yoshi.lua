local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo một bảng UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = playerGui

-- Biến để theo dõi trạng thái của bảng
local isTableShown = false
local tableFrame = nil

-- Tạo một nút bật/tắt cho bảng
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 50)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.Text = "Toggle Table"
ToggleButton.Parent = ScreenGui

-- Hàm để tạo hoặc ẩn bảng
local function ToggleTable()
    if isTableShown then
        if tableFrame then
            tableFrame:Destroy()
            tableFrame = nil
        end
    else
        tableFrame = Instance.new("Frame")
        tableFrame.Size = UDim2.new(0, 200, 0, 100)
        tableFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
        tableFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tableFrame.BorderSizePixel = 2
        tableFrame.Parent = ScreenGui

        -- Tạo nút trong bảng để tăng tốc độ
        local SpeedButton = Instance.new("TextButton")
        SpeedButton.Size = UDim2.new(0, 150, 0, 40)
        SpeedButton.Position = UDim2.new(0.5, -75, 0.5, -20)
        SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
        SpeedButton.Text = "Increase Speed"
        SpeedButton.Parent = tableFrame
        SpeedButton.MouseButton1Click:Connect(function()
            player.Character.Humanoid.WalkSpeed = 300
        end)
    end
    isTableShown = not isTableShown
end

-- Gắn hàm vào sự kiện Click của nút bật/tắt
ToggleButton.MouseButton1Click:Connect(ToggleTable)
