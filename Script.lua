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
  Name = "Контроль над инструментами"
})

Tab:AddToggle({
 Name = "Альтернативная килл аура",
 Default = false,
 Callback = function(Value)
   chjj = Value
    while chjj and task.wait() do
  local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
  if tool and (tool:FindFirstChild("Handle") or tool:FindFirstChildWhichIsA("BasePart")) then
    local handle, origgrip = (tool:FindFirstChild("Handle") or tool:FindFirstChildWhichIsA("BasePart")), tool.Grip
    
    local Chumanoid, Cdistance = nil, math.huge
for _, part in next, game.Workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position, 100) do
    if not part:IsDescendantOf(game.Players.LocalPlayer.Character) and part.Parent:FindFirstChildOfClass("Humanoid") and part.Parent:FindFirstChildOfClass("Humanoid"):GetState() ~= "Dead" then
        local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
        local distance = (part.Position - handle.Position).Magnitude 
        if distance < Cdistance then
            Cdistance = distance
            Chumanoid = humanoid 
        end
    end
end

    if Chumanoid then
      tool:Activate()
      handle.Massless = true 
      handle.Position = Chumanoid.RootPart.Position
      for _, part in next, tool:GetDescendants() do
        if part:IsA("BasePart") and part:FindFirstChildWhichIsA("TouchTransmitter") then
          coroutine.wrap(function()
           firetouchinterest(part, Chumanoid.RootPart, 0)
           firetouchinterest(part, Chumanoid.RootPart, 1)
          end)()
         elseif part:IsA("BasePart") and not part:FindFirstChildWhichIsA("TouchTransmitter") then
          part.Massless = true 
          part.Position = Chumanoid.RootPart.Position
        end
      end
    end
  end
end
   end    
})

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

Tab:AddToggle({
 Name = "Флинг v2",
 Default = false,
 Callback = function(Value)
   uue = Value
   local coje = game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function(speed)
  if speed > 0 and game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
   local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
bv.P = math.huge

   repeat task.wait()
  bv.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
  game.Players.LocalPlayer.SimulationRadius = math.huge
  if game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.FallingDown or game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.PlatformStanding or game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then
    game.Players.LocalPlayer.Character.Humanoid:ChangeState("GettingUp")
  end
  for _, part in next, game.Players.LocalPlayer.Character:GetDescendants() do
    if part:IsA("BasePart") then
      part.CustomPhysicalProperties = PhysicalProperties.new(100, 0, 0, 0, 0)
      part.AssemblyLinearVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 4000
      part.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 4000
    end
  end
until bv.Parent == nil or game.Players.LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Running
   pcall(function() bv:Destroy() end)
   game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
  end
end)

     task.spawn(function()
       repeat task.wait() until uue == false coje:Disconnect()
     end)
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

Tab:AddToggle({
 Name = "Притягивать ближайшие объекты к игрокам",
 Default = false,
 Callback = function(Value)
    yen = Value
    while yen and task.wait() do
  local humanoids = {}
for _, part in next, workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 50) do
    if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and not part:IsDescendantOf(game.Players.LocalPlayer.Character) and game.Players:GetPlayerFromCharacter(part.Parent) then
      if not table.find(humanoids, part.Parent:FindFirstChildOfClass("Humanoid")) then
        table.insert(humanoids, part.Parent:FindFirstChildOfClass("Humanoid"))
      end
    end
  end

  for _, humanoid in next, humanoids do
    for _, part in next, workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 75) do
      if part.Anchored == false and not part:IsDescendantOf(game.Players.LocalPlayer.Character) and not game.Players:GetPlayerFromCharacter(part.Parent) and not part:IsDescendantOf(humanoid.Parent) then
        game.Players.LocalPlayer.SimulationRadius = math.huge
        part.CustomPhysicalProperties = PhysicalProperties.new(100, 0, 0, 0, 0)
        part.CanCollide = false
        part.AssemblyLinearVelocity = (humanoid.RootPart.Position - part.Position).Unit * 500
        part.AssemblyAngularVelocity = Vector3.new(300, 300, 300)
        
        for _, bv in next, part:GetDescendants() do
          if bv:IsA("BodyMover") or bv:IsA("Constraint") then
            bv:Destroy()
          end
        end
      end
    end
    
  end
end
   end    
})

