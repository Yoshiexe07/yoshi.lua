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
ToggleButton.Text = "Nguyen" -- Văn bản của nút
ToggleButton.Parent = ScreenGui

-- Biến để theo dõi trạng thái của nút
local isOn = false
local loopEnabled = false
local loopThread = nil

-- Hàm chạy vòng lặp
local function loopFunction()
    while loopEnabled do
        print("Loop iteration")
        wait(1)
    end
end

-- Hàm để bật hoặc tắt luồng lặp khi nhấn nút
local function Toggle()
    isOn = not isOn
    if isOn then
        -- Bật luồng lặp khi nhấn nút
        loopEnabled = true
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh khi bật
        print("Loop started!")
        loopThread = coroutine.create(loopFunction)
        coroutine.resume(loopThread)
    else
        -- Dừng luồng lặp khi nhấn nút
        loopEnabled = false
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
        print("Loop stopped!")
        if loopThread then
            coroutine.yield(loopThread)
        end
    end
end

-- Gắn hàm vào sự kiện Click của nút
ToggleButton.MouseButton1Click:Connect(Toggle)
