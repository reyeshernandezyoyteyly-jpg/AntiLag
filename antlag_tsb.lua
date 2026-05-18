-- DanielSonrie Ultimate Anti-Lag | The Strongest Battlegrounds Edition
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

print("⚔️ TSB Anti-Lag Iniciado por DanielSonrie")

-- 1. APAGAR ILUMINACIÓN Y POST-PROCESADO DE COMBATE
pcall(function()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e6
    Lighting.Brightness = 1
    
    -- Volar efectos de la actualización (Bloom, Blur de golpes, Blur de despertar)
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("SunRaysEffect") then
            effect.Enabled = false
        end
    end
end)

-- 2. LIMPIEZA AGRESIVA DEL MAPA (Adiós texturas pesadas y escombros)
for _, v in pairs(Workspace:GetDescendants()) do
    pcall(function()
        -- Forzar modo papa en estructuras de la arena
        if v:IsA("BasePart") and not v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
        -- Volar texturas del suelo y paredes que metió la actualización
        elseif v:IsA("Texture") or v:IsA("Decal") then
            v:Destroy()
        end
    end)
end

-- 3. DESTRUCTOR DE PARTÍCULAS EN TIEMPO REAL (Para que los poderes no te congelen el cel)
-- Esto limpia lo que ya está y lo que vaya saliendo en la pelea
local function CleanLaggyThings(obj)
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") then
        obj.Enabled = false
    elseif obj:IsA("Explosion") then
        obj.Visible = false
    -- TSB genera muchos escombros sueltos (partes) cuando rompen paredes, esto los vuelve invisibles/ligeros
    elseif obj:IsA("Debris") or (obj:IsA("BasePart") and obj.Name == "Debris") then
        obj:Destroy()
    end
end

-- Limpiar lo actual
for _, child in pairs(Workspace:GetDescendants()) do
    pcall(CleanLaggyThings, child)
end

-- Monitorear el juego para apagar los efectos de los combos nuevos en cuanto aparezcan
Workspace.DescendantAdded:Connect(function(descendant)
    pcall(CleanLaggyThings, descendant)
end)

print("🚀 Modo Papa Extremo Activo - FPS Booster")

-- 4. TU CARTEL PERSONALIZADO (DanielSonrie)
pcall(function()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    if PlayerGui:FindFirstChild("DanielSonrieGui") then
        PlayerGui.DanielSonrieGui:Destroy()
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "DanielSonrieGui"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = PlayerGui
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(0, 180, 0, 35)
    TextLabel.Position = UDim2.new(0, 15, 0, 15) -- Bien ubicado para que no estorbe los botones del cel
    TextLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    TextLabel.BackgroundTransparency = 0.3
    TextLabel.Text = "DanielSonrie"
    TextLabel.TextColor3 = Color3.fromRGB(0, 255, 120) -- Un verde Neón pro para que resalte
    TextLabel.TextSize = 16
    TextLabel.Font = Enum.Font.GothamBold
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = TextLabel
    
    TextLabel.Parent = ScreenGui
    print("👑 Cartel DanielSonrie Activo en TSB")
end)
