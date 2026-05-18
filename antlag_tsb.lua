-- DanielSonrie Ultimate Anti-Lag | The Strongest Battlegrounds Edition
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

print("⚔️ TSB Anti-Lag Optimizado por DanielSonrie")

-- 1. NOTIFICACIÓN REAL (Como la foto, con máxima prioridad ZIndex)
pcall(function()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    if PlayerGui:FindFirstChild("DanielToastGui") then 
        PlayerGui.DanielToastGui:Destroy() 
    end
    
    local ToastGui = Instance.new("ScreenGui")
    ToastGui.Name = "DanielToastGui"
    ToastGui.ResetOnSpawn = false
    ToastGui.DisplayOrder = 99999 -- Máxima prioridad para que no lo tape nada
    ToastGui.Parent = PlayerGui
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 220, 0, 65)
    MainFrame.Position = UDim2.new(1, -235, 1, -110)
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ToastGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = MainFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 25)
    TitleLabel.Position = UDim2.new(0, 0, 0, 8)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "FPS BOOST ACTIVATED"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Parent = MainFrame
    
    local SubLabel = Instance.new("TextLabel")
    SubLabel.Size = UDim2.new(1, 0, 0, 20)
    SubLabel.Position = UDim2.new(0, 0, 0, 33)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Text = "DanielSonrieScript"
    SubLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
    SubLabel.TextSize = 13
    SubLabel.Font = Enum.Font.GothamBold
    SubLabel.Parent = MainFrame
end)

-- 2. FILTRO INTELIGENTE: ADIÓS ROCAS Y MANTENER DASH AZUL
local function IsRockColor(color)
    local r, g, b = color.R * 255, color.G * 255, color.B * 255
    if (r > 60 and r < 160 and g > 60 and g < 160 and b > 60 and b < 160) or 
       (r > 80 and r < 140 and g > 50 and g < 100 and b > 30 and b < 80) then
        return true
    end
    return false
end

local function CleanLaggyThings(obj)
    local isDashEffect = false
    pcall(function()
        local nameLower = string.lower(obj.Name)
        if string.find(nameLower, "dash") or string.find(nameLower, "aura") or string.find(nameLower, "blue") or string.find(nameLower, "garou") or string.find(nameLower, "teleport") then
            isDashEffect = true
        end
        if obj.Parent and (string.find(string.lower(obj.Parent.Name), "fx") or string.find(string.lower(obj.Parent.Name), "effect")) then
            isDashEffect = true
        end
    end)

    if isDashEffect then return end

    local isRock = false
    pcall(function()
        if obj:IsA("BasePart") then
            local nameLower = string.lower(obj.Name)
            if string.find(nameLower, "rock") or string.find(nameLower, "stone") or string.find(nameLower, "debris") or string.find(nameLower, "boulder") or string.find(nameLower, "floor") then
                isRock = true
            elseif IsRockColor(obj.Color) and not obj.Parent:FindFirstChild("Humanoid") and obj.Name ~= "Terrain" then
                isRock = true
            end
        elseif obj:IsA("Debris") then
            isRock = true
        end
    end)

    if isRock then
        obj:Destroy()
        return
    end

    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
        obj.Enabled = false
    elseif obj:IsA("Explosion") then
        obj.Visible = false
    elseif obj:IsA("BasePart") and not obj:IsA("MeshPart") and not obj.Parent:FindFirstChild("Humanoid") then
        obj.Material = Enum.Material.SmoothPlastic
    elseif obj:IsA("Texture") or obj:IsA("Decal") then
        obj:Destroy()
    end
end

-- 3. AJUSTES DE ILUMINACIÓN DE GOLPES
pcall(function()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e6
    Lighting.Brightness = 1
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") then
            effect.Enabled = false
        end
    end
end)

for _, child in pairs(Workspace:GetDescendants()) do
    pcall(CleanLaggyThings, child)
end

Workspace.DescendantAdded:Connect(function(descendant)
    pcall(CleanLaggyThings, descendant)
end)
