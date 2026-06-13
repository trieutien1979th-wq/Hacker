-- FULL RINGTA SCRIPTS: KHUNG TRÊN CÙNG + MENU CHÍNH
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- XÓA BẢN CŨ NẾU CÓ
if PlayerGui:FindFirstChild("RingtaFullSystem") then 
    PlayerGui.RingtaFullSystem:Destroy() 
end

local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "RingtaFullSystem"
ScreenGui.ResetOnSpawn = false

---------------------------------------------------------------------
-- 1. THANH CÔNG CỤ TRÊN CÙNG (Top Bar - Theo ảnh 1000048690_2.jpg)
---------------------------------------------------------------------
local TopBar = Instance.new("Frame", ScreenGui)
TopBar.Size = UDim2.new(0, 310, 0, 38)
TopBar.Position = UDim2.new(0.5, -155, 0, 5) -- Đặt ở cạnh trên chính giữa màn hình
TopBar.BackgroundColor3 = Color3.fromRGB(30, 25, 35) -- Nền tối
TopBar.BorderSizePixel = 0

local TopBarCorner = Instance.new("UICorner", TopBar)
TopBarCorner.CornerRadius = UDim.new(0, 8)

-- Viền Gradient Tím - Xanh Neon rực rỡ quanh thanh Top Bar
local TopBarStroke = Instance.new("UIStroke", TopBar)
TopBarStroke.Thickness = 1.5
local TopBarGradient = Instance.new("UIGradient", TopBarStroke)
TopBarGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 30, 220)), -- Tím
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 180, 255))   -- Xanh neon
})

-- Icon Di Chuyển (+) bên trái
local DragIcon = Instance.new("TextLabel", TopBar)
DragIcon.Size = UDim2.new(0, 30, 1, 0)
DragIcon.Position = UDim2.new(0, 10, 0, 0)
DragIcon.Text = "✥" -- Ký tự đại diện cho icon di chuyển
DragIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
DragIcon.TextSize = 18
DragIcon.BackgroundTransparency = 1

-- Nút Bấm Chính trên thanh "Open RINGTA SCRIPTS" (kèm icon bàn tay ☝️)
local ToggleButton = Instance.new("TextButton", TopBar)
ToggleButton.Size = UDim2.new(1, -50, 1, 0)
ToggleButton.Position = UDim2.new(0, 40, 0, 0)
ToggleButton.Text = "☝️  Open RINGTA SCRIPTS"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamMedium
ToggleButton.TextSize = 14
ToggleButton.BackgroundTransparency = 1
ToggleButton.TextXAlignment = Enum.TextXAlignment.Left

---------------------------------------------------------------------
-- 2. KHUNG MENU CHÍNH CHIA ĐÔI (Main Menu - Theo ảnh 1000048689.jpg)
---------------------------------------------------------------------
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 520, 0, 330)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -165)
MainFrame.BackgroundColor3 = Color3.fromRGB(155, 25, 40) -- Đỏ rượu chuẩn Ringta
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false -- Mặc định ẩn, bấm thanh trên cùng mới hiện
MainFrame.Active = true

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 12)

-- Thanh Sidebar dọc bên trái
local SideBar = Instance.new("Frame", MainFrame)
SideBar.Size = UDim2.new(0, 150, 1, 0)
SideBar.BackgroundColor3 = Color3.fromRGB(120, 20, 30) -- Đỏ sẫm hơn
SideBar.BorderSizePixel = 0
local SideBarCorner = Instance.new("UICorner", SideBar)
SideBarCorner.CornerRadius = UDim.new(0, 12)

-- Tiêu đề nhỏ trong Sidebar
local SideTitle = Instance.new("TextLabel", SideBar)
SideTitle.Size = UDim2.new(1, 0, 0, 35)
SideTitle.Text = "  RINGTA SCRIPTS"
SideTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SideTitle.Font = Enum.Font.SourceSansBold
SideTitle.TextSize = 14
SideTitle.TextXAlignment = Enum.TextXAlignment.Left
SideTitle.BackgroundTransparency = 1

