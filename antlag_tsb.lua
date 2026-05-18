-- ANTI-LAG ULTIMATE - ELIMINA BASURA, NO EDIFICIOS - DanielSonrieScripts
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

print("⚔️ ANTI-LAG ULTIMATE - ESPERANDO CONTRASEÑA")

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- VENTANA DE CONTRASEÑA
local PasswordGui = Instance.new("ScreenGui")
PasswordGui.Name = "PasswordGui"
PasswordGui.ResetOnSpawn = false
PasswordGui.Parent = PlayerGui

local FondoPass = Instance.new("Frame")
FondoPass.Size = UDim2.new(1, 0, 1, 0)
FondoPass.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FondoPass.BackgroundTransparency = 0.8
FondoPass.Parent = PasswordGui

local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 300, 0, 150)
LoginFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
LoginFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
LoginFrame.BorderSizePixel = 0
LoginFrame.Parent = PasswordGui

local LoginCorner = Instance.new("UICorner")
LoginCorner.CornerRadius = UDim.new(0, 15)
LoginCorner.Parent = LoginFrame

local TitlePass = Instance.new("TextLabel")
TitlePass.Size = UDim2.new(1, 0, 0, 35)
TitlePass.Position = UDim2.new(0, 0, 0, 10)
TitlePass.BackgroundTransparency = 1
TitlePass.Text = "🔒 SCRIPT PROTEGIDO"
TitlePass.TextColor3 = Color3.fromRGB(255, 200, 0)
TitlePass.TextSize = 16
TitlePass.Font = Enum.Font.GothamBold
TitlePass.Parent = LoginFrame

local PasswordBox = Instance.new("TextBox")
PasswordBox.Size = UDim2.new(0, 200, 0, 35)
PasswordBox.Position = UDim2.new(0.5, -100, 0, 55)
PasswordBox.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
PasswordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PasswordBox.TextSize = 14
PasswordBox.Font = Enum.Font.Gotham
PasswordBox.PlaceholderText = "Ingresa la contraseña"
PasswordBox.Text = ""
PasswordBox.ClearTextOnFocus = false
PasswordBox.Parent = LoginFrame

local PassCorner = Instance.new("UICorner")
PassCorner.CornerRadius = UDim.new(0, 8)
PassCorner.Parent = PasswordBox

local ConfirmButton = Instance.new("TextButton")
ConfirmButton.Size = UDim2.new(0, 100, 0, 35)
ConfirmButton.Position = UDim2.new(0.5, -50, 0, 105)
ConfirmButton.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
ConfirmButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ConfirmButton.TextSize = 14
ConfirmButton.Font = Enum.Font.GothamBold
ConfirmButton.Text = "ENTRAR"
ConfirmButton.Parent = LoginFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ConfirmButton

local ErrorMsg = Instance.new("TextLabel")
ErrorMsg.Size = UDim2.new(1, 0, 0, 25)
ErrorMsg.Position = UDim2.new(0, 0, 0, 145)
ErrorMsg.BackgroundTransparency = 1
ErrorMsg.Text = ""
ErrorMsg.TextColor3 = Color3.fromRGB(255, 0, 0)
ErrorMsg.TextSize = 12
ErrorMsg.Font = Enum.Font.Gotham
ErrorMsg.Parent = LoginFrame

local CONTRASENA_CORRECTA = "DanielSonrieScripts"

