-- BỔ SUNG NÚT ĐÓNG/PHÓNG TO TRÊN BẢNG MENU ĐỎ
-- Dán đè đoạn này vào phần MainFrame của code cũ

-- Tạo thanh tiêu đề nhỏ phía trên bảng đỏ
local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundTransparency = 1

local CloseBtn = Instance.new("TextButton", TitleBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
CloseBtn.Text = "X" -- Nút đóng menu
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 20

-- HÀM KẾT NỐI ĐÓNG MENU
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false -- Đóng menu lại
end)

-- Nút thu nhỏ (Dấu trừ)
local MinBtn = Instance.new("TextButton", TitleBar)
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -70, 0, 0)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.BackgroundTransparency = 1
MinBtn.TextSize = 25

MinBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false -- Thu nhỏ về lại thanh Top Bar
end)
