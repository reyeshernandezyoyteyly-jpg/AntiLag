-- DanielScript Ultimate Anti-Lag | TSB Bypasser Edition
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

print("⚔️ TSB Anti-Lag Definitivo (UI Corregida) por DanielSonrie")

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
if PlayerGui:FindFirstChild("DanielWelcomeGui") then PlayerGui.DanielWelcomeGui:Destroy() end
if PlayerGui:FindFirstChild("DanielToastGui") then PlayerGui.DanielToastGui:Destroy() end

-- 1. TEXTO DE BIENVENIDA AL CENTRO MEJORADO (Efecto Neon/Fade y desaparece en 3s)
pcall(function()
    local WelcomeGui = Instance.new("ScreenGui")
    WelcomeGui.Name = "DanielWelcomeGui"
    WelcomeGui.ResetOnSpawn = false
    WelcomeGui.DisplayOrder = 99999
    WelcomeGui.Parent = PlayerGui

    local CenterLabel = Instance.new("TextLabel")
    CenterLabel.Size = UDim2.new(0, 500, 0, 60)
    CenterLabel.Position = UDim2.new(0.5, -250, 0.35, -30)
    CenterLabel.BackgroundTransparency = 1
    CenterLabel.Text = "✨ Creado por DanielSonrie ✨"
    CenterLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CenterLabel.TextSize = 32
    CenterLabel.Font = Enum.Font.GothamBold
    CenterLabel.TextStrokeTransparency = 0.2
    CenterLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    CenterLabel.Parent = WelcomeGui

    -- Efecto de parpadeo suave mientras está activo
    local looping = true
    task.spawn(function()
        while looping do
            pcall(function()
                TweenService:Create(CenterLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
                task.wait(0.5)
                TweenService:Create(CenterLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                task.wait(0.5)
            end)
        end
    end)

    -- Esperar 3 segundos y desvanecer por completo
    task.spawn(function()
        task.wait(3)
        looping = false
        local t = TweenService:Create(CenterLabel, TweenInfo.new(0.5), {TextTransparency = 1, TextStrokeTransparency = 1})
        t:Play() 
        t.Completed:Connect(function() WelcomeGui:Destroy() end)
    end)
end)

-- 2. CARTEL CORREGIDO: AHORA SÍ EN LA ESQUINA (Libre del botón de saltar)
pcall(function()
    local ToastGui = Instance.new("ScreenGui")
    ToastGui.Name = "DanielToastGui"
    ToastGui.ResetOnSpawn = false
    ToastGui.DisplayOrder = 99998
    ToastGui.Parent = PlayerGui
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 170, 0, 45)
    -- Lo acomodamos abajo a la derecha, pero lo metemos un poquito a la izquierda (-225) 
    -- y arriba (-95) para que quede justo al lado del botón de saltar sin pisarlo.
    MainFrame.Position = UDim2.new(1, -225, 1, -95) 
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

    -- Desaparece en 6 segundos
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

-- 3. BYPASS ANTI-LAG (Ocultar Palmeras y esquivar físicas de Rocas del Servidor)
local function BypassServerRocks(obj)
    if string.find(string.lower(obj.Name), "dash") or string.find(string.lower(obj.Name), "blue") then return end

    -- Eliminar Palmeras
    if string.find(string.lower(obj.Name), "tree") or string.find(string.lower(obj.Name), "palm") or string.find(string.lower(obj.Name), "palmera") then
        obj:Destroy()
        return
    end

    -- Encoger e invisibilizar rocas de golpes del Servidor
    if obj:IsA("BasePart") then
        local parentName = obj.Parent and obj.Parent.Name or ""
        if parentName == "VisualEffects" or string.find(string.lower(parentName), "fx") or parentName == "Debris" or string.find(string.lower(obj.Name), "rock") or string.find(string.lower(obj.Name), "debris") then
            if obj.Name ~= "Terrain" and obj.Size.Y < 30 then
                pcall(function()
                    obj.Transparency = 1
                    obj.Size = Vector3.new(0, 0, 0)
                    obj.Position = Vector3.new(0, -999, 0)
                    obj.CanCollide = false
                end)
            end
        end
    end

    -- Modo Papa
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
        if not obj:IsDescendantOf(LocalPlayer.Character) then obj.Enabled = false end
    elseif obj:IsA("Texture") or obj:IsA("Decal") then
        obj:Destroy()
    end
end

pcall(function()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e6
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") then effect.Enabled = false end
    end
end)

for _, child in pairs(Workspace:GetDescendants()) do pcall(BypassServerRocks, child) end
Workspace.DescendantAdded:Connect(function(descendant) pcall(BypassServerRocks, descendant) end)
