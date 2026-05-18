-- ANTI-LAG DEFINITIVO TSB - ELIMINA PIEDRAS DEL DOWN SLAM
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

print("⚔️ ANTI-LAG DEFINITIVO - Modo extremo contra piedras")

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
    CenterLabel.Text = "✨ ANTI-LAG ACTIVADO ✨"
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
-- CORAZÓN DEL ANTI-LAG: ELIMINA PIEDRAS HAGA LO QUE HAGA EL JUEGO
-- ============================================

-- Función que detecta piedras por CARACTERÍSTICAS, no por nombre
local function esPiedraDelSlam(obj)
    -- Ignorar personajes completos
    local current = obj.Parent
    while current do
        if current:FindFirstChild("Humanoid") then
            return false -- Es parte de un personaje, NO borrar
        end
        current = current.Parent
    end
    
    -- Si es una parte física (MeshPart, BasePart, Part)
    if obj:IsA("BasePart") or obj:IsA("MeshPart") or obj:IsA("Part") then
        -- Características TÍPICAS de las piedras del Down Slam:
        -- 1. Tamaño pequeño (menos de 10 unidades)
        -- 2. No colisionable O colisión especial
        -- 3. No es el terreno
        -- 4. Se crean y desaparecen rápido
        
        local tamano = obj.Size.Magnitude
        if tamano < 15 and obj.Name ~= "Terrain" then
            return true
        end
    end
    
    -- También atrapar objetos con nombres sospechosos (por si acaso)
    local nombre = obj.Name and string.lower(obj.Name) or ""
    if nombre:find("rock") or nombre:find("stone") or nombre:find("debris") 
       or nombre:find("fragment") or nombre:find("slam") or nombre:find("piedra") then
        return true
    end
    
    return false
end

-- Eliminación agresiva cada 0.2 segundos (MUY RÁPIDO)
spawn(function()
    while wait(0.2) do
        pcall(function()
            for _, obj in pairs(Workspace:GetDescendants()) do
                if esPiedraDelSlam(obj) then
                    obj:Destroy()
                end
            end
        end)
    end
end)

-- También eliminar partículas y efectos visuales molestos
spawn(function()
    while wait(0.5) do
        pcall(function()
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") 
                   or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Explosion") then
                    obj:Destroy()
                end
                -- Eliminar árboles
                local nombre = obj.Name and string.lower(obj.Name) or ""
                if nombre:find("tree") or nombre:find("palm") then
                    obj:Destroy()
                end
            end
        end)
    end
end)

-- Optimizar iluminación
pcall(function()
    Lighting.GlobalShadows = false
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") then
            effect.Enabled = false
        end
    end
end)

print("✅ ANTI-LAG DEFINITIVO ACTIVADO - Piedras eliminadas cada 0.2 segundos")
