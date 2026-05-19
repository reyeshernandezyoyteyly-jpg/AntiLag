local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local juegosPermitidos = {
    [10449761463] = true,
    [14933485796] = true
}

print("CHECK INICIADO")

if not juegosPermitidos[game.PlaceId] then
    print("NO ES TSB")
    LocalPlayer:Kick("Este script es beta.\nSolo funciona en TSB.")
    return
end

print("SI ES TSB")
