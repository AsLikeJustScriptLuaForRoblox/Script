-- Alwi Hub Cracked GUI Lua V.1.2
pcall(function()
    spawn(function()
        while wait() do
            if getgenv().AutoLine then
                local args = {
                    [1] = 10000
                }

                game:GetService("ReplicatedStorage"):WaitForChild("foreverpack"):WaitForChild("Claim"):FireServer(unpack(args))
                game:GetService("ReplicatedStorage"):WaitForChild("CutLineEvent"):FireServer()
            end
        end
    end)
end)

pcall(function()
    coroutine.wrap(function()
        if #game:GetService("Players"):GetPlayers() <= 1 then
            game:GetService("Players").LocalPlayer:Kick("\nRejoining...")
            wait(getgenv().Rejoiningtime)
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        else
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
        end
    end)()
end)
