-- ANTI-LAG DEFINITIVO - CON PROTECCIÓN DE DUMMY - DanielSonrieScripts
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

print("⚔️ ANTI-LAG - CON DUMMY PROTEGIDO - DanielSonrieScripts")

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
for _, gui in pairs(PlayerGui:GetChildren()) do
    if gui.Name:find("Daniel") then gui:Destroy() end
end

-- ============================================
-- INTRODUCCIÓN (3 segundos)
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
-- PANEL DE ACTUALIZACIONES
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
-- MARCA DE AGUA
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
-- PROTECCIÓN DE DUMMY Y PERSONAJES
-- ============================================

local function esParteDePersonaje(obj)
    local current = obj.Parent
    while current do
        -- Detectar Humanoid (personajes, dummies, jugadores)
        if current:FindFirstChild("Humanoid") then
            return true
        end
        -- También proteger cualquier modelo que sea dummy por nombre
        local nombre = current.Name and string.lower(current.Name) or ""
        if nombre:find("dummy") or nombre:find("training") or nombre:find("target") then
            return true
        end
        current = current.Parent
    end
    return false
end

-- ============================================
-- DETECCIÓN DE PIEDRAS (SIN BORRAR DUMMY)
-- ============================================

local function esRoca(obj)
    -- 🛡️ PROTECCIÓN: Si es parte de un personaje o dummy, NO borrar
    if esParteDePersonaje(obj) then
        return false
    end
    
    local nombre = obj.Name and string.lower(obj.Name) or ""
    
    -- Conservar dash de Garou
    if nombre:find("garou") or nombre:find("dash") then
        return false
    end
    
    -- Detectar rocas
    if obj:IsA("BasePart") or obj:IsA("MeshPart") then
        -- Excluir terreno y baseplate
        if obj.Name == "Terrain" then return false end
        if obj.Name == "Baseplate" then return false end
        
        -- Detectar por nombre de piedra
        if nombre:find("rock") or nombre:find("stone") or nombre:find("piedra") 
           or nombre:find("roca") or nombre:find("debris") or nombre:find("fragment")
           or nombre:find("slam") or nombre:find("down") then
            return true
        end
        
        -- Detectar por tamaño (pero limitado para no borrar el dummy)
        local tamano = obj.Size.Magnitude
        -- El dummy tiene partes de tamaño ~2-5, pero las protegimos arriba
        if tamano < 15 and tamano > 0.5 then
            -- Verificar que no sea parte del entorno
            local parent = obj.Parent
            while parent do
                if parent.Name == "Map" or parent.Name == "Terrain" then
                    return false
                end
                parent = parent.Parent
            end
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

-- Escaneo SOLO cuando aparecen objetos nuevos
Workspace.DescendantAdded:Connect(function(obj)
    task.wait(0.0000000001)
    pcall(function()
        if esRoca(obj) then 
            obj:Destroy()
        end
    end)
end)

-- ============================================
-- ELIMINAR EFECTOS (SIN BORRAR DUMMY)
-- ============================================
Workspace.DescendantAdded:Connect(function(obj)
    pcall(function()
        -- Proteger dummy
        if esParteDePersonaje(obj) then return end
        
        local nombre = obj.Name and string.lower(obj.Name) or ""
        if nombre:find("garou") or nombre:find("dash") then return end
        
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") 
           or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Explosion") then
            obj:Destroy()
        end
    end)
end)

-- ============================================
-- OPTIMIZACIÓN
-- ============================================
pcall(function()
    Lighting.GlobalShadows = false
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") then
            effect.Enabled = false
        end
    end
end)

print("✅ ANTI-LAG CON DUMMY PROTEGIDO - DanielSonrieScripts")
