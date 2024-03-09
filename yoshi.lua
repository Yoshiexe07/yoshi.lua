local AdminCommand = require(path.to.AdminCommand) -- Thay đổi path.to.AdminCommand thành đường dẫn thích hợp của AdminCommand trong dự án của bạn.

local button = script.Parent -- Đặt nút làm con của đối tượng GUI (VD: một UIButton trong Roblox).
local infiniteYieldEnabled = false -- Ban đầu, Infinite Yield không được kích hoạt.

local function toggleInfiniteYield()
    if infiniteYieldEnabled then
        -- Nếu Infinite Yield đã được kích hoạt, tắt nó.
        AdminCommand:DisableInfiniteYield()
        print("Infinite Yield đã được tắt.")
    else
        -- Nếu Infinite Yield chưa được kích hoạt, kích hoạt nó.
        AdminCommand:EnableInfiniteYield()
        print("Infinite Yield đã được kích hoạt.")
    end
    -- Chuyển đổi trạng thái của biến infiniteYieldEnabled.
    infiniteYieldEnabled = not infiniteYieldEnabled
end

-- Gắn sự kiện nhấn vào nút.
button.MouseButton1Click:Connect(toggleInfiniteYield)
