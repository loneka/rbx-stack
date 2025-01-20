local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StateExtensions = require(script.Parent.StateExtensions)
local OnyxUI = require(ReplicatedStorage.Code.Packages.OnyxUI)
local Fusion = require(ReplicatedStorage.Code.Packages.Fusion)
local Theme = require(script.Parent.Theme)

local Themer = OnyxUI.Themer

local Viewport = function(Props)
	local ReturnedGuis = {}

	for _, GuiModule in ipairs(script.Parent.ScreenGuis:GetChildren()) do
		local GuiNameSplit = string.split(GuiModule.Name, ".")
		local FileSuffix = GuiNameSplit[2]

		if GuiModule:IsA("ModuleScript") and not FileSuffix then
			local Gui = require(GuiModule)

			table.insert(
				ReturnedGuis,
				Gui {
					Name = GuiModule.Name,
					Parent = Props.Target,
				}
			)
		end
	end

	return ReturnedGuis
end

return function(Target)
	local Scope = Fusion.scoped(Fusion, {
		Viewport = Viewport,
	})

	StateExtensions:Initialize()
	StateExtensions:Start()

	Themer.Theme:is(Theme):during(function()
		Scope:Viewport {
			Target = Target,
		}
	end)

	return function()
		Scope:doCleanup()
	end
end
