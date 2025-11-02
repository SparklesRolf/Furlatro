local furry_mod = SMODS.current_mod

if Talisman then
    if Cryptid then
        SMODS.Challenge { -- Cryptid
            key = 'challengechipsmaxing',
            rules = {
    	    	custom = {
    	    		{ id = "fur_no_mult" },
    	    		{ id = "fur_planet_exception" },
                    --{ id = "set_seed", value = "CHIPSMAX"}
    	    	},
    	    	modifiers = {},
    	    },
            deck = {
                type = 'Challenge Deck'
            },
            restrictions = {
                banned_cards = {
                    -- Jokers
                    {id = 'j_joker'}, {id = 'j_greedy_joker'}, {id = 'j_lusty_joker'}, {id = 'j_wrathful_joker'}, {id = 'j_gluttenous_joker'},
                    {id = 'j_jolly'}, {id = 'j_zany'}, {id = 'j_mad'}, {id = 'j_crazy'}, {id = 'j_droll'},
                    {id = 'j_half'}, {id = 'j_stencil'}, {id = 'j_ceremonial'}, {id = 'j_mystic_summit'}, {id = 'j_loyalty_card'},
                    {id = 'j_misprint'}, {id = 'j_raised_fist'}, {id = 'j_fibonacci'}, {id = 'j_steel_joker'}, {id = 'j_scary_face'},
                    {id = 'j_abstract'}, {id = 'j_gros_michel'}, {id = 'j_even_steven'}, {id = 'j_scholar'}, {id = 'j_supernova'},
                    {id = 'j_ride_the_bus'}, {id = 'j_blackboard'}, {id = 'j_constellation'}, {id = 'j_green_joker'}, {id = 'j_cavendish'},
                    {id = 'j_card_sharp'}, {id = 'j_red_card'}, {id = 'j_madness'}, {id = 'j_vampire'}, {id = 'j_hologram'},
                    {id = 'j_baron'}, {id = 'j_obelisk'}, {id = 'j_photograph'}, {id = 'j_erosion'}, {id = 'j_fortune_teller'},
                    {id = 'j_lucky_cat'}, {id = 'j_baseball'}, {id = 'j_flash'}, {id = 'j_popcorn'}, {id = 'j_trousers'},
                    {id = 'j_ancient'}, {id = 'j_ramen'}, {id = 'j_walkie_talkie'}, {id = 'j_smiley'}, {id = 'j_campfire'},
                    {id = 'j_acrobat'}, {id = 'j_swashbuckler'}, {id = 'j_throwback'}, {id = 'j_bloodstone'}, {id = 'j_onyx_agate'},
                    {id = 'j_glass'}, {id = 'j_flower_pot'}, {id = 'j_idol'}, {id = 'j_seeing_double'}, {id = 'j_hit_the_road'},
                    {id = 'j_duo'}, {id = 'j_trio'}, {id = 'j_family'}, {id = 'j_order'}, {id = 'j_tribe'},
                    {id = 'j_shoot_the_moon'}, {id = 'j_drivers_license'}, {id = 'j_bootstraps'}, {id = 'j_caino'}, {id = 'j_triboulet'},
                    {id = 'j_yorick'}, {id = 'j_fur_enviousjoker'}, {id = 'j_fur_anxiousjoker'}, {id = 'j_fur_therainbow'}, {id = 'j_fur_sparkles'},
                    {id = 'j_fur_illy'}, {id = 'j_fur_ghost'}, {id = 'j_fur_kalik'}, {id = 'j_fur_koneko'}, {id = 'j_fur_spark'},
                    {id = 'j_fur_cryptidluposity'}, {id = 'j_fur_curiousangel'}, {id = "j_fur_talismanxavierorjose"},  {id = "j_fur_talismansephirapaws"},  {id = "j_fur_foxxlyduskfur"},
                    {id = "j_fur_talismancorruptcuriousangel"}, {id = "j_fur_talismancorruptsparkles"},
            
                    -- Consumables
                    {id = 'c_empress'},
                    {id = 'c_chariot'},
                    {id = 'c_justice'},
                    {id = 'c_wheel_of_fortune'},
                    {id = 'c_magician'},
                    {id = 'c_aura'},
                    {id = 'c_fur_rednotarystamp'},
                    {id = 'c_fur_orangenotarystamp'},
                },

                banned_tags = {
                    {id = 'tag_holo'},
                    {id = 'tag_polychrome'},
                    {id = 'tag_fur_holofurrytag'},
                    {id = 'tag_fur_polyfurrytag'},
                },

                banned_keys = {
                    {id = 'e_foil'},
                    {id = 'e_polychrome'},
                    {id = 'm_lucky'},
                    {id = 'm_glass'},
                    {id = 'm_mult'},
                    {id = 'm_steel'},
                }
            }
        }
    else
        SMODS.Challenge { -- Talisman
            key = 'challengechipsmaxing',
            rules = {
    	    	custom = {
    	    		{ id = "fur_no_mult" },
    	    		{ id = "fur_planet_exception" },
                    --{ id = "set_seed", value = "CHIPSMAX"}
    	    	},
    	    	modifiers = {},
    	    },
            deck = {
                type = 'Challenge Deck'
            },
            restrictions = {
                banned_cards = {
                    -- Jokers
                    {id = 'j_joker'}, {id = 'j_greedy_joker'}, {id = 'j_lusty_joker'}, {id = 'j_wrathful_joker'}, {id = 'j_gluttenous_joker'},
                    {id = 'j_jolly'}, {id = 'j_zany'}, {id = 'j_mad'}, {id = 'j_crazy'}, {id = 'j_droll'},
                    {id = 'j_half'}, {id = 'j_stencil'}, {id = 'j_ceremonial'}, {id = 'j_mystic_summit'}, {id = 'j_loyalty_card'},
                    {id = 'j_misprint'}, {id = 'j_raised_fist'}, {id = 'j_fibonacci'}, {id = 'j_steel_joker'}, {id = 'j_scary_face'},
                    {id = 'j_abstract'}, {id = 'j_gros_michel'}, {id = 'j_even_steven'}, {id = 'j_scholar'}, {id = 'j_supernova'},
                    {id = 'j_ride_the_bus'}, {id = 'j_blackboard'}, {id = 'j_constellation'}, {id = 'j_green_joker'}, {id = 'j_cavendish'},
                    {id = 'j_card_sharp'}, {id = 'j_red_card'}, {id = 'j_madness'}, {id = 'j_vampire'}, {id = 'j_hologram'},
                    {id = 'j_baron'}, {id = 'j_obelisk'}, {id = 'j_photograph'}, {id = 'j_erosion'}, {id = 'j_fortune_teller'},
                    {id = 'j_lucky_cat'}, {id = 'j_baseball'}, {id = 'j_flash'}, {id = 'j_popcorn'}, {id = 'j_trousers'},
                    {id = 'j_ancient'}, {id = 'j_ramen'}, {id = 'j_walkie_talkie'}, {id = 'j_smiley'}, {id = 'j_campfire'},
                    {id = 'j_acrobat'}, {id = 'j_swashbuckler'}, {id = 'j_throwback'}, {id = 'j_bloodstone'}, {id = 'j_onyx_agate'},
                    {id = 'j_glass'}, {id = 'j_flower_pot'}, {id = 'j_idol'}, {id = 'j_seeing_double'}, {id = 'j_hit_the_road'},
                    {id = 'j_duo'}, {id = 'j_trio'}, {id = 'j_family'}, {id = 'j_order'}, {id = 'j_tribe'},
                    {id = 'j_shoot_the_moon'}, {id = 'j_drivers_license'}, {id = 'j_bootstraps'}, {id = 'j_caino'}, {id = 'j_triboulet'},
                    {id = 'j_yorick'}, {id = 'j_fur_enviousjoker'}, {id = 'j_fur_anxiousjoker'}, {id = 'j_fur_therainbow'}, {id = 'j_fur_sparkles'},
                    {id = 'j_fur_illy'}, {id = 'j_fur_ghost'}, {id = 'j_fur_kalik'}, {id = 'j_fur_koneko'}, {id = 'j_fur_spark'},
                    {id = 'j_fur_luposity'}, {id = 'j_fur_curiousangel'}, {id = "j_fur_talismanxavierorjose"},  {id = "j_fur_talismansephirapaws"},  {id = "j_fur_foxxlyduskfur"},
                    {id = "j_fur_talismancorruptcuriousangel"}, {id = "j_fur_talismancorruptsparkles"},
            
                    -- Consumables
                    {id = 'c_empress'},
                    {id = 'c_chariot'},
                    {id = 'c_justice'},
                    {id = 'c_wheel_of_fortune'},
                    {id = 'c_magician'},
                    {id = 'c_aura'},
                    {id = 'c_fur_rednotarystamp'},
                    {id = 'c_fur_orangenotarystamp'},
                },

                banned_tags = {
                    {id = 'tag_holo'},
                    {id = 'tag_polychrome'},
                    {id = 'tag_fur_holofurrytag'},
                    {id = 'tag_fur_polyfurrytag'},
                },

                banned_keys = {
                    {id = 'e_foil'},
                    {id = 'e_polychrome'},
                    {id = 'm_lucky'},
                    {id = 'm_glass'},
                    {id = 'm_mult'},
                    {id = 'm_steel'},
                }
            }
        }
    end
