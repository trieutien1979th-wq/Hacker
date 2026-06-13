-- Cấu trúc Menu Mèo cho Death Run
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer

-- Bật/Tắt các chức năng chính
local WalkSpeed = 30 -- Tốc độ chạy nhanh
local JumpPower = 100 -- Nhảy cao hơn

-- (Giữ nguyên phần khởi tạo ScreenGui và ImageLabel "13411132204" như đoạn code trước)
-- ... [Chèn phần khởi tạo GUI vào đây] ...

-- Nút Speed Hack
SpeedButton.MouseButton1Click:Connect(function()
    if Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
        Player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = WalkSpeed
    end
end)

-- Nút High Jump
JumpButton.MouseButton1Click:Connect(function()
    if Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
        Player.Character:FindFirstChildOfClass("Humanoid").UseJumpPower = true
        Player.Character:FindFirstChildOfClass("Humanoid").JumpPower = JumpPower
    end
end)
