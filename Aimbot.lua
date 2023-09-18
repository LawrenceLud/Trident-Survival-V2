local Camera = game:GetService("Workspace").CurrentCamera
local UserInputService = game:GetService("UserInputService")

local _G = {}
_G.AimbotEnabled = false
_G.AimPartName = "Head" 

local function GetClosestPart()
    local MaximumDistance = math.huge
    local Target = nil

    for _, part in pairs(game:GetService("Workspace"):GetDescendants()) do
        if part:IsA("BasePart") and part.Name == _G.AimPartName then
            local partCenter = part.Position
            local ScreenPoint = Camera:WorldToScreenPoint(partCenter)
            local VectorDistance = (Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

            if VectorDistance < MaximumDistance then
                Target = part
                MaximumDistance = VectorDistance
            end
        end
    end

    return Target
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.UserInputType == Enum.UserInputType.MouseButton2 then
        _G.AimbotEnabled = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        _G.AimbotEnabled = false
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if _G.AimbotEnabled then
        local closestPart = GetClosestPart()
        if closestPart then
            local targetPosition = closestPart.Position
            local cameraPosition = Camera.CFrame.Position
            local newCFrame = CFrame.new(cameraPosition, targetPosition)
            Camera.CFrame = newCFrame
        end
    end
end)