else
    SMODS.Challenge { -- Vanilla
        key = 'challengechipsmaxing',
        rules = {
    		custom = {
    			{ id = "fur_no_mult" },
    			{ id = "fur_planet_exception" },
                --{ id = "set_seed", value = "CHIPSMAX"}
    		},
    		modifiers = {},
    	},
        deck = {
            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {
                -- Jokers
                {id = 'j_joker'}, {id = 'j_greedy_joker'}, {id = 'j_lusty_joker'}, {id = 'j_wrathful_joker'}, {id = 'j_gluttenous_joker'},
                {id = 'j_jolly'}, {id = 'j_zany'}, {id = 'j_mad'}, {id = 'j_crazy'}, {id = 'j_droll'},
                {id = 'j_half'}, {id = 'j_stencil'}, {id = 'j_ceremonial'}, {id = 'j_mystic_summit'}, {id = 'j_loyalty_card'},
                {id = 'j_misprint'}, {id = 'j_raised_fist'}, {id = 'j_fibonacci'}, {id = 'j_steel_joker'}, {id = 'j_scary_face'},
                {id = 'j_abstract'}, {id = 'j_gros_michel'}, {id = 'j_even_steven'}, {id = 'j_scholar'}, {id = 'j_supernova'},
                {id = 'j_ride_the_bus'}, {id = 'j_blackboard'}, {id = 'j_constellation'}, {id = 'j_green_joker'}, {id = 'j_cavendish'},
                {id = 'j_card_sharp'}, {id = 'j_red_card'}, {id = 'j_madness'}, {id = 'j_vampire'}, {id = 'j_hologram'},
                {id = 'j_baron'}, {id = 'j_obelisk'}, {id = 'j_photograph'}, {id = 'j_erosion'}, {id = 'j_fortune_teller'},
                {id = 'j_lucky_cat'}, {id = 'j_baseball'}, {id = 'j_flash'}, {id = 'j_popcorn'}, {id = 'j_trousers'},
                {id = 'j_ancient'}, {id = 'j_ramen'}, {id = 'j_walkie_talkie'}, {id = 'j_smiley'}, {id = 'j_campfire'},
                {id = 'j_acrobat'}, {id = 'j_swashbuckler'}, {id = 'j_throwback'}, {id = 'j_bloodstone'}, {id = 'j_onyx_agate'},
                {id = 'j_glass'}, {id = 'j_flower_pot'}, {id = 'j_idol'}, {id = 'j_seeing_double'}, {id = 'j_hit_the_road'},
                {id = 'j_duo'}, {id = 'j_trio'}, {id = 'j_family'}, {id = 'j_order'}, {id = 'j_tribe'},
                {id = 'j_shoot_the_moon'}, {id = 'j_drivers_license'}, {id = 'j_bootstraps'}, {id = 'j_caino'}, {id = 'j_triboulet'},
                {id = 'j_yorick'}, {id = 'j_fur_enviousjoker'}, {id = 'j_fur_anxiousjoker'}, {id = 'j_fur_therainbow'}, {id = 'j_fur_sparkles'},
                {id = 'j_fur_illy'}, {id = 'j_fur_ghost'}, {id = 'j_fur_kalik'}, {id = 'j_fur_koneko'}, {id = 'j_fur_spark'},
                {id = 'j_fur_luposity'}, {id = 'j_fur_curiousangel'}, {id = "j_fur_xavierorjose"},  {id = "j_fur_sephirapaws"},  {id = "j_fur_foxxlyduskfur"},
                {id = "j_fur_corruptcuriousangel"}, {id = "j_fur_corruptsparkles"},
            
                -- Consumables
                {id = 'c_empress'},
                {id = 'c_chariot'},
                {id = 'c_justice'},
                {id = 'c_wheel_of_fortune'},
                {id = 'c_magician'},
                {id = 'c_aura'},
                {id = 'c_fur_rednotarystamp'},
                {id = 'c_fur_orangenotarystamp'},
            },

            banned_tags = {
                {id = 'tag_holo'},
                {id = 'tag_polychrome'},
                {id = 'tag_fur_holofurrytag'},
                {id = 'tag_fur_polyfurrytag'},
            },

            banned_keys = {
                {id = 'e_foil'},
                {id = 'e_polychrome'},
                {id = 'm_lucky'},
                {id = 'm_glass'},
                {id = 'm_mult'},
                {id = 'm_steel'},
            }
        }
    }