-- Khung chứa nội dung bên phải
local ContentHolder = Instance.new("Frame", MainFrame)
ContentHolder.Size = UDim2.new(1, -170, 1, -20)
ContentHolder.Position = UDim2.new(0, 165, 0, 10)
ContentHolder.BackgroundTransparency = 1

-- Tạo các trang chứa tính năng (Tabs)
local Pages = {
    Main = Instance.new("Frame", ContentHolder),
    Teleport = Instance.new("Frame", ContentHolder)
}
for _, page in pairs(Pages) do 
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false 
end
Pages.Main.Visible = true -- Hiện trang Main đầu tiên

-- Hàm tạo các nút chuyển Tab bên Sidebar
local currentTabCount = 0
local function CreateTabButton(name, targetPage)
    local btn = Instance.new("TextButton", SideBar)
    btn.Size = UDim2.new(1, -10, 0, 36)
    btn.Position = UDim2.new(0, 5, 0, 45 + (currentTabCount * 42))
    btn.Text = "  " .. name
    btn.TextColor3 = Color3.fromRGB(230, 230, 230)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 16
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.BackgroundColor3 = Color3.fromRGB(145, 30, 45)
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    currentTabCount = currentTabCount + 1
    
    btn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        targetPage.Visible = true
    end)
end

CreateTabButton("⭐ Main", Pages.Main)
CreateTabButton("🚀 Teleport", Pages.Teleport)

---------------------------------------------------------------------
-- 3. CÁC NÚT BẬT/TẮT TÍNH NĂNG Ở TRANG "MAIN" (Có nút gạt ON/OFF)
---------------------------------------------------------------------
local function CreateToggleFeature(text, yPos, callback)
    local fFrame = Instance.new("Frame", Pages.Main)
    fFrame.Size = UDim2.new(1, 0, 0, 50)
    fFrame.Position = UDim2.new(0, 0, 0, yPos)
    fFrame.BackgroundColor3 = Color3.fromRGB(140, 25, 35)
    fFrame.BorderSizePixel = 0
    Instance.new("UICorner", fFrame).CornerRadius = UDim.new(0, 8)
    
    local label = Instance.new("TextLabel", fFrame)
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.BackgroundTransparency = 1
    
    local switch = Instance.new("TextButton", fFrame)
    switch.Size = UDim2.new(0, 45, 0, 24)
    switch.Position = UDim2.new(1, -55, 0.5, -12)
    switch.Text = ""
    switch.BackgroundColor3 = Color3.fromRGB(180, 40, 50) -- Màu đỏ khi tắt
    local swCorner = Instance.new("UICorner", switch)
    swCorner.CornerRadius = UDim.new(1, 0)
    
    local circle = Instance.new("Frame", switch)
    circle.Size = UDim2.new(0, 18, 0, 18)
    circle.Position = UDim2.new(0, 3, 0.5, -9)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)
    
    local active = false
    switch.MouseButton1Click:Connect(function()
        active = not active
        if active then
            switch.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Gạt sang trắng/sáng khi bật giống ảnh
            circle.Position = UDim2.new(1, -21, 0.5, -9)
            circle.BackgroundColor3 = Color3.fromRGB(155, 25, 40)
        else
            switch.BackgroundColor3 = Color3.fromRGB(180, 40, 50)
            circle.Position = UDim2.new(0, 3, 0.5, -9)
            circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        end
        callback(active)
    end)
end

-- Thêm thử các nút gạt giống hệt ảnh Ringta của bạn
CreateToggleFeature("Free Auto Bond", 10, function(state)
    print("Free Auto Bond:", state)
end)

CreateToggleFeature("Bring Random Items To You", 70, function(state)
    print("Bring Items:", state)
end)

CreateToggleFeature("Auto Hit Weapon", 130, function(state)
    print("Auto Hit:", state)
end)

---------------------------------------------------------------------
-- 4. CƠ CHẾ ĐÓNG/MỞ VÀ KÉO THẢ THANH CÔNG CỤ
---------------------------------------------------------------------
-- Bấm thanh trên cùng để đóng/mở menu chính
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Cho phép kéo thả thanh TopBar di chuyển khắp màn hình
local dragging, dragInput, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = TopBar.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        TopBar.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
