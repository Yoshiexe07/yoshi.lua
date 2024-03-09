local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Plr = Players.LocalPlayer

local Noclip = Instance.new("ScreenGui")
Noclip.Name = "Noclip"
Noclip.Parent = CoreGui

local BG = Instance.new("Frame")
BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
BG.BorderColor3 = Color3.fromRGB(35, 35, 35)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.1, 0, 0.8, 0)
BG.Size = UDim2.new(0, 210, 0, 127)
BG.Active = true
BG.Draggable = true

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Title.BorderColor3 = Color3.fromRGB(45, 45, 45)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(1, 0, 0, 33)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Noclip"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24

local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Toggle.BorderColor3 = Color3.fromRGB(45, 45, 45)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.15, 0, 0.5, -20)
Toggle.Size = UDim2.new(0.7, 0, 0, 40)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "Toggle Noclip"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 20

local StatusPF = Instance.new("TextLabel")
StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StatusPF.BackgroundTransparency = 1
StatusPF.Position = UDim2.new(0.3, 0, 0.7, 0)
StatusPF.Size = UDim2.new(0, 70, 0, 20)
StatusPF.Font = Enum.Font.SourceSans
StatusPF.Text = "Status:"
StatusPF.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusPF.TextSize = 18
StatusPF.TextXAlignment = Enum.TextXAlignment.Left

local Status = Instance.new("TextLabel")
Status.Name = "Status"
Status.Parent = BG
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.5, 0, 0.7, 0)
Status.Size = UDim2.new(0, 70, 0, 20)
Status.Font = Enum.Font.SourceSans
Status.Text = "OFF"
Status.TextColor3 = Color3.fromRGB(255, 0, 0)
Status.TextSize = 18
Status.TextXAlignment = Enum.TextXAlignment.Left

local Credit = Instance.new("TextLabel")
Credit.Name = "Credit"
Credit.Parent = BG
Credit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.15, 0, 0.85, 0)
Credit.Size = UDim2.new(0, 170, 0, 17)
Credit.Font = Enum.Font.SourceSans
Credit.Text = "Created by KingLuna"
Credit.TextColor3 = Color3.fromRGB(255, 255, 255)
Credit.TextSize = 14

local Clipon = false

Toggle.MouseButton1Click:Connect(function()
    if Clipon then
        Clipon = false
        Status.Text = "OFF"
        Status.TextColor3 = Color3.fromRGB(255, 0, 0)
    else
        Clipon = true
        Status.Text = "ON"
        Status.TextColor3 = Color3.fromRGB(0, 255, 0)
    end

    local function NoclipFunc()
        while Clipon do
            for _, v in ipairs(Plr.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
            wait(0.1)
        end
    end

    coroutine.wrap(NoclipFunc)()
end)
