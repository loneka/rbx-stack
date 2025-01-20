local ReplicatedStorage = game:GetService("ReplicatedStorage")

local OnyxUI = require(ReplicatedStorage.Code.Packages.OnyxUI)
local Fusion = require(ReplicatedStorage.Code.Packages.Fusion)

local Themer = OnyxUI.Themer
local Util = OnyxUI.Util

local Scope = Fusion.scoped(Fusion)

local Theme = Themer.NewTheme(Scope, {
	Colors = {
		Primary = {
			Main = Util.Colors.Black,
		},
		Secondary = {
			Main = Util.Colors.White,
		},
		Accent = {
			Main = Util.Colors.White,
		},

		Neutral = {
			Main = Util.Colors.Gray["300"],
		},
		NeutralContent = {
			Main = Util.Colors.Gray["800"],
		},

		Base = {
			Main = Util.Colors.White,
		},
		BaseContent = {
			Main = Util.Colors.Black,
		},

		Success = {
			Main = Util.Colors.Green["500"],
		},
		Error = {
			Main = Util.Colors.Red["500"],
		},
		Warning = {
			Main = Util.Colors.Amber["500"],
		},
		Info = {
			Main = Util.Colors.Cyan["400"],
		},
	},
	Font = {
		Body = "rbxassetid://12187368625",
		Heading = "rbxassetid://12187368625",
		Monospace = "rbxassetid://12187368625",
	},
	FontWeight = {
		Body = Enum.FontWeight.Medium,
		Bold = Enum.FontWeight.Bold,
		Heading = Enum.FontWeight.ExtraBold,
	},
	TextSize = {
		Base = 22,
	},
	CornerRadius = {
		Base = 0,
	},
	StrokeThickness = {
		Base = 2,
	},
	Spacing = {
		Base = 20,
	},
	SpringSpeed = {
		Base = 50,
	},
	SpringDampening = {
		Base = 1.5,
	},
	Sound = {
		Click = Scope:New "Sound" {
			SoundId = "rbxassetid://9117418796",
			Volume = 1.5,
		},
		Switch = Scope:New "Sound" {
			SoundId = "rbxassetid://9117191554",
			Volume = 1.25,
		},
		Focus = Scope:New "Sound" {
			SoundId = "rbxassetid://9117418796",
			Volume = 1.5,
		},
	},
	Emphasis = {
		Light = 0.1,
		Regular = 0.15,
		Strong = 0.2,
		Contrast = 1,
	},
})

return Theme
