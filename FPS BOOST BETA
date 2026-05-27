-- Script FPS Boost corregido (sin lag acumulativo)
local S=string.char;if setclipboard then setclipboard(S(104,116,116,112,115,58,47,47,100,105,115,99,111,114,100,46,103,103,47,86,107,109,54,102,110,84,80,66,88))end
local L=game:GetService("Lighting")local P=game:GetService("Players")local W=game:GetService("Workspace")
local R=game:GetService("RunService")local T=game:GetService("TweenService")local LP=P.LocalPlayer
local PG=LP:WaitForChild("PlayerGui")local D=game:GetService("Debris")
local function N(c,p,t)local i=Instance.new(c,p)for k,v in pairs(t)do i[k]=v end;return i end
local ids={[10449761463]=1,[14933485796]=1,[18565515049]=1,[19074261395]=1}
if not ids[game.PlaceId]then
local bg=N("ScreenGui",PG,{DisplayOrder=999999})
N("Frame",bg,{Size=UDim2.new(10,0,10,0),Position=UDim2.new(-5,0,-5,0),BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0})
local fr=N("Frame",bg,{Size=UDim2.new(0,450,0,160),Position=UDim2.new(.5,-225,.5,-80),BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0})
N("TextLabel",fr,{Size=UDim2.new(1,0,0,50),Position=UDim2.new(0,0,0,10),BackgroundTransparency=1,Text="⚠️",TextSize=45,Font=Enum.Font.GothamBold,TextColor3=Color3.fromRGB(255,50,50)})
N("TextLabel",fr,{Size=UDim2.new(1,0,0,35),Position=UDim2.new(0,0,0,60),BackgroundTransparency=1,Text="JUEGO NO SOPORTADO",TextSize=20,Font=Enum.Font.GothamBold,TextColor3=Color3.fromRGB(255,50,50)})
N("TextLabel",fr,{Size=UDim2.new(1,0,0,45),Position=UDim2.new(0,0,0,95),BackgroundTransparency=1,Text="ESTE SCRIPT SOLO ES PARA\nTHE STRONGEST BATTLEGROUNDS",TextSize=14,Font=Enum.Font.Gotham,TextColor3=Color3.new(1,1,1)})
local cd=N("TextLabel",fr,{Size=UDim2.new(1,0,0,25),Position=UDim2.new(0,0,0,145),BackgroundTransparency=1,Text="Saliendo en 5 segundos...",TextSize=12,Font=Enum.Font.GothamBold,TextColor3=Color3.fromRGB(255,200,0)})
task.spawn(function()for i=5,1,-1 do cd.Text="Saliendo en "..i.." segundos..." task.wait(1)end;LP:Kick("ESTE SCRIPT SOLO ES PARA THE STRONGEST BATTLEGROUNDS")end)
return end
task.spawn(function()task.wait(1)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="🔑 Ingrese Contraseña",Text="Por favor, introduzca la clave para continuar.",Duration=4})end)end)
local PW=N("ScreenGui",PG,{Name="PasswordGui",ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=999999})
N("Frame",PW,{Size=UDim2.new(3,0,3,0),Position=UDim2.new(-1,0,-1,0),BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=.35,BorderSizePixel=0})
local LF=N("Frame",PW,{Size=UDim2.new(0,320,0,170),Position=UDim2.new(.5,-160,.5,-85),BackgroundColor3=Color3.fromRGB(20,20,20),BackgroundTransparency=.2,BorderSizePixel=0})
N("UICorner",LF,{CornerRadius=UDim.new(0,18)})
N("TextLabel",LF,{Size=UDim2.new(1,0,0,40),Position=UDim2.new(0,0,0,15),BackgroundTransparency=1,Text="🔒 SCRIPT PROTEGIDO",TextColor3=Color3.fromRGB(255,200,0),TextSize=18,Font=Enum.Font.GothamBold})
local LC=N("Frame",LF,{Size=UDim2.new(0,230,0,35),Position=UDim2.new(.5,-115,0,70),BackgroundTransparency=1,BorderSizePixel=0})
N("Frame",LC,{Size=UDim2.new(1,0,0,2),Position=UDim2.new(0,0,1,-2),BackgroundColor3=Color3.fromRGB(255,200,0),BorderSizePixel=0})
local PB=N("TextBox",LC,{Size=UDim2.new(1,0,1,-2),BackgroundTransparency=1,PlaceholderText="Ingresa la contraseña",Text="",TextColor3=Color3.new(1,1,1),PlaceholderColor3=Color3.fromRGB(170,170,170),TextSize=15,Font=Enum.Font.Gotham,ClearTextOnFocus=false})
local CB=N("TextButton",LF,{Size=UDim2.new(0,110,0,38),Position=UDim2.new(.5,-55,0,118),BackgroundColor3=Color3.fromRGB(255,200,0),BorderSizePixel=0,Text="ENTRAR",TextColor3=Color3.new(0,0,0),TextSize=15,Font=Enum.Font.GothamBold})
N("UICorner",CB,{CornerRadius=UDim.new(0,10)})
local EM=N("TextLabel",LF,{Size=UDim2.new(1,0,0,20),Position=UDim2.new(0,0,1,5),BackgroundTransparency=1,Text="",TextColor3=Color3.fromRGB(255,70,70),TextSize=13,Font=Enum.Font.GothamBold})
local KEY="DanielSonrie"
local function MAIN()
PW:Destroy()
local LG=N("ScreenGui",PG,{IgnoreGuiInset=true,DisplayOrder=999999})
N("Frame",LG,{Size=UDim2.new(3,0,3,0),Position=UDim2.new(-1,0,-1,0),BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=.35,BorderSizePixel=0})
local BL=N("BlurEffect",L,{Size=10})
local LT=N("TextLabel",LG,{Size=UDim2.new(0,250,0,40),Position=UDim2.new(.5,-125,.38,0),BackgroundTransparency=1,Text="Cargando",TextColor3=Color3.new(1,1,1),TextSize=22,Font=Enum.Font.GothamBold})
local BB=N("Frame",LG,{Size=UDim2.new(0,320,0,22),Position=UDim2.new(.5,-160,.5,-11),BackgroundColor3=Color3.fromRGB(40,40,40),BorderSizePixel=0})
N("UICorner",BB,{CornerRadius=UDim.new(0,12)})
local PBB=N("Frame",BB,{Size=UDim2.new(0,0,1,0),BackgroundColor3=Color3.fromRGB(255,200,0),BorderSizePixel=0})
N("UICorner",PBB,{CornerRadius=UDim.new(0,12)})
local PT=N("TextLabel",LG,{Size=UDim2.new(0,120,0,30),Position=UDim2.new(.5,-60,.57,0),BackgroundTransparency=1,Text="0%",TextColor3=Color3.fromRGB(255,200,0),TextSize=18,Font=Enum.Font.GothamBold})
task.spawn(function()local p=0;while LG and LG.Parent do task.wait(.3)p=(p%3)+1;LT.Text="Cargando"..string.rep(".",p)end end)
T:Create(PBB,TweenInfo.new(5,Enum.EasingStyle.Linear),{Size=UDim2.new(1,0,1,0)}):Play()
local st=tick()
while true do local pr=math.clamp((tick()-st)/5,0,1)PT.Text=math.floor(pr*100).."%" if pr>=1 then break end;task.wait(.1)end
LG:Destroy()BL:Destroy()
local sd=N("Sound",W,{SoundId="rbxassetid://2865227271",Volume=1})sd:Play()D:AddItem(sd,3)
task.wait(2)
local FG=N("ScreenGui",PG,{Name="FpsGui",ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=999998})
local FF=N("Frame",FG,{Size=UDim2.new(0,75,0,28),Position=UDim2.new(0,10,0,85),BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=.35,BorderSizePixel=0})
N("UICorner",FF,{CornerRadius=UDim.new(0,8)})
local FL=N("TextLabel",FF,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text="FPS: --",TextColor3=Color3.new(0,1,0),TextSize=14,Font=Enum.Font.GothamBold})
local lt,fr=tick(),0
R.RenderStepped:Connect(function()fr+=1;if tick()-lt>=1 then FL.Text="FPS: "..fr
if fr>=50 then FL.TextColor3=Color3.new(0,1,0)elseif fr>=30 then FL.TextColor3=Color3.fromRGB(255,255,0)else FL.TextColor3=Color3.new(1,0,0)end;fr=0;lt=tick()end end)
local BG=N("ScreenGui",PG,{})
local BF=N("Frame",BG,{Size=UDim2.new(0,190,0,125),Position=UDim2.new(0,10,1,0),BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=.35,BorderSizePixel=0})
N("UICorner",BF,{CornerRadius=UDim.new(0,10)})
T:Create(BF,TweenInfo.new(.4,Enum.EasingStyle.Back),{Position=UDim2.new(0,10,1,-135)}):Play()
N("TextLabel",BF,{Size=UDim2.new(1,0,0,22),Position=UDim2.new(0,0,0,5),BackgroundTransparency=1,Text="FPS BOOST BETA",TextColor3=Color3.new(1,1,1),TextSize=12,Font=Enum.Font.GothamBold})
local y=30;for _,t in pairs({"✓ rocas eliminadas","✓ árboles eliminados","✓ decoración removida","✓ efectos reducidos"})do
N("TextLabel",BF,{Size=UDim2.new(1,-10,0,16),Position=UDim2.new(0,8,0,y),BackgroundTransparency=1,Text=t,TextColor3=Color3.new(0,1,0),TextSize=10,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left})y+=18 end
task.spawn(function()task.wait(5)
T:Create(BF,TweenInfo.new(.5,Enum.EasingStyle.Quad),{Position=UDim2.new(0,10,1,150),BackgroundTransparency=1}):Play()
for _,c in pairs(BF:GetChildren())do if c:IsA("TextLabel")then T:Create(c,TweenInfo.new(.5,Enum.EasingStyle.Quad),{TextTransparency=1}):Play()end end;task.wait(.6)BG:Destroy()end)
N("TextLabel",N("ScreenGui",PG,{}),{Size=UDim2.new(0,170,0,20),Position=UDim2.new(1,-180,1,-30),BackgroundTransparency=1,Text="DanielSonrie",TextColor3=Color3.new(1,1,1),TextTransparency=.3,TextSize=11,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Right})
pcall(function()settings().Rendering.QualityLevel=Enum.QualityLevel.Level01 end)
L.GlobalShadows=false;L.FogEnd=9e9;L.Brightness=1
pcall(function()L.EnvironmentDiffuseScale=0 end)pcall(function()L.EnvironmentSpecularScale=0 end)
for _,e in pairs(L:GetChildren())do pcall(function()if e:IsA("Sky")or e:IsA("Atmosphere")or e:IsA("Clouds")or e:IsA("PostEffect")or e:IsA("BloomEffect")or e:IsA("BlurEffect")or e:IsA("SunRaysEffect")or e:IsA("ColorCorrectionEffect")or e:IsA("DepthOfFieldEffect")then e:Destroy()end end)end
L.DescendantAdded:Connect(function(e)pcall(function()if e:IsA("Sky")or e:IsA("Atmosphere")or e:IsA("Clouds")or e:IsA("PostEffect")or e:IsA("BloomEffect")or e:IsA("BlurEffect")or e:IsA("SunRaysEffect")or e:IsA("ColorCorrectionEffect")or e:IsA("DepthOfFieldEffect")then e:Destroy()end end)end)
pcall(function()local t=W:FindFirstChildOfClass("Terrain")if t then t.WaterWaveSize=0;t.WaterWaveSpeed=0;t.WaterReflectance=0;t.WaterTransparency=0;pcall(function()t.Decoration=false end)end end)

