-- DANIEL SCRIPT - ANTI LAG CONTROLADO (No borra jugadores)
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

print("⚔️ TSB Anti-Lag Activado - Modo Seguro")

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
if PlayerGui:FindFirstChild("DanielWelcomeGui") then PlayerGui.DanielWelcomeGui:Destroy() end
if PlayerGui:FindFirstChild("DanielToastGui") then PlayerGui.DanielToastGui:Destroy() end
if PlayerGui:FindFirstChild("DanielStatusGui") then PlayerGui.DanielStatusGui:Destroy() end

-- ============================================
-- 1. TEXTO DE BIENVENIDA (Original, 3 segundos)
-- ============================================
pcall(function()
    local WelcomeGui = Instance.new("ScreenGui")
    WelcomeGui.Name = "DanielWelcomeGui"
    WelcomeGui.ResetOnSpawn = false
    WelcomeGui.DisplayOrder = 99999
    WelcomeGui.Parent = PlayerGui

    local CenterFrame = Instance.new("Frame")
    CenterFrame.Size = UDim2.new(0, 500, 0, 100)
    CenterFrame.Position = UDim2.new(0.5, -250, 0.35, -50)
    CenterFrame.BackgroundTransparency = 1
    CenterFrame.Parent = WelcomeGui

    local CenterLabel = Instance.new("TextLabel")
    CenterLabel.Size = UDim2.new(1, 0, 0, 40)
    CenterLabel.Position = UDim2.new(0, 0, 0, 0)
    CenterLabel.BackgroundTransparency = 1
    CenterLabel.Text = "✨ Creado por DanielSonrie ✨"
    CenterLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CenterLabel.TextSize = 32
    CenterLabel.Font = Enum.Font.GothamBold
    CenterLabel.TextStrokeTransparency = 0.2
    CenterLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    CenterLabel.Parent = CenterFrame

    local SubCenterLabel = Instance.new("TextLabel")
    SubCenterLabel.Size = UDim2.new(1, 0, 0, 30)
    SubCenterLabel.Position = UDim2.new(0, 0, 0, 45)
    SubCenterLabel.BackgroundTransparency = 1
    SubCenterLabel.Text = "este script es fase beta"
    SubCenterLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    SubCenterLabel.TextSize = 18
    SubCenterLabel.Font = Enum.Font.Gotham
    SubCenterLabel.TextStrokeTransparency = 0.3
    SubCenterLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    SubCenterLabel.Parent = CenterFrame

    local looping = true
    task.spawn(function()
        while looping do
            pcall(function()
                TweenService:Create(CenterLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
                TweenService:Create(SubCenterLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(180, 180, 180)}):Play()
                task.wait(0.5)
                TweenService:Create(CenterLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                TweenService:Create(SubCenterLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(220, 220, 220)}):Play()
                task.wait(0.5)
            end)
        end
    end)

    task.spawn(function()
        task.wait(3)
        looping = false
        local t1 = TweenService:Create(CenterLabel, TweenInfo.new(0.5), {TextTransparency = 1, TextStrokeTransparency = 1})
        local t2 = TweenService:Create(SubCenterLabel, TweenInfo.new(0.5), {TextTransparency = 1, TextStrokeTransparency = 1})
        t1:Play() t2:Play()
        t1.Completed:Connect(function() WelcomeGui:Destroy() end)
    end)
end)

-- ============================================
-- 2. CARTEL TEMPORAL EN ESQUINA (Original, 6 segundos)
-- ============================================
pcall(function()
    local ToastGui = Instance.new("ScreenGui")
    ToastGui.Name = "DanielToastGui"
    ToastGui.ResetOnSpawn = false
    ToastGui.DisplayOrder = 99998
    ToastGui.Parent = PlayerGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 170, 0, 45)
    MainFrame.Position = UDim2.new(1, -185, 1, -60) 
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    MainFrame.BackgroundTransparency = 0.25
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ToastGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -15, 0, 18)
    TitleLabel.Position = UDim2.new(0, 0, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "Script Made by Daniel"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 12
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Right
    TitleLabel.Parent = MainFrame

    local SubLabel = Instance.new("TextLabel")
    SubLabel.Size = UDim2.new(1, -15, 0, 15)
    SubLabel.Position = UDim2.new(0, 0, 0, 22)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Text = "Script modificado por Daniel"
    SubLabel.TextColor3 = Color3.fromRGB(170, 170, 170)
    SubLabel.TextSize = 10
    SubLabel.Font = Enum.Font.Gotham
    SubLabel.TextXAlignment = Enum.TextXAlignment.Right
    SubLabel.Parent = MainFrame

    task.spawn(function()
        task.wait(6)
        local ti = TweenInfo.new(0.5)
        TweenService:Create(MainFrame, ti, {BackgroundTransparency = 1}):Play()
        TweenService:Create(TitleLabel, ti, {TextTransparency = 1}):Play()
        local ts = TweenService:Create(SubLabel, ti, {TextTransparency = 1})
        ts:Play() 
        ts.Completed:Connect(function() ToastGui:Destroy() end)
    end)
end)

