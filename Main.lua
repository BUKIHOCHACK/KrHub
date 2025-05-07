local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()
local Player = game.Players.LocalPlayer

local Window = OrionLib:MakeWindow({
    Name = "KrHub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroText = "Loading Script..."
})

function MakeScriptHub()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
end

-- Lấy key từ GitHub
local success, realKey = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/bukihochack/KrHubKeySystem-/main/key.txt")
end)

getgenv().Key = success and realKey or "INVALID_KEY"
getgenv().KeyInput = "string"

OrionLib:MakeNotification({
    Name = "Logged In!",
    Content = "You need a key to use this script!",
    Image = "rbxassetid://4483345998",
    Time = 5
})

local Tab = Window:MakeTab({
    Name = "Key",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddTextbox({
    Name = "Key",
    Default = "Enter Key.",
    TextDisappear = true,
    Callback = function(Value)
        getgenv().KeyInput = Value
    end	  
})

Tab:AddButton({
    Name = "Check Key",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Checking Key",
            Content = "Checking the key you entered...",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        wait(2)
        if getgenv().KeyInput == getgenv().Key then
            OrionLib:MakeNotification({
                Name = "Correct Key!",
                Content = "The key you entered is correct.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            wait(1)
            OrionLib:Destroy()
            wait(0.3)
            MakeScriptHub()
        else
            OrionLib:MakeNotification({
                Name = "Incorrect Key!",
                Content = "The key you entered is incorrect.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

Tab:AddButton({
    Name = "Copy Link GetKey",
    Callback = function()
        setclipboard("https://bukihochack.github.io/KrHubKeySystem-/")
    end    
})

Tab:AddButton({
    Name = "Discord",
    Callback = function()
        setclipboard("Nope")
    end    
})

OrionLib:Init()
