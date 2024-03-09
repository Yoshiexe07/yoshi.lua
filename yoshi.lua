local button = script.Parent -- Đặt nút làm con của đối tượng GUI (VD: một UIButton trong Roblox).

local function activateScript()
    local scriptURL = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
    local success, scriptContent = pcall(game.HttpGet, game, scriptURL)
    if success then
        local loadSuccess, scriptFunction = pcall(loadstring, scriptContent)
        if loadSuccess then
            scriptFunction()
            print("Script đã được kích hoạt.")
        else
            warn("Không thể tải script.")
        end
    else
        warn("Không thể tải script từ URL.")
    end
end

-- Gắn sự kiện nhấn vào nút.
button.MouseButton1Click:Connect(activateScript)
