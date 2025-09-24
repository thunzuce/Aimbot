shared.LoaderTitle = "Zuun"
shared.LoaderKeyFrames = {
    [1] = {1, 10},
    [2] = {2, 30},
    [3] = {3, 60},
    [4] = {2, 100}
}
local v2 = {
    LoaderData = {
        Name = shared.LoaderTitle or "A Loader",
        Colors = shared.LoaderColors or {
            Main = Color3.fromRGB(0, 0, 0),
            Topic = Color3.fromRGB(200, 200, 200),
            Title = Color3.fromRGB(255, 255, 255),
            LoaderBackground = Color3.fromRGB(40, 40, 40),
            LoaderSplash = Color3.fromRGB(3, 252, 3)
        }
    },
    Keyframes = shared.LoaderKeyFrames or {
        [1] = {1, 10},
        [2] = {2, 30},
        [3] = {3, 60},
        [4] = {2, 100}
    }
}
local v3 = {
    [1] = "",
    [2] = "",
    [3] = "",
    [4] = ""
}
function TweenObject(v178, v179, v180)
    game.TweenService:Create(v178, TweenInfo.new(v179, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v180):Play()
end
function CreateObject(v181, v182)
    local v183 = Instance.new(v181)
    local v184
    for v416, v417 in pairs(v182) do
        if v416 ~= "Parent" then
            v183[v416] = v417
        else
            v184 = v417
        end
    end
    v183.Parent = v184
    return v183
end
local function v4(v186, v187)
    local v188 = Instance.new("UICorner")
    v188.CornerRadius = UDim.new(0, v186)
    v188.Parent = v187
end
local v5 = CreateObject("ScreenGui", {
    Name = "Core",
    Parent = game.CoreGui
})
local v6 = CreateObject("Frame", {
    Name = "Main",
    Parent = v5,
    BackgroundColor3 = v2.LoaderData.Colors.Main,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.new(0, 0, 0, 0)
})
v4(12, v6)
local v7 = CreateObject("ImageLabel", {
    Name = "UserImage",
    Parent = v6,
    BackgroundTransparency = 1,
    Image = "rbxassetid://73787736741462",
    Position = UDim2.new(0, 15, 0, 10),
    Size = UDim2.new(0, 50, 0, 50)
})
v4(25, v7)
local v8 = CreateObject("TextLabel", {
    Name = "UserName",
    Parent = v6,
    BackgroundTransparency = 1,
    Text = "Zuun",
    Position = UDim2.new(0, 75, 0, 10),
    Size = UDim2.new(0, 200, 0, 50),
    Font = Enum.Font.GothamBold,
    TextColor3 = v2.LoaderData.Colors.Title,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
})
local v9 = CreateObject("TextLabel", {
    Name = "Top",
    TextTransparency = 1,
    Parent = v6,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 70),
    Size = UDim2.new(0, 301, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "Loader",
    TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 10,
    TextXAlignment = Enum.TextXAlignment.Left
})
local v10 = CreateObject("TextLabel", {
    Name = "Title",
    Parent = v6,
    TextTransparency = 1,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 90),
    Size = UDim2.new(0, 301, 0, 46),
    Font = Enum.Font.Gotham,
    RichText = true,
    Text = "<b>" .. v2.LoaderData.Name .. "</b>",
    TextColor3 = v2.LoaderData.Colors.Title,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
})
local v11 = CreateObject("Frame", {
    Name = "BG",
    Parent = v6,
    AnchorPoint = Vector2.new(0.5, 0),
    BackgroundTransparency = 1,
    BackgroundColor3 = v2.LoaderData.Colors.LoaderBackground,
    BorderSizePixel = 0,
    Position = UDim2.new(0.5, 0, 0, 70),
    Size = UDim2.new(0.8500000238418579, 0, 0, 24)
})
v4(8, v11)
local v12 = CreateObject("Frame", {
    Name = "Progress",
    Parent = v11,
    BackgroundColor3 = v2.LoaderData.Colors.LoaderSplash,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Size = UDim2.new(0, 0, 0, 24)
})
v4(8, v12)
local v13 = CreateObject("TextLabel", {
    Name = "StepLabel",
    Parent = v6,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 1, -25),
    Size = UDim2.new(1, -20, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "",
    TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Center,
    AnchorPoint = Vector2.new(0.5, 0.5)
})
function UpdateStepText(v191)
    v13.Text = v3[v191] or ""
end
function UpdatePercentage(v193, v194)
    TweenObject(v12, 0.5, {
        Size = UDim2.new(v193 / 100, 0, 0, 24)
    })
    UpdateStepText(v194)
end
TweenObject(v6, 0.25, {
    Size = UDim2.new(0, 346, 0, 121)
})
wait()
TweenObject(v9, 0.5, {
    TextTransparency = 0
})
TweenObject(v10, 0.5, {
    TextTransparency = 0
})
TweenObject(v11, 0.5, {
    BackgroundTransparency = 0
})
TweenObject(v12, 0.5, {
    BackgroundTransparency = 0
})
for v195, v196 in pairs(v2.Keyframes) do
    wait(v196[1])
    UpdatePercentage(v196[2], v195)
