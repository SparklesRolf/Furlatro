--[[

Welcome to the source code for Furlatro! Everything is organized in their respective LUA file
in the items subfolder. All code here is just config and data tables that the mod needs.

All code referenced from the mod description is labeled from their originating mod with function
purpouses

--]]

local furry_mod = SMODS.current_mod
local config = SMODS.current_mod.config

furry_mod.config_tab = function() -- Config Tab
    return {n = G.UIT.ROOT, config = {align = "m", r = 0.1, padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 6}, nodes = {
        {n = G.UIT.R, config = {align = "cl", padding = 0, minh = 0.1}, nodes = {}},

        {n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
            {n = G.UIT.C, config = {align = "cl", padding = 0.1}, nodes = {
                create_toggle{col = true, label = "", scale = 1, w = 0, shadow = true, ref_table = furry_mod.config, ref_value = "star_suit"},               
            }},
            {n = G.UIT.C, config = {align = "cl", padding = 0.05}, nodes = {
                {n = G.UIT.T, config = {text = localize("fur_startoggle"), shadow = true,  scale = 0.45, colour = G.C.UI.TEXT_LIGHT }},               
            }},
			{n = G.UIT.C, config = {align = "cr", padding = 0.05}, nodes = {
                {n = G.UIT.T, config = {text = localize("fur_restartrecommended"), shadow = true, scale = 0.23, colour = G.C.UI.TEXT_LIGHT }},               
            }},
        }},

        {n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
            {n = G.UIT.C, config = {align = "cl", padding = 0.1}, nodes = {
                create_toggle{col = true, label = "", scale = 1, w = 0, shadow = true, ref_table = furry_mod.config, ref_value = "poker_hands"},               
            }},
            {n = G.UIT.C, config = {align = "cl", padding = 0.05}, nodes = {
                {n = G.UIT.T, config = {text = localize("fur_pokerhands"), shadow = true,  scale = 0.45, colour = G.C.UI.TEXT_LIGHT }},               
            }},
            {n = G.UIT.C, config = {align = "cr", padding = 0.05}, nodes = {
                {n = G.UIT.T, config = {text = localize("fur_restartrequired"), shadow = true, scale = 0.23, colour = G.C.UI.TEXT_LIGHT }},               
            }},
        }},

        {n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
            {n = G.UIT.C, config = {align = "cl", padding = 0.1}, nodes = {
                create_toggle{col = true, label = "", scale = 1, w = 0, shadow = true, ref_table = furry_mod.config, ref_value = "complex_jokers"},               
            }},
            {n = G.UIT.C, config = {align = "cl", padding = 0.05}, nodes = {
                {n = G.UIT.T, config = {text = localize("fur_complexjokers"), shadow = true,  scale = 0.45, colour = G.C.UI.TEXT_LIGHT }},               
            }},
            {n = G.UIT.C, config = {align = "cr", padding = 0.05}, nodes = {
                {n = G.UIT.T, config = {text = localize("fur_restartrequired"), shadow = true,  scale = 0.23, colour = G.C.UI.TEXT_LIGHT }},               
            }},
        }},

        {n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
            {n = G.UIT.C, config = {align = "cl", padding = 0.1}, nodes = {
                create_toggle{col = true, label = "", scale = 1, w = 0, shadow = true, ref_table = furry_mod.config, ref_value = "joker_lines"},               
            }},
            {n = G.UIT.C, config = {align = "cl", padding = 0.05}, nodes = {
                {n = G.UIT.T, config = {text = localize("fur_jokerquotes"), shadow = true,  scale = 0.45, colour = G.C.UI.TEXT_LIGHT }},               
            }},
        }},
    }}
end

if JokerDisplay then
    SMODS.load_file("joker_display_definitions/furlatro_display_definitions.lua")()
end

SMODS.load_file("items/Atlases.lua")()
SMODS.load_file("items/VanillaJokers.lua")()
SMODS.load_file("items/FurryJokers/Uncommon.lua")()
SMODS.load_file("items/FurryJokers/Rare.lua")()
SMODS.load_file("items/FurryJokers/Legendary.lua")()
SMODS.load_file("items/FurryJokers/Mythic.lua")()
SMODS.load_file("items/FurryJokers/Corrupt.lua")()
SMODS.load_file("items/Achievements.lua")()
SMODS.load_file("items/Boosters.lua")()
SMODS.load_file("items/Challenges.lua")()
SMODS.load_file("items/Consumables.lua")()
SMODS.load_file("items/Decks.lua")()
SMODS.load_file("items/Enhancements.lua")()
SMODS.load_file("items/Gameplay.lua")()
SMODS.load_file("items/Seals.lua")()
SMODS.load_file("items/Skins.lua")()

