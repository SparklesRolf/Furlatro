local furry_mod = SMODS.current_mod
local config = SMODS.current_mod.config

if config.complex_jokers then -- Card Texture Initialize
    if config.smaller_souls then
        SMODS.Atlas {
            key = 'furryjokers',
            path = 'jokers/SmallSoulComplexJokers.png',
            px = 71,
            py = 95
        }
    else
        SMODS.Atlas {
            key = 'furryjokers',
            path = 'jokers/BigSoulComplexJokers.png',
            px = 71,
            py = 95
        }
    end
else
    if config.smaller_souls then
        SMODS.Atlas {
            key = 'furryjokers',
            path = 'jokers/SmallSoulJokers.png',
            px = 71,
            py = 95
        }
    else
        SMODS.Atlas {
            key = 'furryjokers',
            path = 'jokers/BigSoulJokers.png',
            px = 71,
            py = 95
        }
    end
end




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
    config = {extra = { xmult = 1, gain = 0.05, odds = 15 }},
    atlas = 'furryjokers',
    pos = { x = 4, y = 4 },
    soul_pos = { x = 5, y = 4 },
    rarity = 'fur_rarityfurry',
    cost = 25,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = 'Mult',
    saracrossing = true,

    calculate = function(self, card, context)
        local joker = context.other_joker
        local playingcard = context.other_card
        if self.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if not playingcard.edition then
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
        end

        if context.individual and context.cardarea == G.play then
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

        if context.other_joker then
            if not joker.edition then
                if pseudorandom("j_fur_curiousangel") < G.GAME.probabilities.normal/card.ability.extra.odds then
                    G.E_MANAGER:add_event(Event({
					    func = function()
						    joker:set_edition({negative = true}, true)
						    return true
					    end
				    }))

                    return {
                        message = 'Negated!', 
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
        if config.joker_lines then
            info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, G.GAME.probabilities.normal, card.ability.extra.odds, curiousangel_lines.normal[math.random(#curiousangel_lines.normal)], localize('negative', 'labels')}}
        else
            info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, G.GAME.probabilities.normal, card.ability.extra.odds, curiousangel_lines.toggle[math.random(#curiousangel_lines.toggle)], localize('negative', 'labels')}}
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
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
SMODS.Joker { 
    key = 'skips',
    config = {extra = { bossodds = 2, odds = 15 }},
    atlas = 'furryjokers',
    pos = { x = 4, y = 3 },
    soul_pos = { x = 5, y = 3 },
    rarity = 'fur_rarityfurry',
    cost = 25,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    saracrossing = true,

    calculate = function(self, card, context)
        if self.debuff then return nil end
        if context.first_hand_drawn then
            G.GAME.fur_ach_conditions.skips_ability_triggered = false
            oopsall6count = 0
            local oopsall6table = {}
            for i = 1, #G.jokers.cards do
			    if G.jokers.cards[i].config.center.name == "Oops! All 6s" then
                    table.insert(oopsall6table, G.jokers)
                end
            end
            for _ in pairs(oopsall6table) do
                oopsall6count = oopsall6count + 1
            end

            if G.GAME.blind.boss then
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
                            message = localize("fur_skipsskipped"),
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
                        message = localize("fur_skipsskipped"),
                        colour = G.C.SECONDARY_SET.FILTER
                    }
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
            return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.normal[math.random(#skips_lines.normal)]}}
        else
            return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, skips_lines.toggle[math.random(#skips_lines.toggle)]}}
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("fur_mythic", 'labels'), G.C.FUR_MYTHIC, G.C.WHITE, 1)
    end
}

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
    config = {extra = { xmult = 1, gain = 0.05 }},
    atlas = 'furryjokers',
    pos = {x = 4, y = 0},
    soul_pos = {x = 5, y = 0},
    rarity = 'fur_rarityfurry',
    cost = 25,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = 'Mult',
    saracrossing = true,

    calculate = function(self, card, context)
        if self.debuff then return nil end
        if context.first_hand_drawn then
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
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        colour = G.C.FILTER
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
            if self.debuff then return nil end
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
    config = {extra = { xmult = 1, gain = 0.05 }},
    atlas = 'furryjokers',
    pos = {x = 2, y = 0},
    soul_pos = {x = 3, y = 0},
    rarity = 'fur_rarityfurry',
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
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        colour = G.C.FILTER
                    }
                end
            end
        end
            
        if context.individual and context.cardarea == G.hand then
            if self.debuff then return nil end
            if not context.end_of_round then
                if not context.blueprint then
                    if context.other_card:get_id() == 13 then
                        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                        return {
                            extra = {focus = card, message = localize('k_upgrade_ex')},
                            colour = G.C.MULT
                        }
                    end
                end
            end
        end

        if context.joker_main and context.cardarea == G.jokers then
            if self.debuff then return nil end
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
        config = {extra = { xmult = 1, gain = 0.05 }},
        atlas = 'furryjokers',
        pos = { x = 2, y = 4 },
        soul_pos = { x = 3, y = 4 },
        rarity = 'fur_rarityfurry',
        cost = 25,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        effect = 'Mult',
        saracrossing = true,

        calculate = function(self, card, context)
            if self.debuff then return nil end
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
        config = {extra = { xmult = 1, gain = 0.05 }},
        atlas = 'furryjokers',
        pos = { x = 2, y = 4 },
        soul_pos = { x = 3, y = 4 },
        rarity = 'fur_rarityfurry',
        cost = 25,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        effect = 'Mult',
        saracrossing = true,

        calculate = function(self, card, context)
            if self.debuff then return nil end
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
    cost = 25,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    saracrossing = true,

    calculate = function(self, card, context)
        if self.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if not context.blueprint then
                if SMODS.has_enhancement(context.other_card, 'm_fur_sockcard') then
                        ease_hands_played(card.ability.extra.bonus_hands)

                    return {
                        extra = {focus = card, message = '+' ..card.ability.extra.bonus_hands.. localize("k_hud_hands")},
                        colour = G.C.CHIPS
                    }
                end
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