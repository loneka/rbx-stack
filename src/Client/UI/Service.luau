local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StateExtensions = require(script.Parent.StateExtensions)
local OnyxUI = require(ReplicatedStorage.Code.Packages.OnyxUI)
local Fusion = require(ReplicatedStorage.Code.Packages.Fusion)
local OnyxUITheme = require(script.Parent.Theme)

local Themer = OnyxUI.Themer

local Scope = Fusion.scoped(Fusion)

local UIService = {
	Holder = Instance.new("ScreenGui"),
}

function UIService:MountAll()
	for _, Module in ipairs(script.Parent.ScreenGuis:GetDescendants()) do
		local ScreenGui = require(Module)

		ScreenGui(Scope, {
			Parent = UIService.Holder,
		})
	end
end

function UIService:Start()
	StateExtensions:Initialize()
	StateExtensions:Start()

	Themer.Theme:is(OnyxUITheme):during(function()
		UIService:MountAll()
	end)
end

Themer.Theme = Fusion.Contextual(OnyxUITheme)

Scope:Hydrate(UIService.Holder) {
	Name = "Game",
	ResetOnSpawn = false,
	Parent = Players.LocalPlayer.PlayerGui,
}

return UIService