if CardSleeves then
    SMODS.load_file("items/Sleeves.lua")()
end

SMODS.load_file("items/Sounds.lua")()
SMODS.load_file("items/Tags.lua")()









----------------------------------------------MISC-------------------------------------------------------------
SMODS.Atlas { -- Mod Icon
	key = "modicon",
	path = "Icon.png",
	px = 34,
	py = 34
}

local logo = "balatro.png" -- Title Replace
SMODS.Atlas { 
    key = 'balatro',
    path = logo,
    px = 333,
    py = 216,
    prefix_config = { key = false }
}

local set_spritesref = Card.set_sprites -- Following lines from Cryptid (For joker title card)
function Card:set_sprites(_center, _front)
	set_spritesref(self, _center, _front)
	if _center and _center.soul_pos and _center.soul_pos.extra then
		self.children.floating_sprite2 = Sprite(
			self.T.x,
			self.T.y,
			self.T.w,
			self.T.h,
			G.ASSET_ATLAS[_center.atlas or _center.set],
			_center.soul_pos.extra
		)
		self.children.floating_sprite2.role.draw_major = self
		self.children.floating_sprite2.states.hover.can = false
		self.children.floating_sprite2.states.click.can = false
	end
end
local mainmenuref = Game.main_menu
if Talisman then
	if Cryptid then
		Game.main_menu = function(change_context)
			local ret = mainmenuref(change_context)
    		local possible = {	
    		    'j_fur_sparkles',
    		    'j_fur_illy',
    		    'j_fur_ghost',
    		    'j_fur_soks',
    		    'j_fur_kalik',
    		    'j_fur_silver',
    		    'j_fur_astral',
    		    'j_fur_cobalt',
    		    'j_fur_icesea',
    		    'j_fur_koneko',
    		    'j_fur_saph',
    		    'j_fur_skips',
    		    'j_fur_spark',
    		    'j_fur_cryptidluposity',
    		    'j_fur_curiousangel',
				'j_fur_talismansephirapaws',
				'j_fur_talismanxavierorjose',
				'j_fur_foxxlyduskfur',
    		}
    		local menujoker = possible[math.random(#possible)]
    		local newcard = Card(G.title_top.T.x + G.title_top.T.w, G.title_top.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[menujoker],{bypass_discovery_center = true, bypass_discovery_ui = true})
    		-- Recenter the title
    		G.title_top.T.w = G.title_top.T.w * 1.7675
			G.title_top.T.x = G.title_top.T.x - 0.8
    		G.title_top:emplace(newcard)
    		newcard:start_materialize()
			newcard.T.w = newcard.T.w * 1.1 * 1.2
			newcard.T.h = newcard.T.h * 1.1 * 1.2
			newcard.no_ui = true
    		newcard:set_sprites(newcard.config.center, newcard.base.id and newcard.config.card)

    		-- make the title screen use different background colors
			G.SPLASH_BACK:define_draw_steps({
					{
						shader = "splash",
						send = {
							{ name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
							{ name = "vort_speed", val = 0.4 },
							{ name = "colour_1", ref_table = G.C, ref_value = "FUR_TITLE_F" },
							{ name = "colour_2", ref_table = G.C, ref_value = "FUR_TITLE_B" },
						},
					},
			})
			return ret
		end
	else
		Game.main_menu = function(change_context)
			local ret = mainmenuref(change_context)
    		local possible = {	
    		    'j_fur_sparkles',
    		    'j_fur_illy',
    		    'j_fur_ghost',
    		    'j_fur_soks',
    		    'j_fur_kalik',
    		    'j_fur_silver',
    		    'j_fur_astral',
    		    'j_fur_cobalt',
    		    'j_fur_icesea',
    		    'j_fur_koneko',
    		    'j_fur_saph',
    		    'j_fur_skips',
    		    'j_fur_spark',
    		    'j_fur_luposity',
    		    'j_fur_curiousangel',
				'j_fur_talismansephirapaws',
				'j_fur_talismanxavierorjose',
				'j_fur_foxxlyduskfur',
    		}
    		local menujoker = possible[math.random(#possible)]
    		local newcard = Card(G.title_top.T.x + G.title_top.T.w, G.title_top.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[menujoker],{bypass_discovery_center = true, bypass_discovery_ui = true})
    		-- Recenter the title
    		G.title_top.T.w = G.title_top.T.w * 1.7675
			G.title_top.T.x = G.title_top.T.x - 0.8
    		G.title_top:emplace(newcard)
    		newcard:start_materialize()
			newcard.T.w = newcard.T.w * 1.1 * 1.2
			newcard.T.h = newcard.T.h * 1.1 * 1.2
			newcard.no_ui = true
    		newcard:set_sprites(newcard.config.center, newcard.base.id and newcard.config.card)

    		-- make the title screen use different background colors
			G.SPLASH_BACK:define_draw_steps({
					{
						shader = "splash",
						send = {
							{ name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
							{ name = "vort_speed", val = 0.4 },
							{ name = "colour_1", ref_table = G.C, ref_value = "FUR_TITLE_F" },
							{ name = "colour_2", ref_table = G.C, ref_value = "FUR_TITLE_B" },
						},
					},
			})
			return ret
		end
	end
else
	Game.main_menu = function(change_context)
		local ret = mainmenuref(change_context)
    	local possible = {	
    	    'j_fur_sparkles',
    	    'j_fur_illy',
    	    'j_fur_ghost',
    	    'j_fur_soks',
    	    'j_fur_kalik',
    	    'j_fur_silver',
    	    'j_fur_astral',
    	    'j_fur_cobalt',
    	    'j_fur_icesea',
    	    'j_fur_koneko',
    	    'j_fur_saph',
    	    'j_fur_skips',
    	    'j_fur_spark',
    	    'j_fur_luposity',
    	    'j_fur_curiousangel',
			'j_fur_sephirapaws',
			'j_fur_xavierorjose',
			'j_fur_foxxlyduskfur',
    	}
    	local menujoker = possible[math.random(#possible)]
    	local newcard = Card(G.title_top.T.x + G.title_top.T.w, G.title_top.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[menujoker],{bypass_discovery_center = true, bypass_discovery_ui = true})
    	-- Recenter the title
    	G.title_top.T.w = G.title_top.T.w * 1.7675
		G.title_top.T.x = G.title_top.T.x - 0.8
    	G.title_top:emplace(newcard)
    	newcard:start_materialize()
		newcard.T.w = newcard.T.w * 1.1 * 1.2
		newcard.T.h = newcard.T.h * 1.1 * 1.2
		newcard.no_ui = true
    	newcard:set_sprites(newcard.config.center, newcard.base.id and newcard.config.card)

    	-- make the title screen use different background colors
		G.SPLASH_BACK:define_draw_steps({
				{
					shader = "splash",
					send = {
						{ name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
						{ name = "vort_speed", val = 0.4 },
						{ name = "colour_1", ref_table = G.C, ref_value = "FUR_TITLE_F" },
						{ name = "colour_2", ref_table = G.C, ref_value = "FUR_TITLE_B" },
					},
				},
		})
		return ret
	end
end

SMODS.current_mod.description_loc_vars = function() -- Mod description background, or we deploy a flashbang!
    return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2 }
end

local upd = Game.update -- Following lines from Cryptid (For rarity badge gradients & other gradient stuffs)
G.C.FUR_MYTHIC = { 0, 0, 0, 0 }
G.C.FUR_CORRUPT = { 0, 0, 0, 0 }
G.C.FUR_VGEN = { 0, 0, 0, 0 }
G.C.FUR_RAFFLE = { 0, 0, 0, 0 }
G.C.FUR_TITLE_F = { 0, 0, 0, 0 }
G.C.FUR_TITLE_B = { 0, 0, 0, 0 }
furry_mod.C = {
	MYTHIC = { HEX("0093FF"), HEX("3DFFF4") },
	CORRUPT = { HEX("141035"), HEX("141035") },
	RAFFLE = { HEX("3DFFF4"), HEX("8F00FF") },
	VGEN = { HEX("B6FE24"), HEX("B6FE24") },
    TITLE_F = { HEX("14588E"), HEX("14588E") },
    TITLE_B = { HEX("9F50E7"), HEX("9F50E7") },
}
function Game:update(dt)
	upd(self, dt)

	--Gradients based on Balatrostuck code
	local anim_timer = self.TIMERS.REAL * 1.5
	local p = 0.5 * (math.sin(anim_timer) + 1)
	for k, c in pairs(furry_mod.C) do
		if not G.C["FUR_" .. k] then
			G.C["FUR_" .. k] = { 0, 0, 0, 0 }
		end
		for i = 1, 4 do
			G.C["FUR_" .. k][i] = c[1][i] * p + c[2][i] * (1 - p)
		end
	end
	G.C.RARITY["fur_mythic"] = G.C.FUR_MYTHIC
end

local function calculate_scalefactor(text) -- Following lines from Cryptid (For misc card badges)
	local size = 0.9
	local font = G.LANG.font
	local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
	local calced_text_width = 0
	for _, c in utf8.chars(text) do
		local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE + 2.7 * 1 * G.TILESCALE * font.FONTSCALE
		calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
	end
	local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
	return scale_fac
end
local fur_badge = {
	raffle_winners29_8_2025 = {
		col = G.C.FUR_RAFFLE,
		text = {
			'Raffle Winner!',
			'29th Aug, 2025',
		}
	},
    saracrossing = {
		col = G.C.FUR_VGEN,
		tcol = G.C.UI.TEXT_DARK,
        text = {
            'Soul Artist',
            'SaraCrossing02',
            'vgen.co/SaraCrossing02'
        }
    },
}
local smcmb = SMODS.create_mod_badges 
function SMODS.create_mod_badges(obj, badges)
	smcmb(obj, badges)
	if obj and obj.misc_badge then
		local scale_fac = {}
		local scale_fac_len = 1
		if obj.misc_badge and obj.misc_badge.text then
			for i = 1, #obj.misc_badge.text do
				local calced_scale = calculate_scalefactor(obj.misc_badge.text[i])
				scale_fac[i] = calced_scale
				scale_fac_len = math.min(scale_fac_len, calced_scale)
			end
		end
		local ct = {}
		for i = 1, #obj.misc_badge.text do
			ct[i] = {
				string = obj.misc_badge.text[i]
			}
		end
		badges[#badges + 1] = {
			n = G.UIT.R,
			config = { align = "cm" },
			nodes = {
				{
					n = G.UIT.R,
					config = {
						align = "cm",
						colour = G.C.GREEN,
						r = 0.1,
						minw = 2/scale_fac_len,
						minh = 0.36,
						emboss = 0.05,
						padding = 0.03 * 0.9,
					},
					nodes = {
						{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
						{
							n = G.UIT.O,
							config = {
								object = DynaText({
									string = ct or "ERROR",
									colours = { G.C.WHITE },
									silent = true,
									float = true,
									shadow = true,
									offset_y = -0.03,
									spacing = 1,
									scale = 0.33 * 0.9,
								}),
							},
						},
						{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
					},
				},
			},
		}
	end
	if obj then
		for k, v in pairs(fur_badge) do
			if obj[k] then
				local scale_fac = {}
				local scale_fac_len = 1
				if v.text then
					for i = 1, #v.text do
						local calced_scale = calculate_scalefactor(v.text[i])
						scale_fac[i] = calced_scale
						scale_fac_len = math.min(scale_fac_len, calced_scale)
					end
				end
				local ct = {}
				for i = 1, #v.text do
					ct[i] = {
						string = v.text[i]
					}
				end
				badges[#badges + 1] = {
					n = G.UIT.R,
					config = { align = "cm" },
					nodes = {
						{
							n = G.UIT.R,
							config = {
								align = "cm",
								colour = v and v.col or G.C.GREEN,
								r = 0.1,
								minw = 2/scale_fac_len,
								minh = 0.36,
								emboss = 0.05,
								padding = 0.03 * 0.9,
							},
							nodes = {
								{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
								{
									n = G.UIT.O,
									config = {
										object = DynaText({
											string = ct or "ERROR",
											colours = { v and v.tcol or G.C.WHITE },
											silent = true,
											float = true,
											shadow = true,
											offset_y = -0.03,
											spacing = 1,
											scale = 0.33 * 0.9,
										}),
									},
								},
								{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
							},
						},
					},
				}
			end
		end
	end
end

function SMODS.current_mod.reset_game_globals(run_start) -- From Cryptid (For custom achievement checks)
	G.GAME.fur_ach_conditions = G.GAME.fur_ach_conditions or {}
end
---------------------------------------------------------------------------------------------------------------









---------------------------------------------TABLES------------------------------------------------------------
SMODS.Rarity {
    key = 'rarityfurry',
    badge_colour = G.C.DARK_EDITION
}

-- All below tables are empty to dynamically inject into them for cross-mod jokers (Constant checking was too fucking annoying)
SMODS.ObjectType { -- Joker Table
    key = 'furry',
    cards = {

    }
}

SMODS.ObjectType { -- Non Mythics (For Base Floofy Deck)
	key = 'nonmythics',
	cards = { 

	}
}

SMODS.ObjectType { -- Uncommon Jokers
    key = 'uncommonfurries',
    cards = {
        
    }
}

SMODS.ObjectType { -- Rare Jokers
    key = 'rarefurries',
    cards = {

    }
}

SMODS.ObjectType { -- Legendary Jokers
    key = 'legendaryfurries',
    cards = {

    }
}

SMODS.ObjectType { -- Mythic Jokers
    key = 'mythicfurries',
    cards = {

    }
}

SMODS.ObjectType { -- Corrupt Jokers
	key = 'corruptfurries',
    cards = {

    }
}

SMODS.ObjectType { -- Skips Packs
	key = 'skipspacks',
	cards = {

	}
}
---------------------------------------------------------------------------------------------------------------