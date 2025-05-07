local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()
local Player = game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({
    Name = "KrHub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroText = "Loading Script..."
})

-- Tải danh sách key từ GitHub (file raw JSON)
local function fetchKeys()
    local url = "https://raw.githubusercontent.com/BUKIHOCHACK/KrHubKeySystem-/refs/heads/main/KeyKrHub.json" -- Đổi link này thành link raw GitHub của bạn
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success then
        return game:GetService("HttpService"):JSONDecode(response).keys
    else
        warn("Unable to fetch keys from GitHub.")
        return {}
    end
end

-- Lấy danh sách key từ GitHub
local validKeys = fetchKeys()

-- Kiểm tra xem key có hợp lệ không
local function isValidKey(key)
    for _, validKey in ipairs(validKeys) do
        if key == validKey then
            return true
        end
    end
    return false
end

function MakeScriptHub()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
end

OrionLib:MakeNotification({
    Name = "Logged In!",
    Content = "You need a key to use this script!",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- Tạo giao diện Orion với textbox và nút bấm
local Tab = Window:MakeTab({
    Name = "Key",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddTextbox({
    Name = "Enter Your Key",
    Default = "Enter Key",
    TextDisappear = true,
    Callback = function(Value)
        getgenv().KeyInput = Value
    end
})

Tab:AddButton({
    Name = "Check Key",
    Callback = function()
        -- Kiểm tra key nhập vào
        if isValidKey(getgenv().KeyInput) then
            OrionLib:MakeNotification({
                Name = "Correct Key!",
                Content = "Access granted.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })

            -- Lưu key vào file KrHubKey (không có phần mở rộng)
            if writefile then
                writefile("KrHubKey", getgenv().KeyInput)
            end

            -- Xóa OrionLib và load Script Hub
            wait(1)
            OrionLib:Destroy()
            wait(.3)
            MakeScriptHub()
        else
            OrionLib:MakeNotification({
                Name = "Incorrect Key",
                Content = "Access denied.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

Tab:AddButton({
    Name = "Copy GetKey Link",
    Callback = function()
        setclipboard("https://yourdomain.com") -- Thay link của bạn ở đây
    end
})

OrionLib:Init()
