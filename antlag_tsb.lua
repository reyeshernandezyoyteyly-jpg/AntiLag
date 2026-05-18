-- ANTI-LAG DEFINITIVO - DanielSonrieScripts
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

print("⚔️ ANTI-LAG ACTIVADO - DanielSonrieScripts")

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
for _, gui in pairs(PlayerGui:GetChildren()) do
    if gui.Name:find("Daniel") then gui:Destroy() end
end

-- ============================================
-- BIENVENIDA (2 segundos)
-- ============================================
pcall(function()
    local WelcomeGui = Instance.new("ScreenGui")
    WelcomeGui.Name = "DanielWelcomeGui"
    WelcomeGui.ResetOnSpawn = false
    WelcomeGui.Parent = PlayerGui

    local CenterLabel = Instance.new("TextLabel")
    CenterLabel.Size = UDim2.new(0, 200, 0, 30)
    CenterLabel.Position = UDim2.new(0.5, -100, 0.4, -15)
    CenterLabel.BackgroundTransparency = 1
    CenterLabel.Text = "ANTI-LAG ON"
    CenterLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    CenterLabel.TextSize = 20
    CenterLabel.Font = Enum.Font.GothamBold
    CenterLabel.Parent = WelcomeGui

    task.wait(2)
    WelcomeGui:Destroy()
end)

-- ============================================
-- PANEL DE ACTUALIZACIONES (Esquina derecha)
-- ============================================
pcall(function()
    local UpdateGui = Instance.new("ScreenGui")
    UpdateGui.Name = "DanielUpdateGui"
    UpdateGui.ResetOnSpawn = false
    UpdateGui.Parent = PlayerGui

    local UpdateFrame = Instance.new("Frame")
    UpdateFrame.Size = UDim2.new(0, 150, 0, 130)
    UpdateFrame.Position = UDim2.new(1, -160, 0.5, -65)
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
        "✅ efectos reducidos",
        "✅ arboles removidos"
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
-- MARCA DE AGUA (Esquina inferior derecha, chiquita)
-- ============================================
pcall(function()
    local WatermarkGui = Instance.new("ScreenGui")
    WatermarkGui.Name = "DanielWatermark"
    WatermarkGui.ResetOnSpawn = false
    WatermarkGui.Parent = PlayerGui

    local WatermarkLabel = Instance.new("TextLabel")
    WatermarkLabel.Size = UDim2.new(0, 120, 0, 15)
    WatermarkLabel.Position = UDim2.new(1, -125, 1, -25)
    WatermarkLabel.BackgroundTransparency = 1
    WatermarkLabel.Text = "DanielSonrieScripts"
    WatermarkLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    WatermarkLabel.TextSize = 10
    WatermarkLabel.Font = Enum.Font.Gotham
    WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Right
    WatermarkLabel.TextTransparency = 0.3
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
-- ROCAS ELIMINADAS RÁPIDO
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

print("✅ ANTI-LAG ACTIVADO - DanielSonrieScripts")
