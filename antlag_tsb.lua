-- TSB ANTI-LAG - DANIELSONRIESCRIPTS
local L=game:GetService("Lighting")local P=game:GetService("Players")local W=game:GetService("Workspace")local LP=P.LocalPlayer

-- VERIFICAR TSB
local ids={10449761463,14933485796}
local esTSB=false
for _,id in pairs(ids)do if game.PlaceId==id then esTSB=true break end end

if not esTSB then
    local pg=LP:WaitForChild("PlayerGui")
    local g=Instance.new("ScreenGui")g.Parent=pg
    local f=Instance.new("Frame")f.Size=UDim2.new(0,450,0,160)f.Position=UDim2.new(0.5,-225,0.5,-80)f.BackgroundColor3=Color3.fromRGB(0,0,0)f.BackgroundTransparency=0.4f.Parent=g
    local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,20)c.Parent=f
    local t=Instance.new("TextLabel")t.Size=UDim2.new(1,0,0,40)t.Position=UDim2.new(0,0,0,20)t.BackgroundTransparency=1t.Text="⚠️ JUEGO NO SOPORTADO"t.TextColor3=Color3.fromRGB(255,50,50)t.TextSize=20t.Font=Enum.Font.GothamBold t.Parent=f
    local m=Instance.new("TextLabel")m.Size=UDim2.new(1,0,0,60)m.Position=UDim2.new(0,0,0,65)m.BackgroundTransparency=1m.Text="ESTE SCRIPT ES BETA NO ES UNIVERSAL\nPOR AHORA FUNCIONA NADA MAS EN\nTHE STRONGEST BATTLEGROUNDS"m.TextColor3=Color3.fromRGB(255,255,255)m.TextSize=13m.Font=Enum.Font.Gothamm.Parent=f
    task.wait(2)g:Destroy()task.wait(0.5)LP:Kick("⚠️ ESTE SCRIPT SOLO FUNCIONA EN THE STRONGEST BATTLEGROUNDS")
    return
end

-- CONTRASEÑA
local pg=LP:WaitForChild("PlayerGui")
local passGui=Instance.new("ScreenGui")passGui.Name="PassGui"passGui.Parent=pg
local frame=Instance.new("Frame")frame.Size=UDim2.new(0,300,0,150)frame.Position=UDim2.new(0.5,-150,0.5,-75)frame.BackgroundColor3=Color3.fromRGB(30,30,40)frame.Parent=passGui
local corner=Instance.new("UICorner")corner.CornerRadius=UDim.new(0,15)corner.Parent=frame
local title=Instance.new("TextLabel")title.Size=UDim2.new(1,0,0,35)title.Position=UDim2.new(0,0,0,10)title.BackgroundTransparency=1title.Text="🔒 SCRIPT PROTEGIDO"title.TextColor3=Color3.fromRGB(255,200,0)title.TextSize=16title.Font=Enum.Font.GothamBold title.Parent=frame
local box=Instance.new("TextBox")box.Size=UDim2.new(0,200,0,35)box.Position=UDim2.new(0.5,-100,0,55)box.BackgroundColor3=Color3.fromRGB(20,20,30)box.TextColor3=Color3.fromRGB(255,255,255)box.TextSize=14box.Font=Enum.Font.Gothambox.PlaceholderText="Ingresa la contraseña"box.Text=""box.Parent=frame
local btn=Instance.new("TextButton")btn.Size=UDim2.new(0,100,0,35)btn.Position=UDim2.new(0.5,-50,0,105)btn.BackgroundColor3=Color3.fromRGB(255,200,0)btn.TextColor3=Color3.fromRGB(0,0,0)btn.TextSize=14btn.Font=Enum.Font.GothamBold btn.Text="ENTRAR"btn.Parent=frame
local err=Instance.new("TextLabel")err.Size=UDim2.new(1,0,0,25)err.Position=UDim2.new(0,0,0,145)err.BackgroundTransparency=1err.Text=""err.TextColor3=Color3.fromRGB(255,0,0)err.TextSize=12err.Font=Enum.Font.Gotham err.Parent=frame

