local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local HackSpeedActive = false
local InfJumpActive = false
local AutoHitActive = false

-- SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CatMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- NÚT MỞ/TẮT MENU (Nút tròn nhỏ)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -30)
ToggleButton.Text = "CAT"
ToggleButton.TextScaled = true
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ToggleButton.TextColor3 = Color3.new(1,1,1)

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1,0)
ToggleCorner.Parent = ToggleButton

-- KHUNG MENU CHÍNH (Bây giờ là một ImageLabel - Khung Ảnh thay vì Frame xám)
local MainMenu = Instance.new("ImageLabel")
MainMenu.Parent = ScreenGui
MainMenu.Size = UDim2.new(0, 350, 0, 350) -- Kích thước khung ảnh mèo
MainMenu.Position = UDim2.new(0.5, -175, 0.5, -175)
MainMenu.BackgroundTransparency = 1 -- Làm trong suốt nền để lộ hình mèo
-- Đây là ID ảnh chú mèo cute đeo tai nghe trên hệ thống Roblox
MainMenu.Image = "rbxassetid://13411132204" 

-- NÚT ĐÓNG MENU (Nút X nhỏ xinh trên đầu mèo)
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = MainMenu
CloseButton.Size = UDim2.new(0,30,0,30)
CloseButton.Position = UDim2.new(1,-40,0,20)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(255,60,60)
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.ZIndex = 5

local CloseCorner
