local DoorsFolder = game:GetService('Workspace'):WaitForChild('Vantage Interior Doors')

local RequiredTool = 'Door Key'

function onClick(Player)
	local Character = Player.Character or Player.CharacterAdded:Wait()

	if Character then
		local Backpack = Player:FindFirstChild('Backpack')
		local hasPermission = (Backpack:FindFirstChild(RequiredTool) or Character:FindFirstChild(RequiredTool)) or false

		if hasPermission then

		end
	end
end

local openAngle = -1.6
local closedAngle = 0
local openTime = 3

function setupDoor(Door)
	local ClickDetector = Door:FindFirstChildOfClass('ClickDetector')

	local doorHinge = Door:FindFirstChild('DoorHinge')
	local doorMotor = doorHinge:FindFirstChild('Motor')

	if not (doorHinge and doorMotor) then
		warn('Setup failed for', Door)
		return
	end

	if ClickDetector then
		ClickDetector.MouseClick:Connect(function(Player)
			local Character = Player.Character or Player.CharacterAdded:Wait()

			if Character then
				local Backpack = Player:FindFirstChild('Backpack')
				local hasPermission = (Backpack:FindFirstChild(RequiredTool) or Character:FindFirstChild(RequiredTool)) or false

				if hasPermission then
					if doorMotor.DesiredAngle == 0 then
						doorMotor.DesiredAngle = openAngle
					else
						doorMotor.DesiredAngle = closedAngle
					end
				end
			end
		end)
	end
end

function startSetup()
	for _, door in pairs(DoorsFolder:GetDescendants()) do
		if door.Name == 'Door1' then
			setupDoor(door)
		end
	end
end

startSetup()
