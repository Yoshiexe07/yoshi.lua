loadstring(game:HttpGet("https://raw.githubusercontent.com/Yoshiexe07/yoshi.lua/main/exe.lua"))()
-- Lấy thông tin của người chơi
local player = game.Players.LocalPlayer

-- Tạo một bảng UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Tạo một nút chứa hình chữ nhật
local RectButton = Instance.new("TextButton")
RectButton.Size = UDim2.new(0, 100, 0, 50) -- Kích thước của nút
RectButton.Position = UDim2.new(0, 10, 1, -60) -- Vị trí góc dưới cùng bên trái
RectButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ mặc định khi tắt
RectButton.Text = "Ad" -- Văn bản của nút
RectButton.Parent = ScreenGui

-- Biến để theo dõi trạng thái của nút
local isOn = false

-- Hàm để chuyển đổi trạng thái của nút
local function Toggle()
    isOn = not isOn
    if isOn then
        RectButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh lá cây khi bật
        -- Thêm các hành động khi nút được bật
    else
        RectButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
        -- Thêm các hành động khi nút được tắt
    end
end

-- Gắn hàm vào sự kiện Click của nút
RectButton.MouseButton1Click:Connect(Toggle)
