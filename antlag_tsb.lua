-- ANTI-LAG ULTRA RÁPIDO - Rocas 0.0000000001s
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

print("⚔️ ANTI-LAG ACTIVADO - Rocas 0.0000000001s")

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
for _, gui in pairs(PlayerGui:GetChildren()) do
    if gui.Name:find("Daniel") then gui:Destroy() end
end

-- ============================================
-- BIENVENIDA
-- ============================================
pcall(function()
    local WelcomeGui = Instance.new("ScreenGui")
    WelcomeGui.Name = "DanielWelcomeGui"
    WelcomeGui.ResetOnSpawn = false
    WelcomeGui.Parent = PlayerGui

    local CenterLabel = Instance.new("TextLabel")
    CenterLabel.Size = UDim2.new(0, 300, 0, 40)
    CenterLabel.Position = UDim2.new(0.5, -150, 0.4, -20)
    CenterLabel.BackgroundTransparency = 1
    CenterLabel.Text = "🥔 MODO PATATA 🥔"
    CenterLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CenterLabel.TextSize = 26
    CenterLabel.Font = Enum.Font.GothamBold
    CenterLabel.Parent = WelcomeGui

    task.wait(2)
    WelcomeGui:Destroy()
end)

-- ============================================
-- TEXTO TEMPORAL (8 segundos)
-- ============================================
pcall(function()
    local WarningGui = Instance.new("ScreenGui")
    WarningGui.Name = "DanielWarningGui"
    WarningGui.ResetOnSpawn = false
    WarningGui.Parent = PlayerGui

    local LeftFrame = Instance.new("Frame")
    LeftFrame.Size = UDim2.new(0, 180, 0, 70)
    LeftFrame.Position = UDim2.new(0, 10, 1, -80)
    LeftFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LeftFrame.BackgroundTransparency = 0.5
    LeftFrame.BorderSizePixel = 0
    LeftFrame.Parent = WarningGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = LeftFrame

    local FPSLabel = Instance.new("TextLabel")
    FPSLabel.Size = UDim2.new(1, -10, 0, 20)
    FPSLabel.Position = UDim2.new(0, 5, 0, 5)
    FPSLabel.BackgroundTransparency = 1
    FPSLabel.Text = "MODO PATATA"
    FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    FPSLabel.TextSize = 13
    FPSLabel.Font = Enum.Font.GothamBold
    FPSLabel.TextXAlignment = Enum.TextXAlignment.Left
    FPSLabel.Parent = LeftFrame

    local RocaLabel = Instance.new("TextLabel")
    RocaLabel.Size = UDim2.new(1, -10, 0, 18)
    RocaLabel.Position = UDim2.new(0, 5, 0, 28)
    RocaLabel.BackgroundTransparency = 1
    RocaLabel.Text = "ROCAS 0.0000000001s"
    RocaLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    RocaLabel.TextSize = 10
    RocaLabel.Font = Enum.Font.Gotham
    RocaLabel.TextXAlignment = Enum.TextXAlignment.Left
    RocaLabel.Parent = LeftFrame

    local DashLabel = Instance.new("TextLabel")
    DashLabel.Size = UDim2.new(1, -10, 0, 18)
    DashLabel.Position = UDim2.new(0, 5, 0, 48)
    DashLabel.BackgroundTransparency = 1
    DashLabel.Text = "DASH GAROU OK"
    DashLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    DashLabel.TextSize = 10
    DashLabel.Font = Enum.Font.GothamBold
    DashLabel.TextXAlignment = Enum.TextXAlignment.Left
    DashLabel.Parent = LeftFrame

    task.wait(8)
    for i = 1, 10 do
        local alpha = i / 10
        LeftFrame.BackgroundTransparency = 0.5 + (alpha * 0.5)
        FPSLabel.TextTransparency = alpha
        RocaLabel.TextTransparency = alpha
        DashLabel.TextTransparency = alpha
        task.wait(0.05)
    end
    WarningGui:Destroy()
end)

-- ============================================
-- PANEL DE ACTUALIZACIONES (TEXTO CORTO)
-- ============================================
pcall(function()
    local UpdateGui = Instance.new("ScreenGui")
    UpdateGui.Name = "DanielUpdateGui"
    UpdateGui.ResetOnSpawn = false
    UpdateGui.Parent = PlayerGui

    local UpdateFrame = Instance.new("Frame")
    UpdateFrame.Size = UDim2.new(0, 180, 0, 150)
    UpdateFrame.Position = UDim2.new(1, -190, 1, -160)
    UpdateFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    UpdateFrame.BackgroundTransparency = 0.4
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
    TitleLabel.TextSize = 12
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
    TitleLabel.Parent = UpdateFrame

    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Size = UDim2.new(1, -10, 1, -35)
    ScrollFrame.Position = UDim2.new(0, 5, 0, 30)
    ScrollFrame.BackgroundTransparency = 1
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollFrame.ScrollBarThickness = 3
    ScrollFrame.Parent = UpdateFrame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = ScrollFrame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 3)

    local actualizaciones = {
        "✅ rocas eliminadas",
        "✅ modo patata",
        "✅ dash garou ok",
        "✅ arboles fuera",
        "✅ efectos reducidos"
    }

    for _, update in pairs(actualizaciones) do
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 0, 16)
        label.BackgroundTransparency = 1
        label.Text = update
        label.TextColor3 = Color3.fromRGB(200, 200, 200)
        label.TextSize = 10
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = ScrollFrame
    end

    task.wait()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
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
-- ROCAS: 0.0000000001 SEGUNDOS
-- ============================================

local function esRoca(obj)
    local nombre = obj.Name and string.lower(obj.Name) or ""
    if nombre:find("garou") or nombre:find("dash") then
        return false
    end
    
    local current = obj.Parent
    while current do
        if current:FindFirstChild("Humanoid") then
            return false
        end
        current = current.Parent
    end
    
    if obj:IsA("BasePart") or obj:IsA("MeshPart") then
        local tamano = obj.Size.Magnitude
        if tamano < 12 and tamano > 0.5 and obj.Name ~= "Terrain" then
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

print("✅ ACTIVADO - Rocas 0.0000000001s")
