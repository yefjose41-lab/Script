-- Script para Delta Executor
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local autoFarm = false

-- Función para auto farmear monedas
local function autoFarmCoins()
    while autoFarm do
        -- Código para recoger monedas
        for _, coin in pairs(game.Workspace:GetDescendants()) do
            if coin.Name == "Coin" then
                LocalPlayer.Character.HumanoidRootPart.CFrame = coin.CFrame
                wait(0.1)
                fireproximityprompt(coin.ProximityPrompt)
            end
        end
        wait(1)
    end
end

-- Crea el botón
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.3, 0)
Button.Text = "Auto Farm: OFF"
Button.Parent = ScreenGui

-- Conecta el botón a la función
Button.MouseButton1Click:Connect(function()
    autoFarm = not autoFarm
    if autoFarm then
        Button.Text = "Auto Farm: ON"
        spawn(autoFarmCoins)
    else
        Button.Text = "Auto Farm: OFF"
    end
end)
