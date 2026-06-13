local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local HackSpeedActive = false
local InfJumpActive = false
local AntiKnockActive = false
local BrightActive = false

-- SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PremiumDeathRunMenu"
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

-- KHUNG MENU CHÍNH (Màu trắng sữa giống con mèo của bạn)
local MainMenu = Instance.new("Frame")
MainMenu.Parent = ScreenGui
MainMenu.Size = UDim2.new(0, 280, 0, 320)
MainMenu.Position = UDim2.new(0.5, -140, 0.5, -160)
MainMenu.BackgroundColor3 = Color3.fromRGB(235, 232, 227) -- Màu trắng sữa
MainMenu.Visible = false -- Bấm nút CAT mới hiện

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainMenu

-- TIÊU ĐỀ MENU
local Title = Instance.new("TextLabel")
Title.Parent = MainMenu
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "DEATH RUN PREMIUM"
Title.TextColor3 = Color3.fromRGB(40, 40, 40)
Title.TextSize = 18
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
-- CƠ CHẾ TẠO CÁC NÚT CHỨC NĂNG HỖ TRỢ CHƠI GAME
---------------------------------------------------------
local function CreateMenuButton(text, yPos)
    local btn = Instance.new("TextButton")
    btn.Parent = MainMenu
    btn.Size = UDim2.new(0, 220, 0, 40)
    btn.Position = UDim2.new(0.5, -110, 0, yPos)
    btn.Text = text .. ": TẮT"
    btn.BackgroundColor3 = Color3.fromRGB(220, 80, 80) -- Màu đỏ khi tắt
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextSize = 16
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    return btn
end

local SpeedButton = CreateMenuButton("Chạy Nhanh (Speed)", 60)
local JumpButton = CreateMenuButton("Nhảy Vô Hạn (Jump)", 115)
local AntiKnockButton = CreateMenuButton("Chống Văng (Anti-Knock)", 170)
local BrightButton = CreateMenuButton("Sáng Màn Hình (Bright)", 225)

-- 1. Xử lý Chạy Nhanh (Giữ ở mức 40 để nhặt xu nhanh hơn người khác nhưng an toàn)
SpeedButton.MouseButton1Click:Connect(function()
	HackSpeedActive = not HackSpeedActive
	if HackSpeedActive then
		SpeedButton.Text = "Chạy Nhanh: BẬT"
		SpeedButton.BackgroundColor3 = Color3.fromRGB(60, 180, 110) -- Màu xanh khi bật
	else
		SpeedButton.Text = "Chạy Nhanh: TẮT"
		SpeedButton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
		if Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
			Player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
		end
	end
end)

RunService.RenderStepped:Connect(function()
	if HackSpeedActive and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
		Player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 40
	end
end)

-- 2. Xử lý Nhảy Vô Hạn (Giúp nhảy qua các hố bẫy chết người dễ dàng)
JumpButton.MouseButton1Click:Connect(function()
	InfJumpActive = not InfJumpActive
	JumpButton.Text = InfJumpActive and "Nhảy Vô Hạn: BẬT" or "Nhảy Vô Hạn: TẮT"
	JumpButton.BackgroundColor3 = InfJumpActive and Color3.fromRGB(60, 180, 110) or Color3.fromRGB(220, 80, 80)
end)

UserInputService.JumpRequest:Connect(function()
	if InfJumpActive and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
		Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

-- 3. Xử lý Chống Văng (Giữ nhân vật không bị đẩy bay khỏi map khi chạm bẫy gạt)
AntiKnockButton.MouseButton1Click:Connect(function()
	AntiKnockActive = not AntiKnockActive
	AntiKnockButton.Text = AntiKnockActive and "Chống Văng: BẬT" or "Chống Văng: TẮT"
	AntiKnockButton.BackgroundColor3 = AntiKnockActive and Color3.fromRGB(60, 180, 110) or Color3.fromRGB(220, 80, 80)
end)

RunService.Heartbeat:Connect(function()
	if AntiKnockActive and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
		Player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
		Player.Character.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
	end
end)

-- 4. Sáng Màn Hình Fullbright (Giúp nhìn rõ bẫy và xu ở các góc tối tăm)
BrightButton.MouseButton1Click:Connect(function()
	BrightActive = not BrightActive
	if BrightActive then
		BrightButton.Text = "Sáng Màn Hình: BẬT"
		BrightButton.BackgroundColor3 = Color3.fromRGB(60, 180, 110)
		Lighting.Brightness = 2
		Lighting.ClockTime = 14
		Lighting.FogEnd = 99999
	else
		BrightButton.Text = "Sáng Màn Hình: TẮT"
		BrightButton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
		Lighting.Brightness = 1
		Lighting.ClockTime = 12
	end
end)

---------------------------------------------------------
-- CƠ CHẾ ĐÓNG MỞ VÀ KÉO MENU
---------------------------------------------------------
ToggleButton.MouseButton1Click:Connect(function() MainMenu.Visible = not MainMenu.Visible end)
CloseButton.MouseButton1Click:Connect(function() MainMenu.Visible = false end)

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
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)

MainMenu.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then update(input) end
end)
