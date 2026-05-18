-- TSB ANTI-LAG - DanielSonrieScripts
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Verificar si es TSB
local placeId = game.PlaceId
if placeId ~= 10449761463 and placeId ~= 14933485796 then
    local gui = Instance.new("ScreenGui")
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 150)
    frame.Position = UDim2.new(0.5, -200, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
    frame.BackgroundTransparency = 0.3
    frame.Parent = gui
    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.new(1,0,1,0)
    txt.BackgroundTransparency = 1
    txt.Text = "ESTE SCRIPT NO ES UNIVERSAL\nES PARA THE STRONGEST BATTLEGROUNDS"
    txt.TextColor3 = Color3.fromRGB(255,255,255)
    txt.TextSize = 18
    txt.Font = Enum.Font.GothamBold
    txt.Parent = frame
    task.wait(3)
    gui:Destroy()
    return
end

print("✅ TSB DETECTADO - INICIANDO")

-- Pantalla de carga
local pg = LocalPlayer:WaitForChild("PlayerGui")
local loadGui = Instance.new("ScreenGui")
loadGui.Name = "LoadGui"
loadGui.Parent = pg

local fondo = Instance.new("Frame")
fondo.Size = UDim2.new(1,0,1,0)
fondo.BackgroundColor3 = Color3.fromRGB(0,0,0)
fondo.Parent = loadGui

local barra = Instance.new("Frame")
barra.Size = UDim2.new(0,300,0,30)
barra.Position = UDim2.new(0.5,-150,0.5,-15)
barra.BackgroundColor3 = Color3.fromRGB(50,50,60)
barra.Parent = loadGui

local progress = Instance.new("Frame")
progress.Size = UDim2.new(0,0,1,0)
progress.BackgroundColor3 = Color3.fromRGB(255,200,0)
progress.Parent = barra

local texto = Instance.new("TextLabel")
texto.Size = UDim2.new(0,200,0,30)
texto.Position = UDim2.new(0.5,-100,0.5,-60)
texto.BackgroundTransparency = 1
texto.Text = "Cargando"
texto.TextColor3 = Color3.fromRGB(255,255,255)
texto.TextSize = 20
texto.Font = Enum.Font.GothamBold
texto.Parent = loadGui

local pct = Instance.new("TextLabel")
pct.Size = UDim2.new(0,100,0,30)
pct.Position = UDim2.new(0.5,-50,0.5,25)
pct.BackgroundTransparency = 1
pct.Text = "0%"
pct.TextColor3 = Color3.fromRGB(255,255,255)
pct.TextSize = 18
pct.Font = Enum.Font.GothamBold
pct.Parent = loadGui

for i = 1, 100 do
    progress:TweenSize(UDim2.new(0,300 * i/100,1,0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.02, true)
    pct.Text = i .. "%"
    task.wait(0.05)
end

loadGui:Destroy()

-- Bienvenida
local welcome = Instance.new("ScreenGui")
welcome.Name = "WelcomeGui"
welcome.Parent = pg

local bubble = Instance.new("Frame")
bubble.Size = UDim2.new(0,350,0,90)
bubble.Position = UDim2.new(0.5,-175,0.5,-45)
bubble.BackgroundColor3 = Color3.fromRGB(0,0,0)
bubble.BackgroundTransparency = 0.5
bubble.Parent = welcome

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,45)
title.Position = UDim2.new(0,0,0,5)
title.BackgroundTransparency = 1
title.Text = "🥔 MODO PATATA 🥔"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 26
title.Font = Enum.Font.GothamBold
title.Parent = bubble

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1,0,0,25)
sub.Position = UDim2.new(0,0,0,55)
sub.BackgroundTransparency = 1
sub.Text = "Developed by DanielSonrieScripts"
sub.TextColor3 = Color3.fromRGB(255,200,0)
sub.TextSize = 12
sub.Font = Enum.Font.Gotham
sub.Parent = bubble

task.wait(3)
welcome:Destroy()

-- FPS Counter
local fpsGui = Instance.new("ScreenGui")
fpsGui.Name = "FpsGui"
fpsGui.Parent = pg

local fpsFrame = Instance.new("Frame")
fpsFrame.Size = UDim2.new(0,70,0,25)
fpsFrame.Position = UDim2.new(0,10,0,10)
fpsFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
fpsFrame.BackgroundTransparency = 0.5
fpsFrame.Parent = fpsGui

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1,0,1,0)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: --"
fpsLabel.TextColor3 = Color3.fromRGB(0,255,0)
fpsLabel.TextSize = 14
fpsLabel.Font = Enum.Font.GothamBold
fpsLabel.Parent = fpsFrame

local lastTime = tick()
local frameCount = 0
game:GetService("RunService").RenderStepped:Connect(function()
    frameCount = frameCount + 1
    if tick() - lastTime >= 1 then
        local fps = frameCount
        frameCount = 0
        lastTime = tick()
        if fps >= 50 then
            fpsLabel.TextColor3 = Color3.fromRGB(0,255,0)
        elseif fps >= 30 then
            fpsLabel.TextColor3 = Color3.fromRGB(255,255,0)
        else
            fpsLabel.TextColor3 = Color3.fromRGB(255,0,0)
        end
        fpsLabel.Text = "FPS: " .. fps
    end
end)

-- Eliminar rocas y árboles
for _, obj in pairs(Workspace:GetDescendants()) do
    pcall(function()
        local n = obj.Name and obj.Name:lower() or ""
        if n:find("tree") or n:find("palm") or n:find("rock") or n:find("stone") or n:find("debris") then
            obj:Destroy()
        end
        if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Fire") then
            obj:Destroy()
        end
    end)
end

Workspace.DescendantAdded:Connect(function(obj)
    pcall(function()
        local n = obj.Name and obj.Name:lower() or ""
        if n:find("tree") or n:find("palm") or n:find("rock") or n:find("stone") then
            obj:Destroy()
        end
        if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Fire") then
            obj:Destroy()
        end
    end)
end)

Lighting.GlobalShadows = false
print("✅ TSB ANTI-LAG ACTIVADO - DanielSonrieScripts")
