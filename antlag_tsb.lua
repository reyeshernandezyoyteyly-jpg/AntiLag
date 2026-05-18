-- DanielSonrie Ultimate Anti-Lag | The Strongest Battlegrounds Edition
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

print("⚔️ TSB Anti-Lag Iniciado por DanielSonrie")

-- 1. INTERFAZ: INTRO CENTRADA Y MARCA DE AGUA ABAJO A LA DERECHA
pcall(function()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    -- Limpiar GUIs viejas si existen
    if PlayerGui:FindFirstChild("DanielIntroGui") then PlayerGui.DanielIntroGui:Destroy() end
    if PlayerGui:FindFirstChild("DanielWatermarkGui") then PlayerGui.DanielWatermarkGui:Destroy() end
    
    -- --- [ INTRO DEL CENTRO QUE DESAPARECE ] ---
    local IntroGui = Instance.new("ScreenGui")
    IntroGui.Name = "DanielIntroGui"
    IntroGui.ResetOnSpawn = false
    IntroGui.Parent = PlayerGui
    
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 480, 0, 160)
    Frame.Position = UDim2.new(0.5, -240, 0.5, -80)
    Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Frame.BackgroundTransparency = 0.2
    Frame.BorderSizePixel = 0
    Frame.Parent = IntroGui
    
    local UICorner1 = Instance.new("UICorner")
    UICorner1.CornerRadius = UDim.new(0, 15)
    UICorner1.Parent = Frame
    
    local TextIntro = Instance.new("TextLabel")
    TextIntro.Size = UDim2.new(1, 0, 1, 0)
    TextIntro.BackgroundTransparency = 1
    TextIntro.Text = "DanielSonrieScripts"
    TextIntro.TextColor3 = Color3.fromRGB(0, 255, 120) -- Verde neón
    TextIntro.TextSize = 32
    TextIntro.Font = Enum.Font.GothamBold
    TextIntro.Parent = Frame
    
    -- --- [ TEXTO FIJO ABAJO A LA DERECHA ] ---
    local WatermarkGui = Instance.new("ScreenGui")
    WatermarkGui.Name = "DanielWatermarkGui"
    WatermarkGui.ResetOnSpawn = false
    WatermarkGui.Parent = PlayerGui
    
    local TextWatermark = Instance.new("TextLabel")
    -- Posición en la esquina inferior derecha (con espacio para que no tape botones de salto/ataque)
    TextWatermark.Size = UDim2.new(0, 200, 0, 30)
    TextWatermark.Position = UDim2.new(1, -215, 1, -45) 
    TextWatermark.BackgroundTransparency = 1
    TextWatermark.Text = "DanielSonrieScript"
    TextWatermark.TextColor3 = Color3.fromRGB(0, 255, 120) -- Verde neón combinando
    TextWatermark.TextSize = 16
    TextWatermark.Font = Enum.Font.GothamBold
    TextWatermark.TextXAlignment = Enum.TextXAlignment.Right -- Alineado a la derecha
    TextWatermark.Parent = WatermarkGui
    
    -- Animación para desaparecer la intro del centro sola
    task.spawn(function()
        task.wait(4)
        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local frameTween = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 1})
        local textTween = TweenService:Create(TextIntro, tweenInfo, {TextTransparency = 1})
        
        frameTween:Play()
        textTween:Play()
        
        frameTween.Completed:Connect(function()
            IntroGui:Destroy()
        end)
    end)
end)

-- 2. ANTI-LAG INVISIBLE DE FONDO
pcall(function()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e6
    Lighting.Brightness = 1
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("SunRaysEffect") then
            effect.Enabled = false
        end
    end
end)

-- 3. MODO PAPA EN TIEMPO REAL (Para la actualización)
local function CleanLaggyThings(obj)
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") then
        obj.Enabled = false
    elseif obj:IsA("Explosion") then
        obj.Visible = false
    elseif obj:IsA("Debris") or (obj:IsA("BasePart") and obj.Name == "Debris") then
        obj:Destroy()
    elseif obj:IsA("Texture") or obj:IsA("Decal") then
        obj:Destroy()
    end
end

-- Limpiar lo actual
for _, child in pairs(Workspace:GetDescendants()) do
    pcall(CleanLaggyThings, child)
end

-- Monitorear nuevos efectos en tiempo real
Workspace.DescendantAdded:Connect(function(descendant)
    pcall(CleanLaggyThings, descendant)
end)

print("🚀 Modo Papa Extremo Activo - FPS Booster v2")