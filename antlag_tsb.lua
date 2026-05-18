-- DanielScript Ultimate Anti-Lag | TSB Hybrid Core V2
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

print("⚔️ TSB Hybrid V2 (Anti Down-Slam Absoluto) por DanielSonrie")

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
if PlayerGui:FindFirstChild("DanielWelcomeGui") then PlayerGui.DanielWelcomeGui:Destroy() end
if PlayerGui:FindFirstChild("DanielToastGui") then PlayerGui.DanielToastGui:Destroy() end

-- 1. TEXTO DE BIENVENIDA AL CENTRO CON SUBTÍTULO (Desaparece en 3s)
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
    SubCenterLabel.Text = "este escript es fase beta"
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

-- 2. CARTEL EN LA ESQUINA CORREGIDO (Libre del botón de saltar - 6s)
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

-- 3. LIMPIADOR MAESTRO INTERNO
local function CleanObject(obj)
    local name = obj.Name and string.lower(obj.Name) or ""
    local parentName = obj.Parent and string.lower(obj.Parent.Name) or ""

    -- Regla de oro: Salvar Garou Dash y efectos azules
    if string.find(name, "dash") or string.find(name, "blue") or string.find(name, "garou") 
       or string.find(parentName, "dash") or string.find(parentName, "garou") then 
        return obj 
    end

    -- Borrar Palmeras
    if string.find(name, "tree") or string.find(name, "palm") or string.find(name, "palmera") then
        obj:Destroy()
        return nil
    end

    -- ELIMINACIÓN TOTAL DE ROCAS (Gancho + Detección agresiva de Down Slam)
    if obj:IsA("BasePart") or obj:IsA("MeshPart") then
        if parentName == "visualeffects" or string.find(parentName, "fx") or parentName == "debris" 
           or string.find(name, "rock") or string.find(name, "debris") or string.find(name, "stone") or name == "part"
           or (parentName == "workspace" and obj.CanCollide == false and obj.Size.Y < 25 and not obj:IsDescendantOf(Workspace:FindFirstChild("Map"))) then
            
            if obj.Name ~= "Terrain" and name ~= "baseplate" then
                pcall(function()
                    obj.Transparency = 1
                    obj.Size = Vector3.new(0, 0, 0)
                    obj.Position = Vector3.new(0, -999, 0)
                    obj.CanCollide = false
                end)
                return obj
            end
        end
    end

    -- Desactivar partículas pesadas
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Smoke") or obj:IsA("Fire") then
        obj.Enabled = false
    elseif obj:IsA("Explosion") then
        obj.Visible = false
    end

    return obj
end

-- Hook/Intercepción en la creación de instancias (Doble método)
local oldNew = Instance.new
if typeof(hookfunction) == "function" then
    hookfunction(Instance.new, function(className, parent)
        local obj = oldNew(className, parent)
        if obj then
            local success, result = pcall(CleanObject, obj)
            if success and result == nil then return nil end
        end
        return obj
    end)
end

-- Escaneo masivo inicial y en vivo por si falla el hook en celular
for _, child in pairs(Workspace:GetDescendants()) do pcall(CleanObject, child) end
Workspace.DescendantAdded:Connect(function(descendant) pcall(CleanObject, descendant) end)

-- Optimizador de Iluminación
pcall(function()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e6
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") then effect.Enabled = false end
    end
end)
