local player = game.Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui")
if not playerGui then return end

-- Hide Roblox UI elements
pcall(function()
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
end)

-- Create loading screen UI
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true -- Ensures it fits all devices
screenGui.Parent = playerGui

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
background.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Text = "Skyline"
title.Font = Enum.Font.FredokaOne
title.TextScaled = true
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0.1, 0)
title.TextColor3 = Color3.fromRGB(255, 204, 0) -- Yellow for 'Skyline'
title.BackgroundTransparency = 1
title.Parent = background

local premiumText = Instance.new("TextLabel")
premiumText.Text = "Premium"
premiumText.Font = Enum.Font.FredokaOne
premiumText.TextScaled = true
premiumText.Size = UDim2.new(1, 0, 0.15, 0)
premiumText.Position = UDim2.new(0, 0, 0.3, 0)
premiumText.TextColor3 = Color3.fromRGB(0, 102, 255) -- Blue for 'Premium'
premiumText.BackgroundTransparency = 1
premiumText.Parent = background

-- Loading bar
local loadingBarBg = Instance.new("Frame")
loadingBarBg.Size = UDim2.new(0.8, 0, 0.05, 0)
loadingBarBg.Position = UDim2.new(0.1, 0, 0.75, 0)
loadingBarBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
loadingBarBg.Parent = background

local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green loading bar
loadingBar.Parent = loadingBarBg

-- Sound effect
local whooshSound = Instance.new("Sound")
whooshSound.SoundId = "rbxassetid://6026984224" -- Whoosh sound
whooshSound.Volume = 1
whooshSound.Parent = screenGui

-- Animate loading
for i = 1, 100 do
    loadingBar:TweenSize(UDim2.new(i / 100, 0, 1, 0), "Out", "Linear", 0.05, true)
    wait(0.05)
end

-- Play whoosh sound
whooshSound:Play()

-- Fade out loading screen
for i = 1, 10 do
    background.BackgroundTransparency = i / 10
    title.TextTransparency = i / 10
    premiumText.TextTransparency = i / 10
    loadingBarBg.BackgroundTransparency = i / 10
    loadingBar.BackgroundTransparency = i / 10
    wait(0.05)
end
screenGui:Destroy()

-- Show Roblox UI elements back
pcall(function()
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
end)

-- Notification UI
game.StarterGui:SetCore("SendNotification", {
    Title = "Skyline Premium 🌊";
    Text = "Script successfully loaded, " .. player.DisplayName .. "!";
    Duration = 5;
})

-- Execute new external script
loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptAllIDo/skyline-aw8bsh6k/refs/heads/main/Skyline-private.lua?token=GHSAT0AAAAAAC7MEURFHIBPKTIJ32JZQ3TMZ53BTUA"))()
