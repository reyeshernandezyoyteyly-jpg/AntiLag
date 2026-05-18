-- ANTI-LAG OPTIMIZADO TSB - SIN LAG, ROCAS INSTANTÁNEAS, GAROU DASH INTACTO
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

print("⚔️ ANTI-LAG OPTIMIZADO - Sin lag adicional")

-- Limpiar GUIs viejos
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
for _, gui in pairs(PlayerGui:GetChildren()) do
    if gui.Name:find("Daniel") then gui:Destroy() end
end

-- ============================================
-- TEXTO DE BIENVENIDA (3 segundos)
-- ============================================
pcall(function()
    local WelcomeGui = Instance.new("ScreenGui")
    WelcomeGui.Name = "DanielWelcomeGui"
    WelcomeGui.ResetOnSpawn = false
    WelcomeGui.Parent = PlayerGui

    local CenterLabel = Instance.new("TextLabel")
    CenterLabel.Size = UDim2.new(0, 400, 0, 50)
    CenterLabel.Position = UDim2.new(0.5, -200, 0.4, -25)
    CenterLabel.BackgroundTransparency = 1
    CenterLabel.Text = "✨ ANTI-LAG OPTIMIZADO ✨"
    CenterLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CenterLabel.TextSize = 28
    CenterLabel.Font = Enum.Font.GothamBold
    CenterLabel.Parent = WelcomeGui

    task.wait(3)
    WelcomeGui:Destroy()
end)

-- ============================================
-- TEXTO TEMPORAL ESQUINA IZQUIERDA (8 segundos)
-- ============================================
pcall(function()
    local WarningGui = Instance.new("ScreenGui")
    WarningGui.Name = "DanielWarningGui"
    WarningGui.ResetOnSpawn = false
    WarningGui.Parent = PlayerGui

    local LeftFrame = Instance.new("Frame")
    LeftFrame.Size = UDim2.new(0, 210, 0, 95)
    LeftFrame.Position = UDim2.new(0, 10, 1, -105)
    LeftFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LeftFrame.BackgroundTransparency = 0.5
    LeftFrame.BorderSizePixel = 0
    LeftFrame.Parent = WarningGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = LeftFrame

    local FPSLabel = Instance.new("TextLabel")
    FPSLabel.Size = UDim2.new(1, -10, 0, 22)
    FPSLabel.Position = UDim2.new(0, 5, 0, 5)
    FPSLabel.BackgroundTransparency = 1
    FPSLabel.Text = "FPS BOOST ACTIVATED"
    FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    FPSLabel.TextSize = 14
    FPSLabel.Font = Enum.Font.GothamBold
    FPSLabel.TextXAlignment = Enum.TextXAlignment.Left
    FPSLabel.Parent = LeftFrame

    local GraphicLabel = Instance.new("TextLabel")
    GraphicLabel.Size = UDim2.new(1, -10, 0, 20)
    GraphicLabel.Position = UDim2.new(0, 5, 0, 30)
    GraphicLabel.BackgroundTransparency = 1
    GraphicLabel.Text = "Gráficos optimizados"
    GraphicLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    GraphicLabel.TextSize = 13
    GraphicLabel.Font = Enum.Font.Gotham
    GraphicLabel.TextXAlignment = Enum.TextXAlignment.Left
    GraphicLabel.Parent = LeftFrame

    local PhysicsLabel = Instance.new("TextLabel")
    PhysicsLabel.Size = UDim2.new(1, -10, 0, 20)
    PhysicsLabel.Position = UDim2.new(0, 5, 0, 52)
    PhysicsLabel.BackgroundTransparency = 1
    PhysicsLabel.Text = "Física sin cambios"
    PhysicsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    PhysicsLabel.TextSize = 13
    PhysicsLabel.Font = Enum.Font.Gotham
    PhysicsLabel.TextXAlignment = Enum.TextXAlignment.Left
    PhysicsLabel.Parent = LeftFrame

    local RightLabel = Instance.new("TextLabel")
    RightLabel.Size = UDim2.new(0, 180, 0, 22)
    RightLabel.Position = UDim2.new(1, -190, 1, -35)
    RightLabel.BackgroundTransparency = 1
    RightLabel.Text = "DanielSonrieScripts"
    RightLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    RightLabel.TextSize = 13
    RightLabel.Font = Enum.Font.GothamBold
    RightLabel.TextXAlignment = Enum.TextXAlignment.Right
    RightLabel.Parent = WarningGui

    task.wait(8)
    for i = 1, 10 do
        local alpha = i / 10
        LeftFrame.BackgroundTransparency = 0.5 + (alpha * 0.5)
        FPSLabel.TextTransparency = alpha
        GraphicLabel.TextTransparency = alpha
        PhysicsLabel.TextTransparency = alpha
        RightLabel.TextTransparency = alpha
        task.wait(0.05)
    end
    WarningGui:Destroy()
end)

-- ============================================
-- ANTI-LAG OPTIMIZADO (NO da lag adicional)
-- ============================================

-- Función rápida para verificar si un objeto es una roca del Down Slam
local function esRocaDelSlam(obj)
    -- Verificar que NO sea parte de un personaje
    local current = obj.Parent
    while current do
        if current:FindFirstChild("Humanoid") then
            return false
        end
        current = current.Parent
    end
    
    -- Verificar que NO sea el dash de Garou (por nombre)
    local nombre = obj.Name and string.lower(obj.Name) or ""
    if nombre:find("dash") or nombre:find("garou") then
        return false -- Conservar dash de Garou
    end
    
    -- Detectar rocas del Down Slam (tamaño pequeño)
    if obj:IsA("BasePart") or obj:IsA("MeshPart") then
        local tamano = obj.Size.Magnitude
        if tamano < 12 and tamano > 0.5 and obj.Name ~= "Terrain" then
            return true
        end
    end
    
    return false
end

-- ESCANEO INTELIGENTE: Solo cuando aparecen objetos NUEVOS (NO cada 0.2 segundos)
-- Esto ELIMINA el lag adicional que causaba el escaneo constante

-- Escaneo inicial (una sola vez)
for _, obj in pairs(Workspace:GetDescendants()) do
    pcall(function()
        if esRocaDelSlam(obj) then
            obj:Destroy()
        end
    end)
end

-- Escaneo SOLO cuando aparece algo nuevo (MUCHO más eficiente)
Workspace.DescendantAdded:Connect(function(obj)
    task.wait(0.05) -- Pequeña espera para que el objeto se termine de crear
    pcall(function()
        if esRocaDelSlam(obj) then
            obj:Destroy()
        end
    end)
end)

-- Eliminar efectos visuales (solo los que NO son importantes)
Workspace.DescendantAdded:Connect(function(obj)
    pcall(function()
        local nombre = obj.Name and string.lower(obj.Name) or ""
        
        -- Conservar dash de Garou (por si acaso)
        if nombre:find("dash") or nombre:find("garou") then
            return
        end
        
        -- Eliminar partículas y efectos molestos
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") 
           or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Explosion") then
            obj:Destroy()
        end
        
        -- Eliminar árboles
        if nombre:find("tree") or nombre:find("palm") then
            obj:Destroy()
        end
    end)
end)

-- Optimizar iluminación (solo una vez, no causa lag)
pcall(function()
    Lighting.GlobalShadows = false
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") then
            effect.Enabled = false
        end
    end
end)

print("✅ ANTI-LAG OPTIMIZADO - Sin lag adicional, dash de Garou conservado")