-- ============================================
-- 3. ADVERTENCIAS NO PERMANENTES (8 segundos y desaparecen)
-- ============================================
pcall(function()
    local WarningGui = Instance.new("ScreenGui")
    WarningGui.Name = "DanielWarningGui"
    WarningGui.ResetOnSpawn = false
    WarningGui.DisplayOrder = 99997
    WarningGui.Parent = PlayerGui

    -- Marco en esquina inferior izquierda
    local LeftFrame = Instance.new("Frame")
    LeftFrame.Size = UDim2.new(0, 200, 0, 95)
    LeftFrame.Position = UDim2.new(0, 10, 1, -105)
    LeftFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LeftFrame.BackgroundTransparency = 0.5
    LeftFrame.BorderSizePixel = 0
    LeftFrame.Parent = WarningGui

    local LeftCorner = Instance.new("UICorner")
    LeftCorner.CornerRadius = UDim.new(0, 8)
    LeftCorner.Parent = LeftFrame

    -- Texto "FPS BOOST ACTIVATED" (Verde)
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

    -- Texto "Gráficos optimizados" (ya no ruso)
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

    -- Texto "Física sin cambios"
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

    -- Texto "Modo serio activado" (nuevo, como en tu imagen)
    local SeriousLabel = Instance.new("TextLabel")
    SeriousLabel.Size = UDim2.new(1, -10, 0, 20)
    SeriousLabel.Position = UDim2.new(0, 5, 0, 74)
    SeriousLabel.BackgroundTransparency = 1
    SeriousLabel.Text = "Modo serio activado"
    SeriousLabel.TextColor3 = Color3.fromRGB(255, 170, 0)
    SeriousLabel.TextSize = 13
    SeriousLabel.Font = Enum.Font.GothamBold
    SeriousLabel.TextXAlignment = Enum.TextXAlignment.Left
    SeriousLabel.Parent = LeftFrame

    -- Texto "DanielloScript" en esquina inferior derecha
    local RightLabel = Instance.new("TextLabel")
    RightLabel.Size = UDim2.new(0, 150, 0, 20)
    RightLabel.Position = UDim2.new(1, -160, 1, -30)
    RightLabel.BackgroundTransparency = 1
    RightLabel.Text = "DanielloScript"
    RightLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    RightLabel.TextSize = 12
    RightLabel.Font = Enum.Font.GothamBold
    RightLabel.TextXAlignment = Enum.TextXAlignment.Right
    RightLabel.TextTransparency = 0.3
    RightLabel.Parent = WarningGui

    -- HACER QUE DESAPAREZCA TODO DESPUÉS DE 8 SEGUNDOS
    task.spawn(function()
        task.wait(8)
        local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local fadeOut = {BackgroundTransparency = 1}
        local textFade = {TextTransparency = 1}
        
        TweenService:Create(LeftFrame, tweenInfo, fadeOut):Play()
        TweenService:Create(FPSLabel, tweenInfo, textFade):Play()
        TweenService:Create(GraphicLabel, tweenInfo, textFade):Play()
        TweenService:Create(PhysicsLabel, tweenInfo, textFade):Play()
        TweenService:Create(SeriousLabel, tweenInfo, textFade):Play()
        TweenService:Create(RightLabel, tweenInfo, textFade):Play()
        
        task.wait(1)
        WarningGui:Destroy()
    end)
end)

-- ============================================
-- 4. FILTRO ANTI-LAG (NO borra jugadores)
-- ============================================
local function CleanMapOnly(obj)
    -- 🔴 IMPORTANTE: NUNCA borrar personajes
    if obj:IsDescendantOf(Workspace) then
        local model = obj:FindFirstAncestorOfClass("Model")
        if model and (model:FindFirstChild("Humanoid") or Players:GetPlayerFromCharacter(model)) then
            return  -- No tocar personajes
        end
    end

    local name = obj.Name and string.lower(obj.Name) or ""
    local parentName = obj.Parent and string.lower(obj.Parent.Name) or ""

    -- Piedras del Down Slam
    if string.find(name, "slam") or string.find(name, "down") or string.find(name, "piedra") 
       or string.find(name, "rock") or string.find(name, "stone") or string.find(name, "debris") 
       or string.find(name, "fragment") or string.find(parentName, "slam") then
        obj:Destroy()
        return
    end
    
    -- Efectos visuales (pero NO auras de personajes)
    if string.find(name, "effect") or string.find(name, "tornado") or string.find(name, "whirlwind") 
       or string.find(name, "slash") or string.find(name, "hit") or string.find(name, "explosion") 
       or string.find(name, "blast") or string.find(parentName, "visualeffects") then
        obj:Destroy()
        return
    end

    -- Árboles del mapa
    if string.find(name, "tree") or string.find(name, "palm") or string.find(name, "palmera") then
        obj:Destroy()
        return
    end

    -- Partículas y efectos visuales
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") 
       or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Explosion") then
        obj:Destroy()
        return
    end
end

-- Escaneo inicial y en vivo
for _, child in pairs(Workspace:GetDescendants()) do 
    pcall(CleanMapOnly, child) 
end

Workspace.DescendantAdded:Connect(function(descendant) 
    pcall(CleanMapOnly, descendant) 
end)

-- ============================================
-- 5. ILUMINACIÓN LIMPIA
-- ============================================
pcall(function()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e6
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") then 
            effect.Enabled = false 
        end
    end
end)

print("✅ Anti-Lag activado - Personajes visibles - Advertencias temporales")
