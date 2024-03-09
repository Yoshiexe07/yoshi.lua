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
RectButton.Text = "ESP" -- Văn bản của nút
RectButton.Parent = ScreenGui

-- Biến để theo dõi trạng thái của ESP
local espEnabled = false

-- Hàm để tạo và cập nhật ESP cho tất cả các đối tượng
local function updateESP()
    -- Kiểm tra xem ESP có được bật hay không
    if espEnabled then
        -- Lặp qua tất cả các đối tượng trong trò chơi để cập nhật ESP
        for _, object in ipairs(game:GetService("Workspace"):GetDescendants()) do
            -- Kiểm tra nếu đối tượng là một model và có phần tử tên
            if object:IsA("Model") and object:FindFirstChild("HumanoidRootPart") then
                -- Lấy vị trí của HumanoidRootPart của đối tượng
                local objectPosition = object.HumanoidRootPart.Position

                -- Tính khoảng cách giữa người chơi và đối tượng
                local distance = (player.Character.HumanoidRootPart.Position - objectPosition).magnitude

                -- Hiển thị ESP cho các đối tượng trong phạm vi
                if distance <= 500 then -- Điều chỉnh khoảng cách cần hiển thị ESP tại đây
                    -- Tạo một BillboardGui để hiển thị ESP
                    local esp = Instance.new("BillboardGui")
                    esp.Adornee = object.HumanoidRootPart
                    esp.Size = UDim2.new(2, 0, 2, 0)
                    esp.StudsOffset = Vector3.new(0, 3, 0) -- Độ cao của ESP so với đối tượng
                    esp.Parent = object.HumanoidRootPart

                    -- Tạo một TextLabel để hiển thị tên của đối tượng
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Text = object.Name
                    nameLabel.Size = UDim2.new(1, 0, 0.2, 0)
                    nameLabel.TextScaled = true
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.TextColor3 = Color3.new(1, 1, 1) -- Màu của tên
                    nameLabel.Font = Enum.Font.SourceSansBold
                    nameLabel.Parent = esp
                end
            end
        end
    else
        -- Xóa tất cả ESP khi ESP không được bật
        for _, esp in ipairs(ScreenGui:GetChildren()) do
            if esp:IsA("BillboardGui") then
                esp:Destroy()
            end
        end
    end
end

-- Hàm để bật / tắt ESP khi nút được nhấp
local function ToggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        RectButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh lá cây khi bật
    else
        RectButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ khi tắt
    end
end

-- Gắn hàm vào sự kiện Click của nút để bật / tắt ESP
RectButton.MouseButton1Click:Connect(ToggleESP)

-- Cập nhật ESP sau mỗi khoảng thời gian nhất định (ví dụ: sau mỗi 1 giây)
while wait(1) do
    updateESP()
end
