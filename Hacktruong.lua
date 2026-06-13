local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ContentProvider = game:GetService("ContentProvider")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local HackSpeedActive = false
local InfJumpActive = false
local AntiKnockActive = false
local BrightActive = false

-- SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MemeCatDeathRunMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- NÚT MỞ/TẮT MENU (NÚT TRÒN CAT XANH)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -30)
ToggleButton.Text = "CAT"
ToggleButton.TextScaled = true
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ToggleButton.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1,0)

-- KHUNG MENU HÌNH CHÚ MÈO ĐEO TAI NGHE (Từ ảnh 1000048421.png)
local MainMenu = Instance.new("ImageButton")
MainMenu.Parent = ScreenGui
MainMenu.Size = UDim2.new(0, 320, 0, 320) -- Tỉ lệ vuông chuẩn giúp ảnh không bị méo
MainMenu.Position = UDim2.new(0.5, -160, 0.5, -160)
MainMenu.BackgroundTransparency = 1 -- Ẩn nền xám để hiện rõ hình chú mèo

-- ĐÂY LÀ ID TRÊN ROBLOX CỦA HÌNH CON MÈO ĐEO TAI NGHE NÀY
MainMenu.Image = "rbxassetid://14457782352" 
MainMenu.Visible = false -- Chỉ hiện khi bấm nút CAT

-- Ép game tải hình ảnh chú mèo trước để tránh lỗi hiển thị ô trắng
pcall(function()
    ContentProvider:PreloadAsync({MainMenu})
end)

-- NÚT X ĐÓNG MENU (Đặt ở góc trên tai mèo)
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = MainMenu
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Position = UDim2.new(1, -45, 0, 25)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.ZIndex = 5
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0,8)

---------------------------------------------------------
-- CÁC NÚT TÍNH NĂNG ĐƯỢC XẾP ĐẸP TRÊN BỤNG CON MÈO
---------------------------------------------------------
local function CreateCatButton(text, yPos)
    local btn = Instance.new("TextButton")
    btn.Parent = MainMenu
    btn.Size = UDim2.new(0, 190, 0, 36)
    btn.Position = UDim2.new(0.5, -95, 0, yPos)
    btn.Text = text .. ": TẮT"
    btn.BackgroundColor3 = Color3.fromRGB(220, 80, 80) -- Màu đỏ khi tắt
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextSize = 14
    btn.Font = Enum.Font.SourceSansBold
    btn.ZIndex = 3
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    return btn
end

local SpeedButton = CreateCatButton("Speed", 85)
local JumpButton = CreateCatButton("Inf Jump", 135)
local AntiKnockButton = CreateCatButton("Anti-Knock", 185)
local BrightButton = CreateCatButton("Fullbright", 235)

-- 1. Tính năng Chạy nhanh (Tối ưu mức 40 cho Death Run)
SpeedButton.MouseButton1Click:Connect(function()
    HackSpeedActive = not HackSpeedActive
    if HackSpeedActive then
        SpeedButton.Text = "Speed: BẬT"
        SpeedButton.BackgroundColor3 = Color3.fromRGB(60, 180, 110)
    else
        SpeedButton.Text = "Speed: TẮT"
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

-- 2. Tính năng Nhảy vô hạn
JumpButton.MouseButton1Click:Connect(function()
    InfJumpActive = not InfJumpActive
    JumpButton.Text = InfJumpActive and "Inf Jump: BẬT" or "Inf Jump: TẮT"
    JumpButton.BackgroundColor3 = InfJumpActive and Color3.fromRGB(60, 180, 110) or Color3.fromRGB(220, 80, 80)
end)

UserInputService.JumpRequest:Connect(function()
    if InfJumpActive and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
        Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- 3. Tính năng Chống văng bẫy
AntiKnockButton.MouseButton1Click:Connect(function()
    AntiKnockActive = not AntiKnockActive
    AntiKnockButton.Text = AntiKnockActive and "Anti-Knock: BẬT" or "Anti-Knock: TẮT"
    AntiKnockButton.BackgroundColor3 = AntiKnockActive and Color3.fromRGB(60, 180, 110) or Color3.fromRGB(220, 80, 80)
end)

RunService.Heartbeat:Connect(function()
    if AntiKnockActive and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        Player.Character.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
    end
end)

-- 4. Tính năng Làm sáng màn hình
BrightButton.MouseButton1Click:Connect(function()
    BrightActive = not BrightActive
    if BrightActive then
        BrightButton.Text = "Fullbright: BẬT"
        BrightButton.BackgroundColor3 = Color3.fromRGB(60, 180, 110)
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 99999
    else
        BrightButton.Text = "Fullbright: TẮT"
        BrightButton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
        Lighting.Brightness = 1
        Lighting.ClockTime = 12
    end
end)

---------------------------------------------------------
-- ĐÓNG MỞ VÀ CƠ CHẾ KÉO THẢ DI CHUYỂN HÌNH CON MÈO
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
