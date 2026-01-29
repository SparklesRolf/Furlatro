local furry_mod = SMODS.current_mod

SMODS.Challenge { -- Chips Maxing
    key = 'challengechipsmaxing',
    button_colour = G.C.CHIPS,
    rules = {
    	custom = {
    		{ id = "fur_no_mult" },
    		{ id = "fur_planet_exception" },
            { id = "set_seed", value = "CHIPSMAX" },
    	},
    },
    deck = {
        type = 'Challenge Deck'
    },
    restrictions = {
        banned_cards = {},
        banned_tags = {
            {id = 'tag_holo'},
            {id = 'tag_polychrome'},
            {id = 'tag_fur_holofurrytag'},
            {id = 'tag_fur_polyfurrytag'},
        },
        banned_other = {
            {id = 'e_holo', value = "edition"},
            {id = 'e_polychrome', value = "edition"},
            {id = 'm_lucky', value = "enhancement"},
            {id = 'm_glass', value = "enhancement"},
            {id = 'm_mult', value = "enhancement"},
            {id = 'm_steel', value = "enhancement"},
        },
    },

    apply = function(self) -- Code and help from TheOneGoofAli
        for _, v in pairs(G.P_CENTERS) do
            if v.effect == "Mult" or -- Vanilla Checks
                v.effect == "Suit Mult" or
                v.effect == "Type Mult" or
                v.effect == "Hand Size Mult" or
                v.effect == "No Discard Mult" or
                v.effect == "Random Mult" or
                v.effect == "Socialized Mult" or
                v.effect == "Card Mult" or
                v.effect == "Steel Card Buff" or
                v.effect == "Joker Mult" or
                v.effect == "Even Card Buff" or
                v.effect == "Ace Buff" or
                v.effect == "Hand played mult" or
                v.effect == "Set Mult" or
                v.effect == "X1.5 Mult club 7" or
                v.effect == "Jack Discard Effect" or
                v.effect == "X1.5 Mult" or
                v.effect == "X2 Mult" or
                v.effect == "X3 Mult" or
                v.effect == "1 in 10 mult" or
                v.name == "Ceremonial Dagger" or
                v.name == "Gros Michel" or
                v.name == "Ride the Bus" or
                v.name == "Blackboard" or
                v.name == "Constellation" or
                v.name == "Green Joker" or
                v.name == "Cavendish" or
                v.name == "Card Sharp" or
                v.name == "Red Card" or
                v.name == "Madness" or
                v.name == "Vampire" or
                v.name == "Hologram" or
                v.name == "Baron" or
                v.name == "Obelisk" or
                v.name == "Photograph" or
                v.name == "Erosion" or
                v.name == "Fortune Teller" or
                v.name == "Lucky Cat" or
                v.name == "Baseball Card" or
                v.name == "Flash Card" or
                v.name == "Popcorn" or
                v.name == "Spare Trousers" or
                v.name == "Ancient Joker" or
                v.name == "Ramen" or
                v.name == "Walkie Talkie" or
                v.name == "Smiley Face" or
                v.name == "Campfire" or
                v.name == "Acrobat" or
                v.name == "Throwback" or
                v.name == "Bloodstone" or
                v.name == "Onyx Agate" or
                v.name == "Glass Joker" or
                v.name == "Flower Pot" or
                v.name == "The Idol" or
                v.name == "Shoot the Moon" or
                v.name == "Driver's License" or
                v.name == "Bootstraps" or
                v.name == "Caino" or
                v.name == "Triboulet" or
                v.name == "Yorick" or
                v.name == "The Empress" or -- Consumeables
                v.name == "The Chariot" or
                v.name == "Justice" or
                v.name == "The Wheel of Fortune" or
                v.name == "The Magician" or
                v.name == "Aura" or
                v.effect == "Fur Mult" or -- Furlatro Checks
                v.effect == "Fur Chips and Mult" or 
                v.name == "Joseeeeee" or 
                v.name == "Notary Stamp (Red)" or
                v.name == "Notary Stamp (Orange)" or
                v.effect == "Cry Type Mult"
            then 
                G.GAME.banned_keys[v.key] = true 
            end
        end
    end,
}
SMODS.Challenge { -- Mult Maxing
    key = 'challengemultmaxing',
    rules = {
    	custom = {
    		{ id = "fur_no_chips" },
    		{ id = "fur_planet_exception" },
            { id = "set_seed", value = "MULTMAXX"},
    	},
    	modifiers = {},
    },
    deck = {
        type = 'Challenge Deck'
    },
    restrictions = {
        banned_cards = {},
        banned_tags = {
            {id = 'tag_foil'},
            {id = 'tag_fur_foilfurrytag'},
        },
        banned_keys = {
            {id = 'm_lucky'},
            {id = 'm_glass'},
            {id = 'm_mult'},
            {id = 'm_steel'},
        }
    },

    apply = function(self) -- Code and help from TheOneGoofAli
        for _, v in pairs(G.P_CENTERS) do
            if v.effect == "Discard Chips" or -- Vanilla Checks
                v.effect == "Stone card hands" or
                v.effect == "Scary Face Cards" or
                v.effect == "Odd Card Buff" or
                v.effect == "Ace Buff" or
                v.effect == "Stone Card Buff" or
                v.name == "Sly Joker" or
                v.name == "Wily Joker" or
                v.name == "Clever Joker" or
                v.name == "Devious Joker" or
                v.name == "Crafty Joker" or
                v.name == "Runner" or
                v.name == "Ice Cream" or
                v.name == "Blue Joker" or
                v.name == "Hiker" or
                v.name == "Square Joker" or
                v.name == "Bull" or
                v.name == "Walkie Talkie" or
                v.name == "Castle" or
                v.name == "Arrowhead" or
                v.name == "Wee Joker" or
                v.name == "Stuntman" or
                v.name == "The Hierophant" or -- Vanilla Consumeables
                v.name == "The Tower" or
                v.effect == "Fur Chips" or -- Furlatro Checks
                v.effect == "Fur Chips and Mult" or
                v.name == "Joseeeeee" or 
                v.name == "Notary Stamp (Blue)" or
                v.name == "Notary Stamp (Orange)" or
                v.effect == "Cry Type Chips" -- Cryptid Checks
            then
                G.GAME.banned_keys[v.key] = true
            end
        end
    end,
}
SMODS.Challenge { -- Negative Nancy
    key = 'challengenegativenancy',
    button_colour = G.C.DARK_EDITION,
    rules = {
		custom = {
			{ id = "fur_curiousangel_start" },
			{ id = "all_eternal" },
            { id = "set_seed", value = "NEGNANCY" },
		},
		modifiers = {},
	},
    jokers = {
        { id = 'j_fur_curiousangel', eternal = true}
    },
    deck = {
        type = 'Challenge Deck'
    },
    restrictions = {
        banned_cards = {
            {id = 'j_gros_michel'},
            {id = 'j_ice_cream'},
            {id = 'j_cavendish'},
            {id = 'j_turtle_bean'},
            {id = 'j_ramen'},
            {id = 'j_diet_cola'},
            {id = 'j_selzer'},
            {id = 'j_popcorn'},
            {id = 'j_mr_bones'},
            {id = 'j_invisible'},
            {id = 'j_luchador'},
        },
        banned_tags = {
        },
        banned_other = {
            {id = 'bl_final_leaf', type = 'blind'},
        }
    }
}
SMODS.Challenge { -- Snow Day
    key = 'challengesnowday',
    button_colour = G.C.EDITION,
    rules = {
		custom = {
			{ id = "fur_gale_start" },
            { id = "fur_snowy_face" },
            { id = "fur_ante12_win" },
            { id = "set_seed", value = "SNOWYDAY" },
		},
		modifiers = {},
	},
    jokers = {
        { id = 'j_fur_gale', eternal = true },
    },
    deck = {
        type = 'Challenge Deck',
        cards = {
            { s = "fur_Stars", r = "A" },
            { s = "fur_Stars", r = "K", e = "m_fur_snowflakecard" },
            { s = "fur_Stars", r = "T" },
            { s = "fur_Stars", r = "9" },
            { s = "fur_Stars", r = "8" },
            { s = "fur_Stars", r = "7" },
            { s = "fur_Stars", r = "6" },
            { s = "fur_Stars", r = "5" },
            { s = "fur_Stars", r = "4" },
            { s = "fur_Stars", r = "3" },
            { s = "fur_Stars", r = "2" },
            { s = "H", r = "A" },
            { s = "H", r = "K", e = "m_fur_snowflakecard" },
            { s = "H", r = "T" },
            { s = "H", r = "9" },
            { s = "H", r = "8" },
            { s = "H", r = "7" },
            { s = "H", r = "6" },
            { s = "H", r = "5" },
            { s = "H", r = "4" },
            { s = "H", r = "3" },
            { s = "H", r = "2" },
            { s = "S", r = "A" },
            { s = "S", r = "K", e = "m_fur_snowflakecard" },
            { s = "S", r = "T" },
            { s = "S", r = "9" },
            { s = "S", r = "8" },
            { s = "S", r = "7" },
            { s = "S", r = "6" },
            { s = "S", r = "5" },
            { s = "S", r = "4" },
            { s = "S", r = "3" },
            { s = "S", r = "2" },
            { s = "D", r = "A" },
            { s = "D", r = "K", e = "m_fur_snowflakecard" },
            { s = "D", r = "T" },
            { s = "D", r = "9" },
            { s = "D", r = "8" },
            { s = "D", r = "7" },
            { s = "D", r = "6" },
            { s = "D", r = "5" },
            { s = "D", r = "4" },
            { s = "D", r = "3" },
            { s = "D", r = "2" },
            { s = "C", r = "A" },
            { s = "C", r = "K", e = "m_fur_snowflakecard" },
            { s = "C", r = "T" },
            { s = "C", r = "9" },
            { s = "C", r = "8" },
            { s = "C", r = "7" },
            { s = "C", r = "6" },
            { s = "C", r = "5" },
            { s = "C", r = "4" },
            { s = "C", r = "3" },
            { s = "C", r = "2" },
        }
    },

    apply = function(self)
        G.GAME.win_ante = 12
    end,
}
SMODS.Challenge { -- Card Conjuring
    key = 'challengecardconjuring',
    button_colour = G.C.SECONDARY_SET.Spectral,
    rules = {
		custom = {
			{ id = "fur_conjuring_start" },
            { id = "fur_conjuring_start_2" },
            { id = "set_seed", value = "MAGIC" },
		},
		modifiers = {},
	},
    jokers = {
        { id = 'j_fur_astral', eternal = true },
        { id = 'j_fur_saph', eternal = true },
        { id = 'j_fur_aberrantreptile', eternal = true },
    },
    deck = {
        type = 'Challenge Deck',
    },
}
SMODS.Challenge { -- High Royalty
    key = 'challengehighroyalty',
    button_colour = G.C.FILTER,
    rules = {
		custom = {
			{ id = "fur_highroyalty_start" },
            { id = "fur_highroyalty_start2" },
            { id = "fur_ante16_win" },
            { id = "set_seed", value = "ROYALTY" },
		},
		modifiers = {},
	},
    jokers = {
        { id = 'j_baron', eternal = true },
        { id = 'j_fur_illy', eternal = true },
        { id = 'j_fur_lume', eternal = true },
    },
    deck = {
        type = 'Challenge Deck',
        cards = {
            { s = "fur_Stars", r = "A" },
            { s = "fur_Stars", r = "K" },
            { s = "fur_Stars", r = "K" },
            { s = "fur_Stars", r = "K" },
            { s = "fur_Stars", r = "T" },
            { s = "fur_Stars", r = "9" },
            { s = "fur_Stars", r = "8" },
            { s = "fur_Stars", r = "7" },
            { s = "fur_Stars", r = "6" },
            { s = "fur_Stars", r = "5" },
            { s = "fur_Stars", r = "4" },
            { s = "fur_Stars", r = "3" },
            { s = "fur_Stars", r = "2" },
            { s = "H", r = "A" },
            { s = "H", r = "K" },
            { s = "H", r = "K" },
            { s = "H", r = "K" },
            { s = "H", r = "T" },
            { s = "H", r = "9" },
            { s = "H", r = "8" },
            { s = "H", r = "7" },
            { s = "H", r = "6" },
            { s = "H", r = "5" },
            { s = "H", r = "4" },
            { s = "H", r = "3" },
            { s = "H", r = "2" },
            { s = "S", r = "A" },
            { s = "S", r = "K" },
            { s = "S", r = "K" },
            { s = "S", r = "K" },
            { s = "S", r = "T" },
            { s = "S", r = "9" },
            { s = "S", r = "8" },
            { s = "S", r = "7" },
            { s = "S", r = "6" },
            { s = "S", r = "5" },
            { s = "S", r = "4" },
            { s = "S", r = "3" },
            { s = "S", r = "2" },
            { s = "D", r = "A" },
            { s = "D", r = "K" },
            { s = "D", r = "K" },
            { s = "D", r = "K" },
            { s = "D", r = "T" },
            { s = "D", r = "9" },
            { s = "D", r = "8" },
            { s = "D", r = "7" },
            { s = "D", r = "6" },
            { s = "D", r = "5" },
            { s = "D", r = "4" },
            { s = "D", r = "3" },
            { s = "D", r = "2" },
            { s = "C", r = "A" },
            { s = "C", r = "K" },
            { s = "C", r = "K" },
            { s = "C", r = "K" },
            { s = "C", r = "T" },
            { s = "C", r = "9" },
            { s = "C", r = "8" },
            { s = "C", r = "7" },
            { s = "C", r = "6" },
            { s = "C", r = "5" },
            { s = "C", r = "4" },
            { s = "C", r = "3" },
            { s = "C", r = "2" },
        },
    },

    apply = function(self)
        G.GAME.win_ante = 16
    end
}