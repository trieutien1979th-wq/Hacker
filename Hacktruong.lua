-- CODE DỰ PHÒNG KHÔNG LỖI ẢNH
local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local MainMenu = Instance.new("Frame", ScreenGui)
MainMenu.Size = UDim2.new(0, 300, 0, 300)
MainMenu.Position = UDim2.new(0.5, -150, 0.5, -150)
MainMenu.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Nền trắng
MainMenu.Active = true
MainMenu.Draggable = true -- Có thể kéo thả menu

-- Thay vì dùng ảnh con mèo dễ bị lỗi, mình tạo 1 cái Label để bạn dán link ảnh trực tiếp từ Google vào
local Title = Instance.new("TextLabel", MainMenu)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "MENU ĐÃ HOẠT ĐỘNG!"
Title.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Title.TextColor3 = Color3.new(1,1,1)

-- Nút test
local btn = Instance.new("TextButton", MainMenu)
btn.Size = UDim2.new(0, 200, 0, 50)
btn.Position = UDim2.new(0.5, -100, 0.5, -25)
btn.Text = "BẬT CHẾ ĐỘ"
btn.MouseButton1Click:Connect(function()
    print("Tính năng đã kích hoạt!")
end)