end

SMODS.Challenge { -- Mult Maxing
    key = 'challengemultmaxing',
    rules = {
		custom = {
			{ id = "fur_no_chips" },
			{ id = "fur_planet_exception" },
            --{ id = "set_seed", value = "MULTMAXX"}
		},
		modifiers = {},
	},
    deck = {
        type = 'Challenge Deck'
    },
    restrictions = {
        banned_cards = {
            -- Jokers
            {id = 'j_sly'},
            {id = 'j_wily'},
            {id = 'j_clever'},
            {id = 'j_devious'},
            {id = 'j_crafty'},
            {id = 'j_banner'},
            {id = 'j_marble'},
            {id = 'j_scary_face'},
            {id = 'j_odd_todd'},
            {id = 'j_scholar'},
            {id = 'j_runner'},
            {id = 'j_ice_cream'},
            {id = 'j_blue_joker'},
            {id = 'j_hiker'},
            {id = 'j_square'},
            {id = 'j_stone'},
            {id = 'j_bull'},
            {id = 'j_walkie_talkie'},
            {id = 'j_castle'},
            {id = 'j_arrowhead'},
            {id = 'j_wee'},
            {id = 'j_stuntman'},
            {id = 'j_fur_trickyjoker'},
            {id = 'j_fur_cobalt'},
            {id = 'j_fur_icesea'},
            
            -- Consumables
            {id = 'c_heirophant'},
            {id = 'c_tower'},
            {id = 'c_fur_treasurechest'},
            {id = 'c_wheel_of_fortune'},
            {id = 'c_aura'},
            {id = 'c_fur_bluenotarystamp'},
            {id = 'c_fur_orangenotarystamp'},
        },

        banned_tags = {
            {id = 'tag_foil'},
            {id = 'tag_fur_foilfurrytag'},
        },

        banned_keys = {
            {id = 'e_foil'},
            {id = 'e_polychrome'},
            {id = 'm_lucky'},
            {id = 'm_glass'},
            {id = 'm_mult'},
            {id = 'm_steel'},
        }
    }
}

SMODS.Challenge { -- Negative Nancy
    key = 'challengenegativenancy',
    rules = {
		custom = {
			{ id = "fur_curiousangel_start" },
			{ id = "all_eternal" },
            --{ id = "set_seed", value = "NEGNANCY"}
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