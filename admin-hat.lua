lp = game.Players:GetPlayerFromCharacter(script.Parent.Parent.Parent)
lpchar = lp.Character
prefix = ";"

local commands = {
	["stopmusic"] = function()
		for i,v in pairs(game.Workspace:GetChildren()) do
			if v:IsA("Sound") then
				v:Stop()
			end
		end
	end;

	["musicurl"] = function(args)
		if #args ~= 1 then
			chat("you may only have one argument for this command.")
			return
		end
		musicId = args[1]
		s = Instance.new("Sound", game.Workspace)
		s.Volume = 1
		s.SoundId = musicId --use a full url. http://finobe.com/asset?id=(id) or Roblox's http://roblox.com/asset?id=
		m = Instance.new("Message", game.Workspace)
		m.Text = "Loading audio."
		s:Play()
		wait(2)
		s:Stop()
		wait(2)
		s:Play()
		m:remove()
	end;
	
	["args"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			local listofargs = ""
			for i = 1, #args do
				if i ~= 1 then
					listofargs = listofargs .. ", " .. args[i]
				else
					listofargs = args[i]
				end
			end
			chat(#args .." arguments: ".. listofargs)
		end
	end;
	
	["kill"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					plrs[i].Character:BreakJoints() --if that somehow doesn't work, then...
					if plrs[i].Character:FindFirstChild("Humanoid") then
						if not plrs[i].Character.Humanoid.Health == 0 then
							plrs[i].Character.Humanoid.Health = 0
						end
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;
	
	["paralyze"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
			return
		end
		if findPlayer() ~= nil then
			victims = findPlayer()
			for i = 1, #victims do
				victims[i].Character.Humanoid:Destroy()
			end
		else
			chat("can't find ".. args[1])
		end
	end;

	["kick"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						plrs[i].Character:remove()
						Instance.new("Message", plrs[i].PlayerGui).Text = "You have been kicked from this game."
						wait(3)
						plrs[i]:remove()
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["respawn"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						plrs[i].Character:remove()
						wait(1)
						plrs[i]:LoadCharacter()
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["sparkles"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						Instance.new("Sparkles", plrs[i].Character.Torso)
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["smoke"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						Instance.new("Smoke", plrs[i].Character.Torso)
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["fire"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						Instance.new("Fire", plrs[i].Character.Torso)
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["unsparkles"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						for i,v in pairs(plrs[i].Character.Torso:GetChildren()) do
							if v.Name == "Sparkles" then
								v:Remove()
							end
						end
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["unsmoke"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						for i,v in pairs(plrs[i].Character.Torso:GetChildren()) do
							if v.Name == "Smoke" then
								v:Remove()
							end
						end
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["unfire"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						for i,v in pairs(plrs[i].Character.Torso:GetChildren()) do
							if v.Name == "Fire" then
								v:Remove()
							end
						end
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["jump"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						plrs[i].Character.Humanoid.Jump = true
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["sit"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						plrs[i].Character.Humanoid.Sit = true
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["stun"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						plrs[i].Character.Humanoid.PlatformStand = true
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["unstun"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						plrs[i].Character.Humanoid.PlatformStand = false
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["god"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						plrs[i].Character.Humanoid.MaxHealth = math.huge()
						plrs[i].Character.Humanoid.Health = math.huge()
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["ungod"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						plrs[i].Character.Humanoid.MaxHealth = 100
						plrs[i].Character.Humanoid.Health = 100
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["ff"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						Instance.new("ForceField", plrs[i].Character)
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;

	["unff"] = function(args)
		if #args == 0 then
			chat("you need at least 1 argument for this command.")
		else
			for i = 1, #args do
				if findPlayer(args[i]) ~= nil then
					local plrs = findPlayer(args[i])
					for i = 1, #plrs do
						for i,v in pairs(plrs[i].Character:GetChildren()) do
							if v:IsA("ForceField") then
								v:remove()
							end
						end
					end
				else
					chat("can't find the player(s)")
				end
			end
		end
	end;
}

--==~~ stuff that makes things do the thing. --==~~

function chat(msg)
	game:GetService("Chat"):Chat(lpchar.Head, "[cfox] ".. msg, Enum.ChatColor.Red)
end

function findPlayer(nameString)
    local matches = {}
	if string.lower(nameString) == "me" then
		table.insert(matches, lp)
		return matches
	end
	if string.lower(nameString) == "all" then
		for i,v in pairs(game.Players:GetChildren()) do
			table.insert(matches, v)
		end
		return matches
	end
	if string.lower(nameString) == "others" then
		for i,v in pairs(game.Players:GetChildren()) do
			if not v == lp then
				table.insert(matches, v)
			end
			return matches
		end
	end
    for i,v in ipairs(game.Players:GetPlayers()) do
        if string.lower(v.Name):match(string.lower(nameString)) then
            table.insert(matches, v)
        end
    end
    if #matches ~= 0 then
        return matches
    else
        return nil
    end
end

local function parse(msg)
	if string.match(msg, "^".. prefix) then
		return string.gsub(msg, string.match(msg, "^".. prefix), '', 1)
	else
		return false
	end
end

lp.Chatted:connect(function(msg)
	if not parse(msg) == false then
		msg = parse(msg)
		
		local args = {}
		for arg in string.gmatch(msg, "[^%s]+") do
			table.insert(args, arg)
		end
		
		local cmdName = args[1]
		table.remove(args, 1)
		local cmd = commands[cmdName]
		
		if cmd ~= nil then
			cmd(args)
		end
	end
end)

h = Instance.new("Hint", lp.PlayerGui).Text = "cfox commands loaded."
wait(3)
h:remove()
