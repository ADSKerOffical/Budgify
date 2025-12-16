local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()

local Window = OrionLib:MakeWindow({Name = "Budgify | RU", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
 Name = "Разрушение",
 Icon = "rbxassetid://4483345998",
 PremiumOnly = false
})

getgenv().isnetworkowner = newcclosure(function(part)
  return (part.ReceiveAge == 0 and gethiddenproperty(part, "NetworkIsSleeping") == false)
end)

local Section = Tab:AddSection({
  Name = "Контроль над TouchTransmitter"
})

Tab:AddToggle({
 Name = "Прикоснуть инструмент ко всем игрокам",
 Default= false,
 Callback = function(Value)
uijb = Value
       while uijb and game:GetService("RunService").RenderStepped:Wait() do
 pcall(function()
    local p = game.Players:GetPlayers()
    for i = 2, #p do local v = p[i].Character
local LP = game.Players.LocalPlayer
local tool = LP.Character and LP.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate()
                for i, v in next, v:GetChildren() do
                  if v:IsA("BasePart") then
                     for _, part in next, tool:GetDescendants() do
                       if part:IsA("BasePart") and part:FindFirstChild("TouchInterest") then
                         firetouchinterest(part, v, 0)
                         firetouchinterest(part, v, 1)
                       end
                     end
                  end
               end
            end
        end
     end)
 end
   end    
})

Tab:AddToggle({
 Name = "Прикоснуть инструмент ко всем сущностям",
 Default = false,
 Callback = function(Value)
ooj = Value
while ooj and game:GetService("RunService").RenderStepped:Wait() do
    local LP = game:GetService("Players").LocalPlayer
local tool = LP.Character and LP.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate()
                for i, v in next, workspace:GetDescendants() do
                    if v:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(v.Parent) then
                       for i, d in next, v.Parent:GetDescendants() do
                         if d:IsA("BasePart") then
                           for _, part in next, tool:GetDescendants() do
                             if part:IsA("BasePart") then
                              firetouchinterest(part, d, 0)
                              firetouchinterest(part, d, 1)
                            end
                          end
                       end
                    end
                 end
             end
         end
     end
 end    
})

Tab:AddToggle({
 Name = "Прикоснуть ближайшие объекты ко всем игрокам",
 Default = false,
 Callback = function(Value)
 bubuska = Value
        while bubuska and task.wait() do
 if game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name) and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
  game.Players.LocalPlayer.SimulationRadius = math.huge
  for _, part in next, workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 40) do
    if part:FindFirstChild("TouchInterest") then
      for _, player in next, game.Players:GetPlayers() do
         if player ~= game.Players.LocalPlayer and workspace:FindFirstChild(player.Name) then
           for _, parte in next, player.Character:GetChildren() do
             if parte:IsA("BasePart") then
               task.spawn(function()
                 firetouchinterest(part, parte, 0)
                 firetouchinterest(part, parte, 1)
               end)
             end
           end
        end
      end
    end
  end
 end
end
   end    
}) 

local Section = Tab:AddSection({
  Name = "Контроль над самим собой"
})

local hiddenfling = false
Tab:AddToggle({
    Name = "Флинг",
    Default = false,
    Callback = function(value)
 hiddenfling = value
            local hrp, c, vel, movel = nil, nil, nil, 0.1
            local player = game.Players.LocalPlayer

            while player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and hiddenfling == true do
                game:GetService("RunService").Heartbeat:Wait()

                local lp = player
                while hiddenfling == true and not (c and c.Parent and hrp and hrp.Parent) do
                    game:GetService("RunService").Heartbeat:Wait()
                    c = lp.Character
                    hrp = c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
                end

                if hiddenfling == true then
                    vel = hrp.Velocity
                    hrp.Velocity = vel * 10000 + Vector3.new(0, 100000, 0)
                    game:GetService("RunService").RenderStepped:Wait()

                    if c and c.Parent and hrp and hrp.Parent then
                        hrp.Velocity = vel
                    end

                    game:GetService("RunService").Stepped:Wait()

                    if c and c.Parent and hrp and hrp.Parent then
                        hrp.Velocity = vel + Vector3.new(0, movel, 0)
                        movel = movel * -1
                    end
                end
            end
end
})

