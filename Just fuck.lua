if game.PlaceId == 16984716324 then
    local DeltaLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AsLikeJustScriptLuaForRoblox/Privatev1/refs/heads/main/Gui%20Libary/Source%20GUI.lua"))()
    local Window = DeltaLib:CreateWindow("Rylu Hub | Candy :3", UDim2.new(0, 550, 0, 400))

    local UserProfile = Window:AddUserProfile()
    local HomeTab = Window:CreateTab("Home")
    local ControlsTab = Window:CreateTab("Main")
    local SettingsTab = Window:CreateTab("Settings")

    local WelcomeSection = HomeTab:CreateSection("Welcome")
    WelcomeSection:AddLabel("Welcome to Alwi Hub GUI V.1.0")
    WelcomeSection:AddLabel("Want Support? Join our Discord server :3")

    local StatusLabel = WelcomeSection:AddLabel("Status: Active - " .. os.date("%H:%M:%S"))

    WelcomeSection:AddButton("Copy Discord Link", function()
        setclipboard("https://discord.gg/TT4D5SJ2er")
        game.StarterGui:SetCore("SendNotification", {
            Title = "Copied!",
            Text = "Discord link copied to clipboard.",
            Duration = 3
        })
        StatusLabel:SetText("Status: Discord link copied!")
    end)

    WelcomeSection:AddButton("Set Username to Anonymous", function()
        UserProfile.SetDisplayName("Unknown")
        StatusLabel:SetText("Status: Username set to Unknown")
    end)

    getgenv().EggSpeed = 400
    getgenv().AutoEgg = false

    local TogglesSection = ControlsTab:CreateSection("Auto Farm Section")
    TogglesSection:AddButton("Instant UGC (if u have progress is wont works)", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("EasterService"):WaitForChild("RF"):WaitForChild("AttemptUGCPurchase"):InvokeServer()
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.7.0").knit.Services.EasterService.RF.AttemptUGCPurchase:InvokeServer()
    end) 

    TogglesSection:AddToggle("Auto Collect Egg", false, function(state)
        getgenv().AutoEgg = state

        if state then
            StatusLabel:SetText("Status: Auto Collect Enabled")

            spawn(function()
                while getgenv().AutoEgg and task.wait() do
                    local player = game.Players.LocalPlayer
                    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    local eggMain = nil

                    pcall(function()
                        while not eggMain do
                            local foundEgg = workspace:FindFirstChild("Seasonal")
                            if foundEgg and foundEgg:FindFirstChild("Easter") and foundEgg.Easter:FindFirstChild("Eggs") then
                                local eggModel = foundEgg.Easter.Eggs:FindFirstChild("EasterEgg")
                                if eggModel and eggModel:FindFirstChild("Main") then
                                    eggMain = eggModel.Main
                                end
                            end
                            if not eggMain then task.wait() end
                        end
                    end)

                    if hrp and eggMain then
                        local dist = (hrp.Position - eggMain.Position).Magnitude
                        local time = dist / getgenv().EggSpeed

                        game:GetService("TweenService"):Create(
                            hrp,
                            TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            { CFrame = eggMain.CFrame + Vector3.new(0, 3, 0) }
                        ):Play()

                        task.wait(time + 0.1)

                        local prompt = eggMain:FindFirstChild("ProximityPrompt")
                        if prompt then fireproximityprompt(prompt) end
                    end
                end
            end)
        else
            StatusLabel:SetText("Status: Auto Collect Disabled")
        end
    end)

    local TextScalingSection = SettingsTab:CreateSection("Text Scaling")

    TextScalingSection:AddToggle("Enable Text Scaling", true, function(enabled)
        if enabled then
            Window.TextScaling.Enable()
        else
            Window.TextScaling.Disable()
        end
        StatusLabel:SetText("Text scaling " .. (enabled and "enabled" or "disabled"))
    end)

    TextScalingSection:AddSlider("Min Text Size",16, 26, 16, function(value)
        Window.TextScaling.SetMinTextSize(value)
        StatusLabel:SetText("Min text size set to " .. value)
    end)
end
