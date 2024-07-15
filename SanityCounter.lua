local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Sanity = Character:WaitForChild("Sanity",math.huge)

local New_GUI = Instance.new("ScreenGui")
New_GUI.Parent = game:GetService("CoreGui")
New_GUI.IgnoreGuiInset = true
New_GUI.Enabled = true
New_GUI.ResetOnSpawn = false

local Label = Instance.new("TextLabel")
Label.Parent = New_GUI
Label.Size = UDim2.fromOffset(400,400)
Label.Position = UDim2.fromScale(0,0.5)
Label.BackgroundTransparency = 1
Label.TextSize = 15
Label.TextColor3 = Color3.new(1,1,1)
Label.TextStrokeTransparency = 0

local PreviousConnection = Sanity:GetPropertyChangedSignal("Value"):Connect(function()
    Label.Visible = true
    Label.Text = "Sanity : " .. tostring(Sanity.Value) .. " / " .. tostring(Sanity.MaxValue)
end)

Player.CharacterAdded:Connect(function(Char)
    PreviousConnection:Disconnect()
    PreviousConnection = nil
    Label.Visible = false
    Character = Char
    Sanity = Character:WaitForChild("Sanity",math.huge)
    PreviousConnection = Sanity:GetPropertyChangedSignal("Value"):Connect(function()
        Label.Visible = true
        Label.Text = "Sanity : " .. tostring(Sanity.Value) .. " / " .. tostring(Sanity.MaxValue)
    end)
end)
