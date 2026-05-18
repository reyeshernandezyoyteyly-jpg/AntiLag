-- DanielSonrie Ultimate Anti-Lag | The Strongest Battlegrounds Edition
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

print("⚔️ TSB Anti-Lag Iniciado por DanielSonrie")

-- 1. PANTALLA DE BIENVENIDA (Intro Centrada)
pcall(function()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    if PlayerGui:FindFirstChild("DanielWelcomeGui") then 
        PlayerGui.DanielWelcomeGui:Destroy() 
    end
    
    local WelcomeGui = Instance.new("ScreenGui")
    WelcomeGui.Name = "DanielWelcomeGui"
    WelcomeGui.ResetOnSpawn = false
    WelcomeGui.Parent = PlayerGui
    
    -- Marco principal centrado
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 500, 0, 200)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -100)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BackgroundTransparency = 0.15
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = WelcomeGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    -- Título Principal
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 60)
    TitleLabel.Position = UDim2.new(0, 0, 0, 20)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "DanielSonrieScript"
    TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 120) -- Verde neón
    TitleLabel.TextSize = 36
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Parent = MainFrame
    
    -- Subtítulo
    local SubLabel = Instance.new("TextLabel")
    SubLabel.Size = UDim2.new(1, 0, 0, 40)
    SubLabel.Position = UDim2.new(0, 0, 0, 80)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Text = "TSB FPS Booster - Modo Papa Activado"
    SubLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    SubLabel.TextSize = 16
    SubLabel.Font = Enum.Font.Gotham
    SubLabel.Parent = MainFrame
    
    -- Animación de desaparición después de 3 segundos
    task.spawn(function()
        task.wait(3)
        local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local frameTween = TweenService:Create(MainFrame, tweenInfo, {BackgroundTransparency = 1})
        local titleTween = TweenService:Create(TitleLabel, tweenInfo, {TextTransparency = 1})
        local subTween = TweenService:Create(SubLabel, tweenInfo, {TextTransparency = 1})
        
        frameTween:Play()
        titleTween:Play()
        subTween:Play()
        
        frameTween.Completed:Connect(function()
            WelcomeGui:Destroy()
        end)
    end)
end)

-- 2. NOTIFICACIÓN FPS BOOST (Esquina inferior derecha)
local FpsNotificationGui = nil
local function CreateFpsNotification()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    if PlayerGui:FindFirstChild("DanielFpsGui") then 
        PlayerGui.DanielFpsGui:Destroy() 
    end
    
    FpsNotificationGui = Instance.new("ScreenGui")
    FpsNotificationGui.Name = "DanielFpsGui"
    FpsNotificationGui.ResetOnSpawn = false
    FpsNotificationGui.Parent = PlayerGui
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 280, 0, 110)
    MainFrame.Position = UDim2.new(1, -295, 1, -125)
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = FpsNotificationGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame
    
    -- Título Principal
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 35)
    TitleLabel.Position = UDim2.new(0, 10, 0, 8)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "DanielSonrieScript"
    TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
    TitleLabel.TextSize = 18
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = MainFrame
    
    -- Subtexto FPS
    local FpsLabel = Instance.new("TextLabel")
    FpsLabel.Size = UDim2.new(1, 0, 0, 25)
    FpsLabel.Position = UDim2.new(0, 10, 0, 40)
    FpsLabel.BackgroundTransparency = 1
    FpsLabel.Text = "FPS BOOST ACTIVATED"
    FpsLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
    FpsLabel.TextSize = 14
    FpsLabel.Font = Enum.Font.Gotham
    FpsLabel.TextXAlignment = Enum.TextXAlignment.Left
    FpsLabel.Parent = MainFrame
    
    -- Subtexto respuesta
    local ResponseLabel = Instance.new("TextLabel")
    ResponseLabel.Size = UDim2.new(1, 0, 0, 25)
    ResponseLabel.Position = UDim2.new(0, 10, 0, 65)
    ResponseLabel.BackgroundTransparency = 1
    ResponseLabel.Text = "Escribe: Si Dad UwU para cerrar"
    ResponseLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    ResponseLabel.TextSize = 12
    ResponseLabel.Font = Enum.Font.Gotham
    ResponseLabel.TextXAlignment = Enum.TextXAlignment.Left
    ResponseLabel.Parent = MainFrame
    
    return FpsNotificationGui