local function start()
    passGui:Destroy()
    print("✅ INICIANDO")
    for _,g in pairs(pg:GetChildren())do if g.Name:find("Daniel")then g:Destroy()end end
    
    -- BIENVENIDA
    local w=Instance.new("ScreenGui")w.Name="Welcome"w.Parent=pg
    local b=Instance.new("Frame")b.Size=UDim2.new(0,350,0,90)b.Position=UDim2.new(0.5,-175,0.5,-45)b.BackgroundColor3=Color3.fromRGB(0,0,0)b.BackgroundTransparency=0.5b.Parent=w
    local bc=Instance.new("UICorner")bc.CornerRadius=UDim.new(0,20)bc.Parent=b
    local t1=Instance.new("TextLabel")t1.Size=UDim2.new(1,0,0,45)t1.Position=UDim2.new(0,0,0,5)t1.BackgroundTransparency=1t1.Text="🥔 MODO PATATA 🥔"t1.TextColor3=Color3.fromRGB(255,255,255)t1.TextSize=26t1.Font=Enum.Font.GothamBold t1.Parent=b
    local t2=Instance.new("TextLabel")t2.Size=UDim2.new(1,0,0,25)t2.Position=UDim2.new(0,0,0,55)t2.BackgroundTransparency=1t2.Text="Developed by DanielSonrieScripts"t2.TextColor3=Color3.fromRGB(255,200,0)t2.TextSize=12t2.Font=Enum.Font.Gotham t2.Parent=b
    task.wait(3)w:Destroy()
    
    -- FPS COUNTER
    local fpsGui=Instance.new("ScreenGui")fpsGui.Name="Fps"fpsGui.Parent=pg
    local fpsFrame=Instance.new("Frame")fpsFrame.Size=UDim2.new(0,70,0,25)fpsFrame.Position=UDim2.new(0,10,0,10)fpsFrame.BackgroundColor3=Color3.fromRGB(0,0,0)fpsFrame.BackgroundTransparency=0.5fpsFrame.Parent=fpsGui
    local fpsLabel=Instance.new("TextLabel")fpsLabel.Size=UDim2.new(1,0,1,0)fpsLabel.BackgroundTransparency=1fpsLabel.Text="FPS: --"fpsLabel.TextColor3=Color3.fromRGB(0,255,0)fpsLabel.TextSize=14fpsLabel.Font=Enum.Font.GothamBold fpsLabel.Parent=fpsFrame
    local lt=tick()local fc=0
    game:GetService("RunService").RenderStepped:Connect(function()
        fc=fc+1
        if tick()-lt>=1 then
            local fps=fc fc=0 lt=tick()
            fpsLabel.TextColor3=fps>=50 and Color3.fromRGB(0,255,0)or(fps>=30 and Color3.fromRGB(255,255,0)or Color3.fromRGB(255,0,0))
            fpsLabel.Text="FPS: "..fps
        end
    end)
    
    -- PANEL FPS BOOST
    local boost=Instance.new("ScreenGui")boost.Name="Boost"boost.Parent=pg
    local bf=Instance.new("Frame")bf.Size=UDim2.new(0,160,0,95)bf.Position=UDim2.new(0,10,1,-105)bf.BackgroundColor3=Color3.fromRGB(0,0,0)bf.BackgroundTransparency=0.5bf.Parent=boost
    local bt=Instance.new("TextLabel")bt.Size=UDim2.new(1,-10,0,22)bt.Position=UDim2.new(0,5,0,5)bt.BackgroundTransparency=1bt.Text="FPS BOOST BETA"bt.TextColor3=Color3.fromRGB(255,255,255)bt.TextSize=11bt.Font=Enum.Font.GothamBold bt.Parent=bf
    local items={"✓ rocas eliminadas","✓ modo patata","✓ efectos reducidos","✓ arboles removidos"}
    local y=30
    for _,v in pairs(items)do
        local l=Instance.new("TextLabel")l.Size=UDim2.new(1,-10,0,16)l.Position=UDim2.new(0,5,0,y)l.BackgroundTransparency=1l.Text=v l.TextColor3=Color3.fromRGB(0,255,0)l.TextSize=10l.Font=Enum.Font.Gothaml.Parent=bf
        y=y+18
    end
    task.delay(8,function()boost:Destroy()end)
    
    -- MARCA AGUA
    local wm=Instance.new("ScreenGui")wm.Name="WM"wm.Parent=pg
    local wml=Instance.new("TextLabel")wml.Size=UDim2.new(0,150,0,18)wml.Position=UDim2.new(1,-160,1,-30)wml.BackgroundTransparency=1wml.Text="DanielSonrieScripts"wml.TextColor3=Color3.fromRGB(255,255,255)wml.TextSize=10wml.Font=Enum.Font.Gotham wml.Parent=wm
    
    -- ELIMINAR BASURA
    for _,obj in pairs(W:GetDescendants())do
        pcall(function()
            local n=obj.Name and obj.Name:lower()or""
            if n:find("tree")or n:find("palm")or n:find("rock")or n:find("stone")or n:find("debris")then obj:Destroy()end
            if obj:IsA("ParticleEmitter")or obj:IsA("Smoke")or obj:IsA("Fire")then obj:Destroy()end
            if obj:IsA("BasePart")and obj.Size.Magnitude<10 and obj.Size.Magnitude>0.5 then obj:Destroy()end
        end)
    end
    
    W.DescendantAdded:Connect(function(obj)
        pcall(function()
            local n=obj.Name and obj.Name:lower()or""
            if n:find("tree")or n:find("palm")or n:find("rock")or n:find("stone")then obj:Destroy()end
            if obj:IsA("ParticleEmitter")or obj:IsA("Smoke")or obj:IsA("Fire")then obj:Destroy()end
        end)
    end)
    
    L.GlobalShadows=false
    for _,e in pairs(L:GetChildren())do if e:IsA("BloomEffect")or e:IsA("BlurEffect")then e.Enabled=false end end
    
    print("✅ ANTI-LAG TSB ACTIVADO")
end

btn.MouseButton1Click:Connect(function()
    if box.Text=="DanielSonrieScripts"then start()else err.Text="❌ Contraseña incorrecta"box.Text=""task.wait(2)err.Text=""end
end)
