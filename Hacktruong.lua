local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer

-- Các biến trạng thái của chức năng hack
local HackSpeedActive = false
local InfJumpActive = false

-- SCREEN GUI (Giao diện chính)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PremiumMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- NÚT MỞ/TẮT MENU (Nút tròn nhỏ nổi trên màn hình)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -30)
ToggleButton.Text = "☰"
ToggleButton.TextScaled = true
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ToggleButton.TextColor3 = Color3.new(1,1,1)

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1,0)
ToggleCorner.Parent = ToggleButton

-- FRAME CHÍNH (Bảng Menu chứa các nút hack)
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 250) -- Tăng chiều cao lên 250 để chứa nhiều nút
Frame.Position = UDim2.new(0.5, -150, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0,12)
FrameCorner.Parent = Frame

-- TIÊU ĐỀ MENU
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundTransparency = 1
Title.Text = "⭐ Premium Menu Hack ⭐"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true

-- NÚT ĐÓNG MENU (Nút X)
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0,30,0,30)
CloseButton.Position = UDim2.new(1,-35,0,5)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(255,60,60)
CloseButton.TextColor3 = Color3.new(1,1,1)

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0,8)
CloseCorner.Parent = CloseButton

---------------------------------------------------------
-- NÚT HACK 1: CHẠY NHANH (SPEED HACK)
---------------------------------------------------------
local SpeedButton = Instance.new("TextButton")
SpeedButton.Parent = Frame
SpeedButton.Size = UDim2.new(0, 240, 0, 40)
SpeedButton.Position = UDim2.new(0.5, -120, 0, 60) -- Vị trí nút 1
SpeedButton.Text = "Hack Tốc Độ: TẮT"
SpeedButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60) -- Ban đầu màu đỏ (Tắt)
SpeedButton.TextColor3 = Color3.new(1,1,1)
SpeedButton.TextSize = 18

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0,8)
SpeedCorner.Parent = SpeedButton

SpeedButton.MouseButton1Click:Connect(function()
	HackSpeedActive = not HackSpeedActive
	if HackSpeedActive then
		SpeedButton.Text = "Hack Tốc Độ: BẬT"
		SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100) -- Bật lên màu xanh lá
	else
		SpeedButton.Text = "Hack Tốc Độ: TẮT"
		SpeedButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		-- Trả về tốc độ mặc định khi tắt
		if Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
			Player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
		end
	end
end)

-- Vòng lặp liên tục giữ tốc độ (tránh game tự reset tốc độ)
RunService.RenderStepped:Connect(function()
	if HackSpeedActive and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
		Player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 100 -- Bạn có thể đổi số 100 thành tốc độ bạn muốn
	end
end)

---------------------------------------------------------
-- NÚT HACK 2: NHẢY VÔ HẠN (INFINITE JUMP)
---------------------------------------------------------
local JumpButton = Instance.new("TextButton")
JumpButton.Parent = Frame
JumpButton.Size = UDim2.new(0, 240, 0, 40)
JumpButton.Position = UDim2.new(0.5, -120, 0, 115) -- Vị trí nút 2
JumpButton.Text = "Nhảy Vô Hạn: TẮT"
JumpButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
JumpButton.TextColor3 = Color3.new(1,1,1)
JumpButton.TextSize = 18

local JumpCorner = Instance.new("UICorner")
JumpCorner.CornerRadius = UDim.new(0,8)
JumpCorner.Parent = JumpButton

JumpButton.MouseButton1Click:Connect(function()
	InfJumpActive = not InfJumpActive
	if InfJumpActive then
		JumpButton.Text = "Nhảy Vô Hạn: BẬT"
		JumpButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
	else
		JumpButton.Text = "Nhảy Vô Hạn: TẮT"
		JumpButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
	end
end)

-- Code xử lý khi bấm nút cách nhảy liên tục trên không
UserInputService.JumpRequest:Connect(function()
	if InfJumpActive and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
		Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

---------------------------------------------------------
-- CÁC CHỨC NĂNG ĐÓNG / MỞ / KÉO MENU (Giữ nguyên của bạn)
---------------------------------------------------------
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

Title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
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

Title.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
