local furry_mod = SMODS.current_mod
local config = furry_mod.config

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
    config = { partnersynergizetrigger = false, extra = { xmult = 1, gain = 1 }},
    atlas = 'curiousangelslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
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
        if G.GAME.selected_partner == "pnr_fur_curiousangelpartner" then
            if not card.ability.partnersynergizetrigger or card.ability.extra.gain == 1 then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.gain = card.ability.extra.gain * 2
            end
        end
        
        if context.individual and context.cardarea == G.play then
            if not playingcard.edition then
                if SMODS.pseudorandom_probability(card, "j_fur_curiousangel", 1, 15, "fur_curiousangel") then
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
                if SMODS.pseudorandom_probability(card, "j_fur_curiousangel", 1, 15, "fur_curiousangel") then
                    G.E_MANAGER:add_event(Event({
					func = function()
				    	joker:set_edition({negative = true}, true)
				    	return true
					end}))

                    return {
                        message = localize("fur_angelnegated"), 
                        colour = G.C.DARK_EDITION
                    }
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
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 15, "fur_curiousangel")
        if not (card.edition or {}).negative then
            info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        end
        
        if config.joker_lines then
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, numerator, denominator, curiousangel_lines.normal[math.random(#curiousangel_lines.normal)], localize('negative', 'labels')}}
        else
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, numerator, denominator, curiousangel_lines.toggle[math.random(#curiousangel_lines.toggle)], localize('negative', 'labels')}}
        end
    end,

    update = function(self, card, dt)
        local complexbackground = config.complex_jokers.current_option
        local jokerref = card.config.center
        if complexbackground == 1 then
            jokerref.pos = { x = 1, y = 0 }
        elseif complexbackground == 2 then
            jokerref.pos = { x = 2, y = 0 }
        end
        
        if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
            config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
            card:set_sprites(jokerref)
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
    end,

    in_pool = function(self, args)
        if (next(SMODS.find_card("j_fur_corruptcuriousangel")) or next(SMODS.find_card("j_fur_talismancorruptcuriousangel"))) then
            return false
        else
            return true
        end
    end
}

local danny_lines = {
    normal = {
        '"Can you pet me please..."',
        '"Meow!"',
        '"Bwah"',
        '"Silly"',
        '"Am I a good kitty...?"',
    },
    toggle = {
        '',
    }
}
if Talisman then -- Danny
    SMODS.Joker {
        key = "talismandanny",
        loc_txt = {
            name = "Danny",
            text = {
                "This CatDragon {C:attention}debuffs{} all non-{C:fur_stars}#3#{} cards",
                "For each {C:attention}played hand{} that contains a {C:attention}Flush{}, add",
                "{X:dark_edition,C:white}^#2#{} Mult and apply a {C:blue}Blue Paw Seal{} to {C:attention}scored cards",
                "Each {C:attention}scored {C:fur_stars}#3#{} card gives {X:dark_edition,C:white}^#1#{} Mult"
            },
        },
        config = { partnersynergizetrigger = false, extra = { emult = 1, emultgain = 0.1 }},
        atlas = 'dannyslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
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
        raffle_winners31_10_2025 = true,
        saracrossing = true,
        
        calculate = function(self, card, context)
            if card.debuff then return nil end

            local playingcard = context.other_card
            if G.GAME.selected_partner == "pnr_fur_dannypartner" then
                if not card.ability.partnersynergizetrigger or card.ability.extra.emultgain == 0.1 then
                    card.ability.partnersynergizetrigger = true
                    card.ability.extra.emultgain = card.ability.extra.emultgain * 2
                end
            end

            if context.before and (next(context.poker_hands['Flush']) or next(context.poker_hands['Flush House'])
                or next(context.poker_hands['Flush Five']) or next(context.poker_hands['Straight Flush'])) then
                if not context.blueprint then
                    card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.emultgain

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                    }
                end
            end

            if context.individual and context.cardarea == G.play and (next(context.poker_hands['Flush']) or next(context.poker_hands['Flush House'])
                or next(context.poker_hands['Flush Five']) or next(context.poker_hands['Straight Flush'])) then
                if playingcard.seal == "fur_bluepawseal" then
                    return {
                        emult = card.ability.extra.emult,
                        remove_default_message = true,
                        message = '^'..card.ability.extra.emult.." "..localize("k_mult"),
                        sound = 'fur_emult',
                        colour = G.C.DARK_EDITION
                    }
                else
                    G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        playingcard:set_seal('fur_bluepawseal', nil, true);
                        playingcard:juice_up(0.5, 0.5)
                        return true
                    end)}))
                    
                    return {
                        emult = card.ability.extra.emult,
                        message = localize('fur_sealed', 'dictionary'),
                        remove_default_message = true,
                        message = '^'..card.ability.extra.emult.." "..localize("k_mult"),
                        sound = 'fur_emult',
                        colour = G.C.DARK_EDITION
                    }
                end
            end
        end,

        update = function(self, card, dt) -- From Cryptid
            local complexbackground = config.complex_jokers.current_option
            local jokerref = card.config.center
            if G.GAME.selected_partner ~= "pnr_fur_dannypartner" then
	    	    if G.deck and card.added_to_deck then
	    		    for i, v in pairs(G.deck.cards) do
	    		    	if not (v:is_suit("fur_stars") or v:is_suit('six_Stars')) then
	    		    		v:set_debuff(true)
	    		    	end
	    		    end
	    	    end
	    	    if G.hand and card.added_to_deck then
	    		    for i, v in pairs(G.hand.cards) do
	    		    	if not (v:is_suit("fur_stars") or v:is_suit('six_Stars')) then
	    		    		v:set_debuff(true)
	    		    	end
	    		    end
	    	    end
            end
            if complexbackground == 1 then
                jokerref.pos = { x = 1, y = 0 }
            elseif complexbackground == 2 then
                jokerref.pos = { x = 2, y = 0 }
            end

            if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
                config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
                card:set_sprites(jokerref)
            end 
	    end,

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_SEALS.fur_bluepawseal
            
            if config.joker_lines then
                return { vars = { card.ability.extra.emult, card.ability.extra.emultgain, localize('fur_stars', 'suits_singular'), danny_lines.normal[math.random(#danny_lines.normal)] }}
            else
                return { vars = { card.ability.extra.emult, card.ability.extra.emultgain, localize('fur_stars', 'suits_singular'), danny_lines.toggle[math.random(#danny_lines.toggle)] }}
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end,

        in_pool = function(self, args)
            if next(SMODS.find_card("j_fur_talismancorruptdanny")) then
                return false
            else
                return true
            end
        end
    }
end

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
        atlas = 'skipsslab',
        config = { extra = { bossdenominator = 15 }},
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
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
            if G.GAME.blind.boss then
                if (G.GAME.probabilities.normal > 4) or card.ability.cry_rigged then
                    if (context.fix_probability and context.identifier == "fur_skips") and not context.blueprint then
                        return {
                            numerator = 4
                        }
                    end
                end
            end

            if context.first_hand_drawn then
                if not G.GAME.blind.boss then
                    if SMODS.pseudorandom_probability(card, "j_fur_skips", 1, 15, "fur_skips") then
	    	    	    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
	    		        G.GAME.chips = G.GAME.blind.chips
                        check_for_unlock({ type = "skips_ability_triggered" })
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
        
            if context.skip_blind then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        if G.GAME.selected_partner == "pnr_fur_skipspartner" then
                            add_tag(Tag('tag_fur_skipstag'))
                            add_tag(Tag('tag_fur_skipstag'))
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        else
                            add_tag(Tag('tag_fur_skipstag'))
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        end
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
            local numerator, denominator = SMODS.get_probability_vars(card, 1, 15, 'fur_skips')

            if config.joker_lines then
                return { vars = {numerator, denominator, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossdenominator }}
            else
                return { vars = {numerator, denominator, skips_lines.toggle[math.random(#skips_lines.toggle)] }}
            end
        end,

        update = function(self, card, dt)
            local complexbackground = config.complex_jokers.current_option
            local jokerref = card.config.center
            if complexbackground == 1 then
                jokerref.pos = { x = 1, y = 0 }
            elseif complexbackground == 2 then
                jokerref.pos = { x = 2, y = 0 }
            end

            if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
                config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
                card:set_sprites(jokerref)
            end
        end,
    
        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end
    }
else
    SMODS.Joker { 
        key = 'skips',
        atlas = 'skipsslab',
        config = { extra = { bossdenominator = 15 }},
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
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
            if G.GAME.blind.boss then
                if (G.GAME.probabilities.normal > 4) or card.ability.cry_rigged then
                    if (context.fix_probability and context.identifier == "fur_skips") and not context.blueprint then
                        return {
                            numerator = 4
                        }
                    end
                end
            end

            if context.first_hand_drawn then
                if G.GAME.blind.boss then
                    if card.ability.cry_rigged or G.GAME.probabilities.normal > 4 then
                        if pseudorandom("j_fur_skips") < 4 / card.ability.extra.bossdenominator then
			                G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
				                G.GAME.chips = G.GAME.blind.chips
                                check_for_unlock({ type = "skips_ability_triggered" })
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
                        if SMODS.pseudorandom_probability(card, "j_fur_skips", 1, 15, "fur_skips") then
	    	    	        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
	    		            G.GAME.chips = G.GAME.blind.chips
                            check_for_unlock({ type = "skips_ability_triggered" })
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
                    if SMODS.pseudorandom_probability(card, "j_fur_skips", 1, 15, "fur_skips") then
	    	    	    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
	    		        G.GAME.chips = G.GAME.blind.chips
                        check_for_unlock({ type = "skips_ability_triggered" })
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

            if context.skip_blind then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        if G.GAME.selected_partner == "pnr_fur_skipspartner" then
                            add_tag(Tag('tag_fur_skipstag'))
                            add_tag(Tag('tag_fur_skipstag'))
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        else
                            add_tag(Tag('tag_fur_skipstag'))
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        end
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
            local numerator, denominator = SMODS.get_probability_vars(card, 1, 15, 'fur_skips')

            if config.joker_lines then
                return {vars = {numerator, denominator, skips_lines.normal[math.random(#skips_lines.normal)], card.ability.extra.bossdenominator}}
            else
                return {vars = {numerator, denominator, skips_lines.toggle[math.random(#skips_lines.toggle)], card.ability.extra.bossdenominator}}
            end
        end,

        update = function(self, card, dt)
            local complexbackground = config.complex_jokers.current_option
            local jokerref = card.config.center
            if complexbackground == 1 then
                jokerref.pos = { x = 1, y = 0 }
            elseif complexbackground == 2 then
                jokerref.pos = { x = 2, y = 0 }
            end

            if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
                config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
                card:set_sprites(jokerref)
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
    config = { partnersynergizetrigger = false, extra = { xmult = 1, gain = 0.25 }},
    atlas = 'ghostslab',
    pos = {x = 1, y = 0},
    soul_pos = {x = 0, y = 0},
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
        if G.GAME.selected_partner == "pnr_fur_ghostpartner" then
            if not card.ability.partnersynergizetrigger or card.ability.extra.gain == 0.25 then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.gain = card.ability.extra.gain * 2
            end
        end

        if context.first_hand_drawn then
            G.hand.config.highlighted_limit = 5
            G.GAME.starting_params.play_limit = 5
            G.GAME.starting_params.discard_limit = 5
            SMODS.update_hand_limit_text(true, true)
        end

        if context.hand_drawn then
            G.hand.config.highlighted_limit = 5
            G.GAME.starting_params.play_limit = 5
            G.GAME.starting_params.discard_limit = 5
            SMODS.update_hand_limit_text(true, true)
        end

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
            return {
                xmult = card.ability.extra.xmult,
                colour = G.C.MULT
            }
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

    update = function(self, card, dt)
        local complexbackground = config.complex_jokers.current_option
        local jokerref = card.config.center
        if complexbackground == 1 then
            jokerref.pos = { x = 1, y = 0 }
        elseif complexbackground == 2 then
            jokerref.pos = { x = 2, y = 0 }
        end
        
        if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
            config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
            card:set_sprites(jokerref)
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
        '"Where\'d ya get that card from, the Dollar General?"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'illy',
    config = {extra = { xmult = 1, gain = 0.5 }},
    atlas = 'illyadoslab',
    pos = {x = 1, y = 0},
    soul_pos = {x = 0, y = 0},
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
                if next(SMODS.find_mod("partner")) then
                    if G.GAME.selected_partner == "pnr_fur_illypartner" then
                        if context.other_card:is_face() then
                            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                            return {
                                extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                            }
                        end
                    else
                        if context.other_card:get_id() == 13 then
                            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                            return {
                                extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                            }
                        end
                    end
                else
                    if context.other_card:get_id() == 13 then
                        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                        return {
                            extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                        }
                    end
                end
            end
        end
            
        if context.individual and context.cardarea == G.hand then
            if not context.end_of_round then
                if not context.blueprint then
                    if next(SMODS.find_mod("partner")) then
                        if G.GAME.selected_partner == "pnr_fur_illypartner" then
                            if context.other_card:is_face() then
                                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                                return {
                                    extra = {message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                                }
                            end
                        else
                            if context.other_card:get_id() == 13 then
                                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                                return {
                                    extra = {message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                                }
                            end
                        end
                    else
                        if context.other_card:get_id() == 13 then
                            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                            return {
                                extra = {message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                            }
                        end
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
        if config.joker_lines then
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, illy_lines.normal[math.random(#illy_lines.normal)], localize("King", 'ranks')}}
        else
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, illy_lines.toggle[math.random(#illy_lines.toggle)], localize("King", 'ranks')}}
        end
    end,

    update = function(self, card, dt)
        local complexbackground = config.complex_jokers.current_option
        local jokerref = card.config.center
        if complexbackground == 1 then
            jokerref.pos = { x = 1, y = 0 }
        elseif complexbackground == 2 then
            jokerref.pos = { x = 2, y = 0 }
        end
        
        if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
            config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
            card:set_sprites(jokerref)
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
    end
}

local iridia_lines = { -- Kris57 (OC: Iridia)
    normal = {
        '*Mrow* :3',
        'Breaking News: Demon spotted in your area...',
        '.... .- .. / .- -. --. . .-.. ... -.-.--',
        '"HAI ANGELS!"'
    },
    toggle = {
        '',
    },
}
SMODS.Joker {
    key = 'iridia',
    config = { partnersynergizetrigger = false, extra = { xchips = 1.75, xmult = 1.75 }},
    atlas = 'iridiaslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = "fur_rarityfurry",
    cost = 25,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    raffle_winners31_10_2025 = true,
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if G.GAME.selected_partner == "pnr_fur_iridiapartner" then
            if not card.ability.partnersynergizetrigger or (card.ability.extra.xchips == 1.75 and card.ability.extraxmult == 1.75) then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.xchips = card.ability.extra.xchips * 2
                card.ability.extra.xmult = card.ability.extra.xmult * 2
            end
        end

        if context.individual and context.cardarea == G.play then
            return {
                xchips = card.ability.extra.xchips,
                xmult = card.ability.extra.xmult
            }
        end

        if context.before and context.cardarea == G.jokers then
            if next(SMODS.find_card("j_fur_kris57")) or next(SMODS.find_card("j_fur_talismankris57")) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local _planet = nil
                for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                    if v.config.hand_type == G.GAME.last_hand_played then
                        _planet = v.key
                    end
                end

                if G.GAME.selected_partner == "pnr_fur_iridiapartner" then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 2
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, _planet, 'fur_iridia')
                            local card2 = create_card('Planet',G.consumeables, nil, nil, nil, nil, _planet, 'fur_iridia')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 1
                            card2:add_to_deck()
                            G.consumeables:emplace(card2)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                else
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, _planet, 'fur_iridia')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                end

                return { 
                    message = localize('k_plus_planet'), 
                    colour = G.C.SECONDARY_SET.Planet 
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        if config.joker_lines then
            return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, iridia_lines.normal[math.random(#iridia_lines.normal)], localize('k_planet') }}
        else
            return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, iridia_lines.toggle[math.random(#iridia_lines.toggle)], localize('k_planet') }}
        end
    end,

    update = function(self, card, dt)
        local complexbackground = config.complex_jokers.current_option
        local jokerref = card.config.center
        if complexbackground == 1 then
            jokerref.pos = { x = 1, y = 0 }
        elseif complexbackground == 2 then
            jokerref.pos = { x = 2, y = 0 }
        end
        
        if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
            config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
            card:set_sprites(jokerref)
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
    end
}

local jose_lines = { -- Jose (Talisman)
    normal = {
        '"Joseeeeeeeeeeeeeeee"',
        '"No way Jose!"',
    },
    toggle = {
        '',
    }
}
if Talisman then
    SMODS.Joker {
        key = 'talismanxavierorjose',
        config = { partnersynergizetrigger = false, extra = { xmoney = 1, moneygain = 0.1 }},
        atlas = 'joseeeeslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
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
            if G.GAME.selected_partner == "pnr_fur_xavierorjosepartner" then
                if not card.ability.partnersynergizetrigger or card.ability.extra.moneygain == 0.1 then
                    card.ability.partnersynergizetrigger = true
                    card.ability.extra.moneygain = card.ability.extra.moneygain * 2
                end
            end

            if context.individual and context.cardarea == G.play then
                local playingcard = context.other_card
                local enhancements = pseudorandom_element(G.P_CENTER_POOLS["Enhanced"], pseudoseed("j_fur_talismanxavierorjose"))

                if not context.blueprint then
                    if playingcard.config.center.key == "c_base" then
                        if SMODS.pseudorandom_probability(card, "j_fur_xavierorjose", 1, 3, "fur_xavierorjose") then
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
                    else
                        if SMODS.pseudorandom_probability(card, "j_fur_xavierorjose", 1, 5, "fur_xavierorjose2") then
                            G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                playingcard:set_ability(G.P_CENTERS.c_base);
                                playingcard:juice_up(0.5, 0.5)
                                return true
                            end)}))
                        
                            card.ability.extra.xmoney = card.ability.extra.xmoney + card.ability.extra.moneygain
                            
                            return {
                                extra = {focus = card, message = localize('k_upgrade_ex')},
                                colour = G.C.FILTER,
                            }
                        end
                    end
                end
            end
        end,

        calc_dollar_bonus = function(self, card)
            return G.GAME.dollars * card.ability.extra.xmoney
        end,

        loc_vars = function(self, info_queue, card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, 3, 'fur_xavierorjose')
            local numerator2, denominator2 = SMODS.get_probability_vars(card, 1, 5, 'fur_xavierorjose2')

            if config.joker_lines then
                return {vars = {numerator, denominator, numerator2, denominator2, card.ability.extra.moneygain, card.ability.extra.xmoney, jose_lines.normal[math.random(#jose_lines.normal)]}}
            else
                return {vars = {numerator, denominator, numerator2, denominator2, card.ability.extra.moneygain, card.ability.extra.xmoney, jose_lines.toggle[math.random(#jose_lines.toggle)]}}
            end
        end,

        update = function(self, card, dt)
            local complexbackground = config.complex_jokers.current_option
            local jokerref = card.config.center
            if complexbackground == 1 then
                jokerref.pos = { x = 1, y = 0 }
            elseif complexbackground == 2 then
                jokerref.pos = { x = 2, y = 0 }
            end

            if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
                config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
                card:set_sprites(jokerref)
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end,
    }
end

local kris57_lines = {
    normal = {
        '"Literally just existing"',
        '"DELTARUNE TOMORROW!!!"',
        '"It\'s TV time!!"',
    },
    toggle = {
        '',
    }
}
if Talisman then -- Kris_57
    SMODS.Joker {
        key = 'talismankris57',
        config = { partnersynergizetrigger = false, extra = { echips = 1, emult = 1, echipsgain = 0.5, emultgain = 0.5, money = 5 }},
        atlas = 'kris57slab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["furry"] = true,
            ["mythicfurries"] = true
        },
        cost = 25,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        kris_57 = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            if G.GAME.selected_partner == "pnr_fur_kris57partner" then
                if not card.ability.partnersynergizetrigger or (card.ability.extra.echipsgain == 0.5 and card.ability.extra.emultgain == 0.5) then
                    card.ability.partnersynergizetrigger = true
                    card.ability.extra.money = card.ability.extra.money * 2
                    card.ability.extra.echipsgain = card.ability.extra.echipsgain * 2
                    card.ability.extra.emultgain = card.ability.extra.emultgain * 2
                end
            end

            if context.individual and context.cardarea == G.play then
                if context.other_card:get_id() == 5 then
                    if not context.blueprint then
                        card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.emultgain
                    end
                    if next(SMODS.find_card("j_fur_iridia")) then
                        ease_dollars(card.ability.extra.money)
                    end

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                    }
                end

                if context.other_card:get_id() == 7 then
                    if not context.blueprint then
                        card.ability.extra.echips = card.ability.extra.echips + card.ability.extra.echipsgain
                    end
                    if next(SMODS.find_card("j_fur_iridia")) then
                        ease_dollars(card.ability.extra.money)
                    end
                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                    }
                end
            end

            if context.joker_main and context.cardarea == G.jokers then
                return {
                    echips = card.ability.extra.echips,
                    emult = card.ability.extra.emult,
                    sound = 'fur_emult',
                    colour = G.C.DARK_EDITION
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return { vars = { card.ability.extra.echips, card.ability.extra.emult, card.ability.extra.echipsgain, card.ability.extra.emultgain, kris57_lines.normal[math.random(#kris57_lines.normal)], card.ability.extra.money }}
            else
                return { vars = { card.ability.extra.echips, card.ability.extra.emult, card.ability.extra.echipsgain, card.ability.extra.emultgain, kris57_lines.toggle[math.random(#kris57_lines.toggle)], card.ability.extra.money }}
            end
        end,

        update = function(self, card, dt)
            local complexbackground = config.complex_jokers.current_option
            local jokerref = card.config.center
            if complexbackground == 1 then
                jokerref.pos = { x = 1, y = 0 }
            elseif complexbackground == 2 then
                jokerref.pos = { x = 2, y = 0 }
            end

            if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
                config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
                card:set_sprites(jokerref)
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end
    }
else
    SMODS.Joker {
        key = 'kris57',
        config = { extra = { partnersynergizetrigger = false, xchips = 1, xmult = 1, xchipsgain = 0.5, xmultgain = 0.5, money = 5 }},
        atlas = 'kris57slab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["furry"] = true,
            ["mythicfurries"] = true
        },
        cost = 25,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        kris_57 = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            if G.GAME.selected_partner == "pnr_fur_kris57partner" then
                if not card.ability.partnersynergizetrigger or (card.ability.extra.xchipsgain == 0.5 and card.ability.extra.xmultgain == 0.5) then
                    card.ability.partnersynergizetrigger = true
                    card.ability.extra.money = card.ability.extra.money * 2
                    card.ability.extra.xchipsgain = card.ability.extra.xchipsgain * 2
                    card.ability.extra.xmultgain = card.ability.extra.xmultgain * 2
                end
            end

            if context.individual and context.cardarea == G.play then
                if context.other_card:get_id() == 5 then
                    if not context.blueprint then
                        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultgain
                    end
                    if next(SMODS.find_card("j_fur_iridia")) then
                        ease_dollars(card.ability.extra.money)
                    end

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                    }
                end

                if context.other_card:get_id() == 7 then
                    if not context.blueprint then
                        card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsgain
                    end
                    if next(SMODS.find_card("j_fur_iridia")) then
                        ease_dollars(card.ability.extra.money)
                    end

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                    }
                end
            end

            if context.joker_main and context.cardarea == G.jokers then
                return {
                    xchips = card.ability.extra.xchips,
                    xmult = card.ability.extra.xmult
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, card.ability.extra.xchipsgain, card.ability.extra.xmultgain, kris57_lines.normal[math.random(#kris57_lines.normal)], card.ability.extra.money }}
            else
                return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, card.ability.extra.xchipsgain, card.ability.extra.xmultgain, kris57_lines.toggle[math.random(#kris57_lines.toggle)], card.ability.extra.money }}
            end
        end,

        update = function(self, card, dt)
            local complexbackground = config.complex_jokers.current_option
            local jokerref = card.config.center
            if complexbackground == 1 then
                jokerref.pos = { x = 1, y = 0 }
            elseif complexbackground == 2 then
                jokerref.pos = { x = 2, y = 0 }
            end

            if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
                config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
                card:set_sprites(jokerref)
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end
    }
end

local lupo_lines = { -- Luposity
    normal = {
        '"Chat, who wants a choccy chip cookie?"',
        '"COOOOKKKKIIIEEEEEE!!!!"',
        '"Mmmmmmmm, yummy cookie..."',
    },
    toggle = {
        '',
    }
}
if Cryptid then
    SMODS.Joker { 
        key = 'cryptidluposity',
        config = {extra = { xmult = 1, gain = 0.5 }},
        atlas = 'luposityslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
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

        update = function(self, card, dt)
            local complexbackground = config.complex_jokers.current_option
            local jokerref = card.config.center
            if complexbackground == 1 then
                jokerref.pos = { x = 1, y = 0 }
            elseif complexbackground == 2 then
                jokerref.pos = { x = 2, y = 0 }
            end

            if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
                config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
                card:set_sprites(jokerref)
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
        atlas = 'luposityslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
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
                    if next(SMODS.find_mod("partner")) then
                        if context.consumeable.config.center.key == "c_fur_chocolatechipcookie" then
                            card.ability.extra.gain = card.ability.extra.gain + 0.25
                        end
                        if context.consumeable.ability.set == "lupocookies" then
                            if G.GAME.selected_partner == "pnr_fur_lupositypartner" then
                                card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.gain * 5)
                            else
                                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
                            end
                        else
                            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
                        end
                    end

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

        update = function(self, card, dt)
            local complexbackground = config.complex_jokers.current_option
            local jokerref = card.config.center
            if complexbackground == 1 then
                jokerref.pos = { x = 1, y = 0 }
            elseif complexbackground == 2 then
                jokerref.pos = { x = 2, y = 0 }
            end

            if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
                config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
                card:set_sprites(jokerref)
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end
    }
end

local sephirapaws_lines = { -- SephiraPaws (Talisman Check)
    normal = {
        '"UwU"',
        '"Fluffiness over 9000!"',
        '"Time to push the game to its limits >:3"',
    },
    toggle = {
        '',
    }
}
if Talisman then
    SMODS.Joker {
        key = "talismansephirapaws",
        config = { discardstate = "Inactive", partnersynergizetrigger = false, extra = { emult = 1, emultgain = 0.25 }},
        atlas = 'sephirapawsslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
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
            if G.GAME.selected_partner == "pnr_fur_sephirapawspartner" then
                if not card.ability.partnersynergizetrigger or card.ability.extra.emultgain == 0.25 then
                    card.ability.partnersynergizetrigger = true
                    card.ability.extra.emultgain = card.ability.extra.emultgain * 2
                end
            end

            if context.setting_blind then
                card.ability.discardstate = "Active"
                juice_card_until(card, eval, true)

                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
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
                        emult = card.ability.extra.emult,
                        remove_default_message = true,
                        message = '^'..card.ability.extra.emult.." "..localize("k_mult"),
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

        update = function(self, card, dt)
            local complexbackground = config.complex_jokers.current_option
            local jokerref = card.config.center
            if complexbackground == 1 then
                jokerref.pos = { x = 1, y = 0 }
            elseif complexbackground == 2 then
                jokerref.pos = { x = 2, y = 0 }
            end

            if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
                config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
                card:set_sprites(jokerref)
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end,

        in_pool = function(self, args)
            if next(SMODS.find_card("j_fur_talismancorruptsephirapaws")) then
                return false
            else
                return true
            end
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
    config = { partnersynergizetrigger = false, extra = { bonus_hands = 1 }},
    atlas = 'soksslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
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
        if G.GAME.selected_partner == "pnr_fur_sokspartner" then
            if not card.ability.partnersynergizetrigger or card.ability.extra.bonus_hands == 1 then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.bonus_hands = card.ability.extra.bonus_hands * 2
            end
        end

        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_fur_sockcard') then
                ease_hands_played(card.ability.extra.bonus_hands)
                
                return {
                    extra = {focus = card, message = '+ ' ..card.ability.extra.bonus_hands.. localize("k_hud_hands"), colour = G.C.CHIPS},
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

    update = function(self, card, dt)
        local complexbackground = config.complex_jokers.current_option
        local jokerref = card.config.center
        if complexbackground == 1 then
            jokerref.pos = { x = 1, y = 0 }
        elseif complexbackground == 2 then
            jokerref.pos = { x = 2, y = 0 }
        end
        
        if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
            config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
            card:set_sprites(jokerref)
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
    end
}

local sourstone_lines = { -- Sourstone :3
    normal = {
        '',
    },
    toggle = {
        '',
    },
}
if Talisman then
    SMODS.Joker {
        key = 'talismansourstone3',
        config = { extra = { money = 5, emult = 2 }},
        atlas = 'sourstone3slab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = "fur_rarityfurry",
        pools = {
            ["furry"] = true,
            ["mythicfurries"] = true
        },
        cost = 25,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        kris_57 = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            
            if context.joker_main and context.cardarea == G.jokers then
                if G.jokers.cards[1] == card then
                    ease_dollars(card.ability.extra.money)

                    return {
                        extra = {
                            card = card, 
                            message = "+$" .. card.ability.extra.money, 
                            colour = G.C.MONEY
                        },
                    }
                elseif G.jokers.cards[#G.jokers.cards] == card then
                    if next(SMODS.find_mod("partner")) then
                        if G.GAME.selected_partner == "pnr_fur_sourstone3partner" then
                            return {
                                emult = card.ability.extra.emult,
                                remove_default_message = true,
                                message = '^'..card.ability.extra.emult.." "..localize("k_mult"),
                                sound = 'fur_emult',
                                colour = G.C.DARK_EDITION
                            }
                        else
                            ease_dollars(-card.ability.extra.money, true)

                            return {
                                emult = card.ability.extra.emult,
                                remove_default_message = true,
                                message = '^'..card.ability.extra.emult.." "..localize("k_mult"),
                                sound = 'fur_emult',
                                colour = G.C.DARK_EDITION
                            }
                        end
                    else
                        ease_dollars(-card.ability.extra.money, true)

                        return {
                            emult = card.ability.extra.emult,
                            remove_default_message = true,
                            message = '^'..card.ability.extra.emult.." "..localize("k_mult"),
                            sound = 'fur_emult',
                            colour = G.C.DARK_EDITION
                        }
                    end
                end
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return { vars = { card.ability.extra.money, card.ability.extra.emult, sourstone_lines.normal[math.random(#sourstone_lines.normal)] }}
            else
                return { vars = { card.ability.extra.money, card.ability.extra.emult, sourstone_lines.toggle[math.random(#sourstone_lines.toggle)] }}
            end
        end,

        update = function(self, card, dt)
            local complexbackground = config.complex_jokers.current_option
            local jokerref = card.config.center
            if complexbackground == 1 then
                jokerref.pos = { x = 1, y = 0 }
            elseif complexbackground == 2 then
                jokerref.pos = { x = 2, y = 0 }
            end
            
            if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
                config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
                card:set_sprites(jokerref)
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
        end
    }
end