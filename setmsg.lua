game.Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if plr:GetRankInGroup(34436790) >= 1 then
			local splittedString = string.split(msg, " ")
			local msg2 = table.concat(splittedString, " ", 3)
			if splittedString[1] == "/setmsg" then
				if splittedString[2] == "set" then
					game.ReplicatedStorage.MSGBar:Fire("set", tostring(msg2))
				elseif splittedString[2] == "destroy" then
					game.ReplicatedStorage.MSGBar:Fire("destroy")
				end
			end
		else
			print(plr.Name.." has attempted to change/destroy the setmessage without valid permissions")
		end
	end)
end)
