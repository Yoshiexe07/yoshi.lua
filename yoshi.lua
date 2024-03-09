local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo một bảng UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = playerGui

-- Tạo một nút chứa hình chữ nhật
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 50) -- Kích thước của nút
ToggleButton.Position = UDim2.new(0, 10, 0, 10) -- Vị trí
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ mặc định khi tắt
ToggleButton.Text = "Toggle" -- Văn bản của nút
ToggleButton.Parent = ScreenGui

-- Biến để theo dõi trạng thái của nút
local isOn = false
local highlightingEnabled = false

-- Hàm để hiện tên người chơi và làm nổi bật họ
local function highlightPlayer()
    if highlightingEnabled then
        -- Thực hiện việc làm nổi bật người chơi ở đây (ví dụ: thay đổi màu sắc, hiện tên, ...)
        print("Player Highlighted!")
    end
end

-- Hàm để bật hoặc tắt code khi nhấn nút
local function Toggle()
    isOn = not isOn
    if isOn then
        -- Bật code khi nhấn nút
        highlightingEnabled = true
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- Màu vàng khi bật
        print("Code is enabled!")
    else
        -- Tắt code khi nhấn nút
        highlightingEnabled = false
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
        print("Code is disabled!")
    end
end

-- Gắn hàm vào sự kiện Click của nút
ToggleButton.MouseButton1Click:Connect(Toggle)

-- Gọi hàm hiện tên người chơi và làm nổi bật họ
player.CharacterAdded:Connect(highlightPlayer)
