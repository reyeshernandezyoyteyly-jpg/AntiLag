-- DanielScript Ultimate Anti-Lag | The Strongest Battlegrounds Edition
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

print("⚔️ TSB Anti-Lag Definitivo por DanielSonrie")

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
if PlayerGui:FindFirstChild("DanielWelcomeGui") then PlayerGui.DanielWelcomeGui:Destroy() end
if PlayerGui:FindFirstChild("DanielToastGui") then PlayerGui.DanielToastGui:Destroy() end

-- 1. TEXTO DE BIENVENIDA AL CENTRO (Desaparece en 3 segundos)
pcall(function()
    local WelcomeGui = Instance.new("ScreenGui")
    WelcomeGui.Name = "DanielWelcomeGui"
    WelcomeGui.ResetOnSpawn = false
    WelcomeGui.DisplayOrder = 99999
    WelcomeGui.Parent = PlayerGui

    local CenterLabel = Instance.new("TextLabel")
    CenterLabel.Size = UDim2.new(0, 400, 0, 50)
    CenterLabel.Position = UDim2.new(0.5, -200, 0.4, -25)
    CenterLabel.BackgroundTransparency = 1
    CenterLabel.Text = "Creado por DanielSonrie"
    CenterLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CenterLabel.TextSize = 28
    CenterLabel.Font = Enum.Font.GothamBold
    CenterLabel.TextStrokeTransparency = 0.5
    CenterLabel.Parent = WelcomeGui

    task.spawn(function()
        task.wait(3)
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
        local tweenText = TweenService:Create(CenterLabel, tweenInfo, {TextTransparency = 1, TextStrokeTransparency = 1})
        tweenText:Play()
        tweenText.Completed:Connect(function()
            WelcomeGui:Destroy()
        end)
    end)
end)

-- 2. CARTEL CON FONDO NEGRO EN LA ESQUINA (Desaparece en 6 segundos y libre del botón)
pcall(function()
    local ToastGui = Instance.new("ScreenGui")
    ToastGui.Name = "DanielToastGui"
    ToastGui.ResetOnSpawn = false
    ToastGui.DisplayOrder = 99998
    ToastGui.Parent = PlayerGui
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 180, 0, 50)
    -- Movido más a la izquierda para que dejes libre el botón de saltar
    MainFrame.Position = UDim2.new(1, -240, 1, -150) 
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BackgroundTransparency = 0.3
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ToastGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = MainFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -10, 0, 20)
    TitleLabel.Position = UDim2.new(0, 0, 0, 6)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "Script Made by Daniel"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 13
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Right
    TitleLabel.Parent = MainFrame
    
    local SubLabel = Instance.new("TextLabel")
    SubLabel.Size = UDim2.new(1, -10, 0, 15)
    SubLabel.Position = UDim2.new(0, 0, 0, 24)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Text = "Script modificado por Daniel"
    SubLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    SubLabel.TextSize = 11
    SubLabel.Font = Enum.Font.Gotham
    SubLabel.TextXAlignment = Enum.TextXAlignment.Right
    SubLabel.Parent = MainFrame

    task.spawn(function()
        task.wait(6)
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
        TweenService:Create(MainFrame, tweenInfo, {BackgroundTransparency = 1}):Play()
        TweenService:Create(TitleLabel, tweenInfo, {TextTransparency = 1}):Play()
        local tweenSub = TweenService:Create(SubLabel, tweenInfo, {TextTransparency = 1})
        tweenSub:Play()
        tweenSub.Completed:Connect(function()
            ToastGui:Destroy()
        end)
    end)
end)

-- 3. ELIMINACIÓN DE LAG REAL (Palmeras, Rocas del mapa y de Golpes)
local function CleanLaggyThings(obj)
    -- Respetar tu Dash Azul
    local isDash = false
    pcall(function()
        local n = string.lower(obj.Name)
        if string.find(n, "dash") or string.find(n, "blue") or string.find(n, "aura") or string.find(n, "garou") then
            isDash = true
        end
    end)
    if isDash then return end

    -- BORRAR PALMERAS POR COMPLETO
    local isTree = false
    pcall(function()
        local n = string.lower(obj.Name)
        if string.find(n, "tree") or string.find(n, "palm") or string.find(n, "leaf") or string.find(n, "leaves") or string.find(n, "palmera") then
            isTree = true
        end
    end)
    if isTree then
        obj:Destroy()
        return
    end

    -- BORRAR ROCAS (Tanto las del mapa roto como las generadas por golpes de jugadores)
    local isRockDebris = false
    pcall(function()
        if obj:IsA("BasePart") then
            local n = string.lower(obj.Name)
            if obj.Parent and (obj.Parent.Name == "VisualEffects" or string.find(string.lower(obj.Parent.Name), "fx") or obj.Parent.Name == "Debris") then
                isRockDebris = true
            elseif not obj.Parent:FindFirstChild("Humanoid") and (string.find(n, "rock") or string.find(n, "debris") or string.find(n, "stone") or n == "part" or obj.Name == "MeshPart") then
                if obj.Name ~= "Terrain" and obj.Size.Y < 30 and not obj:IsDescendantOf(Workspace:FindFirstChild("Map")) then
                    isRockDebris = true
                elseif obj.CanCollide == false or obj.Velocity.Magnitude > 0 then
                    isRockDebris = true
                end
            end
        elseif obj:IsA("Debris") or obj.Name == "Debris" then
            isRockDebris = true
        end
    end)

    if isRockDebris then
        obj:Destroy()
        return
    end

    -- Texturas y partículas pesadas al mínimo (Modo Papa)
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
        if not obj:IsDescendantOf(LocalPlayer.Character) then
            obj.Enabled = false
        end
    elseif obj:IsA("Explosion") then
        obj.Visible = false
    elseif obj:IsA("BasePart") and not obj:IsA("MeshPart") and not obj.Parent:FindFirstChild("Humanoid") then
        obj.Material = Enum.Material.SmoothPlastic
    elseif obj:IsA("Texture") or obj:IsA("Decal") then
        obj:Destroy()
    end
end

-- Optimizar Iluminación
pcall(function()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e6
    Lighting.Brightness = 1
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") then
            effect.Enabled = false
        end
    end
end)

for _, child in pairs(Workspace:GetDescendants()) do
    pcall(CleanLaggyThings, child)
end

Workspace.DescendantAdded:Connect(function(descendant)
    pcall(CleanLaggyThings, descendant)
end)
