
-- Создатель: ImNzkss52
-- Интерфейс в стиле Kiciahook V2

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AutoFarmButton = Instance.new("TextButton")
local TeleportButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 250, 0, 200)
Frame.BorderSizePixel = 0

Title.Parent = Frame
Title.Text = "Blox Fruits | Kiciahook V2 UI"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

AutoFarmButton.Parent = Frame
AutoFarmButton.Position = UDim2.new(0.1, 0, 0.3, 0)
AutoFarmButton.Size = UDim2.new(0.8, 0, 0, 40)
AutoFarmButton.Text = "АвтоФарм"
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmButton.Font = Enum.Font.SourceSansBold
AutoFarmButton.TextSize = 16

TeleportButton.Parent = Frame
TeleportButton.Position = UDim2.new(0.1, 0, 0.6, 0)
TeleportButton.Size = UDim2.new(0.8, 0, 0, 40)
TeleportButton.Text = "Телепорт на остров"
TeleportButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.Font = Enum.Font.SourceSansBold
TeleportButton.TextSize = 16

-- АвтоФарм функция (пример)
local farming = false
AutoFarmButton.MouseButton1Click:Connect(function()
    farming = not farming
    AutoFarmButton.Text = farming and "Остановить" or "АвтоФарм"
    while farming do
        local enemy = workspace.Enemies:FindFirstChildWhichIsA("Model")
        if enemy then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
            wait(0.2)
            -- Удар врага
            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = game.Players.LocalPlayer.Character
                    v:Activate()
                end
            end
        end
        wait(0.5)
    end
end)

-- Телепорт
TeleportButton.MouseButton1Click:Connect(function()
    local island = workspace:FindFirstChild("StarterIsland")
    if island then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = island.Position + Vector3.new(0, 10, 0)
    end
end)
