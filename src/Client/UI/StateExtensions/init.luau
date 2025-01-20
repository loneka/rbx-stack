local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Bootloader = require(ReplicatedStorage.Code.Packages.Bootloader)

local function GetModules()
	local Modules = {}

	for _, Child in ipairs(script:GetChildren()) do
		if Child:IsA("ModuleScript") then
			Modules[Child.Name] = require(Child)
		end
	end

	return Modules
end

return Bootloader(GetModules())
