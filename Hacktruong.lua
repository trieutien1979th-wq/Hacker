local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local HackSpeedActive = false
local InfJumpActive = false
local AutoHitActive = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PremiumMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -30)
ToggleButton.Text = "MENU"
ToggleButton.TextScaled = true
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ToggleButton.TextColor3 = Color3.new(1,1,1)

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1,0)
ToggleCorner.Parent = ToggleButton

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 300)
Frame.Position = UDim2.new(0.5, -150, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0,12)
FrameCorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundTransparency = 1
Title.Text = "PREMIUM MENU"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0,30,0,30)
CloseButton.Position = UDim2.new(1,-35,0,5)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(255,60,60)
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.ZIndex = 5

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0,8)
CloseCorner.Parent = CloseButton

local SpeedButton = Instance.new("TextButton")
SpeedButton.Parent = Frame
SpeedButton.Size = UDim2.new(0, 240, 0, 40)
SpeedButton.Position = UDim2.new(0.5, -120, 0, 60)
SpeedButton.Text = "Speed: OFF"
SpeedButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
SpeedButton.TextColor3 = Color3.new(1,1,1)
SpeedButton.TextSize = 18
SpeedButton.ZIndex = 2

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0,8)
SpeedCorner.Parent = SpeedButton

SpeedButton.MouseButton1Click:Connect(function()
	HackSpeedActive = not HackSpeedActive
	if HackSpeedActive then
		SpeedButton.Text = "Speed: ON"
		SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
	else
		SpeedButton.Text = "Speed: OFF"
		SpeedButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		if Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
			Player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
		end
	end
end)

RunService.RenderStepped:Connect(function()
	if HackSpeedActive and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
		Player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 100
	end
end)

local JumpButton = Instance.new("TextButton")
JumpButton.Parent = Frame
JumpButton.Size = UDim2.new(0, 240, 0, 40)
JumpButton.Position = UDim2.new(0.5, -120, 0, 115)
JumpButton.Text = "Inf Jump: OFF"
JumpButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
JumpButton.TextColor3 = Color3.new(1,1,1)
JumpButton.TextSize = 18
JumpButton.ZIndex = 2

local JumpCorner = Instance.new("UICorner")
JumpCorner.CornerRadius = UDim.new(0,8)
JumpCorner.Parent = JumpButton

JumpButton.MouseButton1Click:Connect(function()
	InfJumpActive = not InfJumpActive
	if InfJumpActive then
		JumpButton.Text = "Inf Jump: ON"
		JumpButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
	else
		JumpButton.Text = "Inf Jump: OFF"
		JumpButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
	end
end)

UserInputService.JumpRequest:Connect(function()
	if InfJumpActive and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
		Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

local HitButton = Instance.new("TextButton")
HitButton.Parent = Frame
HitButton.Size = UDim2.new(0, 240, 0, 40)
HitButton.Position = UDim2.new(0.5, -120, 0, 170)
HitButton.Text = "Auto Hit: OFF"
HitButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
HitButton.TextColor3 = Color3.new(1,1,1)
HitButton.TextSize = 18
HitButton.ZIndex = 2

local HitCorner = Instance.new("UICorner")
HitCorner.CornerRadius = UDim.new(0,8)
HitCorner.Parent = HitButton

HitButton.MouseButton1Click:Connect(function()
	AutoHitActive = not AutoHitActive
	if AutoHitActive then
		HitButton.Text = "Auto Hit: ON"
		HitButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
	else
		HitButton.Text = "Auto Hit: OFF"
		HitButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
	end
end)

task.spawn(function()
	while task.wait(0.1) do
		if AutoHitActive and Player.Character then
			local Tool = Player.Character:FindFirstChildOfClass("Tool")
			if Tool then
				Tool:Activate()
			end
		end
	end
end)

ToggleButton.MouseButton1Click:Connect(function()
	Frame.Visible = not Frame.Visible
end)

CloseButton.MouseButton1Click:Connect(function()
	Frame.Visible = false
end)

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	Frame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

Frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

Frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
