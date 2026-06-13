local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local HackSpeedActive = false
local InfJumpActive = false
local AutoHitActive = false
local AntiKnockActive = false

-- SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeathRunCatMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- NÚT CAT
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -30)
ToggleButton.Text = "CAT"
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ToggleButton.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1,0)

-- MENU CHÍNH
local MainMenu = Instance.new("Frame")
MainMenu.Parent = ScreenGui
MainMenu.Size = UDim2.new(0, 280, 0, 350)
MainMenu.Position = UDim2.new(0.5, -140, 0.5, -175)
MainMenu.BackgroundColor3 = Color3.fromRGB(235, 232, 227)
MainMenu.Visible = false
Instance.new("UICorner", MainMenu).CornerRadius = UDim.new(0, 20)

-- HÀM TẠO NÚT (Cho gọn code)
local function CreateButton(text, yPos)
    local btn = Instance.new("TextButton")
    btn.Parent = MainMenu
    btn.Size = UDim2.new(0, 200, 0, 35)
    btn.Position = UDim2.new(0.5, -100, 0, yPos)
    btn.Text = text .. ": OFF"
    btn.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
    btn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    return btn
end

local SpeedBtn = CreateButton("Speed", 50)
local JumpBtn = CreateButton("Inf Jump", 95)
local AntiKnockBtn = CreateButton("Anti-Knock", 140)
local BrightBtn = CreateButton("Fullbright", 185)

-- LOGIC CÁC CHỨC NĂNG
SpeedBtn.MouseButton1Click:Connect(function()
    HackSpeedActive = not HackSpeedActive
    SpeedBtn.Text = HackSpeedActive and "Speed: ON" or "Speed: OFF"
    SpeedBtn.BackgroundColor3 = HackSpeedActive and Color3.fromRGB(60, 180, 110) or Color3.fromRGB(220, 80, 80)
end)

RunService.RenderStepped:Connect(function()
    if HackSpeedActive and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
        Player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 45 -- Tốc độ vừa đủ để không bị lag
    end
end)

JumpBtn.MouseButton1Click:Connect(function()
    InfJumpActive = not InfJumpActive
    JumpBtn.Text = InfJumpActive and "Inf Jump: ON" or "Inf Jump: OFF"
    JumpBtn.BackgroundColor3 = InfJumpActive and Color3.fromRGB(60, 180, 110) or Color3.fromRGB(220, 80, 80)
end)

UserInputService.JumpRequest:Connect(function()
    if InfJumpActive and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
        Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- CHỐNG VĂNG (Anti-Knockback)
AntiKnockBtn.MouseButton1Click:Connect(function()
    AntiKnockActive = not AntiKnockActive
    AntiKnockBtn.Text = AntiKnockActive and "Anti-Knock: ON" or "Anti-Knock: OFF"
    AntiKnockBtn.BackgroundColor3 = AntiKnockActive and Color3.fromRGB(60, 180, 110) or Color3.fromRGB(220, 80, 80)
end)

RunService.Heartbeat:Connect(function()
    if AntiKnockActive and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0) -- Triệt tiêu lực văng
    end
end)

-- FULLBRIGHT
BrightBtn.MouseButton1Click:Connect(function()
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 99999
    BrightBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 110)
    BrightBtn.Text = "Fullbright: ON"
end)

-- ĐÓNG MỞ MENU
ToggleButton.MouseButton1Click:Connect(function() MainMenu.Visible = not MainMenu.Visible end)
