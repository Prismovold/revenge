local plr = game.Players.LocalPlayer

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))();

local UI = Material.Load({
    Title = "SlimeHub",
    Style = 3,
    SizeX = 500,
    SizeY = 350,
    Theme = "Dark", -- Light or Dark
    ColorOverrides = {
        MainFrame = Color3.fromRGB(235,235,235)
    }
})

-- slime
local revenge = UI.New({
    Title = "SlimeHub"
})

revenge.Button({
    Text = "Bow No-cooldown",
    Callback = function()
        local env = getsenv(game.Players.LocalPlayer.Backpack.Bow.click)
        env.reloading = false
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Click this before you equip the bow everytime a new round starts."            
            })
        end
}})

revenge.Button({
    Text = "Place a Part",
    Callback = function()
        local part = Instance.new("Part")
        part.Name = "xdlolol"
        part.Parent = game.Workspace
        part.Anchored = true
        part.Position = game:GetService("Players").LocalPlayer.Character["Left Leg"].Position
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "The parts are anchored and client-sided."            
            })
        end
}})

revenge.Button({
    Text = "Delete Anchored Parts",
    Callback = function()
        for i, v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "xdlolol" then
        v:Destroy()
        end
        end
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Destroy the Parts created by the above button."            
            })
        end
}})

revenge.Button({
    Text = "Inf. Build & No-Cooldown",
    Callback = function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack.Build:GetDescendants()) do
            if v.Name == "CoolDown" then
                v.Value = 0.01
            end
        end
        for i, v in pairs(game.Players.LocalPlayer.Backpack.Build:GetDescendants()) do
            if v.Name == "MaxClones" then
                v.Value = 9e9
            end
        end
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Click this before you equip the item and everytime a new round starts."            
            })
        end
}})

revenge.TextField({
    Text = "Amount of money",
    Callback = function(value)
local args = {
    [1] = game:GetService("Players").LocalPlayer.leaderstats.Coins,
    [2] = -value,
    [3] = "arrow",
    [4] = "Arrow 2"
}

workspace.DoShopPurchase:InvokeServer(unpack(args))
    end
})
-- end
