herelocal OrionLib = loadstring(game:HttpGet("https://githubusercontent.com"))()
local Window = OrionLib:MakeWindow({Name = "Orion", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionConfig"})

local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

getgenv().GodModeEnabled = false

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddToggle({
    Name = "God Mode",
    Default = false,
    Callback = function(Value)
        getgenv().GodModeEnabled = Value
        if getgenv().GodModeEnabled then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
        else
            humanoid.MaxHealth = 100
            humanoid.Health = 100
        end
    end
})

humanoid.HealthChanged:Connect(function()
    if getgenv().GodModeEnabled then
        humanoid.Health = math.huge
    end
end)

player.CharacterAdded:Connect(function(newCharacter)
    local newHumanoid = newCharacter:WaitForChild("Humanoid")
    newHumanoid.HealthChanged:Connect(function()
        if getgenv().GodModeEnabled then
            newHumanoid.MaxHealth = math.huge
            newHumanoid.Health = math.huge
        end
    end)
end)

OrionLib:Init()
