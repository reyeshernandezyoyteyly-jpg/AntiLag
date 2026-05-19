-- TSB ANTI-LAG | DanielSonrieScripts

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 🔍 DETECTAR TSB
local TSB_IDS = {
	10449761463,
	14933485796
}

local esTSB = false

for _,id in pairs(TSB_IDS) do
	if game.PlaceId == id then
		esTSB = true
		break
	end
end

-- ❌ NO ES TSB
if not esTSB then
	
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = "DanielSonrieScripts",
			Text = "Este script solo funciona en TSB",
			Duration = 5
		})
	end)

	return
end

print("✅ TSB DETECTADO")

-- 🔒 PASSWORD
local PasswordGui = Instance.new("ScreenGui")
PasswordGui.Name = "DanielPassword"
PasswordGui.ResetOnSpawn = false
PasswordGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0,300,0,170)
Frame.Position = UDim2.new(0.5,-150,0.5,-85)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,25)
Frame.Parent = PasswordGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0,15)
Corner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundTransparency = 1
Title.Text = "🔒 DanielSonrieScripts"
Title.TextColor3 = Color3.fromRGB(255,200,0)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

local Box = Instance.new("TextBox")
Box.Size = UDim2.new(0,220,0,35)
Box.Position = UDim2.new(0.5,-110,0,60)
Box.PlaceholderText = "Contraseña"
Box.Text = ""
Box.TextColor3 = Color3.new(1,1,1)
Box.BackgroundColor3 = Color3.fromRGB(30,30,35)
Box.Font = Enum.Font.Gotham
Box.TextSize = 14
Box.Parent = Frame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0,8)
BoxCorner.Parent = Box

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0,120,0,35)
Button.Position = UDim2.new(0.5,-60,0,110)
Button.Text = "ENTRAR"
Button.TextColor3 = Color3.new(0,0,0)
Button.BackgroundColor3 = Color3.fromRGB(255,200,0)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 14
Button.Parent = Frame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0,8)
BtnCorner.Parent = Button

local ErrorLabel = Instance.new("TextLabel")
ErrorLabel.Size = UDim2.new(1,0,0,20)
ErrorLabel.Position = UDim2.new(0,0,1,-20)
ErrorLabel.BackgroundTransparency = 1
ErrorLabel.Text = ""
ErrorLabel.TextColor3 = Color3.fromRGB(255,0,0)
ErrorLabel.TextSize = 12
ErrorLabel.Font = Enum.Font.Gotham
ErrorLabel.Parent = Frame

local PASSWORD = "DanielSonrieScripts"

-- 🚀 EJECUTAR ANTI LAG
local function iniciarScript()

	PasswordGui:Destroy()

	print("✅ SCRIPT INICIADO")

	-- 🌊 WATERMARK
	local WatermarkGui = Instance.new("ScreenGui")
	WatermarkGui.Name = "DanielWatermark"
	WatermarkGui.Parent = PlayerGui

	local Watermark = Instance.new("TextLabel")
	Watermark.Size = UDim2.new(0,180,0,22)
	Watermark.Position = UDim2.new(1,-190,1,-30)
	Watermark.BackgroundTransparency = 1
	Watermark.Text = "DanielSonrieScripts | Goat"
	Watermark.TextColor3 = Color3.new(1,1,1)
	Watermark.TextTransparency = 0.3
	Watermark.TextSize = 12
	Watermark.Font = Enum.Font.GothamBold
	Watermark.TextXAlignment = Enum.TextXAlignment.Right
	Watermark.Parent = WatermarkGui

	-- 🥔 MODO PATATA
	pcall(function()

		Lighting.GlobalShadows = false
		Lighting.FogEnd = 1000000
		Lighting.Brightness = 1

		for _,v in pairs(Lighting:GetChildren()) do
			if v:IsA("PostEffect") then
				v.Enabled = false
			end
		end

	end)

	-- 🚀 REMOVE EFFECTS
	for _,v in pairs(Workspace:GetDescendants()) do

		pcall(function()

			if v:IsA("ParticleEmitter") then
				v.Enabled = false
			end

			if v:IsA("Trail") then
				v.Enabled = false
			end

			if v:IsA("Beam") then
				v.Enabled = false
			end

			if v:IsA("Smoke") then
				v.Enabled = false
			end

			if v:IsA("Fire") then
				v.Enabled = false
			end

			if v:IsA("Explosion") then
				v.Visible = false
			end

		end)

	end

	-- 🔄 REMOVE NEW EFFECTS
	Workspace.DescendantAdded:Connect(function(v)

		pcall(function()

			if v:IsA("ParticleEmitter")
				or v:IsA("Trail")
				or v:IsA("Beam")
				or v:IsA("Smoke")
				or v:IsA("Fire") then

				v.Enabled = false
			end

		end)

	end)

	-- ✅ NOTIFICACION
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = "DanielSonrieScripts",
			Text = "🥔 Anti-Lag activado",
			Duration = 5
		})
	end)

	print("🚀 ANTI LAG ACTIVADO")
end

-- 🔑 PASSWORD CHECK
Button.MouseButton1Click:Connect(function()

	if Box.Text == PASSWORD then
		iniciarScript()
	else
		ErrorLabel.Text = "❌ Contraseña incorrecta"
	end

end)
