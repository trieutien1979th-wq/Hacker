local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local HackSpeedActive = false
local InfJumpActive = false
local AutoHitActive = false

-- SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PremiumCatMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- NÚT MỞ/TẮT MENU (Nút tròn màu xanh)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -30)
ToggleButton.Text = "CAT"
ToggleButton.TextScaled = true
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ToggleButton.TextColor3 = Color3.new(1,1,1)

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1,0)
ToggleCorner.Parent = ToggleButton

-- KHUNG MENU CHÍNH (Đổi thành màu trắng sữa giống con mèo của bạn)
local MainMenu = Instance.new("Frame")
MainMenu.Parent = ScreenGui
MainMenu.Size = UDim2.new(0, 280, 0, 280)
MainMenu.Position = UDim2.new(0.5, -140, 0.5, -140)
MainMenu.BackgroundColor3 = Color3.fromRGB(235, 232, 227) -- Màu trắng sữa/kem 
MainMenu.Visible = false -- Mặc định ẩn, bấm nút CAT mới hiện

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20) -- Bo góc tròn cực mượt
MainCorner.Parent = MainMenu

-- TIÊU ĐỀ MENU (Chữ màu đen cho nổi trên nền trắng)
local Title = Instance.new("TextLabel")
Title.Parent = MainMenu
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "CAT MENU HACK"
Title.TextColor3 = Color3.fromRGB(40, 40, 40) -- Màu chữ xám đen
Title.TextSize = 20
Title.Font = Enum.Font.SourceSansBold

-- NÚT ĐÓNG MENU (Nút X)
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = MainMenu
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0, 10)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.ZIndex = 5

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

---------------------------------------------------------
-- CÁC NÚT BẤM CHỨC NĂNG HACK
---------------------------------------------------------

-- Nút Speed
local SpeedButton = Instance.new("TextButton")
SpeedButton.Parent = MainMenu
SpeedButton.Size = UDim2.new(0, 200, 0, 40)
SpeedButton.Position = UDim2.new(0.5, -100, 0, 70)
SpeedButton.Text = "Speed: OFF"
SpeedButton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
SpeedButton.TextColor3 = Color3.new(1,1,1)
SpeedButton.TextSize = 16

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 10)
SpeedCorner.Parent = SpeedButton

SpeedButton.MouseButton1Click:Connect(function()
	HackSpeedActive = not HackSpeedActive
	if HackSpeedActive then
		SpeedButton.Text = "Speed: ON"
		SpeedButton.BackgroundColor3 = Color3.fromRGB(60, 180, 110)
	else
		SpeedButton.Text = "Speed: OFF"
		SpeedButton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
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

-- Nút Jump
local JumpButton = Instance.new("TextButton")
JumpButton.Parent = MainMenu
JumpButton.Size = UDim2.new(0, 200, 0, 40)
JumpButton.Position = UDim2.new(0.5, -100, 0, 130)
JumpButton.Text = "Inf Jump: OFF"
JumpButton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
JumpButton.TextColor3 = Color3.new(1,1,1)
JumpButton.TextSize = 16

local JumpCorner = Instance.new("UICorner")
JumpCorner.CornerRadius = UDim.new(0, 10)
JumpCorner.Parent = JumpButton

JumpButton.MouseButton1Click:Connect(function()
	InfJumpActive = not InfJumpActive
	if InfJumpActive then
		JumpButton.Text = "Inf Jump: ON"
		JumpButton.BackgroundColor3 = Color3.fromRGB(60, 180, 110)
	else
		JumpButton.Text = "Inf Jump: OFF"
		JumpButton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
	end
end)

UserInputService.JumpRequest:Connect(function()
	if InfJumpActive and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
		Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

-- Nút Auto Hit
local HitButton = Instance.new("TextButton")
HitButton.Parent = MainMenu
HitButton.Size = UDim2.new(0, 200, 0, 40)
HitButton.Position = UDim2.new(0.5, -100, 0, 190)
HitButton.Text = "Auto Hit: OFF"
HitButton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
HitButton.TextColor3 = Color3.new(1,1,1)
HitButton.TextSize = 16

local HitCorner = Instance.new("UICorner")
HitCorner.CornerRadius = UDim.new(0, 10)
HitCorner.Parent = HitButton

HitButton.MouseButton1Click:Connect(function()
	AutoHitActive = not AutoHitActive
	if AutoHitActive then
		HitButton.Text = "Auto Hit: ON"
		HitButton.BackgroundColor3 = Color3.fromRGB(60, 180, 110)
	else
		HitButton.Text = "Auto Hit: OFF"
		HitButton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
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

---------------------------------------------------------
-- CƠ CHẾ ĐÓNG MỞ VÀ KÉO MENU
---------------------------------------------------------
ToggleButton.MouseButton1Click:Connect(function()
	MainMenu.Visible = not MainMenu.Visible
end)

CloseButton.MouseButton1Click:Connect(function()
	MainMenu.Visible = false
end)

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	MainMenu.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

MainMenu.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = MainMenu.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

MainMenu.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
