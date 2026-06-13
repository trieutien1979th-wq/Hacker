-- RINGTA STYLE MENU FRAMEWORK
local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(150, 30, 40) -- Màu đỏ đặc trưng của Ringta
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

-- SIDEBAR (Thanh dọc bên trái)
local SideBar = Instance.new("Frame", MainFrame)
SideBar.Size = UDim2.new(0, 150, 1, 0)
SideBar.BackgroundColor3 = Color3.fromRGB(130, 20, 30)
Instance.new("UICorner", SideBar).CornerRadius = UDim.new(0, 10)

-- KHUNG NỘI DUNG (Bên phải)
local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, -150, 1, 0)
ContentFrame.Position = UDim2.new(0, 150, 0, 0)
ContentFrame.BackgroundTransparency = 1

-- HÀM TẠO NÚT TAB (Sidebar)
local function CreateTab(name, yPos)
    local btn = Instance.new("TextButton", SideBar)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.Text = "  " .. name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.BackgroundTransparency = 1
    return btn
end

CreateTab("⭐ Main", 20)
CreateTab("🚀 Teleport", 60)
CreateTab("⚙️ Other", 100)

-- TÍNH NĂNG Ở BÊN PHẢI (Ví dụ: Auto Hit)
local Toggle = Instance.new("TextButton", ContentFrame)
Toggle.Size = UDim2.new(0, 200, 0, 40)
Toggle.Position = UDim2.new(0, 20, 0, 20)
Toggle.Text = "Auto Hit Weapon"
Toggle.BackgroundColor3 = Color3.fromRGB(170, 40, 50)
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 8)
