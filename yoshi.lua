-- Lấy đối tượng LocalPlayer
local player = game.Players.LocalPlayer

-- Tạo một nút bật/tắt
local button = Instance.new("TextButton")
button.Text = "Toggle"
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0.5, -50, 0.5, -25)
button.Parent = game:GetService("StarterGui"):WaitForChild("ScreenGui") -- Gắn vào màn hình bằng cách sử dụng ScreenGui

-- Biến để theo dõi trạng thái của nút
local isOn = false

-- Hàm để bật hoặc tắt khi nhấn nút
local function Toggle()
    isOn = not isOn
    if isOn then
        -- Code cho trạng thái bật
        print("Button is now ON")
    else
        -- Code cho trạng thái tắt
        print("Button is now OFF")
    end
end

-- Gắn hàm vào sự kiện Click của nút
button.MouseButton1Click:Connect(Toggle)
