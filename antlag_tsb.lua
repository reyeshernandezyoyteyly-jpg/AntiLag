-- ANTI-LAG DEFINITIVO - DanielSonrieScripts
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

print("⚔️ ANTI-LAG ACTIVADO - DanielSonrieScripts")

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
for _, gui in pairs(PlayerGui:GetChildren()) do
    if gui.Name:find("Daniel") then gui:Destroy() end
end

-- ============================================
-- INTRODUCCIÓN MODO PATATA (3 segundos)
-- ============================================
pcall(function()
    local WelcomeGui = Instance.new("ScreenGui")
    WelcomeGui.Name = "DanielWelcomeGui"
    WelcomeGui.ResetOnSpawn = false
    WelcomeGui.Parent = PlayerGui

    local CenterLabel = Instance.new("TextLabel")
    CenterLabel.Size = UDim2.new(0, 300, 0, 50)
    CenterLabel.Position = UDim2.new(0.5, -150, 0.4, -25)
    CenterLabel.BackgroundTransparency = 1
    CenterLabel.Text = "🥔 MODO PATATA ACTIVADO 🥔"
    CenterLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CenterLabel.TextSize = 26
    CenterLabel.Font = Enum.Font.GothamBold
    CenterLabel.Parent = WelcomeGui

    task.wait(3)
    WelcomeGui:Destroy()
end)

-- ============================================
-- PANEL DE ACTUALIZACIONES (ESQUINA INFERIOR IZQUIERDA - 8 segundos)
-- ============================================
pcall(function()
    local UpdateGui = Instance.new("ScreenGui")
    UpdateGui.Name = "DanielUpdateGui"
    UpdateGui.ResetOnSpawn = false
    UpdateGui.Parent = PlayerGui

    local UpdateFrame = Instance.new("Frame")
    UpdateFrame.Size = UDim2.new(0, 160, 0, 100)
    UpdateFrame.Position = UDim2.new(0, 10, 1, -110)
    UpdateFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    UpdateFrame.BackgroundTransparency = 0.5
    UpdateFrame.BorderSizePixel = 0
    UpdateFrame.Parent = UpdateGui

    local UpdateCorner = Instance.new("UICorner")
    UpdateCorner.CornerRadius = UDim.new(0, 8)
    UpdateCorner.Parent = UpdateFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -10, 0, 22)
    TitleLabel.Position = UDim2.new(0, 5, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "ACTUALIZACIONES"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
    TitleLabel.TextSize = 11
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
    TitleLabel.Parent = UpdateFrame

    local actualizaciones = {
        {texto = "rocas eliminadas", color = Color3.fromRGB(0, 255, 0)},
        {texto = "modo patata", color = Color3.fromRGB(0, 255, 0)},
        {texto = "efectos reducidos", color = Color3.fromRGB(0, 255, 0)},
        {texto = "arboles removidos", color = Color3.fromRGB(0, 255, 0)}
    }

    local yPos = 30
    for _, update in pairs(actualizaciones) do
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 0, 16)
        label.Position = UDim2.new(0, 5, 0, yPos)
        label.BackgroundTransparency = 1
        label.Text = "✓ " .. update.texto
        label.TextColor3 = update.color
        label.TextSize = 10
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = UpdateFrame
        yPos = yPos + 18
    end

    -- DESAPARECER DESPUÉS DE 8 SEGUNDOS
    task.spawn(function()
        task.wait(8)
        for i = 1, 10 do
            local alpha = i / 10
            UpdateFrame.BackgroundTransparency = 0.5 + (alpha * 0.5)
            TitleLabel.TextTransparency = alpha
            for _, child in pairs(UpdateFrame:GetChildren()) do
                if child:IsA("TextLabel") and child ~= TitleLabel then
                    child.TextTransparency = alpha
                end
            end
            task.wait(0.05)
        end
        UpdateGui:Destroy()
    end)
end)

-- ============================================
-- MARCA DE AGUA BLANCA (Esquina inferior derecha, permanente)
-- ============================================
pcall(function()
    local WatermarkGui = Instance.new("ScreenGui")
    WatermarkGui.Name = "DanielWatermark"
    WatermarkGui.ResetOnSpawn = false
    WatermarkGui.Parent = PlayerGui

    local WatermarkLabel = Instance.new("TextLabel")
    WatermarkLabel.Size = UDim2.new(0, 130, 0, 15)
    WatermarkLabel.Position = UDim2.new(1, -135, 1, -25)
    WatermarkLabel.BackgroundTransparency = 1
    WatermarkLabel.Text = "DanielSonrieScripts"
    WatermarkLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    WatermarkLabel.TextSize = 10
    WatermarkLabel.Font = Enum.Font.Gotham
    WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Right
    WatermarkLabel.Parent = WatermarkGui
end)

-- ============================================
-- ELIMINAR ÁRBOLES
-- ============================================
pcall(function()
    for _, obj in pairs(Workspace:GetDescendants()) do
        local nombre = obj.Name and string.lower(obj.Name) or ""
        if nombre:find("tree") or nombre:find("palm") or nombre:find("palmera") then
            obj:Destroy()
        end
    end
end)

-- ============================================
-- ROCAS ELIMINADAS (GRANDES Y CHICAS)
-- ============================================

local function esRoca(obj)
    local nombre = obj.Name and string.lower(obj.Name) or ""
    -- Conservar dash de Garou
    if nombre:find("garou") or nombre:find("dash") then
        return false
    end
    
    -- NO borrar personajes
    local current = obj.Parent
    while current do
        if current:FindFirstChild("Humanoid") then
            return false
        end
        current = current.Parent
    end
    
    -- Detectar rocas (ahora también las GRANDES)
    if obj:IsA("BasePart") or obj:IsA("MeshPart") then
        local tamano = obj.Size.Magnitude
        -- Aumentado el límite para atrapar piedras GRANDES (ahora hasta 25)
        if tamano < 25 and tamano > 0.5 and obj.Name ~= "Terrain" then
            return true
        end
    end
    return false
end

-- Escaneo inicial
for _, obj in pairs(Workspace:GetDescendants()) do
    pcall(function()
        if esRoca(obj) then 
            obj:Destroy()
        end
    end)
end

-- Escaneo rápido para nuevas rocas
Workspace.DescendantAdded:Connect(function(obj)
    task.wait(0.0000000001)
    pcall(function()
        if esRoca(obj) then 
            obj:Destroy()
        end
    end)
end)

-- Escaneo periódico cada 0.5 segundos para asegurar (por si acaso)
spawn(function()
    while wait(0.5) do
        pcall(function()
            for _, obj in pairs(Workspace:GetDescendants()) do
                if esRoca(obj) then
                    obj:Destroy()
                end
            end
        end)
    end
end)

-- ============================================
-- ELIMINAR EFECTOS VISUALES (PERO CONSERVAR DASH GAROU)
-- ============================================
Workspace.DescendantAdded:Connect(function(obj)
    pcall(function()
        local nombre = obj.Name and string.lower(obj.Name) or ""
        if nombre:find("garou") or nombre:find("dash") then return end
        
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") 
           or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Explosion") then
            obj:Destroy()
        end
    end)
end)

-- ============================================
-- OPTIMIZACIÓN DE GRÁFICOS
-- ============================================
pcall(function()
    Lighting.GlobalShadows = false
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") then
            effect.Enabled = false
        end
    end
end)

print("✅ ANTI-LAG ACTIVADO - DanielSonrieScripts")
print("✅ Piedras grandes y chicas eliminadas")
