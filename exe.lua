local widget = require("widget")

-- Hàm xử lý sự kiện khi nút được bấm
local function onPressButton(event)
    if event.phase == "ended" then
        -- Mở liên kết đã được chỉ định
        system.openURL("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    end
end

-- Tạo nút
local adButton = widget.newButton({
    label = "AD",  -- Chữ hiển thị trên nút
    fontSize = 20, -- Cỡ chữ
    onEvent = onPressButton  -- Sự kiện khi nút được bấm
})

-- Đặt vị trí của nút
adButton.x = 100
adButton.y = 100

-- Thêm nút vào scene hiện tại
local sceneGroup = display.newGroup()
sceneGroup:insert(adButton)
