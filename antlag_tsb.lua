-- DanielSonrie Ultimate Anti-Lag | The Strongest Battlegrounds Edition
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

print("⚔️ TSB Anti-Lag v4 (Árboles y Rocas Corregidos) por DanielSonrie")

-- 1. NOTIFICACIÓN COMPACTA EN LA ESQUINA (No tapa el salto)
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
    
    local MainFrame = Instance.new("Frame")
    -- Tamaño compacto para celular
    MainFrame.Size = UDim2.new(0, 170, 0, 45)
    -- Posición subida para no estorbar el botón de saltar
    MainFrame.Position = UDim2.new(1, -210, 1, -165) 
    MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ToastGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = MainFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 18)
    TitleLabel.Position = UDim2.new(0, 0, 0, 4)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "FPS BOOST ACTIVATED"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 10
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Parent = MainFrame
    
    local SubLabel = Instance.new("TextLabel")
    SubLabel.Size = UDim2.new(1, 0, 0, 15)
    SubLabel.Position = UDim2.new(0, 0, 0, 22)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Text = "DanielSonrieScript"
    SubLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
    SubLabel.TextSize = 11
    SubLabel.Font = Enum.Font.GothamBold
    SubLabel.Parent = MainFrame
end)

-- 2. FILTRO INTELIGENTE: RESPETA ÁRBOLES/DASH Y DESINTEGRA ROCAS
local function CleanLaggyThings(obj)
    -- GUARDAR TU DASH AZUL Y EFECTOS DE GAROU
    local isDashEffect = false
    pcall(function()
        local nameLower = string.lower(obj.Name)
        if string.find(nameLower, "dash") or string.find(nameLower, "aura") or string.find(nameLower, "blue") or string.find(nameLower, "garou") or string.find(nameLower, "teleport") then
            isDashEffect = true
        end
    end)
    if isDashEffect then return end

    -- IMPEDIR QUE LOS ÁRBOLES SE QUEDEN FLOTANDO
    local isMapStructure = false
    pcall(function()
        if obj:IsDescendantOf(Workspace:FindFirstChild("Map")) or string.find(string.lower(obj.Name), "tree") or string.find(string.lower(obj.Name), "leaf") or string.find(string.lower(obj.Name), "leave") then
            isMapStructure = true
        end
    end)
    if isMapStructure then return end

    -- FILTRO DE ROCAS POR COMPORTAMIENTO (Elimina escombros dinámicos de golpes)
    local isRockDebris = false
    pcall(function()
        if obj:IsA("BasePart") then
            -- Si aparece en la carpeta de efectos visuales de TSB o es creado por un ataque
            if obj.Parent and (obj.Parent.Name == "VisualEffects" or string.find(string.lower(obj.Parent.Name), "fx")) then
                isRockDebris = true
            -- Si es una roca suelta lanzada (no tiene colisión de mapa o se mueve por impacto)
            elseif not obj.Parent:FindFirstChild("Humanoid") and (obj.Name == "Part" or obj.Name == "MeshPart" or string.find(string.lower(obj.Name), "rock") or string.find(string.lower(obj.Name), "debris")) then
                if obj.CanCollide == false or obj.Velocity.Magnitude > 0 then
                    isRockDebris = true
                end
            end
        elseif obj:IsA("Debris") then
            isRockDebris = true
        end
    end)

    if isRockDebris then
        obj:Destroy()
        return
    end

    -- Remover partículas del entorno pesadas sin romper personajes
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
        if not obj:IsDescendantOf(LocalPlayer.Character) then
            obj.Enabled = false
        end
    elseif obj:IsA("Explosion") then
        obj.Visible = false
    elseif obj:IsA("Texture") or obj:IsA("Decal") then
        -- No borrar texturas dentro del mapa para evitar bugs visuales de árboles
        if not obj:IsDescendantOf(Workspace:FindFirstChild("Map")) then
            obj:Destroy()
        end
    end
end

-- 3. OPTIMIZACIÓN DE ILUMINACIÓN DE GOLPES
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

-- Ejecutar escáner en vivo
for _, child in pairs(Workspace:GetDescendants()) do
    pcall(CleanLaggyThings, child)
end

Workspace.DescendantAdded:Connect(function(descendant)
    pcall(CleanLaggyThings, descendant)
end)