-- ==================== NUEVA FUNCIÓN ANTI-LAG CORREGIDA ====================
local function esBasura(o)
    if not o or not o.Parent or not o.Name then return false end
    local n = string.lower(o.Name)
    if n:find("shibuya_plane") or n == "terrain" or n:find("baseplate") or n:find("floor") or n:find("ground") or n:find("map") then return false end
    local p = o.Parent
    while p do
        if p:FindFirstChild("Humanoid") then return false end
        local pn = p.Name and string.lower(p.Name) or ""
        if pn:find("dummy") or pn:find("training") or pn:find("target") or pn:find("weakest") then return false end
        p = p.Parent
    end
    if n:find("tree") or n:find("palm") or n:find("palmera") then return true end
    if o:IsA("BasePart") or o:IsA("MeshPart") then
        if n:find("garou") or n:find("dash") or n:find("water") then return false end
        if n:find("rock") or n:find("stone") or n:find("piedra") or n:find("roca") or n:find("debris") or n:find("fragment") or n:find("slam") or n:find("down") then return true end
        local sz = o.Size and o.Size.Magnitude or 0
        if sz < 50 and sz > 0.5 then return true end
    end
    return false
end

-- Eliminación directa inicial (sin acumular en tablas)
for _, o in ipairs(W:GetDescendants()) do
    pcall(function()
        if o:IsA("ParticleEmitter") or o:IsA("Trail") or o:IsA("Beam") or o:IsA("Smoke") or o:IsA("Fire") or o:IsA("Explosion") or o:IsA("Sparkles") then
            local n = string.lower(o.Name or "")
            if not n:find("garou") and not n:find("dash") and not n:find("water") then o:Destroy() end
        elseif esBasura(o) then
            o:Destroy()
        elseif o:IsA("BasePart") then
            o.CastShadow = false
        end
    end)
end

-- Limpieza de objetos NUEVOS sin saturar la memoria
workspace.DescendantAdded:Connect(function(o)
    task.defer(function()
        pcall(function()
            if o:IsA("ParticleEmitter") or o:IsA("Trail") or o:IsA("Beam") or o:IsA("Smoke") or o:IsA("Fire") or o:IsA("Explosion") or o:IsA("Sparkles") then
                local n = string.lower(o.Name or "")
                if not n:find("garou") and not n:find("dash") and not n:find("water") then o:Destroy() end
            elseif esBasura(o) then
                o:Destroy()
            elseif o:IsA("BasePart") then
                o.CastShadow = false
            end
        end)
    end)
end)

print("✅ ANTI-LAG MEMORY FIX ACTIVADO (Versión corregida)")
-- ==================== FIN DE LA CORRECCIÓN ====================

pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="🚀 FPS BOOST BETA ✅",Text="Filtro anti-saturación de memoria activo.",Duration=8})end)
end
local function chk()if PB.Text==KEY then MAIN()else EM.Text="❌ Contraseña incorrecta";PB.Text="";task.wait(2);EM.Text=""end end
CB.MouseButton1Click:Connect(chk)
PB.FocusLost:Connect(function(e)if e then chk()end end)
