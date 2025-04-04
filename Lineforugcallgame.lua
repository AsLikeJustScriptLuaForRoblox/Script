-- Alwi Hub Cracked Script V1.2
-- getgenv().AutoLine = getgenv().AutoLine or true
-- getgenv().Rejoiningtime = getgenv().Rejoiningtime or 10
-- getgenv().Money = getgenv().Money or 100000  

local GameIdList = {
    86989502458300, 101154632072819, 122765496738369,
    111366523908845, 123423404979327, 122707064710426,
    139903571045314, 103572742165356
}

local placeId = game.PlaceId  
if not table.find(GameIdList, placeId) then
    print("Game unsupported")
    return
end

if not game.Loaded then game.Loaded:Wait() end  

getrenv().ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage")) 
getrenv().Players = cloneref(game:GetService("Players")) 
getrenv().TeleportService = cloneref(game:GetService("TeleportService")) 

spawn(function()
    while task.wait() do
        if getgenv().AutoLine then
            local foreverpack = getrenv().ReplicatedStorage:FindFirstChild("foreverpack")
            local Claim = foreverpack and foreverpack:FindFirstChild("Claim")
            local CutLineEvent = getrenv().ReplicatedStorage:FindFirstChild("CutLineEvent")

            if Claim then
                Claim:FireServer(getgenv().Money)
            end
            if CutLineEvent then
                CutLineEvent:FireServer()
            end
        end
    end
end)

spawn(function()
    while task.wait(getgenv().Rejoiningtime) do
        if #getrenv().Players:GetPlayers() <= 1 then
            getrenv().Players.LocalPlayer:Kick("\nRejoining...")
            task.wait(0.5)
            getrenv().TeleportService:Teleport(placeId, getrenv().Players.LocalPlayer)
        else
            getrenv().TeleportService:TeleportToPlaceInstance(placeId, game.JobId, getrenv().Players.LocalPlayer)
        end
    end
end)