end
UpdatePercentage(100, 4)
TweenObject(v9, 0.5, {
    TextTransparency = 1
})
TweenObject(v10, 0.5, {
    TextTransparency = 1
})
TweenObject(v11, 0.5, {
    BackgroundTransparency = 1
})
TweenObject(v12, 0.5, {
    BackgroundTransparency = 1
})
wait(0.5)
TweenObject(v6, 0.25, {
    Size = UDim2.new(0, 0, 0, 0)
})
wait(0.25)
v5:Destroy()

-- [Phần tự động hóa gameplay với toggle]
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")

-- Current position of the character
local currentPos = character.PrimaryPart.Position

-- Two target coordinates for teleporting
local pos1 = Vector3.new(130.067, 3.254, 2766.13)
local pos2 = Vector3.new(-63.638, 3.254, 2766.966)

-- Calculate distances and select the closest coordinate
local distance1 = (currentPos - pos1).Magnitude
local distance2 = (currentPos - pos2).Magnitude
local targetPos = if distance1 < distance2 then pos1 else pos2

-- Teleport to the closest coordinate
character:SetPrimaryPartCFrame(CFrame.new(targetPos))

-- Find remote events (update these names based on your game)
local castEvent = RS:FindFirstChild("CastRod") -- Thay bằng tên RemoteEvent thực tế
local reelEvent = RS:FindFirstChild("Reel") -- Thay bằng tên RemoteEvent thực tế

-- Equip the rod
local backpack = player.Backpack
local rod = backpack:FindFirstChild("Starter Rod") or backpack:FindFirstChildOfClass("Tool")
if rod and not character:FindFirstChild(rod and rod.Name) then
    rod.Parent = character
    print("Equipped rod:", rod.Name)
else
    warn("No rod found in Backpack or already equipped")
end

-- Function to simulate continuous mouse clicks for "Click Fast"
local function simulateClickFast()
    local success, clickFastGui = pcall(function()
        return player.PlayerGui:WaitForChild("Main"):FindFirstChild("ClickFastFrame") -- Thay bằng đường dẫn GUI thực tế
    end)
    if success and clickFastGui and clickFastGui.Visible then
        print("ClickFast GUI found, simulating clicks")
        for i = 1, 100 do
            local success, err = pcall(function()
                UIS:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            end)
            if not success then
                warn("Click simulation failed: " .. err)
                local equippedRod = character:FindFirstChildOfClass("Tool")
                if equippedRod then
                    equippedRod:Activate()
                end
            end
            wait(0.01)
        end
    else
        warn("ClickFast GUI not found or not visible")
    end
end

-- Function to cast and handle the rod
local function castAndHandle()
    if not character or not character.Parent then
        character = player.Character or player.CharacterAdded:Wait()
        humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    end
    if castEvent then
        print("Firing CastRod event")
        castEvent:FireServer(targetPos)
    else
        local equippedRod = character:FindFirstChildOfClass("Tool")
        if equippedRod then
            print("Activating rod:", equippedRod.Name)
            equippedRod:Activate()
        else
            warn("No rod equipped")
        end
    end
    wait(3)
    simulateClickFast()
    if reelEvent then
        print("Firing Reel event")
        reelEvent:FireServer()
    else
        warn("No Reel event found")
    end
end

-- Toggle variable for automation
local isAutoEnabled = false
local autoLoop

-- Function to start/stop automation
local function toggleAutomation(state)
    isAutoEnabled = state
    print("Auto Farm toggled:", isAutoEnabled)
    if isAutoEnabled then
        autoLoop = game:GetService("RunService").Heartbeat:Connect(function()
            local success, err = pcall(castAndHandle)
            if not success then
                warn("Error in castAndHandle: " .. err)
            end
        end)
    else
        if autoLoop then
            autoLoop:Disconnect()
            autoLoop = nil
            print("Auto Farm stopped")
        end
    end
end

-- Load Fluent UI and create window
local success, v14 = pcall(function()
    return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)
if not success then
    warn("Failed to load Fluent UI: " .. v14)
    return
end

local v15 = v14:CreateWindow({
    Title = "zuun",
    SubTitle = "Premium Script",
    TabWidth = 160,
    Theme = "Dark",
    Acrylic = false,
    Size = UDim2.fromOffset(500, 320),
    MinimizeKey = Enum.KeyCode.End
})
local v16 = {
    Home = v15:AddTab({Title = "info"}),
    Main = v15:AddTab({Title = "farm"}),
    event = v15:AddTab({Title = "event"}),
    ITM = v15:AddTab({Title = "item"}),
    Setting = v15:AddTab({Title = "Setting"}),
    Teleport = v15:AddTab({Title = "Teleport"}),
    Shop = v15:AddTab({Title = "Shop"}),
    Misc = v15:AddTab({Title = "Misc"})
}

-- Add toggle to Farm tab
v16.Main:AddToggle("AutoFarm", {
    Title = "Auto Farm",
    Default = false
}, toggleAutomation)
