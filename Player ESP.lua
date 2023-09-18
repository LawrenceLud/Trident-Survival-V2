local Players = game:GetService("Players")
local uis = game:GetService("UserInputService")

_G.Enabled = true

local function createAdornment(parent)
    local adornment = Instance.new("BoxHandleAdornment")
    adornment.Adornee = parent 
    adornment.AlwaysOnTop = true 
    adornment.ZIndex = 1 
    adornment.Size = parent.Size 
    adornment.Color = BrickColor.new("Bright green") 
    adornment.Transparency = 0.3 
    adornment.Parent = parent 
    return adornment
end

uis.InputBegan:Connect(function(input, gp)
    if not gp then
        if input.KeyCode == Enum.KeyCode.V then
            _G.Enabled = not _G.Enabled 
        end
    end
end)

for i,v in pairs(game:GetService("ReplicatedStorage").Player:GetDescendants()) do
    if v:IsA("MeshPart") or v:IsA("Part") then
        createAdornment(v) 
    end
end

for i,v in pairs(game.Workspace:GetChildren()) do
    if v:FindFirstChild("Head") then
        for i,v in pairs(v:GetChildren()) do
            if v:IsA("Part") then
                createAdornment(v) 
            end
        end
        for i,v in pairs(v:GetChildren()) do
            if v:IsA("MeshPart") then
                createAdornment(v) 
            end
        end
    end
end

while wait() do
    if _G.Enabled == true then
        -- Ativar o ESP
        for i,v in pairs(game:GetService("ReplicatedStorage").Player:GetDescendants()) do
            if v:IsA("MeshPart") or v:IsA("Part") then
                local adornment = v:FindFirstChild("BoxHandleAdornment")
                if adornment then
                    adornment.Transparency = 0.3 
                end
            end
        end

        for i,v in pairs(game.Workspace:GetChildren()) do
            if v:FindFirstChild("Head") then
                for i,v in pairs(v:GetChildren()) do
                    if v:IsA("Part") then
                        local adornment = v:FindFirstChild("BoxHandleAdornment")
                        if adornment then
                            adornment.Transparency = 0.3 
                        end
                    end
                end
                for i,v in pairs(v:GetChildren()) do
                    if v:IsA("MeshPart") then
                        local adornment = v:FindFirstChild("BoxHandleAdornment")
                        if adornment then
                            adornment.Transparency = 0.3 
                        end
                    end
                end
            end
        end
    end

    if _G.Enabled == false then
        for i,v in pairs(game:GetService("ReplicatedStorage").Player:GetDescendants()) do
            if v:IsA("MeshPart") or v:IsA("Part") then
                local adornment = v:FindFirstChild("BoxHandleAdornment")
                if adornment then
                    adornment.Transparency = 1 
                end
            end
        end

        for i,v in pairs(game.Workspace:GetChildren()) do
            if v:FindFirstChild("Head") then
                for i,v in pairs(v:GetChildren()) do
                    if v:IsA("Part") then
                        local adornment = v:FindFirstChild("BoxHandleAdornment")
                        if adornment then
                            adornment.Transparency = 1 
                        end
                    end
                end
                for i,v in pairs(v:GetChildren()) do
                    if v:IsA("MeshPart") then
                        local adornment = v:FindFirstChild("BoxHandleAdornment")
                        if adornment then
                            adornment.Transparency = 1 
                        end
                    end
                end
            end
        end
    end
end