Tab:AddToggle({
 Name = "Притягивать ближайшие объекты к сущностям",
 Default = false,
 Callback = function(Value)
     syg = Value
     while syg and task.wait() do
  local humanoids = {}
for _, part in next, workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 50) do
    if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and not part:IsDescendantOf(game.Players.LocalPlayer.Character) then
      if not table.find(humanoids, part.Parent:FindFirstChildOfClass("Humanoid")) then
        table.insert(humanoids, part.Parent:FindFirstChildOfClass("Humanoid"))
      end
    end
  end

  for _, humanoid in next, humanoids do
    for _, part in next, workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 75) do
      if part.Anchored == false and not part:IsDescendantOf(game.Players.LocalPlayer.Character) and not game.Players:GetPlayerFromCharacter(part.Parent) and not part:IsDescendantOf(humanoid.Parent) then
        game.Players.LocalPlayer.SimulationRadius = math.huge
        part.CustomPhysicalProperties = PhysicalProperties.new(100, 0, 0, 0, 0)
        part.CanCollide = false
        part.AssemblyLinearVelocity = (humanoid.RootPart.Position - part.Position).Unit * 500
        part.AssemblyAngularVelocity = Vector3.new(300, 300, 300)
        
        for _, bv in next, part:GetDescendants() do
          if bv:IsA("BodyMover") or bv:IsA("Constraint") then
            bv:Destroy()
          end
        end
      end
    end
    
  end
end
   end    
})

Tab:AddToggle({
 Name = "Режим чёрной дыры",
 Default = false,
 Callback = function(Value)
  hjr = Value
while hjr and task.wait() do
  for _, part in next, workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position, 100) do
    if part.Anchored == false and not part:IsDescendantOf(game.Players.LocalPlayer.Character) and not game.Players:GetPlayerFromCharacter(part.Parent) and not part.Parent:FindFirstChildOfClass("Humanoid") and not part:FindFirstChild("BudgifyAlgPos") then
      game.Players.LocalPlayer.SimulationRadius = math.huge
      part.CanCollide = false
      part.CanTouch = false
      part.CanQuery = false
      part.CustomPhysicalProperties = PhysicalProperties.new(100, 0, 0, 0, 0)
      part.AssemblyAngularVelocity = Vector3.new(350, 350, 350)
      
     local attach1 = Instance.new("Attachment", part)
     local attach2 = Instance.new("Attachment", game.Players.LocalPlayer.Character.HumanoidRootPart)
     attach2.Position = Vector3.new(0, 0, 0)
     
     part.Destroying:Connect(function()
       attach2:Destroy()
     end)

     local alg = Instance.new("AlignPosition", game.Players.LocalPlayer.Character.HumanoidRootPart)
     alg.Name = "BudgifyAlgPos"
     alg.Attachment0 = attach1
     alg.Attachment1 = attach2
     alg.ApplyAtCenterOfMass = false
     alg.MaxForce = math.huge
     alg.MaxVelocity = math.huge
     alg.MaxAxesForce = Vector3.new(math.huge, math.huge, math.huge)
     alg.RigidityEnabled = true
     
     alg.Destroying:Connect(function()
       pcall(function() attach1:Destroy() end)
       pcall(function() attach2:Destroy() end)
     end)
     
     task.spawn(function()
       repeat task.wait() until hjr == false
       pcall(function() alg:Destroy() end)
       pcall(function() attach1:Destroy() end)
       pcall(function() attach2:Destroy() end)
     end)
      
      for _, bv in next, part:GetDescendants() do
        if bv:IsA("BodyMover") or (bv:IsA("Constraint") and bv.Name ~= "BudgifyAlgPos") then
          bv:Destroy()
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

Tab:AddToggle({
 Name = "Заморозить ближайших сущностей",
 Default = false,
 Callback = function(Value)
   ieuih = Value
    while ieuih and task.wait() do
  local humanoids = {}
for _, part in next, workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 70) do
    if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and not part:IsDescendantOf(game.Players.LocalPlayer.Character) and not game.Players:GetPlayerFromCharacter(part.Parent) then
      if not table.find(humanoids, part.Parent:FindFirstChildOfClass("Humanoid")) then
        table.insert(humanoids, part.Parent:FindFirstChildOfClass("Humanoid"))
      end
    end
  end

for _, humanoid in next, humanoids do
  sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
  humanoid.WalkSpeed = 0
  humanoid.JumpPower = 0
  
  for _, state in next, {"Running", "Jumping"} do
    pcall(function() humanoid:SetStateEnabled(state, false) end)
  end
  
  for _, part in next, humanoid.Parent:GetDescendants() do
    if part:IsA("BasePart") and isnetworkowner(part) then
      sethiddenproperty(part, "NetworkOwnershipRule", Enum.NetworkOwnership.Manual)
      sethiddenproperty(part, "Friction", math.huge)
      sethiddenproperty(part, "Elasticity", math.huge)
      
      if part:FindFirstChildWhichIsA("TouchTransmitter") then
        for _, con in next, getconnections(part.Touched) do
          con:Disconnect()
        end
      end
    end
  end
  
  humanoid:SetStateEnabled("PlatformStanding", true)
  humanoid.PlatformStand = true
  humanoid.EvaluateStateMachine = true
  
  if not (humanoid.RootPart and humanoid.RootPart:FindFirstChild("BudgifyFreezeHumPart")) then
    local part = Instance.new("Part", humanoid.RootPart)
    part.Name = "BudgifyFreezeHumPart"
    part.Anchored = true
    part.Size = Vector3.zero
    part.CFrame = humanoid.RootPart.CFrame
    part.CanCollide = false

    local rotate = Instance.new("Rotate", part)
    rotate.Part0 = humanoid.RootPart
    rotate.Part1 = part
    rotate.C0 = CFrame.new(0, 0, 0)
    
      task.spawn(function()
        repeat task.wait() until not isnetworkowner(part) or ieuih == false
        pcall(function() part:Destroy() end)
      end)
    end
  end
end
   end    
})

