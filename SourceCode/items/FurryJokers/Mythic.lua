local furry_mod = SMODS.current_mod
local config = SMODS.current_mod.config

local curiousangel_lines = { -- CuriousAngel
    normal = {
        '"I\'M NOT COTTON CANDY!"',
        '"I\'m going to shit you, real."',
        '*Blep*',
        '"Play THE FINALS"',
        '*Strangles you cutely*',
    },
    toggle = {
        '',
    }
}
SMODS.Joker { 
    key = 'curiousangel',
    config = {extra = { xmult = 1, gain = 1, odds = 15 }},
    atlas = 'furryjokers',
    pos = { x = 4, y = 4 },
    soul_pos = { x = 5, y = 4 },
    rarity = 'fur_rarityfurry',
    pools = {
        ["furry"] = true,
        ["mythicfurries"] = true,
    },
    cost = 25,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = 'Mult',
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        local joker = context.other_joker
        local playingcard = context.other_card
        
        if context.individual and context.cardarea == G.play then
            if not playingcard.edition then
                if Cryptid then
                    if card.ability.cry_rigged then
                        G.E_MANAGER:add_event(Event({
				    	func = function()
				    	    playingcard:set_edition({negative = true}, true)
				    	    return true
				    	end}))
                    
                        return {
                            message = localize("fur_angelnegated"), 
                            colour = G.C.DARK_EDITION
                        }
                    else
                        if pseudorandom("j_fur_curiousangel") < G.GAME.probabilities.normal/card.ability.extra.odds then
                            G.E_MANAGER:add_event(Event({
				        	    func = function()
				        		    playingcard:set_edition({negative = true}, true)
				        		    return true
				        	    end
				            }))

                            return {
                                message = localize("fur_angelnegated"), 
                                colour = G.C.DARK_EDITION
                            }
                        end
                    end
                else
                    if pseudorandom("j_fur_curiousangel") < G.GAME.probabilities.normal/card.ability.extra.odds then
                        G.E_MANAGER:add_event(Event({
				    	func = function()
				    	    playingcard:set_edition({negative = true}, true)
				    	    return true
				    	end}))

                        return {
                            message = localize("fur_angelnegated"), 
                            colour = G.C.DARK_EDITION
                        }
                    end
                end
            else
                if not context.blueprint then
                    if (playingcard.edition or {}).negative then
                        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                        return {
                            focus = card,
                            message = localize('k_upgrade_ex'),
                            colour = G.C.FILTER
                        }
                    end
                end
            end
        end

        if context.other_joker then
            if not joker.edition then
                if Cryptid then
                    if card.ability.cry_rigged then
                        G.E_MANAGER:add_event(Event({
				        func = function()
				            joker:set_edition({negative = true}, true)
				            return true
				        end}))
                    
                        return {
                            message = 'Negated!', 
                            colour = G.C.DARK_EDITION
                        }
                    else    
                        if pseudorandom("j_fur_curiousangel") < G.GAME.probabilities.normal/card.ability.extra.odds then
                            G.E_MANAGER:add_event(Event({
				        	func = function()
				        	    joker:set_edition({negative = true}, true)
				        	    return true
				        	end}))

                            return {
                                message = 'Negated!', 
                                colour = G.C.DARK_EDITION
                            }
                        end
                    end
                else
                    if pseudorandom("j_fur_curiousangel") < G.GAME.probabilities.normal/card.ability.extra.odds then
                        G.E_MANAGER:add_event(Event({
				    	func = function()
				    	    joker:set_edition({negative = true}, true)
				    	    return true
				    	end}))

                        return {
                            message = 'Negated!', 
                            colour = G.C.DARK_EDITION
                        }
                    end
                end
            end
        end

        if context.joker_main and context.cardarea == G.jokers then
            return {
                xmult = card.ability.extra.xmult,
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        if not (card.edition or {}).negative then
            info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        end

        if config.joker_lines then
            if Cryptid then
                if card.ability.cry_rigged then
                    return {vars = {card.ability.extra.xmult, card.ability.extra.gain, card.ability.extra.odds, card.ability.extra.odds, curiousangel_lines.normal[math.random(#curiousangel_lines.normal)], localize('negative', 'labels')}}
                else
                    return {vars = {card.ability.extra.xmult, card.ability.extra.gain, G.GAME.probabilities.normal, card.ability.extra.odds, curiousangel_lines.normal[math.random(#curiousangel_lines.normal)], localize('negative', 'labels')}}
                end
            else
                return {vars = {card.ability.extra.xmult, card.ability.extra.gain, G.GAME.probabilities.normal, card.ability.extra.odds, curiousangel_lines.normal[math.random(#curiousangel_lines.normal)], localize('negative', 'labels')}}
            end
        else
            if Cryptid then
                if card.ability.cry_rigged then
                    return {vars = {card.ability.extra.xmult, card.ability.extra.gain, card.ability.extra.odds, card.ability.extra.odds, curiousangel_lines.toggle[math.random(#curiousangel_lines.toggle)], localize('negative', 'labels')}}
                else
                    return {vars = {card.ability.extra.xmult, card.ability.extra.gain, G.GAME.probabilities.normal, card.ability.extra.odds, curiousangel_lines.toggle[math.random(#curiousangel_lines.toggle)], localize('negative', 'labels')}}
                end
            else
                return {vars = {card.ability.extra.xmult, card.ability.extra.gain, G.GAME.probabilities.normal, card.ability.extra.odds, curiousangel_lines.toggle[math.random(#curiousangel_lines.toggle)], localize('negative', 'labels')}}
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
    end,

    in_pool = function(self, args)
        local corruptangel = 0

        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center.key == "j_fur_talismancorruptcuriousangel" or G.jokers.cards[i].config.center.key == "j_fur_corruptcuriousangel" then
                corruptangel = corruptangel + 1
            end
        end
        
        if corruptangel >= 1 then
            return false
        else
            return true
        end
    end
}

local skips_lines = { -- DelusionalSkips
    normal = {
        '"Get yoinkady schploined"',
        '"PEBBLE!"',
        '"Only on Tuesdays"'
    },
    toggle = {
        '',
    }
}
if next(SMODS.find_mod("Multiplayer")) then
    SMODS.Joker { 
        key = 'multiplayerskips',
        config = { partnersynergizetrigger = "False", extra = { bossodds = 0, odds = 15 }},
        atlas = 'furryjokers',
        pos = { x = 4, y = 3 },
        soul_pos = { x = 5, y = 3 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["furry"] = true,
            ["mythicfurries"] = true,
        },
        cost = 25,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        effect = nil,
        saracrossing = true,
    
        calculate = function(self, card, context)
            if card.debuff then return nil end

            if context.first_hand_drawn then
                G.GAME.fur_ach_conditions.skips_ability_triggered = false
            
                if not G.GAME.blind.boss then
                    if Cryptid then
                        if card.ability.cry_rigged then
                            G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
	    			            G.GAME.chips = G.GAME.blind.chips
                                G.GAME.fur_ach_conditions.skips_ability_triggered = true
	    			            G.STATE = G.STATES.HAND_PLAYED
	    			            G.STATE_COMPLETE = true
	    			            end_round()
	    		            return true end)
                            }))
                        
                            return {
                                message = localize("Skipped", 'blind_states'),
                                colour = G.C.SECONDARY_SET.FILTER
                            }
                        else
                            if pseudorandom("j_fur_skips") < G.GAME.probabilities.normal/card.ability.extra.odds then
	    		                G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
	    			                G.GAME.chips = G.GAME.blind.chips
                                    G.GAME.fur_ach_conditions.skips_ability_triggered = true
	    			                G.STATE = G.STATES.HAND_PLAYED
	    			                G.STATE_COMPLETE = true
	    			                end_round()
	    		                return true end)
                                }))
                            
                                return {
                                    message = localize("Skipped", 'blind_states'),
                                    colour = G.C.SECONDARY_SET.FILTER
                                }
                            end
                        end
                    else
                        if pseudorandom("j_fur_skips") < G.GAME.probabilities.normal/card.ability.extra.odds then
	    		            G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
	    			            G.GAME.chips = G.GAME.blind.chips
                                G.GAME.fur_ach_conditions.skips_ability_triggered = true
	    			            G.STATE = G.STATES.HAND_PLAYED
	    			            G.STATE_COMPLETE = true
	    			            end_round()
	    		            return true end)
                            }))
                        
                            return {
                                message = localize("Skipped", 'blind_states'),
                                colour = G.C.SECONDARY_SET.FILTER
                            }
                        end
                    end
                end
            end
        
            if context.skip_blind then
                if next(SMODS.find_mod("partner")) then
                    if G.GAME.selected_partner == "pnr_fur_skipspartner" then
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                add_tag(Tag('tag_fur_skipstag'))
                                add_tag(Tag('tag_fur_skipstag'))
                                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                                return true
                            end)
                        }))
                    
                        return {
                            extra = {focus = card, message = localize('fur_skipstag')},
                        }

                    else
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                add_tag(Tag('tag_fur_skipstag'))
                                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                                return true
                            end)
                        }))

                        return {
                            extra = {focus = card, message = localize('fur_skipstag')},
                        }
                    end
                else
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            add_tag(Tag('tag_fur_skipstag'))
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                            return true
                        end)
                    }))

                    return {
                        extra = {focus = card, message = localize('fur_skipstag')},
                    }
                end
            end
        end,
    
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS.tag_fur_skipstag
        
            if config.joker_lines then
                if G.GAME.current_round.hands_left > 0 then
                    if G.GAME.blind.boss then
                        if Cryptid then
                            if card.ability.cry_rigged or (G.GAME.probabilities.normal > card.ability.extra.bossodds) then
                                return {vars = {card.ability.extra.bossodds, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            end
                        else
                            if G.GAME.probabilities.normal > card.ability.extra.bossodds then
                                return {vars = {card.ability.extra.bossodds, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            end
                        end
                    else
                        if Cryptid then
                            if card.ability.cry_rigged then
                                return {vars = {card.ability.extra.odds, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            end
                        else
                            return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                        end
                    end
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                end
            else
                if G.GAME.current_round.hands_left > 0 then
                    if G.GAME.blind.boss then
                        if Cryptid then
                            if card.ability.cry_rigged or (G.GAME.probabilities.normal > card.ability.extra.bossodds) then
                                return {vars = {card.ability.extra.bossodds, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            end
                        else
                            if G.GAME.probabilities.normal > card.ability.extra.bossodds then
                                return {vars = {card.ability.extra.bossodds, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            end
                        end
                    else
                        if Cryptid then
                            if card.ability.cry_rigged then
                                return {vars = {card.ability.extra.odds, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            end
                        else
                            return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                        end
                    end
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                end
            end
        end,
    
        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end
    }
else
    SMODS.Joker { 
        key = 'skips',
        config = { partnersynergizetrigger = "False", extra = { bossodds = 4, odds = 15 }},
        atlas = 'furryjokers',
        pos = { x = 4, y = 3 },
        soul_pos = { x = 5, y = 3 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["furry"] = true,
            ["mythicfurries"] = true,
        },
        cost = 25,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        effect = nil,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end

            if context.first_hand_drawn then
                G.GAME.fur_ach_conditions.skips_ability_triggered = false
                oopsall6count = 0
                local oopsall6table = {}
                for i = 1, #G.jokers.cards do
	    		    if G.jokers.cards[i].config.center.key == "j_oops" then
                        table.insert(oopsall6table, G.jokers)
                    end
                end
                for _ in pairs(oopsall6table) do
                    oopsall6count = oopsall6count + 1
                end

                if G.GAME.blind.boss then
                    if Cryptid then
                        if card.ability.cry_rigged then
                            if pseudorandom("j_fur_skips") < card.ability.extra.bossodds/card.ability.extra.odds then
	    		                G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
	    			                G.GAME.chips = G.GAME.blind.chips
                                    G.GAME.fur_ach_conditions.skips_ability_triggered = true
	    			                G.STATE = G.STATES.HAND_PLAYED
	    			                G.STATE_COMPLETE = true
	    			                end_round()
	    		                return true end)
                                }))
                            
                                return {
                                    message = localize("Skipped", 'blind_states'),
                                    colour = G.C.SECONDARY_SET.FILTER
                                }
                            end
                        elseif oopsall6count >= 2 then
                            if pseudorandom("j_fur_skips") < card.ability.extra.bossodds/card.ability.extra.odds then
	    		                G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
	    			                G.GAME.chips = G.GAME.blind.chips
                                    G.GAME.fur_ach_conditions.skips_ability_triggered = true
	    			                G.STATE = G.STATES.HAND_PLAYED
	    			                G.STATE_COMPLETE = true
	    			                end_round()
	    		                return true end)
                                }))
                            
                                return {
                                    message = localize("Skipped", 'blind_states'),
                                    colour = G.C.SECONDARY_SET.FILTER
                                }
                            end
                        else
                            if pseudorandom("j_fur_skips") < G.GAME.probabilities.normal/card.ability.extra.odds then
	    		                G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
	    			                G.GAME.chips = G.GAME.blind.chips
                                    G.GAME.fur_ach_conditions.skips_ability_triggered = true
	    			                G.STATE = G.STATES.HAND_PLAYED
	    			                G.STATE_COMPLETE = true
	    			                end_round()
	    		                return true end)
                                }))

                                return {
                                    message = localize("Skipped", 'blind_states'),
                                    colour = G.C.SECONDARY_SET.FILTER
                                }
                            end
                        end
                    else
                        if oopsall6count >= 2 then
                            if pseudorandom("j_fur_skips") < card.ability.extra.bossodds/card.ability.extra.odds then
	    		                G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
	    			                G.GAME.chips = G.GAME.blind.chips
                                    G.GAME.fur_ach_conditions.skips_ability_triggered = true
	    			                G.STATE = G.STATES.HAND_PLAYED
	    			                G.STATE_COMPLETE = true
	    			                end_round()
	    		                return true end)
                                }))

                                return {
                                    message = localize("Skipped", 'blind_states'),
                                    colour = G.C.SECONDARY_SET.FILTER
                                }
                            end
                        else
                            if pseudorandom("j_fur_skips") < G.GAME.probabilities.normal/card.ability.extra.odds then
	    		                G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
	    			                G.GAME.chips = G.GAME.blind.chips
                                    G.GAME.fur_ach_conditions.skips_ability_triggered = true
	    			                G.STATE = G.STATES.HAND_PLAYED
	    			                G.STATE_COMPLETE = true
	    			                end_round()
	    		                return true end)
                                }))

                                return {
                                    message = localize("Skipped", 'blind_states'),
                                    colour = G.C.SECONDARY_SET.FILTER
                                }
                            end
                        end
                    end
                else
                    if Cryptid then
                        if card.ability.cry_rigged then
                            G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
	    			            G.GAME.chips = G.GAME.blind.chips
                                G.GAME.fur_ach_conditions.skips_ability_triggered = true
	    			            G.STATE = G.STATES.HAND_PLAYED
	    			            G.STATE_COMPLETE = true
	    			            end_round()
	    		            return true end)
                            }))

                            return {
                                message = localize("Skipped", 'blind_states'),
                                colour = G.C.SECONDARY_SET.FILTER
                            }
                        else
                            if pseudorandom("j_fur_skips") < G.GAME.probabilities.normal/card.ability.extra.odds then
	    		                G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
	    			                G.GAME.chips = G.GAME.blind.chips
                                    G.GAME.fur_ach_conditions.skips_ability_triggered = true
	    			                G.STATE = G.STATES.HAND_PLAYED
	    			                G.STATE_COMPLETE = true
	    			                end_round()
	    		                return true end)
                                }))

                                return {
                                    message = localize("Skipped", 'blind_states'),
                                    colour = G.C.SECONDARY_SET.FILTER
                                }
                            end
                        end
                    else
                        if pseudorandom("j_fur_skips") < G.GAME.probabilities.normal/card.ability.extra.odds then
	    		            G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
	    			            G.GAME.chips = G.GAME.blind.chips
                                G.GAME.fur_ach_conditions.skips_ability_triggered = true
	    			            G.STATE = G.STATES.HAND_PLAYED
	    			            G.STATE_COMPLETE = true
	    			            end_round()
	    		            return true end)
                            }))

                            return {
                                message = localize("Skipped", 'blind_states'),
                                colour = G.C.SECONDARY_SET.FILTER
                            }
                        end
                    end
                end
            end

            if context.skip_blind then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag('tag_fur_skipstag'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end)
                }))

                return {
                    extra = {focus = card, message = localize('fur_skipstag')},
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS.tag_fur_skipstag

            if config.joker_lines then
                if G.GAME.current_round.hands_left > 0 then
                    if G.GAME.blind.boss then
                        if Cryptid then
                            if card.ability.cry_rigged or (G.GAME.probabilities.normal > card.ability.extra.bossodds) then
                                return {vars = {card.ability.extra.bossodds, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            end
                        else
                            if G.GAME.probabilities.normal > card.ability.extra.bossodds then
                                return {vars = {card.ability.extra.bossodds, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            end
                        end
                    else
                        if Cryptid then
                            if card.ability.cry_rigged then
                                return {vars = {card.ability.extra.odds, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                            end
                        else
                            return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                        end
                    end
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossodds}}
                end
            else
                if G.GAME.current_round.hands_left > 0 then
                    if G.GAME.blind.boss then
                        if Cryptid then
                            if card.ability.cry_rigged or (G.GAME.probabilities.normal > card.ability.extra.bossodds) then
                                return {vars = {card.ability.extra.bossodds, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            end
                        else
                            if G.GAME.probabilities.normal > card.ability.extra.bossodds then
                                return {vars = {card.ability.extra.bossodds, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            end
                        end
                    else
                        if Cryptid then
                            if card.ability.cry_rigged then
                                return {vars = {card.ability.extra.odds, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            else
                                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                            end
                        else
                            return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                        end
                    end
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossodds}}
                end
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end
    }
end

local ghost_lines = { -- GhostFox
    normal = {
        '"It\'s not my birthday!!"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'ghost',
    config = {extra = { xmult = 1, gain = 0.25 }},
    atlas = 'furryjokers',
    pos = {x = 4, y = 0},
    soul_pos = {x = 5, y = 0},
    rarity = 'fur_rarityfurry',
    pools = {
        ["furry"] = true,
        ["mythicfurries"] = true,
    },
    cost = 25,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = 'Mult',
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end

        if context.individual and context.cardarea == G.play then
            local playingcard = context.other_card
            if not context.blueprint then
                if SMODS.has_enhancement(context.other_card, 'm_fur_ghostcard') then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                    }
                end

                for k, v in pairs(playingcard) do
                    if playingcard.config.center.key == "c_base" then
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            playingcard:set_ability(G.P_CENTERS['m_fur_ghostcard']);
                            playingcard:juice_up(0.5, 0.5)
                            return true
                        end
                        }))

                        return {
                            message = localize('fur_ghostcardtrigger'),
                            colour = G.C.FILTER
                        }
                    end
                end
            end
        end

        if context.joker_main and context.cardarea == G.jokers then
            if card.debuff then return nil end
            return {
                xmult = card.ability.extra.xmult,
                colour = G.C.MULT
            }
        end

        if context.hand_drawn then
            G.hand.config.highlighted_limit = 5
            G.GAME.starting_params.play_limit = 5
            G.GAME.starting_params.discard_limit = 5
            SMODS.update_hand_limit_text(true, true)
        end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_ghostcard
        if config.joker_lines then
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, ghost_lines.normal[math.random(#ghost_lines.normal)]}}
        else
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, ghost_lines.toggle[math.random(#ghost_lines.toggle)]}}
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
    end
}

local illy_lines = { -- illyADo
    normal = {
        '"Man, I just ate shit for breakfast..."',
        '"Chat, if you dont clip this play..."',
        '"PLUH!!!"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'illy',
    config = {extra = { xmult = 1, gain = 0.5 }},
    atlas = 'furryjokers',
    pos = {x = 2, y = 0},
    soul_pos = {x = 3, y = 0},
    rarity = 'fur_rarityfurry',
    pools = {
        ["furry"] = true,
        ["mythicfurries"] = true,
    },
    cost = 25,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = 'Mult',
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if not context.blueprint then
                if context.other_card:get_id() == 13 then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                    }
                end
            end
        end
            
        if context.individual and context.cardarea == G.hand then
            if card.debuff then return nil end
            if not context.end_of_round then
                if not context.blueprint then
                    if context.other_card:get_id() == 13 then
                        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                        return {
                            extra = {message = localize('k_upgrade_ex'), colour = G.C.MULT},
                        }
                    end
                end
            end
        end

        if context.joker_main and context.cardarea == G.jokers then
            if card.debuff then return nil end
            return {
                xmult = card.ability.extra.xmult,
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        if config.joker_lines then
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, illy_lines.normal[math.random(#illy_lines.normal)], localize("King", 'ranks')}}
        else
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, illy_lines.toggle[math.random(#illy_lines.toggle)], localize("King", 'ranks')}}
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
    end
}

if Talisman then -- Jose (Talisman Check)
    local jose_lines = {
        normal = {
            '"Joseeeeeeeeeeeeeeee"',
            '"No way Jose!"',
        },
        toggle = {
            '',
        }
    }
    SMODS.Joker {
        key = 'talismanxavierorjose',
        config = { extra = { odds1 = 3, odds2 = 5, xmoney = 1, moneygain = 0.1 }},
        atlas = 'furryjokers2',
        pos = { x = 2, y = 0 },
        soul_pos = { x = 3, y = 0 },
        rarity = "fur_rarityfurry",
        pools = {
            ["furry"] = true,
            ["mythicfurries"] = true,
        },
        cost = 25,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        raffle_winners29_8_2025 = true,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end

            if context.individual and context.cardarea == G.play then
                local playingcard = context.other_card
                local enhancements = pseudorandom_element(G.P_CENTER_POOLS["Enhanced"], pseudoseed("j_fur_xavierorjose"))
                if playingcard.config.center.key == "c_base" then
                    if Cryptid then
                        if card.ability.cry_rigged then
                            G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                playingcard:set_ability(enhancements);
                                playingcard:juice_up(0.5, 0.5)
                                return true
                            end)}))
                        
                            return {
                                message = localize('fur_enhanced', 'dictionary'),
                                colour = G.C.FILTER
                            }
                        else
                            if pseudorandom("j_fur_xavierorjose") < G.GAME.probabilities.normal/card.ability.extra.odds1 then
                                G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                    playingcard:set_ability(enhancements);
                                    playingcard:juice_up(0.5, 0.5)
                                    return true
                                end)}))
                            
                                return {
                                    message = localize('fur_enhanced', 'dictionary'),
                                    colour = G.C.FILTER
                                }
                            end
                        end
                    else
                        if pseudorandom("j_fur_xavierorjose") < G.GAME.probabilities.normal/card.ability.extra.odds1 then
                            G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                playingcard:set_ability(enhancements);
                                playingcard:juice_up(0.5, 0.5)
                                return true
                            end)}))
                        
                            return {
                                message = localize('fur_enhanced', 'dictionary'),
                                colour = G.C.FILTER
                            }
                        end
                    end
                else
                    if Cryptid then
                        if card.ability.cry_rigged then
                            if not context.blueprint then
                                card.ability.extra.xmoney = card.ability.extra.xmoney + card.ability.extra.moneygain
                            end
                        
                            G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                playingcard:set_ability(G.P_CENTERS.c_base);
                                playingcard:juice_up(0.5, 0.5)
                                return true
                            end)}))
                        
                            return {
                                extra = {focus = card, message = localize('k_upgrade_ex')},
                                colour = G.C.FILTER,
                            }
                        else
                            if pseudorandom("j_fur_xavierorjose") < G.GAME.probabilities.normal/card.ability.extra.odds2 then
                                if not context.blueprint then
                                    card.ability.extra.xmoney = card.ability.extra.xmoney + card.ability.extra.moneygain
                                end

                                G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                    playingcard:set_ability(G.P_CENTERS.c_base);
                                    playingcard:juice_up(0.5, 0.5)
                                    return true
                                end)}))

                                return {
                                    extra = {focus = card, message = localize('k_upgrade_ex')},
                                    colour = G.C.FILTER,
                                }
                            end
                        end
                    else
                        if pseudorandom("j_fur_xavierorjose") < G.GAME.probabilities.normal/card.ability.extra.odds2 then
                            if not context.blueprint then
                                card.ability.extra.xmoney = card.ability.extra.xmoney + card.ability.extra.moneygain
                            end

                            G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                playingcard:set_ability(G.P_CENTERS.c_base);
                                playingcard:juice_up(0.5, 0.5)
                                return true
                            end)}))

                            return {
                                extra = {focus = card, message = localize('k_upgrade_ex')},
                                colour = G.C.FILTER,
                            }
                        end
                    end
                end
            end

            if context.end_of_round and context.cardarea == G.jokers then
                if not context.blueprint then
                    if card.ability.extra.xmoney > 1 then
                        return {
                            extra = {focus = card, message = 'X'.. card.ability.extra.xmoney.." Dollars", colour = G.C.MONEY },
                            ease_dollars((G.GAME.dollars * card.ability.extra.xmoney) - G.GAME.dollars)
                        }
                    end
                end
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                if Cryptid then
                    if card.ability.cry_rigged then
                        return {vars = {card.ability.extra.odds2, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.xmoney, card.ability.extra.moneygain, jose_lines.normal[math.random(#jose_lines.normal)]}}
                    else
                        return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.xmoney, card.ability.extra.moneygain, jose_lines.normal[math.random(#jose_lines.normal)]}}
                    end
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.xmoney, card.ability.extra.moneygain, jose_lines.normal[math.random(#jose_lines.normal)]}}
                end
            else
                if Cryptid then
                    if card.ability.cry_rigged then
                        return {vars = {card.ability.extra.odds2, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.xmoney, card.ability.extra.moneygain, jose_lines.toggle[math.random(#jose_lines.toggle)]}}
                    else
                        return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.xmoney, card.ability.extra.moneygain, jose_lines.toggle[math.random(#jose_lines.toggle)]}}
                    end
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.xmoney, card.ability.extra.moneygain, jose_lines.toggle[math.random(#jose_lines.toggle)]}}
                end
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end,
    }
end

local lupo_lines = { -- Luposity (Alternate effect for code cards if Cryptid mod is present)
    normal = {
        '"Chat, who wants a choccy chip cookie?"',
        '"COOOOKKKKIIIEEEEEE!!!!"',
        '"Mmmmmmmm, yummy cookie..."',
    },
    toggle = {
        '',
    }
}
if Cryptid then -- Cryptid mod check
    SMODS.Joker { 
        key = 'cryptidluposity',
        config = {extra = { xmult = 1, gain = 0.5 }},
        atlas = 'furryjokers',
        pos = { x = 2, y = 4 },
        soul_pos = { x = 3, y = 4 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["furry"] = true,
            ["mythicfurries"] = true,
        },
        cost = 25,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        effect = 'Mult',
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            if context.using_consumeable and context.consumeable.ability.set == 'Code' then
                if not context.blueprint then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        colour = G.C.GREEN
                    }
                end
            end

            if context.joker_main and context.cardarea == G.jokers then
                return {
                    xmult = card.ability.extra.xmult,
                    colour = G.C.MULT
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return {vars = {card.ability.extra.xmult, card.ability.extra.gain, lupo_lines.normal[math.random(#lupo_lines.normal)], localize('code', 'labels')}}
            else
                return {vars = {card.ability.extra.xmult, card.ability.extra.gain, lupo_lines.toggle[math.random(#lupo_lines.toggle)], localize('code', 'labels')}}
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end
    }
else
    SMODS.Joker { 
        key = 'luposity',
        config = {extra = { xmult = 1, gain = 0.5 }},
        atlas = 'furryjokers',
        pos = { x = 2, y = 4 },
        soul_pos = { x = 3, y = 4 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["furry"] = true,
            ["mythicfurries"] = true,
        },
        cost = 25,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        effect = 'Mult',
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            if context.using_consumeable then
                if not context.blueprint then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        colour = G.C.MULT
                    }
                end
            end

            if context.joker_main and context.cardarea == G.jokers then
                return {
                    xmult = card.ability.extra.xmult,
                    colour = G.C.MULT
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return {vars = {card.ability.extra.xmult, card.ability.extra.gain, lupo_lines.normal[math.random(#lupo_lines.normal)], localize('b_stat_consumables')}}
            else
                return {vars = {card.ability.extra.xmult, card.ability.extra.gain, lupo_lines.toggle[math.random(#lupo_lines.toggle)], localize('b_stat_consumables')}}
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end
    }
end

if Talisman then -- SephiraPaws (Talisman Check)
    local sephirapaws_lines = {
        normal = {
            '"UwU"',
            '"Fluffiness over 9000!"',
            '"Time to push the game to its limits >:3"',
        },
        toggle = {
            '',
        }
    }
    SMODS.Joker {
        key = "talismansephirapaws",
        config = { discardstate = "Inactive", extra = { emult = 1, emultgain = 0.25 }},
        atlas = 'furryjokers2',
        pos = { x = 0, y = 0 },
        soul_pos = { x = 1, y = 0 },
        rarity = "fur_rarityfurry",
        pools = {
            ["furry"] = true,
            ["mythicfurries"] = true,
        },
        cost = 25,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        raffle_winners29_8_2025 = true,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            local eval = function() return card.ability.discardstate == "Active" and not G.RESET_JIGGLES end

            if context.setting_blind then
                if not context.blueprint then
                    card.ability.discardstate = "Active"
                    juice_card_until(card, eval, true)

                    return {
                        message = localize("loyalty_active", "v_dictionary"),
                        card = card,
                    }
                end
            end

            if context.pre_discard and not context.hook then -- From VanillaRemade
                if not context.blueprint then
                    local upgradeemult = true
                    local selectedhandtype = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                    local play_more_than = (G.GAME.hands[selectedhandtype].played or 0)
                    for handname, values in pairs(G.GAME.hands) do
                        if handname ~= selectedhandtype and values.played >= play_more_than and SMODS.is_poker_hand_visible(handname) then
                        upgradeemult = false
                        break
                        end
                    end

                    if upgradeemult and card.ability.discardstate == "Active" then
                        card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.emultgain
                        card.ability.discardstate = "Inactive"

                        return {
                            message = localize('k_upgrade_ex'),
                            card = card,
                            colour = G.C.FILTER
                        }
                    end
                end
            end

            if context.joker_main and context.cardarea == G.jokers then
                if card.ability.extra.emult ~= 1 then
                    return {
                        mult = mod_mult(mult ^ card.ability.extra.emult),
                        remove_default_message = true,
                        message = '^' .. card.ability.extra.emult .. ' Mult',
                        sound = 'fur_emult',
                        colour = G.C.DARK_EDITION
                    }
                end
            end

            if context.end_of_round then
                card.ability.discardstate = "Inactive"
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return {vars = {card.ability.extra.emult, card.ability.extra.emultgain, card.ability.discardstate, sephirapaws_lines.normal[math.random(#sephirapaws_lines.normal)],}}
            else
                return {vars = {card.ability.extra.emult, card.ability.extra.emultgain, card.ability.discardstate, sephirapaws_lines.toggle[math.random(#sephirapaws_lines.toggle)],}}
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end
    }
end

local soks_lines = { -- SoksAtArt
    normal = {
        '"I am more than happy to take a dragon every now and then"',
        '"Greetings my Milkers"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'soks',
    config = {extra = { bonus_hands = 1 }},
    atlas = 'furryjokers',
    pos = {x = 0, y = 1},
    soul_pos = {x = 1, y = 1},
    rarity = 'fur_rarityfurry',
    pools = {
        ["furry"] = true,
        ["mythicfurries"] = true,
    },
    cost = 25,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_fur_sockcard') then
                    ease_hands_played(card.ability.extra.bonus_hands)

                return {
                    extra = {focus = card, message = '+' .. card.ability.extra.bonus_hands .. " " .. localize("k_hud_hands"), colour = G.C.CHIPS},
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_sockcard
        if config.joker_lines then
            return {vars = {card.ability.extra.bonus_hands, soks_lines.normal[math.random(#soks_lines.normal)], localize("k_hud_hands")}}
        else
            return {vars = {card.ability.extra.bonus_hands, soks_lines.toggle[math.random(#soks_lines.toggle)], localize("k_hud_hands")}}
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
    end
}