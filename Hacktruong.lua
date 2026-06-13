local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- TẠO GIAO DIỆN CHILL
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "ChillMenu"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45) -- Màu tối chill
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Tự kéo thả bằng chuột

-- THÊM HIỆU ỨNG GRADIENT (Chuyển màu tím sang xanh)
local UIGradient = Instance.new("UIGradient", MainFrame)
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 30, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 60, 90))
})
UIGradient.Rotation = 45

-- TIÊU ĐỀ
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "CHILL MODE"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.BackgroundTransparency = 1

-- NÚT BẤM STYLE CHILL
local function CreateButton(name, yPos)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0, 240, 0, 45)
    btn.Position = UDim2.new(0.5, -120, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.Gotham
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    return btn
end

local SpeedBtn = CreateButton("Auto Speed: OFF", 80)
local JumpBtn = CreateButton("Inf Jump: OFF", 140)
local FlyBtn = CreateButton("Fly Mode: OFF", 200)

-- HOẠT HÌNH BẤM NÚT
local function ClickAnim(btn)
    btn.MouseButton1Click:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
        task.wait(0.2)
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    end)
end

ClickAnim(SpeedBtn)
ClickAnim(JumpBtn)
ClickAnim(FlyBtn)

print("Menu Chill đã sẵn sàng!")