local Section = Tab:AddSection({
  Name = "Контроль над машинами"
})

Tab:AddDropdown({
	Name = "Отправить в пустоту",
	Default = "",
	Options = {"Текущую машину", "Все машины"},
	Callback = function(Value)
		if Value == "Текущую машину" then
		  local function FindCar(instance)
  local current = instance.Parent
  
  local function FindPart(inst: Instance, partname: string)
    for _, part in next, inst:GetChildren() do
      if part:IsA("BasePart") and string.find(string.lower(part.Name), partname) then
        return part
      end
    end
    return nil
  end

  while current ~= nil and current ~= workspace and current ~= game do
    if current:IsA("Model") and (current.Name:lower():find("car") or current.Name:lower():find("vehicle") or FindPart(current, "wheel")) then
      return current
    end
    current = current.Parent
  end

  return nil
end

local posit = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
FindCar(game.Players.LocalPlayer.Character.Humanoid.SeatPart):PivotTo(CFrame.new(0, workspace.FallenPartsDestroyHeight + 10, 0))
game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
  task.wait(wait())
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = posit
		elseif Value == "Все машины" then
		  local function FindCar(instance)
  local current = instance.Parent
  
  local function FindPart(inst: Instance, partname: string)
    for _, part in next, inst:GetChildren() do
      if part:IsA("BasePart") and string.find(string.lower(part.Name), partname) then
        return part
      end
    end
    return nil
  end

  while current ~= nil and current ~= workspace and current ~= game do
    if current:IsA("Model") and (current.Name:lower():find("car") or current.Name:lower():find("vehicle") or FindPart(current, "wheel")) then
      return current
    end
    current = current.Parent
  end

  return nil
end

local posit = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
for _, seat in next, game.Workspace:GetDescendants() do
  if seat:IsA("VehicleSeat") and seat.Occupant == nil and FindCar(seat) and seat.Disabled == false then
    game.Players.LocalPlayer.SimulationRadius = math.huge
    repeat task.wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = seat.CFrame until seat.Occupant == game.Players.LocalPlayer.Character.Humanoid
    repeat task.wait() FindCar(game.Players.LocalPlayer.Character.Humanoid.SeatPart):PivotTo(CFrame.new(0, workspace.FallenPartsDestroyHeight + 10, 0)) until FindCar(game.Players.LocalPlayer.Character.Humanoid.SeatPart):GetPivot() == CFrame.new(0, workspace.FallenPartsDestroyHeight + 10, 0)
      task.wait(wait())
    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
    repeat task.wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = posit until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == posit
  end
end
		end
	end    
})

Tab:AddButton({
 Name = "Притянуть все машины",
 Callback = function()
local function FindCar(instance)
  local current = instance.Parent
  
  local function FindPart(inst: Instance, partname: string)
    for _, part in next, inst:GetChildren() do
      if part:IsA("BasePart") and string.find(string.lower(part.Name), partname) then
        return part
      end
    end
    return nil
  end

  while current ~= nil and current ~= workspace and current ~= game do
    if current:IsA("Model") and (current.Name:lower():find("car") or current.Name:lower():find("vehicle") or FindPart(current, "wheel")) then
      return current
    end
    current = current.Parent
  end

  return nil
end

local posit = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
for _, seat in next, game.Workspace:GetDescendants() do
  if seat:IsA("VehicleSeat") and seat.Occupant == nil and FindCar(seat) and seat.Disabled == false then
    game.Players.LocalPlayer.SimulationRadius = math.huge
    repeat task.wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = seat.CFrame until seat.Occupant == game.Players.LocalPlayer.Character.Humanoid
    repeat task.wait() FindCar(game.Players.LocalPlayer.Character.Humanoid.SeatPart):PivotTo(posit) until FindCar(game.Players.LocalPlayer.Character.Humanoid.SeatPart):GetPivot() == posit
      task.wait(wait())
    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
  end
end
   end    
})

local Section = Tab:AddSection({
  Name = "Контроль над объектами"
})

