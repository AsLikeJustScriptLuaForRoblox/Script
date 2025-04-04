-- Alwi Hub Cracked Script V.1.2
-- getgenv().AutoLine = true
-- getgenv().Rejoiningtime = 10
local GameIdList = {
    86989502458300, 101154632072819, 122765496738369,
    111366523908845, 123423404979327, 122707064710426,
    139903571045314, 103572742165356
}

local GameIdLine = game.PlaceId  
local isSupported = false  

for _, id in ipairs(GameIdList) do
    if GameIdLine == id then
        if not game.Loaded then
    game.Loaded:Wait()  
end
    
pcall(function()
    spawn(function()
        while wait() do
            if getgenv().AutoLine then
                local args = {
                    [1] = 1000000
                }

                game:GetService("ReplicatedStorage"):WaitForChild("foreverpack"):WaitForChild("Claim"):FireServer(unpack(args))
                game:GetService("ReplicatedStorage"):WaitForChild("CutLineEvent"):FireServer()
            end
        end
    end)
end)

pcall(function()
    spawn(function()
        coroutine.wrap(function()
            while true do
                wait(getgenv().Rejoiningtime)

                if #game:GetService("Players"):GetPlayers() <= 1 then
                    game:GetService("Players").LocalPlayer:Kick("\nRejoining...")
                    wait(0.5) 
                    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
                else
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
                end
                wait(0.1) 
            end
        end)()
    end)
end)
end

        isSupported = true
        break
    end
end

if not isSupported then
    print("Game unsupported")
end
