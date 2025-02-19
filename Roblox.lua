local Camera = workspace.CurrentCamera  
local Players = game:GetService("Players")  
local RunService = game:GetService("RunService")  
local TweenService = game:GetService("TweenService")  
local UserInputService = game:GetService("UserInputService")  
local LocalPlayer = Players.LocalPlayer  

_G.AimbotEnabled = true  
_G.TeamCheck = false -- If true, the aimbot will only lock onto enemy team members.  
_G.AimPart = "UpperTorso" -- Lock onto "Torso" or "UpperTorso" instead of "Head".  
_G.Sensitivity = 0.1 -- Time taken for the aimbot to lock onto the target.  

-- FOV settings  
_G.CircleSides = 64  
_G.CircleColor = Color3.fromRGB(255, 255, 255)  
_G.CircleTransparency = 0.7  
_G.CircleRadius = 80  
_G.CircleFilled = false  
_G.CircleVisible = true  
_G.CircleThickness = 1  

-- Draw FOV circle  
local FOVCircle = Drawing.new("Circle")  
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)  
FOVCircle.Radius = _G.CircleRadius  
FOVCircle.Filled = _G.CircleFilled  
FOVCircle.Color = _G.CircleColor  
FOVCircle.Visible = _G.CircleVisible  
FOVCircle.Transparency = _G.CircleTransparency  
FOVCircle.NumSides = _G.CircleSides  
FOVCircle.Thickness = _G.CircleThickness  

-- Function to find the closest player inside the FOV  
local function GetClosestPlayer()  
    local MaximumDistance = _G.CircleRadius  
    local Target = nil  

    for _, v in ipairs(Players:GetPlayers()) do  
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then  
            if v.Character.Humanoid.Health > 0 then  
                if _G.TeamCheck and v.Team == LocalPlayer.Team then  
                    continue  
                end  

                local ScreenPoint = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)  
                local Distance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude  

                if Distance < MaximumDistance then  
                    Target = v  
                    MaximumDistance = Distance  
                end  
            end  
        end  
    end  

    return Target  
end  

-- Update FOV circle and auto-aim  
RunService.RenderStepped:Connect(function()  
    FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)  

    if _G.AimbotEnabled then  
        local target = GetClosestPlayer()  
        if target and target.Character and target.Character:FindFirstChild(_G.AimPart) then  
            local targetPart = target.Character[_G.AimPart]  
            TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),  
                {CFrame = CFrame.new(Camera.CFrame.Position, targetPart.Position)}):Play()  
        end  
    end  
end)