Tab:AddToggle({
 Name = "Откидывать ближайшие объекты",
 Default = false,
 Callback = function(Value)
 oppja = Value
while oppja and task.wait() do
  if game.Players.LocalPlayer.Character then
local parts = workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 80)
  for _, part in ipairs(parts) do
    if part and part.Anchored == false and not part:IsDescendantOf(game.Players.LocalPlayer.Character) and not game.Players:FindFirstChild(part.Parent.Name) then
game.Players.LocalPlayer.SimulationRadius = math.huge
part.AssemblyLinearVelocity = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Unit * -800
part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
  if part:FindFirstChild("PrimaryPart") ~= nil and not part.PrimaryPart:IsDescendantOf(game.Players.LocalPlayer.Character) and not part.PrimaryPart.Anchored and not game.Players:FindFirstChild(part.PrimaryPart.Parent.Name) then
     part.Velocity = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.PrimaryPart.Position).Unit * -800
  end
  if part:GetRootPart() and not part:GetRootPart():IsDescendantOf(game.Players.LocalPlayer.Character) and not part:GetRootPart().Anchored and not game.Players:FindFirstChild(part:GetRootPart().Parent.Name) then
     part:GetRootPart().AssemblyLinearVelocity = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part:GetRootPart().Position).Unit * -800
  end
      end
    end
  end
end   
   end    
})

local Section = Tab:AddSection({
  Name = "Контроль над сущностями"
})

Tab:AddToggle({
 Name = "Убить ближайших сущностей",
 Default = false,
 Callback = function(Value)
yoo = Value
while yoo and task.wait() do
 if workspace:FindFirstChild(game.Players.LocalPlayer.Name) and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
   local parts = workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 50)
    for _, part in next, parts do
      if part.Anchored == false and not game.Players:GetPlayerFromCharacter(part.Parent) and part.Parent:FindFirstChildOfClass("Humanoid") then
       local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
        game.Players.LocalPlayer.SimulationRadius = math.huge
        
        humanoid.Health = 0
        humanoid:TakeDamage(math.huge)
        humanoid:ChangeState("Dead") 
        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
        humanoid.JumpHeight = 0
        humanoid.Sit = true
        humanoid.PlatformStand = true
        humanoid.EvaluateStateMachine = false
        humanoid:UnequipTools()
        
        replicatesignal(humanoid.ServerBreakJoints)
        
        for _, part in next, humanoid.Parent:GetDescendants() do
           if part:IsA("BasePart") then
   part.CanCollide = false
   part.CanTouch = false
   sethiddenproperty(part, "LocalSimulationValidation", 0)
   part.Velocity = Vector3.new(0, -1000, 0)
   part.AssemblyAngularVelocity = Vector3.new(0, -1000, 0)
   part.AssemblyLinearVelocity = Vector3.new(0, -1000, 0)
           end
        end
      end
    end
  end
 end
   end    
})

local Tab = Window:MakeTab({
 Name = "Защита",
 Icon = "rbxassetid://4483345998",
 PremiumOnly = false
})

Tab:AddToggle({
 Name = "Невозможность сесть",
 Default = false,
 Callback = function(Value)
         game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):SetStateEnabled("Seated", not Value)
   end    
})

Tab:AddToggle({
 Name = "Анти bang",
 Default = false,
 Callback = function(Value)
  kiudi = Value
     while kiudi and task.wait() do
       for _, player in next, game.Players:GetPlayers() do
         if player ~= game.Players.LocalPlayer and game.Workspace:FindFirstChild(player.Name) and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude <= 10 then
           for _, anim in next, player.Character.Humanoid:GetPlayingAnimationTracks() do
              if anim.Animation.AnimationId == "rbxassetid://148840371" or anim.Animation.AnimationId == "rbxassetid://5918726674" then
    game:GetService("RunService").Heartbeat:Wait()
    last_pick_sin_mrazy = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9e8, workspace.FallenPartsDestroyHeight + 1, 9e8) 
    game:GetService("RunService").Heartbeat:Wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = last_pick_sin_mrazy
              end
           end
         end
       end
     end
   end    
})

