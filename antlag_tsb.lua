-- DanielScript Ultimate Anti-Lag | The Strongest Battlegrounds Edition
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

print("⚔️ TSB Anti-Lag (UI Idéntica) por Daniel")

-- 1. NOTIFICACIÓN LIMPIA E IDÉNTICA A LA FOTO (Sin cuadros, texto fino)
pcall(function()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    if PlayerGui:FindFirstChild("DanielToastGui") then 
        PlayerGui.DanielToastGui:Destroy() 
    end
    
    local ToastGui = Instance.new("ScreenGui")
    ToastGui.Name = "DanielToastGui"
    ToastGui.ResetOnSpawn = false
    ToastGui.DisplayOrder = 99999
    ToastGui.Parent = PlayerGui
    
    -- Contenedor transparente (Sin recuadro de fondo)
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 200, 0, 50)
    MainFrame.Position = UDim2.new(1, -220, 1, -120) 
    MainFrame.BackgroundTransparency = 1 -- Totalmente invisible el fondo
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ToastGui
    
    -- Texto Principal (Blanco, alineado a la derecha)
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 20)
    TitleLabel.Position = UDim2.new(0, 0, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "Script Made by Daniel"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Right
    TitleLabel.Parent = MainFrame
    
    -- Texto Secundario (Gris, alineado a la derecha)
    local SubLabel = Instance.new("TextLabel")
    SubLabel.Size = UDim2.new(1, 0, 0, 15)
    SubLabel.Position = UDim2.new(0, 0, 0, 25)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Text = "Script modificado por Daniel"
    SubLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    SubLabel.TextSize = 12
    SubLabel.Font = Enum.Font.SourceSans
    SubLabel.TextXAlignment = Enum.TextXAlignment.Right
    SubLabel.Parent = MainFrame
end)

-- 2. LIMPIADOR DE ROCAS SEGURO (Respeta mapa y árboles)
local function CleanLaggyThings(obj)
    -- Proteger Dash
    local isDash = false
    pcall(function()
        local n = string.lower(obj.Name)
        if string.find(n, "dash") or string.find(n, "blue") or string.find(n, "aura") or string.find(n, "garou") then
            isDash = true
        end
    end)
    if isDash then return end

    -- Borrar solo escombros de los golpes
    local isTrashDebris = false
    pcall(function()
        if obj:IsA("BasePart") then
            if obj.Parent and (obj.Parent.Name == "VisualEffects" or string.find(string.lower(obj.Parent.Name), "fx") or obj.Parent.Name == "Debris") then
                isTrashDebris = true
            elseif not obj.Parent:FindFirstChild("Humanoid") and (string.find(string.lower(obj.Name), "rock") or string.find(string.lower(obj.Name), "debris")) then
                isTrashDebris = true
            end
        elseif obj:IsA("Debris") then
            isTrashDebris = true
        end
    end)

    if isTrashDebris then
        obj:Destroy()
        return
    end

    -- Desactivar partículas pesadas sin romper el escenario
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
        if not obj:IsDescendantOf(LocalPlayer.Character) then
            obj.Enabled = false
        end
    elseif obj:IsA("Explosion") then
        obj.Visible = false
    end
end

-- 3. ILUMINACIÓN BASE
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
