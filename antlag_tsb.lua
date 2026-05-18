-- DanielSonrie Ultimate Anti-Lag | The Strongest Battlegrounds Edition
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

print("⚔️ TSB Anti-Lag Modificado por DanielSonrie")

-- 1. NOTIFICACIÓN ESTILO NOTIFICATION TOAST (Abajo a la derecha)
pcall(function()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    if PlayerGui:FindFirstChild("DanielToastGui") then 
        PlayerGui.DanielToastGui:Destroy() 
    end
    
    local ToastGui = Instance.new("ScreenGui")
    ToastGui.Name = "DanielToastGui"
    ToastGui.ResetOnSpawn = false
    ToastGui.Parent = PlayerGui
    
    -- El contenedor gris oscuro de la esquina
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 220, 0, 65)
    MainFrame.Position = UDim2.new(1, -235, 1, -110) -- Ubicación exacta sobre los botones de ataque
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ToastGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = MainFrame
    
    -- Texto Principal: FPS BOOST ACTIVATED
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 25)
    TitleLabel.Position = UDim2.new(0, 0, 0, 8)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "FPS BOOST ACTIVATED"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Parent = MainFrame
    
    -- Subtexto en verde: DanielSonrieScript
    local SubLabel = Instance.new("TextLabel")
    SubLabel.Size = UDim2.new(1, 0, 0, 20)
    SubLabel.Position = UDim2.new(0, 0, 0, 33)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Text = "DanielSonrieScript"
    SubLabel.TextColor3 = Color3.fromRGB(0, 255, 120) -- Verde neón idéntico
    SubLabel.TextSize = 13
    SubLabel.Font = Enum.Font.GothamBold
    SubLabel.Parent = MainFrame
end)

-- 2. FILTRO INTELIGENTE (Respeta a Garou y vuela el lag real)
local function CleanLaggyThings(obj)
    -- EVITAR BORRAR EFECTOS DE GAROU
    -- TSB suele nombrar los efectos de los personajes con el nombre del move o el user
    local isGarouEffect = false
    if obj:IsDescendantOf(Workspace) then
        -- Si el efecto pertenece a un modelo de ataque de Garou o al personaje, saltarlo
        if string.find(string.lower(obj.Name), "garou") or string.find(string.lower(obj.Name), "dash") then
            isGarouEffect = true
        end
    end

    if not isGarouEffect then
        -- Desactivar partículas pesadas de mapa/actualización pero NO del dash salvado
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
            -- Solo apaga si no es del dash del jugador
            if not string.find(string.lower(obj.Name), "dash") then
                obj.Enabled = false
            end
        elseif obj:IsA("Explosion") then
            obj.Visible = false
        -- Destruir las rocas y escombros del piso cuando tiras a alguien
        elseif obj:IsA("Debris") or (obj:IsA("BasePart") and (obj.Name == "Debris" or obj.Name == "Rock" or obj.Name == "FloorRock")) then
            obj:Destroy()
        -- Modo Papa en el mapa base
        elseif obj:IsA("BasePart") and not obj:IsA("MeshPart") and not obj.Parent:FindFirstChild("Humanoid") then
            obj.Material = Enum.Material.SmoothPlastic
        elseif obj:IsA("Texture") or obj:IsA("Decal") then
            obj:Destroy()
        end
    end
end

-- 3. OPTIMIZAR ILUMINACIÓN DE GOLPES
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

-- Ejecutar limpieza inicial y activar el escáner de escombros en tiempo real
for _, child in pairs(Workspace:GetDescendants()) do
    pcall(CleanLaggyThings, child)
end

Workspace.DescendantAdded:Connect(function(descendant)
    pcall(CleanLaggyThings, descendant)
end)

print("🚀 Modo Papa Extremo Activo - FPS Booster v3")