Tab:AddToggle({
 Name = "Забаговать ближайших сущностей",
 Default = false,
 Callback = function(Value)
   jush = Value
    while jush and task.wait(wait()) do
local humanoids = {}
for _, part in next, workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart", 10).Position, 75) do
    if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and not part:IsDescendantOf(game.Players.LocalPlayer.Character) and not game.Players:GetPlayerFromCharacter(part.Parent) then
      if not table.find(humanoids, part.Parent:FindFirstChildOfClass("Humanoid")) then
        table.insert(humanoids, part.Parent:FindFirstChildOfClass("Humanoid"))
      end
    end
  end

  for _, humanoid in next, humanoids do
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
    humanoid.RootPart.Position = Vector3.new(1000, 1000, 1000)
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
for _, part in next, plr.Character:GetDescendants() do
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
 Name = "Анти читерское откидывание объектами",
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

Tab:AddButton({
 Name = "Подчинить себе ближайшие объекты под контролем читера\n(Находится в разработке)",
 Callback = function()
local pos, cansit = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame, game.Players.LocalPlayer.Character.Humanoid:GetStateEnabled("Seated")
game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", false)
for _, part in next, game.Workspace:GetPartBoundsInRadius(pos.Position, 100) do
  if part.Anchored == false and not part:IsDescendantOf(game.Players.LocalPlayer.Character) and not game.Players:GetPlayerFromCharacter(part.Parent) and not part.Parent:FindFirstChildOfClass("Humanoid") then
    if not isnetworkowner(part) and not part:FindFirstChildOfClass("TouchTransmitter") and not part:FindFirstAncestorOfClass("Model").PrimaryPart then
      local countdown = os.clock()
    
      repeat task.wait()
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
        sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", math.huge)
        -- sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", math.huge)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame
      until isnetworkowner(part) or os.clock() - countdown >= 1
    elseif not isnetworkowner(part) and (part.Parent and part:FindFirstAncestorOfClass("Model") and part:FindFirstAncestorOfClass("Model").PrimaryPart ~= nil) then
      local countdown = os.clock()
      repeat task.wait()
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
        sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", math.huge)
        -- sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", math.huge)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part:FindFirstAncestorOfClass("Model").PrimaryPart.CFrame
      until isnetworkowner(part:FindFirstAncestorOfClass("Model").PrimaryPart) or os.clock() - countdown >= 1
    end
  end
end
game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", cansit)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
game.Players.LocalPlayer.Character.Humanoid:ChangeState("GettingUp", true)

for _, part in next, game.Players.LocalPlayer.Character:GetDescendants() do
  if part:IsA("BasePart") then
    part.Velocity = Vector3.zero
    part.AssemblyLinearVelocity = Vector3.zero
    part.AssemblyAngularVelocity = Vector3.zero
  end
end
   end    
})

local Tab = Window:MakeTab({
 Name = "Особое",
 Icon = "rbxassetid://4483345998",
 PremiumOnly = false
})

Tab:AddToggle({
 Name = "Клиентская нулевая задержка",
 Default = false,
 Callback = function(Value)
    hehn = Value
     if hehn == true then
       for _, func in next, {wait, task.wait} do
 local hook; hook = hookfunction(func, newcclosure(function(...)
    if not checkcaller() then
        return hook()
      else
        return hook(...)
     end
  end))
end
     else
       restorefunction(wait)
       restorefunction(task.wait)
     end
   end    
})

Tab:AddButton({
 Name = "Восстановить кнопку респавна",
 Callback = function()
     local a = Instance.new("BindableEvent")
a.Event:Connect(function()
  replicatesignal(game.Players.LocalPlayer.Kill)
end)

game.StarterGui:SetCore("ResetButtonCallback", a)
   end    
})

Tab:AddToggle({
 Name = "Увеличить радиус симуляции",
 Default = false,
 Callback = function(Value)
    oiebb = Value
     while oiebb and task.wait() do
  sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
  sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", math.huge)
  
  for _, plr in next, game.Players:GetPlayers() do
    if plr ~= game.Players.LocalPlayer then
      sethiddenproperty(plr, "SimulationRadius", 0)
      sethiddenproperty(plr, "MaxSimulationRadius", 0)
      sethiddenproperty(plr, "MaximumSimulationRadius", 0)
    end
  end
end
   end    
})
