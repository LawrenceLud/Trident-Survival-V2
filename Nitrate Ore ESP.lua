local uis = game:GetService("UserInputService")

_G.Enabled = true

uis.InputBegan:Connect(function(input, gp)
    if not gp then
        if input.KeyCode == Enum.KeyCode.V then
            _G.Enabled = not _G.Enabled
        end
    end
end)

local function addAdornmentsToModel(model)
    for _, v in pairs(model:GetDescendants()) do
        if v:IsA("MeshPart") or v:IsA("Part") then
            local adornment = Instance.new("BoxHandleAdornment")
            adornment.Adornee = v
            adornment.AlwaysOnTop = true
            adornment.ZIndex = 1
            adornment.Size = v.Size
            adornment.Color = BrickColor.new("Bright green")
            adornment.Transparency = 0.1
            adornment.Parent = v
        end
    end
end

local function updateAdornments(enabled)
    for _, model in pairs(game:GetService("ReplicatedStorage").Entities:GetChildren()) do
        if model:IsA("Model") and model.Name == "NitrateOre" then
            addAdornmentsToModel(model)
        end
    end

    if enabled then
        for _, model in pairs(game:GetService("ReplicatedStorage").Entities:GetChildren()) do
            if model:IsA("Model") and model.Name == "NitrateOre" then
                for _, v in pairs(model:GetDescendants()) do
                    if v:IsA("BoxHandleAdornment") then
                        v.Transparency = 0.1
                    end
                end
            end
        end
    else
        for _, model in pairs(game:GetService("ReplicatedStorage").Entities:GetChildren()) do
            if model:IsA("Model") and model.Name == "NitrateOre" then
                for _, v in pairs(model:GetDescendants()) do
                    if v:IsA("BoxHandleAdornment") then
                        v.Transparency = 1
                    end
                end
            end
        end
    end
end

while wait() do
    updateAdornments(_G.Enabled)
end