Tab:AddToggle({
 Name = "Анти флинг",
 Default = false,
 Callback = function(Value)
jhg = Value
     while jhg and task.wait() do
       for _, plr in next, game:GetService("Players"):GetPlayers() do
         if plr ~= game:GetService("Players").LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
for _, part in next, plr.Character:GetChildren() do
  if part:IsA("BasePart") then
 part.CanCollide = not jhg
 part.CanTouch = not jhg
 part.AssemblyLinearVelocity = Vector3.zero
 part.AssemblyAngularVelocity = Vector3.zero
 part.Velocity = Vector3.zero
 part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
  end
end
         end
       end
     end
   end    
})

Tab:AddToggle({
 Name = "Анти пустота",
 Default = false,
 Callback = function(Value)
      local function getrespawn(): Instance
  for _, part in next, workspace:GetDescendants() do
    if part:IsA("SpawnLocation") then
      return part
   end
  end
end

local thnei = Value
local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()

while thnei and task.wait() do
char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
  if char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart.CFrame.Y <= workspace.FallenPartsDestroyHeight + 10 then
    if getrespawn() then
 char.HumanoidRootPart.CFrame = getrespawn().CFrame
 char.HumanoidRootPart.Velocity = Vector3.zero
     else
 char.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
 char.HumanoidRootPart.Velocity = Vector3.zero
    end
  end
end
   end    
})

Tab:AddToggle({
 Name = "Игнорирование простых сущностей",
 Default = false,
 Callback = function(Value)
     jdge = Value
while jdge and task.wait() do
  local humanoids = {}
for _, part in next, workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position, 50) do
    if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and not part:IsDescendantOf(game.Players.LocalPlayer.Character) then
      if not table.find(humanoids, part.Parent:FindFirstChildOfClass("Humanoid")) then
        table.insert(humanoids, part.Parent:FindFirstChildOfClass("Humanoid"))
      end
    end
  end

  for _, humanoid in next, humanoids do
   game.Players.LocalPlayer.SimulationRadius = math.huge
    for _, part in next, humanoid.Parent:GetDescendants() do
      if part:IsA("BasePart") then
        part.CanTouch = not jdge
        part.CanQuery = not jdge
      end
    end
  end
end
   end    
})

Tab:AddToggle({
 Name = "Анти откидывание объектами",
 Default = false,
 Callback = function(Value)
  hueey = Value
     while hueey and game:GetService("RunService").PreSimulation:Wait() do
       if game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name) and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
         game.Players.LocalPlayer.SimulationRadius = math.huge
         sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", math.huge)
         sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", math.huge)
         
         for _, part in next, workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 50) do
           if part.Anchored == false and not isnetworkowner(part) and part.Velocity.Magnitude >= 5 and not game.Players:GetPlayerFromCharacter(part.Parent) then
              part.Velocity = Vector3.zero
              part.AssemblyLinearVelocity = Vector3.zero
              part.AssemblyAngularVelocity = Vector3.zero
              part.CanCollide = isnetworkowner(part)
              part.CanTouch = isnetworkowner(part)
              part.CanQuery = isnetworkowner(part)
              part.Massless = not isnetworkowner(part)
              part:ResetPropertyToDefault("CustomPhysicalProperties")
              
             for _, mov in next, part:GetDescendants() do
               if mov:IsA("BodyMover") or mov:IsA("Constraint") then
                 mov:Destroy()
               end
             end
           end
         end
       end
     end
   end    
})

Tab:AddToggle({
 Name = "Анти читерский контроль с помощью чата",
 Default = false,
 Callback = function(Value)
   djue = Value
      while djue and task.wait() do
        if game.TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
 game:GetService("RunService").Heartbeat:Connect(function()
   for _, player in next, game.Players:GetPlayers() do
     for _, con in next, getconnections(player.Chatted) do
       con:Disconnect()
     end
   end
 end)
elseif game.TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
  game:GetService("RunService").Heartbeat:Connect(function()
    for _, con in next, getconnections(game.TextChatService.MessageReceived) do
      con:Disconnect()
    end
  end)
end
      end
   end    
})
