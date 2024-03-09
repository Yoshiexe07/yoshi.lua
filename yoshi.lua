local button = Instance.new("TextButton") -- Tạo một TextButton
button.Parent = game:GetService("Workspace") -- Gán TextButton vào Workspace (hoặc một vị trí phù hợp khác trong hierarchy của game)

button.Size = UDim2.new(0, 200, 0, 50) -- Kích thước của nút
button.Position = UDim2.new(0.5, -100, 0.5, -25) -- Vị trí của nút (ở giữa màn hình)
button.Text = "Auto Click" -- Văn bản trên nút

local autoClicking = false -- Biến để kiểm tra xem auto clicking có được kích hoạt không
local clickDelay = 0.5 -- Thời gian trễ giữa các lần click (trong giây)

local function click()
    while autoClicking do
        button.MouseButton1Click:Fire() -- Tự động kích hoạt sự kiện nhấn chuột trái
        wait(clickDelay) -- Chờ một khoảng thời gian trước khi tiếp tục click
    end
end

button.MouseButton1Click:Connect(function()
    autoClicking = not autoClicking -- Đảo trạng thái auto clicking khi nhấn nút

    if autoClicking then
        click() -- Bắt đầu auto click
        button.Text = "Stop Auto Click" -- Đổi văn bản trên nút thành "Stop Auto Click"
    else
        button.Text = "Auto Click" -- Đổi văn bản trên nút thành "Auto Click"
    end
end)