local function ejecutarScriptCompleto()
    PasswordGui:Destroy()
    print("✅ CONTRASEÑA CORRECTA - INICIANDO")
    
    for _, gui in pairs(PlayerGui:GetChildren()) do
        if gui.Name:find("Daniel") then gui:Destroy() end
    end

    -- PANTALLA DE CARGA
    local LoadGui = Instance.new("ScreenGui")
    LoadGui.Name = "DanielLoadGui"
    LoadGui.ResetOnSpawn = false
    LoadGui.Parent = PlayerGui
    LoadGui.DisplayOrder = 999999

    local Blur = Instance.new("BlurEffect")
    Blur.Size = 12
    Blur.Parent = Lighting

    local FondoCarga = Instance.new("Frame")
    FondoCarga.Size = UDim2.new(1, 0, 1, 0)
    FondoCarga.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    FondoCarga.BackgroundTransparency = 0.3
    FondoCarga.Parent = LoadGui

    local BarFrame = Instance.new("Frame")
    BarFrame.Size = UDim2.new(0, 300, 0, 30)
    BarFrame.Position = UDim2.new(0.5, -150, 0.5, -15)
    BarFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    BarFrame.BorderSizePixel = 0
    BarFrame.Parent = LoadGui

    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(0, 15)
    BarCorner.Parent = BarFrame

    local ProgressBar = Instance.new("Frame")
    ProgressBar.Size = UDim2.new(0, 0, 1, 0)
    ProgressBar.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Parent = BarFrame

    local ProgressCorner = Instance.new("UICorner")
    ProgressCorner.CornerRadius = UDim.new(0, 15)
    ProgressCorner.Parent = ProgressBar

    local LoadText = Instance.new("TextLabel")
    LoadText.Size = UDim2.new(0, 200, 0, 30)
    LoadText.Position = UDim2.new(0.5, -100, 0.5, -60)
    LoadText.BackgroundTransparency = 1
    LoadText.Text = "Cargando"
    LoadText.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoadText.TextSize = 20
    LoadText.Font = Enum.Font.GothamBold
    LoadText.Parent = LoadGui

    local PercentText = Instance.new("TextLabel")
    PercentText.Size = UDim2.new(0, 100, 0, 30)
    PercentText.Position = UDim2.new(0.5, -50, 0.5, 25)
    PercentText.BackgroundTransparency = 1
    PercentText.Text = "0%"
    PercentText.TextColor3 = Color3.fromRGB(255, 255, 255)
    PercentText.TextSize = 18
    PercentText.Font = Enum.Font.GothamBold
    PercentText.Parent = LoadGui

    local puntos = 0
    local cargaLoop = task.spawn(function()
        while LoadGui and LoadGui.Parent do
            task.wait(0.3)
            puntos = (puntos % 3) + 1
            pcall(function()
                LoadText.Text = "Cargando" .. string.rep(".", puntos)
            end)
        end
    end)

    function ejecutarOptimizaciones()
        print("✅ OPTIMIZACIONES INICIANDO")
        Blur:Destroy()
        
        -- BIENVENIDA MODO PATATA
        pcall(function()
            local WelcomeGui = Instance.new("ScreenGui")
            WelcomeGui.Name = "DanielWelcomeGui"
            WelcomeGui.ResetOnSpawn = false
            WelcomeGui.Parent = PlayerGui

            local Bubble = Instance.new("Frame")
            Bubble.Size = UDim2.new(0, 350, 0, 90)
            Bubble.Position = UDim2.new(0.5, -175, 0.5, -45)
            Bubble.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Bubble.BackgroundTransparency = 0.5
            Bubble.BorderSizePixel = 0
            Bubble.Parent = WelcomeGui

            local BubbleCorner = Instance.new("UICorner")
            BubbleCorner.CornerRadius = UDim.new(0, 20)
            BubbleCorner.Parent = Bubble

            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Size = UDim2.new(1, 0, 0, 45)
            TitleLabel.Position = UDim2.new(0, 0, 0, 5)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = "🥔 MODO PATATA 🥔"
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 26
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.Parent = Bubble

            local SubLabel = Instance.new("TextLabel")
            SubLabel.Size = UDim2.new(1, 0, 0, 25)
            SubLabel.Position = UDim2.new(0, 0, 0, 55)
            SubLabel.BackgroundTransparency = 1
            SubLabel.Text = "Developed by DanielSonrieScripts"
            SubLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
            SubLabel.TextSize = 12
            SubLabel.Font = Enum.Font.Gotham
            SubLabel.Parent = Bubble

            Bubble.Position = UDim2.new(0.5, -175, 1, 0)
            local entrarAnim = TweenService:Create(Bubble, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -175, 0.5, -45)})
            entrarAnim:Play()
            
            task.wait(3)
            
            local salirAnim = TweenService:Create(Bubble, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5, -175, 1, 0), BackgroundTransparency = 1})
            salirAnim:Play()
            TweenService:Create(TitleLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
            TweenService:Create(SubLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
            
            task.wait(0.5)
            WelcomeGui:Destroy()
        end)

        -- CONTADOR FPS
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

        -- PANEL FPS BOOST BETA
        pcall(function()
            local BoostGui = Instance.new("ScreenGui")
            BoostGui.Name = "DanielBoostGui"
            BoostGui.ResetOnSpawn = false
            BoostGui.Parent = PlayerGui

            local BoostFrame = Instance.new("Frame")
            BoostFrame.Size = UDim2.new(0, 170, 0, 110)
            BoostFrame.Position = UDim2.new(0, 10, 1, 0)
            BoostFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            BoostFrame.BackgroundTransparency = 0.5
            BoostFrame.BorderSizePixel = 0
            BoostFrame.Parent = BoostGui

            local BoostCorner = Instance.new("UICorner")
            BoostCorner.CornerRadius = UDim.new(0, 8)
            BoostCorner.Parent = BoostFrame

            local entrarAnim = TweenService:Create(BoostFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0, 10, 1, -120)})
            entrarAnim:Play()

            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Size = UDim2.new(1, -10, 0, 22)
            TitleLabel.Position = UDim2.new(0, 5, 0, 5)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = "FPS BOOST BETA"
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 11
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
            TitleLabel.Parent = BoostFrame

            local mejoras = {
                {texto = "rocas eliminadas", color = Color3.fromRGB(0, 255, 0)},
                {texto = "palmeras eliminadas", color = Color3.fromRGB(0, 255, 0)},
                {texto = "botes de basura", color = Color3.fromRGB(0, 255, 0)},
                {texto = "efectos reducidos", color = Color3.fromRGB(0, 255, 0)}
            }

            local yPos = 30
            for _, mejora in pairs(mejoras) do
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, -10, 0, 16)
                label.Position = UDim2.new(0, 5, 0, yPos)
                label.BackgroundTransparency = 1
                label.Text = "✓ " .. mejora.texto
                label.TextColor3 = mejora.color
                label.TextSize = 10
                label.Font = Enum.Font.Gotham
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Parent = BoostFrame
                yPos = yPos + 18
            end

            task.spawn(function()
                task.wait(8)
                local salirAnim = TweenService:Create(BoostFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0, 10, 1, 0), BackgroundTransparency = 1})
                salirAnim:Play()
                TweenService:Create(TitleLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
                for _, child in pairs(BoostFrame:GetChildren()) do
                    if child:IsA("TextLabel") and child ~= TitleLabel then
                        TweenService:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
                    end
                end
                task.wait(0.5)
                BoostGui:Destroy()
            end)
        end)

        -- MARCA DE AGUA
        pcall(function()
            local WatermarkGui = Instance.new("ScreenGui")
            WatermarkGui.Name = "DanielWatermark"
            WatermarkGui.ResetOnSpawn = false
            WatermarkGui.Parent = PlayerGui

            local WatermarkLabel = Instance.new("TextLabel")
            WatermarkLabel.Size = UDim2.new(0, 150, 0, 18)
            WatermarkLabel.Position = UDim2.new(1, -160, 1, -30)
            WatermarkLabel.BackgroundTransparency = 1
            WatermarkLabel.Text = "DanielSonrieScripts"
            WatermarkLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            WatermarkLabel.TextSize = 10
            WatermarkLabel.Font = Enum.Font.Gotham
            WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Right
            WatermarkLabel.TextTransparency = 0.3
            WatermarkLabel.Parent = WatermarkGui
        end)

        -- ============================================
        -- LIMPIEZA DE BASURA (SIN DAÑAR EDIFICIOS)
        -- ============================================
        pcall(function()
            -- Apagar sombras y efectos
            Lighting.GlobalShadows = false
            for _, effect in pairs(Lighting:GetChildren()) do
                if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") then
                    effect.Enabled = false
                end
            end
            
            -- FUNCIÓN PARA PROTEGER EDIFICIOS
            local function esProtegido(obj)
                -- Proteger personajes y jugadores
                local current = obj.Parent
                while current do
                    if current:FindFirstChild("Humanoid") then
                        return true
                    end
                    current = current.Parent
                end
                
                -- Proteger edificios por nombre
                local nombre = obj.Name and string.lower(obj.Name) or ""
                if nombre:find("building") or nombre:find("house") or nombre:find("wall") or nombre:find("base") or nombre:find("floor") or nombre:find("platform") then
                    return true
                end
                
                -- Proteger el terreno
                if obj.Name == "Terrain" then
                    return true
                end
                
                return false
            end
            
            -- 1. ELIMINAR PALMERAS Y ÁRBOLES
            for _, obj in pairs(Workspace:GetDescendants()) do
                pcall(function()
                    if not esProtegido(obj) then
                        local nombre = obj.Name and string.lower(obj.Name) or ""
                        if nombre:find("tree") or nombre:find("palm") or nombre:find("palmera") or nombre:find("bush") or nombre:find("planta") then
                            obj:Destroy()
                        end
                    end
                end)
            end
            
            -- 2. ELIMINAR ROCAS Y PIEDRAS (incluyendo Down Slam)
            for _, obj in pairs(Workspace:GetDescendants()) do
                pcall(function()
                    if not esProtegido(obj) then
                        local nombre = obj.Name and string.lower(obj.Name) or ""
                        if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                            -- Por nombre
                            if nombre:find("rock") or nombre:find("stone") or nombre:find("piedra") or nombre:find("roca") or nombre:find("debris") or nombre:find("fragment") or nombre:find("slam") or nombre:find("down") then
                                obj:Destroy()
                            end
                            -- Por tamaño (cosas pequeñas)
                            local tamano = obj.Size.Magnitude
                            if tamano < 10 and tamano > 0.5 then
                                obj:Destroy()
                            end
                        end
                    end
                end)
            end
            
            -- 3. ELIMINAR BOTES DE BASURA
            for _, obj in pairs(Workspace:GetDescendants()) do
                pcall(function()
                    if not esProtegido(obj) then
                        local nombre = obj.Name and string.lower(obj.Name) or ""
                        if nombre:find("trash") or nombre:find("basura") or nombre:find("bote") or nombre:find("can") or nombre:find("dumpster") then
                            obj:Destroy()
                        end
                    end
                end)
            end
            
            -- 4. ELIMINAR PARTÍCULAS Y EFECTOS
            for _, obj in pairs(Workspace:GetDescendants()) do
                pcall(function()
                    if not esProtegido(obj) then
                        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Explosion") then
                            obj:Destroy()
                        end
                    end
                end)
            end
            
            -- 5. ELIMINAR OBJETOS NUEVOS (monitoreo en vivo)
            Workspace.DescendantAdded:Connect(function(obj)
                pcall(function()
                    if not esProtegido(obj) then
                        local nombre = obj.Name and string.lower(obj.Name) or ""
                        -- Árboles y palmeras
                        if nombre:find("tree") or nombre:find("palm") or nombre:find("palmera") then
                            obj:Destroy()
                        end
                        -- Rocas y piedras
                        if obj:IsA("BasePart") and (nombre:find("rock") or nombre:find("stone") or nombre:find("piedra") or nombre:find("slam") or nombre:find("down")) then
                            obj:Destroy()
                        end
                        -- Botes de basura
                        if nombre:find("trash") or nombre:find("basura") or nombre:find("bote") then
                            obj:Destroy()
                        end
                        -- Partículas
                        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:I