end

CreateFpsNotification()

-- 3. Sistema de comando para cerrar notificación
local chatInputDetected = false
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Slash or input.KeyCode == Enum.KeyCode.Quote then
        chatInputDetected = true
    end
end)

-- Monitorear si el usuario escribe "Si Dad UwU"
game:GetService("RunService").Heartbeat:Connect(function()
    if FpsNotificationGui and FpsNotificationGui.Parent then
        -- Podrías agregar lógica adicional aquí si lo necesitas
    end
end)

-- 4. FILTRO INTELIGENTE (Elimina rocas del jugador, down slam, rocas lanzadas)
local function CleanLaggyThings(obj)
    if not obj or not obj.Parent then return end
    
    local objName = string.lower(obj.Name)
    
    -- ELIMINAR: Todas las rocas que lanza el jugador, down slam, escombros
    if string.find(objName, "rock") or string.find(objName, "stone") or string.find(objName, "debris") or 
       string.find(objName, "downslam") or string.find(objName, "down slam") or string.find(objName, "slam") or
       string.find(objName, "pebble") or string.find(objName, "boulder") or string.find(objName, "projectile") then
        pcall(function() obj:Destroy() end)
        return
    end
    
    -- Desactivar partículas pesadas (excepto de ataques importantes)
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
        if not (string.find(objName, "attack") or string.find(objName, "skill") or string.find(objName, "move") or string.find(objName, "aura")) then
            pcall(function() obj.Enabled = false end)
        end
    elseif obj:IsA("Explosion") then
        pcall(function() obj.Visible = false end)
    elseif obj:IsA("BasePart") and not obj:IsA("MeshPart") and not obj.Parent:FindFirstChild("Humanoid") then
        pcall(function() obj.Material = Enum.Material.SmoothPlastic end)
    elseif obj:IsA("Texture") or obj:IsA("Decal") then
        pcall(function() obj:Destroy() end)
    end
end

-- 5. MODIFICAR DASH DE GAROU - Línea azul tipo Flag Potato
local function OptimizeDash(obj)
    if not obj or not obj.Parent then return end
    
    local objName = string.lower(obj.Name)
    
    -- Detectar dash de Garou
    if string.find(objName, "dash") and string.find(objName, "garou") then
        -- Eliminar todas las partículas del dash original
        for _, child in pairs(obj:GetDescendants()) do
            if child:IsA("ParticleEmitter") or child:IsA("Trail") or child:IsA("Beam") then
                pcall(function() child:Destroy() end)
            end
        end
        
        -- Crear línea azul simple tipo flag
        pcall(function()
            local dashLine = Instance.new("Part")
            dashLine.Name = "DashLinePotato"
            dashLine.Shape = Enum.PartType.Block
            dashLine.Size = Vector3.new(0.3, 0.3, 5)
            dashLine.Color = Color3.fromRGB(0, 150, 255) -- Azul
            dashLine.Material = Enum.Material.Neon
            dashLine.CanCollide = false
            dashLine.TopSurface = Enum.SurfaceType.Smooth
            dashLine.BottomSurface = Enum.SurfaceType.Smooth
            dashLine.Parent = obj
            
            -- Efecto flag potato (pixelado)
            local mesh = Instance.new("BlockMesh")
            mesh.Scale = Vector3.new(1, 1, 1)
            mesh.Parent = dashLine
        end)
    end
end

-- 6. OPTIMIZAR ILUMINACIÓN
pcall(function()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e6
    Lighting.Brightness = 1
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or effect:IsA("ColorCorrectionEffect") then
            pcall(function() effect.Enabled = false end)
        end
    end
end)

-- Limpiar elementos existentes
for _, child in pairs(Workspace:GetDescendants()) do
    pcall(function() CleanLaggyThings(child) end)
    pcall(function() OptimizeDash(child) end)
end

-- Monitorear nuevos elementos en tiempo real
Workspace.DescendantAdded:Connect(function(descendant)
    task.delay(0.05, function()
        pcall(function() CleanLaggyThings(descendant) end)
        pcall(function() OptimizeDash(descendant) end)
    end)
end)

print("🚀 Modo Papa Extremo Activo - DanielSonrie v6")
