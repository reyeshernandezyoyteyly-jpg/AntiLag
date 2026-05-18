-- ANTI-LAG DEFINITIVO - CON ANIMACIONES CHIDAS - DanielSonrieScripts
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

print("⚔️ ANTI-LAG DEFINITIVO - CON ANIMACIONES CHIDAS")

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
for _, gui in pairs(PlayerGui:GetChildren()) do
    if gui.Name:find("Daniel") then gui:Destroy() end
end

-- ============================================
-- ANIMACIÓN DE ENTRADA CHIDA (CON REBOTE)
-- ============================================
pcall(function()
    local WelcomeGui = Instance.new("ScreenGui")
    WelcomeGui.Name = "DanielWelcomeGui"
    WelcomeGui.ResetOnSpawn = false
    WelcomeGui.Parent = PlayerGui

    -- Marco principal
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 400, 0, 120)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -60)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = WelcomeGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 20)
    MainCorner.Parent = MainFrame

    -- Efecto de brillo (gradiente)
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 100, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 0))
    })
    Gradient.Rotation = 45
    Gradient.Parent = MainFrame

    -- Texto principal
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.Position = UDim2.new(0, 0, 0, 15)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "🥔 MODO PATATA 🥔"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 32
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Parent = MainFrame

    -- Subtítulo
    local SubLabel = Instance.new("TextLabel")
    SubLabel.Size = UDim2.new(1, 0, 0, 25)
    SubLabel.Position = UDim2.new(0, 0, 0, 65)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Text = "Anti-Lag Optimizado | DanielSonrieScripts"
    SubLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    SubLabel.TextSize = 16
    SubLabel.Font = Enum.Font.Gotham
    SubLabel.Parent = MainFrame

    -- Animación de entrada (rebote)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
    MainFrame.BackgroundTransparency = 1
    TitleLabel.TextTransparency = 1
    SubLabel.TextTransparency = 1
    
    local entrada1 = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -200, 0.5, -60)})
    local entrada2 = TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.2})
    local entrada3 = TweenService:Create(TitleLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 0})
    local entrada4 = TweenService:Create(SubLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 0})
    
    entrada1:Play()
    task.wait(0.15)
    entrada2:Play()
    entrada3:Play()
    entrada4:Play()
    
    -- Animación de brillo (pulso)
    local pulse = TweenService:Create(Gradient, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Rotation = 405})
    pulse:Play()
    
    -- Esperar 2.5 segundos y hacer animación de salida
    task.wait(2.5)
    
    local saida1 = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -200, 0.5, 100)})
    local saida2 = TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 1})
    local saida3 = TweenService:Create(TitleLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 1})
    local saida4 = TweenService:Create(SubLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 1})
    
    saida1:Play()
    saida2:Play()
    saida3:Play()
    saida4:Play()
    
    task.wait(0.4)
    WelcomeGui:Destroy()
end)

-- ============================================
-- CONTADOR DE FPS (ESQUINA SUPERIOR IZQUIERDA)
-- ============================================
pcall(function()
    local FpsGui = Instance.new("ScreenGui")
    FpsGui.Name = "DanielFpsGui"
    FpsGui.ResetOnSpawn = false
    FpsGui.Parent = PlayerGui

    local FpsFrame = Instance.new("Frame")
    FpsFrame.Size = UDim2.new(0, 70, 0, 25)
    FpsFrame.Position = UDim2.new(0, 10, 0, 10)
    FpsFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    FpsFrame.BackgroundTransparency = 0.5
    FpsFrame.BorderSizePixel = 0
    FpsFrame.Parent = FpsGui

    local FpsCorner = Instance.new("UICorner")
    FpsCorner.CornerRadius = UDim.new(0, 5)
    FpsCorner.Parent = FpsFrame

    local FpsLabel = Instance.new("TextLabel")
    FpsLabel.Size = UDim2.new(1, 0, 1, 0)
    FpsLabel.BackgroundTransparency = 1
    FpsLabel.Text = "FPS: --"
    FpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    FpsLabel.TextSize = 14
    FpsLabel.Font = Enum.Font.GothamBold
    FpsLabel.TextXAlignment = Enum.TextXAlignment.Center
    FpsLabel.Parent = FpsFrame

    local lastTime = tick()
    local frameCount = 0

    RunService.RenderStepped:Connect(function()
        frameCount = frameCount + 1
        local currentTime = tick()
        if currentTime - lastTime >= 1 then
            local fps = frameCount
            frameCount = 0
            lastTime = currentTime
            if fps >= 50 then
                FpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            elseif fps >= 30 then
                FpsLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            else
                FpsLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
            FpsLabel.Text = "FPS: " .. fps
        end
    end)
end)

