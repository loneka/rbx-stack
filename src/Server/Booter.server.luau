local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Bootloader = require(ReplicatedStorage.Code.Bootloader)

local function GetServices()
	local ServiceModules = {}

	for _, Descendant in ipairs(script.Parent:GetDescendants()) do
		if Descendant:IsA("ModuleScript") and (string.match(Descendant.Name, "Service$") ~= nil) then
			table.insert(ServiceModules, Descendant)
		end
	end

	return ServiceModules
end

local Services = Bootloader(GetServices())

Services:Initialize()
Services:Start()

game:BindToClose(function()
	Services:Destroy()
end)
