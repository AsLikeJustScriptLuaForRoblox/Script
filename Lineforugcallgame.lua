-- Alwi Hub Cracked Script V.1.2
-- getgenv().AutoLine = true
-- getgenv().Rejoiningtime = 10

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

