-- CẤU TRÚC MENU RINGTA HOÀN CHỈNH
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
if PlayerGui:FindFirstChild("RingtaMenu") then PlayerGui.RingtaMenu:Destroy() end

local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "RingtaMenu"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 550, 0, 350)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(160, 35, 45) -- Màu đỏ chủ đạo
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
MainFrame.Active = true
MainFrame.Draggable = true

-- Sidebar
local SideBar = Instance.new("Frame", MainFrame)
SideBar.Size = UDim2.new(0, 160, 1, 0)
SideBar.BackgroundColor3 = Color3.fromRGB(130, 25, 35)
Instance.new("UICorner", SideBar).CornerRadius = UDim.new(0, 10)

-- Khung nội dung bên phải (Chứa các Tab)
local ContentHolder = Instance.new("Frame", MainFrame)
ContentHolder.Size = UDim2.new(1, -170, 1, -20)
ContentHolder.Position = UDim2.new(0, 170, 0, 10)
ContentHolder.BackgroundTransparency = 1

-- Khởi tạo các trang nội dung
local Pages = {
    Main = Instance.new("Frame", ContentHolder),
    Teleport = Instance.new("Frame", ContentHolder)
}
for _, p in pairs(Pages) do p.Size = UDim2.new(1,0,1,0); p.BackgroundTransparency = 1; p.Visible = false end
Pages.Main.Visible = true -- Mặc định hiện trang Main

-- TẠO NÚT CHUYỂN TAB
local function CreateTab(name, page)
    local btn = Instance.new("TextButton", SideBar)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, (#SideBar:GetChildren() - 1) * 45 + 10)
    btn.Text = name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(180, 40, 50)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        page.Visible = true
    end)
end

CreateTab("⭐ Main", Pages.Main)
CreateTab("🚀 Teleport", Pages.Teleport)

-- THÊM CHỨC NĂNG VÀO TRANG MAIN
local AutoHit = Instance.new("TextButton", Pages.Main)
AutoHit.Size = UDim2.new(0, 200, 0, 40)
AutoHit.Text = "Auto Hit Weapon: OFF"
AutoHit.BackgroundColor3 = Color3.fromRGB(180, 40, 50)
AutoHit.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", AutoHit)

AutoHit.MouseButton1Click:Connect(function()
    AutoHit.Text = (AutoHit.Text:find("OFF") and "Auto Hit Weapon: ON" or "Auto Hit Weapon: OFF")
    AutoHit.BackgroundColor3 = AutoHit.Text:find("ON") and Color3.fromRGB(40, 180, 80) or Color3.fromRGB(180, 40, 50)
end)
