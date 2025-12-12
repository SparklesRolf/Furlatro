local furry_mod = SMODS.current_mod
local config = furry_mod.config

local corruptangel_lines = { -- CuriousAngel (Corrupt)
    normal = {
        '"What the fuck is your luck?"',
        '"Have you consider going outside?"',
        '"How did you find me.."',
        '"Can this run end faster so i can go back to sleep"',
        '"Stop hovering over me.. it tickles"',
    },
    toggle = {
        '',
    }
}
if Talisman then
    SMODS.Joker {
        key = 'talismancorruptcuriousangel',
        config = {extra = { emult = 5, gain = 5 }},
        atlas = 'corruptcuriousangelslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        effect = nil,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            local joker = context.other_joker
            local playingcard = context.other_card

            if context.individual and context.cardarea == G.play then
                if not (playingcard.edition or {}).negative then
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
                else
                    if not context.blueprint then
                        card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.gain

                        return {
                            focus = card,
                            message = localize('k_upgrade_ex'),
                            colour = G.C.FILTER
                        }
                    end
                end
            end

            if context.other_joker and not (joker.edition or {}).negative then
                if context.other_joker.config.center.key ~= "j_fur_talismancorruptcuriousangel" then
                    if context.other_joker.config.center.key ~= "j_fur_talismancorruptsparkles" then
                        if context.other_joker.config.center.key ~= "j_fur_talismancorruptdanny" then
                            if context.other_joker.config.center.key ~= "j_fur_talismancorruptsephirapaws" then
                                G.E_MANAGER:add_event(Event({
    		                        func = function()
    			                        joker:set_edition({negative = true}, true)
    			                        return true
    		                        end
    		                    }))

                                return {
                                    extra = {message = localize("fur_angelnegated"), card = context.other_joker, colour = G.C.DARK_EDITION}
                                }
                            end
                        end
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
        end,

        loc_vars = function(self, info_queue, card)
            if not (card.edition or {}).negative then
                info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
            end

            if config.joker_lines then
                return {vars = {card.ability.extra.emult, card.ability.extra.gain, corruptangel_lines.normal[math.random(#corruptangel_lines.normal)], localize('negative', 'labels')}}
            else
                return {vars = {card.ability.extra.emult, card.ability.extra.gain, corruptangel_lines.toggle[math.random(#corruptangel_lines.toggle)], localize('negative', 'labels')}}
            end
        end,

        set_badges = function(self, card, badges)
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
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

        in_pool = function(self, args)
            if self.discovered and G.GAME.corrupted then
                return true
            else
                return false
            end
        end
    }
else
    SMODS.Joker {
        key = 'corruptcuriousangel',
        config = {extra = { xmult = 5, gain = 5 }},
        atlas = 'corruptcuriousangelslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        effect = nil,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            local joker = context.other_joker
            local playingcard = context.other_card

            if context.individual and context.cardarea == G.play then
                if not (playingcard.edition or {}).negative then
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
                else
                    if not context.blueprint then
                        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                        return {
                            focus = card,
                            message = localize('k_upgrade_ex'),
                            colour = G.C.FILTER
                        }
                    end
                end
            end

            if context.other_joker and not (joker.edition or {}).negative then
                if context.other_joker.config.center.key ~= "j_fur_corruptcuriousangel" then
                    if context.other_joker.config.center.key ~= "j_fur_corruptsparkles" then
                        if context.other_joker.config.center.key ~= "j_fur_corruptdanny" then
                            if context.other_joker.config.center.key ~= "j_fur_corruptsephirapaws" then
                                G.E_MANAGER:add_event(Event({
    		                        func = function()
    			                        joker:set_edition({negative = true}, true)
    			                        return true
    		                        end
    		                    }))

                                return {
                                    extra = {message = localize("fur_angelnegated"), card = context.other_joker, colour = G.C.DARK_EDITION}
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
            if not (card.edition or {}).negative then
                info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
            end

            if config.joker_lines then
                return {vars = {card.ability.extra.xmult, card.ability.extra.gain, corruptangel_lines.normal[math.random(#corruptangel_lines.normal)], localize('negative', 'labels')}}
            else
                return {vars = {card.ability.extra.xmult, card.ability.extra.gain, corruptangel_lines.toggle[math.random(#corruptangel_lines.toggle)], localize('negative', 'labels')}}
            end
        end,

        set_badges = function(self, card, badges)
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
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

        in_pool = function(self, args)
            if self.discovered and G.GAME.corrupted then
                return true
            else
                return false
            end
        end
    }
end

local corruptdanny_lines = { -- Danny (Corrupt)
    normal = {
        '*Hiss*',
        '"I\'m just the worst, aren\'t I?"',
        '"S.T.A.R.S...."',
        '"I just like how stars look okay!?"',
    },
    toggle = {
        '',
    }
}
if Talisman then
    SMODS.Joker {
        key = "talismancorruptdanny",
        config = { extra = { emult = 2, emultgain = 0.3 }},
        atlas = 'corruptdannyslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = "fur_rarityfurry",
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        raffle_winners31_10_2025 = true,
        saracrossing = true,

        calculate = function(self, card, context)
            local playingcard = context.other_card

            if context.destroy_card and context.cardarea == G.hand and not context.blueprint then
			    if not context.destroy_card:is_suit('fur_stars') then
			    	return { remove = true }
			    end
            end

            if context.before and (next(context.poker_hands['Flush']) or next(context.poker_hands['Flush House'])
                or next(context.poker_hands['Flush Five']) or next(context.poker_hands['Straight Flush'])) then
                if card.debuff then return nil end
                if not context.blueprint then
                    card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.emultgain

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                    }
                end
            end

            if context.individual and context.cardarea == G.play and (next(context.poker_hands['Flush']) or next(context.poker_hands['Flush House'])
                or next(context.poker_hands['Flush Five']) or next(context.poker_hands['Straight Flush'])) then
                if card.debuff then return nil end
                if not (playingcard.edition or {}).polychrome then
                    G.E_MANAGER:add_event(Event({
    			    func = function()
    				    playingcard:set_edition({polychrome = true}, true)
    				    return true
    			    end
    			    }))
                end

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
	    	if G.deck and card.added_to_deck then
	    		for i, v in pairs(G.deck.cards) do
	    			if not v:is_suit("fur_stars") then
	    				v:set_debuff(true)
	    			end
	    		end
	    	end
	    	if G.hand and card.added_to_deck then
	    		for i, v in pairs(G.hand.cards) do
	    			if not v:is_suit("fur_stars") then
	    				v:set_debuff(true)
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
                return { vars = { card.ability.extra.emult, card.ability.extra.emultgain, localize('fur_stars', 'suits_singular'), localize('polychrome', 'labels'), corruptdanny_lines.normal[math.random(#corruptdanny_lines.normal)] }}
            else
                return { vars = { card.ability.extra.emult, card.ability.extra.emultgain, localize('fur_stars', 'suits_singular'), localize('polychrome', 'labels'), corruptdanny_lines.toggle[math.random(#corruptdanny_lines.toggle)] }}
            end
        end,

        set_badges = function(self, card, badges)
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
            end
        end,
        
        in_pool = function(self, args)
            if self.discovered and G.GAME.corrupted then
                return true
            else
                return false
            end
        end
    }
else
    SMODS.Joker {
        key = "corruptdanny",
        config = { extra = { xmult = 2, xmultgain = 0.3 }},
        atlas = 'corruptdannyslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = "fur_rarityfurry",
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        raffle_winners31_10_2025 = true,
        saracrossing = true,
        
        calculate = function(self, card, context)
            local playingcard = context.other_card

            if context.destroy_card and context.cardarea == G.hand and not context.blueprint then
			    if not context.destroy_card:is_suit('fur_stars') then
			    	return { remove = true }
			    end
            end

            if context.before and (next(context.poker_hands['Flush']) or next(context.poker_hands['Flush House'])
                or next(context.poker_hands['Flush Five']) or next(context.poker_hands['Straight Flush'])) then
                if card.debuff then return nil end
                if not context.blueprint then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultgain

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                    }
                end
            end

            if context.individual and context.cardarea == G.play and (next(context.poker_hands['Flush']) or next(context.poker_hands['Flush House'])
                or next(context.poker_hands['Flush Five']) or next(context.poker_hands['Straight Flush'])) then
                if card.debuff then return nil end
                if not (playingcard.edition or {}).polychrome then
                    G.E_MANAGER:add_event(Event({
    			    func = function()
    				    playingcard:set_edition({polychrome = true}, true)
    				    return true
    			    end
    			    }))
                end

                if playingcard.seal == "fur_bluepawseal" then
                    return {
                        xmult = card.ability.extra.xmult
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
                        xmult = card.ability.extra.xmult,
                        message = localize('fur_sealed', 'dictionary'),
                        colour = G.C.FILTER,
                    }
                end
            end
        end,

        update = function(self, card, dt) -- From Cryptid
            local complexbackground = config.complex_jokers.current_option
            local jokerref = card.config.center
	    	if G.deck and card.added_to_deck then
	    		for i, v in pairs(G.deck.cards) do
	    			if not v:is_suit("fur_stars") then
	    				v:set_debuff(true)
	    			end
	    		end
	    	end
	    	if G.hand and card.added_to_deck then
	    		for i, v in pairs(G.hand.cards) do
	    			if not v:is_suit("fur_stars") then
	    				v:set_debuff(true)
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
                return { vars = { card.ability.extra.xmult, card.ability.extra.xmultgain, localize('fur_stars', 'suits_singular'), localize('polychrome', 'labels'), corruptdanny_lines.normal[math.random(#corruptdanny_lines.normal)] }}
            else
                return { vars = { card.ability.extra.xmult, card.ability.extra.xmultgain, localize('fur_stars', 'suits_singular'), localize('polychrome', 'labels'), corruptdanny_lines.toggle[math.random(#corruptdanny_lines.toggle)] }}
            end
        end,

        set_badges = function(self, card, badges)
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
            end
        end,

        in_pool = function(self, args)
            if self.discovered and G.GAME.corrupted then
                return true
            else
                return false
            end
        end
    }
end

local corruptsephirapaws_lines = { -- SephiraPaws (Corrupted)
    normal = {
        '"Fluffy Evilness >:3"',
        '"Corrupted Fluffball"',
        '"You\'ll never stop me!!"',
        '"Make the number go up >:3c"',
        '"It\'s going to be a Night of Nights >w>"',
    },
    toggle = {
        '',
    },
}
if Talisman then
    SMODS.Joker {
        key = "talismancorruptsephirapaws",
        config = { extra = { emult = 1, emultgain = 5 }},
        atlas = 'corruptsephirapawsslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = "fur_rarityfurry",
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        raffle_winners31_10_2025 = true,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end

            if context.pre_discard and not context.hook then -- From VanillaRemade
                if not context.blueprint then
                    local selectedhandtype = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                    for handname, values in pairs(G.GAME.hands) do
                        if handname == selectedhandtype then
                            if selectedhandtype == "Flush Five" then -- (+^5)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 1 
                            elseif selectedhandtype == "Flush House" then -- (+^4)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.8
                            elseif selectedhandtype == "fur_spectrumfive" or selectedhandtype == "six_Spectrum Five" or selectedhandtype == "spectrum_Spectrum Five" then -- (+^3.5)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.7
                            elseif selectedhandtype == "Five of a Kind" then -- (+^3)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.6
                            elseif selectedhandtype == "Straight Flush" then -- (+^2.5)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.5
                            elseif selectedhandtype == "fur_spectrumhouse" or selectedhandtype == "six_Spectrum House" or selectedhandtype == "spectrum_Spectrum House" then -- (+^2)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.4
                            elseif selectedhandtype == "Four of a Kind" then -- (+^1)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.2
                            elseif selectedhandtype == "fur_straightspectrum" or selectedhandtype == "six_Straight Spectrum" or selectedhandtype == "spectrum_Straight Spectrum" then -- (+^0.75)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.15
                            elseif selectedhandtype == "Flush" then -- (+^0.5)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.1
                            elseif selectedhandtype == "Full House" then -- (+^0.4)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.08
                            elseif selectedhandtype == "Straight" then -- (+^0.35)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.07
                            elseif selectedhandtype == "Three of a Kind" then -- (+^0.3)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.06
                            elseif selectedhandtype == "fur_spectrum" or selectedhandtype == "six_Spectrum" or selectedhandtype == "spectrum_Spectrum" then -- (+^0.25)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.05
                            elseif selectedhandtype == "Two Pair" then -- (+^0.1)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.02
                            elseif selectedhandtype == "Pair" then -- (+^0.05)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.01
                            elseif selectedhandtype == "High Card" then -- (+^0.01)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.002
                            else -- Other modded hands fallback (+^1 Mult)
                                card.ability.extra.emultgain = card.ability.extra.emultgain * 0.2
                            end
                            break
                        end
                    end

                    card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.emultgain
                    
                    return {
                        message = "+^"..card.ability.extra.emultgain.." "..localize("k_mult"),
                        card = card,
                        colour = G.C.DARK_EDITION
                    }
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

            if context.discard or context.end_of_round then
                card.ability.extra.emultgain = 5
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return { vars = { card.ability.extra.emultgain / 500, card.ability.extra.emultgain, card.ability.extra.emult, corruptsephirapaws_lines.normal[math.random(#corruptsephirapaws_lines.normal)] }}
            else
                return { vars = { card.ability.extra.emultgain / 500, card.ability.extra.emultgain, card.ability.extra.emult, corruptsephirapaws_lines.toggle[math.random(#corruptsephirapaws_lines.toggle)] }}
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
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
            end
        end,

        in_pool = function(self, args)
            if self.discovered and G.GAME.corrupted then
                return true
            else
                return false
            end
        end
    }
else
    SMODS.Joker {
        key = "corruptsephirapaws",
        config = { extra = { xmult = 1, xmultgain = 5 }},
        atlas = 'corruptsephirapawsslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = "fur_rarityfurry",
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        raffle_winners31_10_2025 = true,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end

            if context.pre_discard and not context.hook then -- From VanillaRemade
                if not context.blueprint then
                    local selectedhandtype = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                    for handname, values in pairs(G.GAME.hands) do
                        if handname == selectedhandtype then
                            if selectedhandtype == "Flush Five" then -- (+^5)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 1) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "Flush House" then -- (+^4)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.8) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "fur_spectrumfive" or selectedhandtype == "six_Spectrum Five" or selectedhandtype == "spectrum_Spectrum Five" then -- (+^3.5)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.7) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "Five of a Kind" then -- (+^3)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.6) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "Straight Flush" then -- (+^2.5)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.5) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "fur_spectrumhouse" or selectedhandtype == "six_Spectrum House" or selectedhandtype == "spectrum_Spectrum House" then -- (+^2)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.4) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "Four of a Kind" then -- (+^1)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.2) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "fur_straightspectrum" or selectedhandtype == "six_Straight Spectrum" or selectedhandtype == "spectrum_Straight Spectrum" then -- (+^0.75)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.15) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "Flush" then -- (+^0.5)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.1) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "Full House" then -- (+^0.4)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.08) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "Straight" then -- (+^0.35)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.07) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "Three of a Kind" then -- (+^0.3)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.06) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "fur_spectrum" or selectedhandtype == "six_Spectrum" or selectedhandtype == "spectrum_Spectrum" then -- (+^0.25)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.05) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "Two Pair" then -- (+^0.1)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.02) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "Pair" then -- (+^0.05)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.01) * G.GAME.hands[handname].level
                            elseif selectedhandtype == "High Card" then -- (+^0.01)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.002) * G.GAME.hands[handname].level
                            else -- Other modded hands fallback (+^1 Mult)
                                card.ability.extra.xmultgain = (card.ability.extra.xmultgain * 0.2) * G.GAME.hands[handname].level
                            end
                            break
                        end
                    end

                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultgain
                    
                    return {
                        message = "+X"..card.ability.extra.xmultgain.." "..localize("k_mult"),
                        card = card,
                        colour = G.C.MULT
                    }
                end
            end

            if context.joker_main and context.cardarea == G.jokers then
                return {
                    xmult = card.ability.extra.xmult,
                }
            end

            if context.discard or context.end_of_round then
                card.ability.extra.xmultgain = 5
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return { vars = { card.ability.extra.xmultgain * 0.002, card.ability.extra.xmultgain, card.ability.extra.xmult, corruptsephirapaws_lines.normal[math.random(#corruptsephirapaws_lines.normal)] }}
            else
                return { vars = { card.ability.extra.xmultgain * 0.002, card.ability.extra.xmultgain, card.ability.extra.xmult, corruptsephirapaws_lines.toggle[math.random(#corruptsephirapaws_lines.toggle)] }}
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
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
            end
        end,

        in_pool = function(self, args)
            if self.discovered and G.GAME.corrupted then
                return true
            else
                return false
            end
        end
    }
end

local corruptsparkles_lines = { -- SparklesRolf (Hate)
    normal = {
        '=)',
        "Let's turn these cards into dust...",
        "Moreee....MOREEEEEEEE",
        "Let's erase this save once and for all",
        "Determination.",
    },
    toggle = {
        '',
    }
}
if Talisman then
    SMODS.Joker {
        key = 'talismancorruptsparkles',
        config = {extra = { emult = 9.99, levelupamount = 1 }},
        atlas = 'corruptsparklesslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        effect = nil,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end

            if context.destroy_card and context.destroy_card:is_suit("Hearts") and context.cardarea == G.play then
                return {
                    remove = true,
                    emult = card.ability.extra.emult,
                    level_up = card.ability.extra.levelupamount,
                    remove_default_message = true,
                    message = '^'..card.ability.extra.emult.." "..localize("k_mult"),
                    sound = 'fur_emult',
                    colour = G.C.DARK_EDITION
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return {vars = {card.ability.extra.emult, card.ability.extra.levelupamount, corruptsparkles_lines.normal[math.random(#corruptsparkles_lines.normal)], localize('Hearts', 'suits_plural'), colours = {HEX("FF0000")}}}
            else
                return {vars = {card.ability.extra.emult, card.ability.extra.levelupamount, corruptsparkles_lines.toggle[math.random(#corruptsparkles_lines.toggle)], localize('Hearts', 'suits_plural'), colours = {HEX("FF0000")}}}
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
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
            end
        end,

        in_pool = function(self, args)
            if self.discovered and G.GAME.corrupted then
                return true
            else
                return false
            end
        end
    }
else
    SMODS.Joker {
        key = 'corruptsparkles',
        config = {extra = { xmult = 9.99, levelupamount = 1 }},
        atlas = 'corruptsparklesslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        effect = nil,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end

            if context.destroy_card and context.destroy_card:is_suit("Hearts") and context.cardarea == G.play then
                return {
                    remove = true,
                    xmult = card.ability.extra.xmult,
                    level_up = card.ability.extra.levelupamount,
                    colour = G.C.MULT
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return {vars = {card.ability.extra.xmult, card.ability.extra.levelupamount, corruptsparkles_lines.normal[math.random(#corruptsparkles_lines.normal)], localize('Hearts', 'suits_plural'), colours = {HEX("FF0000")}}}
            else
                return {vars = {card.ability.extra.xmult, card.ability.extra.levelupamount, corruptsparkles_lines.toggle[math.random(#corruptsparkles_lines.toggle)], localize('Hearts', 'suits_plural'), colours = {HEX("FF0000")}}}
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
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
            end
        end,

        in_pool = function(self, args)
            if self.discovered and G.GAME.corrupted then
                return true
            else
                return false
            end
        end
    }
end