-- ============================================
-- PANEL DE ACTUALIZACIONES (CON ANIMACIÓN)
-- ============================================
pcall(function()
    local UpdateGui = Instance.new("ScreenGui")
    UpdateGui.Name = "DanielUpdateGui"
    UpdateGui.ResetOnSpawn = false
    UpdateGui.Parent = PlayerGui

    local UpdateFrame = Instance.new("Frame")
    UpdateFrame.Size = UDim2.new(0, 170, 0, 95)
    UpdateFrame.Position = UDim2.new(0, -180, 1, -105)
    UpdateFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    UpdateFrame.BackgroundTransparency = 0.6
    UpdateFrame.BorderSizePixel = 0
    UpdateFrame.Parent = UpdateGui

    local UpdateCorner = Instance.new("UICorner")
    UpdateCorner.CornerRadius = UDim.new(0, 8)
    UpdateCorner.Parent = UpdateFrame

    -- Animación de entrada deslizando desde la izquierda
    local entradaAnim = TweenService:Create(UpdateFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0, 10, 1, -105)})
    entradaAnim:Play()

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

    -- Animación de salida después de 8 segundos
    task.spawn(function()
        task.wait(8)
        local saidaAnim = TweenService:Create(UpdateFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0, -180, 1, -105)})
        saidaAnim:Play()
        task.wait(0.3)
        UpdateGui:Destroy()
    end)
end)

-- ============================================
-- MARCA DE AGUA (CON ANIMACIÓN DE PARPADEO)
-- ============================================
pcall(function()
    local WatermarkGui = Instance.new("ScreenGui")
    WatermarkGui.Name = "DanielWatermark"
    WatermarkGui.ResetOnSpawn = false
    WatermarkGui.Parent = PlayerGui

    local WatermarkLabel = Instance.new("TextLabel")
    WatermarkLabel.Size = UDim2.new(0, 140, 0, 18)
    WatermarkLabel.Position = UDim2.new(1, -150, 1, -30)
    WatermarkLabel.BackgroundTransparency = 1
    WatermarkLabel.Text = "DanielSonrieScripts"
    WatermarkLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    WatermarkLabel.TextSize = 10
    WatermarkLabel.Font = Enum.Font.Gotham
    WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Right
    WatermarkLabel.TextTransparency = 0.3
    WatermarkLabel.Parent = WatermarkGui
    
    -- Animación de parpadeo suave
    local parpadeo = TweenService:Create(WatermarkLabel, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {TextTransparency = 0.6})
    parpadeo:Play()
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
-- PROTECCIÓN DE DUMMY
-- ============================================
local function esDummy(obj)
    local current = obj.Parent
    while current do
        if current:FindFirstChild("Humanoid") then
            return true
        end
        local nombre = current.Name and string.lower(current.Name) or ""
        if nombre:find("dummy") or nombre:find("training") or nombre:find("target") or nombre:find("weakest") then
            return true
        end
        current = current.Parent
    end
    return false
end

-- ============================================
-- ELIMINAR ROCAS
-- ============================================
local function esRoca(obj)
    if esDummy(obj) then return false end
    
    local nombre = obj.Name and string.lower(obj.Name) or ""
    
    if nombre:find("garou") or nombre:find("dash") then
        return false
    end
    
    if obj:IsA("BasePart") or obj:IsA("MeshPart") then
        if obj.Name == "Terrain" then return false end
        
        if nombre:find("rock") or nombre:find("stone") or nombre:find("piedra") 
           or nombre:find("roca") or nombre:find("debris") or nombre:find("fragment")
           or nombre:find("slam") or nombre:find("down") then
            return true
        end
        
        local tamano = obj.Size.Magnitude
        if tamano < 50 and tamano > 0.5 then
            return true
        end
    end
    return false
end

for _, obj in pairs(Workspace:GetDescendants()) do
    pcall(function()
        if esRoca(obj) then obj:Destroy() end
    end)
end

Workspace.DescendantAdded:Connect(function(obj)
    task.wait(0.0000000001)
    pcall(function()
        if esRoca(obj) then obj:Destroy() end
    end)
end)

-- ============================================
-- ELIMINAR EFECTOS
-- ============================================
Workspace.DescendantAdded:Connect(function(obj)
    pcall(function()
        if esDummy(obj) then return end
        
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

print("✅ ANTI-LAG DEFINITIVO CON ANIMACIONES CHIDAS - DanielSonrieScripts")
