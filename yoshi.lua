local FlyingGuiStarterGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local _1st = Instance.new("TextButton")
local UIGradient_2 = Instance.new("UIGradient")
local UICorner_2 = Instance.new("UICorner")

--Properties:

FlyingGuiStarterGui.Name = "Flying Gui (StarterGui)"
FlyingGuiStarterGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
FlyingGuiStarterGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = FlyingGuiStarterGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.262135923, 0, 0.246022031, 0)
Frame.Size = UDim2.new(0, 607, 0, 384)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(-0.0010790251, 0, -0.00137380755, 0)
TextLabel.Size = UDim2.new(0, 607, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Fly Gui/Made By k4yl0w#8915"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UICorner.Parent = Frame

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 255))}
UIGradient.Parent = Frame

_1st.Name = "1st"
_1st.Parent = Frame
_1st.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_1st.BorderSizePixel = 3
_1st.Position = UDim2.new(0.278591096, 0, 0.407727569, 0)
_1st.Size = UDim2.new(0.490766704, 0, 0.29539752, 0)
_1st.Font = Enum.Font.Cartoon
_1st.Text = "Fly"
_1st.TextColor3 = Color3.fromRGB(0, 0, 0)
_1st.TextScaled = true
_1st.TextSize = 14.000
_1st.TextWrapped = true

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 170, 0))}
UIGradient_2.Parent = _1st

UICorner_2.Parent = _1st

-- Scripts:

local function LCYFDVR_fake_script() -- _1st.Flying Script 
	local script = Instance.new('LocalScript', _1st)

	--Flying Script--
	script.parent.MouseButton1Down:connect(function()
		repeat wait() 
		until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
		local mouse = game.Players.LocalPlayer:GetMouse() 
		repeat wait() until mouse
		local plr = game.Players.LocalPlayer 
		local torso = plr.Character.Head 
		local flying = true --Making This False Will Not Work In Mobile--
		local deb = true 
		local ctrl = {f = 0, b = 0, l = 0, r = 0} 
		local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
		local maxspeed = 50 
		local speed = 0 
	
		function Fly() 
			local bg = Instance.new("BodyGyro", torso) 
			bg.P = 9e4 
			bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
			bg.cframe = torso.CFrame 
			local bv = Instance.new("BodyVelocity", torso) 
			bv.velocity = Vector3.new(0,0.1,0) 
			bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
			repeat wait() 
				plr.Character.Humanoid.PlatformStand = true 
				if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
					speed = speed+.5+(speed/maxspeed) 
					if speed > maxspeed then 
						speed = maxspeed 
					end 
				elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
					speed = speed-1 
					if speed < 0 then 
						speed = 0 
					end 
				end 
				if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
					lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
				elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
				else 
					bv.velocity = Vector3.new(0,0.1,0) 
				end 
				bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
			until not flying 
			ctrl = {f = 0, b = 0, l = 0, r = 0} 
			lastctrl = {f = 0, b = 0, l = 0, r = 0} 
			speed = 0 
			bg:Destroy() 
			bv:Destroy() 
			plr.Character.Humanoid.PlatformStand = false 
		end 
		mouse.KeyDown:connect(function(key) 
			if key:lower() == "e" then 
				if flying then flying = false 
				else 
					flying = true 
					Fly() 
				end 
			elseif key:lower() == "w" then 
				ctrl.f = 1 
			elseif key:lower() == "s" then 
				ctrl.b = -1 
			elseif key:lower() == "a" then 
				ctrl.l = -1 
			elseif key:lower() == "d" then 
				ctrl.r = 1 
			end 
		end) 
		mouse.KeyUp:connect(function(key) 
			if key:lower() == "w" then 
				ctrl.f = 0 
			elseif key:lower() == "s" then 
				ctrl.b = 0 
			elseif key:lower() == "a" then 
				ctrl.l = 0 
			elseif key:lower() == "d" then 
				ctrl.r = 0 
			end 
		end)
		Fly()
	end)
end
coroutine.wrap(LCYFDVR_fake_script)()
local function QREV_fake_script() -- _1st.Button Script 
	local script = Instance.new('LocalScript', _1st)

	--Button Script--
	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Visible = false --Feel Free To Delete This If You Want To Keep Gui--
	end)
	
end
coroutine.wrap(QREV_fake_script)()
local function ONUIA_fake_script() -- Frame.Script 
	local script = Instance.new('Script', Frame)

	frame = script.Parent.Frame -- Take out {}s, and put name of frame
	frame.Draggable = true
	frame.Active = true
	frame.Selectable = true
end
coroutine.wrap(ONUIA_fake_script)()
local function BXPSPEK_fake_script() -- Frame.Script 
	local script = Instance.new('Script', Frame)

	script.Parent.Visible = false
	wait (6) ----------- How long it will take for the GUI to appear
	script.Parent.Visible = true
	wait (5) ----------- How long it will take for the GUI to disappear
	script.Parent.Visible = false
	
end
coroutine.wrap(BXPSPEK_fake_script)()
