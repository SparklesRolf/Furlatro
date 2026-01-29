local furry_mod = SMODS.current_mod
local config = furry_mod.config

local aberrantreptile_lines = { -- AberrantReptile
    normal = {
        '"Wizard noodle!"',
    },
    toggle = {
        '',
    },
}
SMODS.Joker {
    key = 'aberrantreptile',
    config = { partnersynergizetrigger = false, extra = { retriggers = 1 }},
    atlas = 'aberrantreptileslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = 'fur_rarityfurrynonmythic',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = "",
    raffle_winners25_12_2025 = true,
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if G.GAME.selected_partner == "pnr_fur_aberrantreptilepartner" then
            if not card.ability.partnersynergizetrigger then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.retriggers = card.ability.extra.retriggers * 2
            end
        end

        if context.individual and context.cardarea == G.play and not context.blueprint then
            local playingcard = context.other_card
            if not playingcard.seal then
                if SMODS.pseudorandom_probability(card, "j_fur_aberrantreptile", 1, 10, "fur_aberrantreptile") then
                    G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        play_sound('gold_seal')
                        playingcard:set_seal('Blue', nil, true);
                        playingcard:juice_up(0.5, 0.5)
                        return true
                    end)}))
                end
            end
        end

        if context.repetition and context.cardarea == G.play then
            local playingcard = context.other_card
            if playingcard.seal == "Blue" then
                local _planet = nil
                for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                    if v.config.hand_type == G.GAME.last_hand_played then
                        _planet = v.key
                    end
                end
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, _planet, 'fur_aberrantreptile')
                        card:add_to_deck()
                        card:set_edition({negative = true}, true)
                        G.consumeables:emplace(card)
                        G.GAME.consumeable_buffer = 0
                    return true
                end)}))
                return {
                    message = localize("k_again_ex"),
                    repetitions = card.ability.extra.retriggers,
                    card = card,
                }
            end
        end

        if context.end_of_round and context.repetition and context.cardarea == G.hand then
            local playingcard = context.other_card
            if playingcard.seal == "Blue" then
                return {
                    message = localize("k_again_ex"),
                    repetitions = card.ability.extra.retriggers,
                    card = card,
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 10, "fur_aberrantreptile")
        info_queue[#info_queue + 1] = G.P_SEALS.Blue
        if config.joker_lines then
            return { vars = { card.ability.extra.retriggers, aberrantreptile_lines.normal[math.random(#aberrantreptile_lines.normal)], localize('negative', 'labels'), localize('k_planet'), numerator, denominator}}
        else
            return { vars = { card.ability.extra.retriggers, aberrantreptile_lines.toggle[math.random(#aberrantreptile_lines.toggle)], localize('negative', 'labels'), localize('k_planet'), numerator, denominator}}
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
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}

local cobalt_lines = { -- CobaltTheBluPanda
    normal = {
        '"I run on caffeine, chaos, and questionable decisions."',
        '"Call me a natural disaster, but cuter."',
        '"Do I look like I have a plan? I woke up in a tree!"'
    },
    toggle = {
        '',
    }
}
SMODS.Joker { 
    key = 'cobalt',
    config = {extra = { xchips = 1.5, suit = "Clubs" }},
    atlas = 'cobaltslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = 'fur_rarityfurrynonmythic',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = "Fur Chips",
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Clubs") then

                return {
                    xchips = card.ability.extra.xchips,
                    sound = "fur_xchip",
                    colour = G.C.CHIPS
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        if config.joker_lines then
            return {vars = {card.ability.extra.xchips, cobalt_lines.normal[math.random(#cobalt_lines.normal)], localize('Clubs', 'suits_plural')}}
        else
            return {vars = {card.ability.extra.xchips, cobalt_lines.toggle[math.random(#cobalt_lines.toggle)], localize('Clubs', 'suits_plural')}}
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
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}

local diablo_lines = { -- Diablo2324
    normal = {
        '"Us furries are overpowered, you cant escape it Jacob!"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = "diablo2324",
    config = { partnersynergizetrigger = false, extra = { xmult = 2.5 }},
    atlas = 'diablo2324slab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = "fur_rarityfurrynonmythic",
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = "Fur Mult",
    raffle_winners31_10_2025 = true,
    saracrossing = true,
    
    calculate = function(self, card, context)
        if card.debuff then return nil end
        if G.GAME.selected_partner == "pnr_fur_diablo2324partner" then
            if not card.ability.partnersynergizetrigger then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.xmult = card.ability.extra.xmult * 2
            end
        end

        if context.other_joker 
           and (context.other_joker.config.center.rarity == "fur_rarityfurrynonmythic" or context.other_joker.config.center.rarity == "fur_rarityfurrymythic" or context.other_joker.config.center.rarity == "fur_rarityfurrycorrupt")
           and not context.other_joker.debuff 
        then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        if config.joker_lines then
            return {vars = {card.ability.extra.xmult, diablo_lines.normal[math.random(#diablo_lines.normal)]}}
        else
            return {vars = {card.ability.extra.xmult, diablo_lines.toggle[math.random(#diablo_lines.toggle)]}}
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
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}

local foxxlydusk_lines = { -- FoxxlyDuskFur
    normal = {
        '"Hello Everynyan"',
        '"Welcome to Foxxly Maid Cafe, Enjoy your stay"',
        '"I\'m NOT CUTE!!!"',
        '"Imagine FOP"',
        '"Abwah"',
    },
    shopbuy = {
        "Enjoy your COFFEE :3",
        "Order up!",
        "Good choice!",
        "One Jimbo with a shot of espresso coming your way!",
    },
    shopend = {
        "Come back soon!",
        "Thanks for stopping in <3",
        "Thanks for choosing Foxxly's Maid Cafe UwU"
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'foxxlyduskfur',
    config = { bufftrigger = false, partnersynergizetrigger = false, extra = { xmult = 1, gain = 0.05 }},
    atlas = 'foxxlyduskfurslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = 'fur_rarityfurrynonmythic',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = "Fur Mult",
    raffle_winners29_8_2025 = true,
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        local randomshopbuy = foxxlydusk_lines.shopbuy[math.random(#foxxlydusk_lines.shopbuy)]
        local randomshopend = foxxlydusk_lines.shopend[math.random(#foxxlydusk_lines.shopend)]

        if G.GAME.selected_partner == "pnr_fur_foxxlyduskfurpartner" then
            if not card.ability.partnersynergizetrigger then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.gain = card.ability.extra.gain * 2
            end
        end

        if next(SMODS.find_card("j_dusk")) and not card.ability.bufftrigger then
            card.ability.bufftrigger = true
            card.ability.extra.gain = card.ability.extra.gain * 2
        elseif not next(SMODS.find_card("j_dusk")) and card.ability.bufftrigger then
            card.ability.bufftrigger = false
            card.ability.extra.gain = card.ability.extra.gain / 2
        end

        if (context.reroll_shop or context.open_booster or context.buying_card) and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
            
            return {
                extra = {message = randomshopbuy, no_retrigger = true, colour = G.C.FILTER},
            }
        end

        if context.ending_shop then
            if not context.blueprint then
                return {
                    extra = {message = randomshopend, no_retrigger = true, colour = G.C.FILTER},
                }
            end
        end
        
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_dusk

        if config.joker_lines then
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, foxxlydusk_lines.normal[math.random(#foxxlydusk_lines.normal)]}}
        else
            return {vars = {card.ability.extra.xmult, card.ability.extra.gain, foxxlydusk_lines.toggle[math.random(#foxxlydusk_lines.toggle)]}}
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
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end,
}

local icesea_lines = { -- IceSea
    normal = {
        '"Yuh"',
        '"Buh"',
        '"Guh"',
        '"Wuh"'
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'icesea',
    config = {extra = { xchips = 2, enhancement_gate = "m_bonus" }},
    atlas = 'iceseaslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = 'fur_rarityfurrynonmythic',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = "Fur Chips",
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, "m_bonus") then

                return {
                    xchips = card.ability.extra.xchips,
                    sound = "fur_xchip",
                    colour = G.C.CHIPS
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        if config.joker_lines then
            return {vars = {card.ability.extra.xchips, icesea_lines.normal[math.random(#icesea_lines.normal)], localize("fur_bonuscard")}}
        else
            return {vars = {card.ability.extra.xchips, icesea_lines.toggle[math.random(#icesea_lines.toggle)], localize("fur_bonuscard")}}
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
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}

local lume_lines = { -- Lume
    normal = {
        '',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'lume',
    config = { partnersynergizetrigger = false, extra = { xmult = 2 }},
    atlas = 'lumeslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = "fur_rarityfurrynonmythic",
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = "Fur Mult",
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if G.GAME.selected_partner == "pnr_fur_lumepartner" then
            if not card.ability.partnersynergizetrigger then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.xmult = card.ability.extra.xmult * 2
            end
        end

        if context.individual and context.cardarea == G.play then
            local playingcard = context.other_card

            if SMODS.has_enhancement(context.other_card, 'm_fur_princecard') then        
                return {
                    xmult = card.ability.extra.xmult
                }
            end
            
            if not context.blueprint then
                for k, v in pairs(playingcard) do
                    if playingcard:is_face() then
                        if playingcard.config.center.key == "c_base" then
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                playingcard:set_ability(G.P_CENTERS['m_fur_princecard']);
                                playingcard:juice_up(0.5, 0.5)
                                return true
                            end
                            }))

                            return {
                                message = localize("fur_princecardtrigger"),
                                no_retrigger = true,
                                colour = G.C.FILTER
                            }
                        end
                    end
                end
            end
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

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_princecard

        if config.joker_lines then
            return { vars = { card.ability.extra.xmult, localize("k_face_cards"), lume_lines.normal[math.random(#lume_lines.normal)] }}
        else
            return { vars = { card.ability.extra.xmult, localize("k_face_cards"), lume_lines.toggle[math.random(#lume_lines.toggle)]}}
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}

local schnacki_lines = { -- SchnackiOfficial
    normal = {
        '"Hot Femboy Folf"',
        '"Not a Bottom uwu"',
        '"Breedable :3"',
        '"Bnuy Kidnapper"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'schnackiofficial',
    config = { bufftrigger = false, extra = { xmult = 1.5 }},
    atlas = 'schnackiofficialslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = 'fur_rarityfurrynonmythic',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = "Fur Mult",
    raffle_winners31_10_2025 = true,
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if next(SMODS.find_card("j_ice_cream")) and not card.ability.bufftrigger then
            card.ability.bufftrigger = true
            card.ability.extra.xmult = card.ability.extra.xmult * 1.5
        elseif not next(SMODS.find_card("j_ice_cream")) and card.ability.bufftrigger then
            card.ability.bufftrigger = false
            card.ability.extra.xmult = card.ability.extra.xmult / 1.5
        end

        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('Spades') then
                return {
                    xmult = card.ability.extra.xmult,
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_ice_cream
        if config.joker_lines then
            return {vars = {card.ability.extra.xmult, schnacki_lines.normal[math.random(#schnacki_lines.normal)], localize('Spades', 'suits_plural')}}
        else
            return {vars = {card.ability.extra.xmult, schnacki_lines.toggle[math.random(#schnacki_lines.toggle)], localize('Spades', 'suits_plural')}}
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
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}

local sephirapaws_lines = { -- SephiraPaws
    normal = {
        '"UwU"',
        '"Fluffiness over 9000!"',
        '"Time to push the game to its limits >:3"',
    },
    toggle = {
        '',
    }
}
if not Talisman then
    SMODS.Joker {
        key = "sephirapaws",
        config = { partnersynergizetrigger = false, extra = { xmult = 1, gain = 0.1 }},
        atlas = 'sephirapawsslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = "fur_rarityfurrynonmythic",
        pools = {
            ["furry"] = true,
            ["nonmythics"] = true,
            ["legendaryfurries"] = true,
        },
        cost = 15,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        effect = "Fur Mult",
        raffle_winners29_8_2025 = true,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            local playingcardcount = 0
            if G.GAME.selected_partner == "pnr_fur_sephirapawspartner" then
                if not card.ability.partnersynergizetrigger then
                    card.ability.partnersynergizetrigger = true
                    card.ability.extra.gain = card.ability.extra.gain * 2
                end
            end

            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    playingcardcount = playingcardcount + 1
                end
            end

            if context.joker_main then
                return {
                    xmult = card.ability.extra.xmult + (card.ability.extra.gain * playingcardcount),
                    colour = G.C.MULT,
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            local playingcardcount = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    playingcardcount = playingcardcount + 1
                end
            end

            if config.joker_lines then
                if G.GAME.current_round.hands_left > 0 then
                    return {vars = {card.ability.extra.xmult + (card.ability.extra.gain * playingcardcount), card.ability.extra.gain, sephirapaws_lines.normal[math.random(#sephirapaws_lines.normal)]}}
                else
                    return {vars = {card.ability.extra.xmult, card.ability.extra.gain, sephirapaws_lines.normal[math.random(#sephirapaws_lines.normal)]}}
                end
            else
                if G.GAME.current_round.hands_left > 0 then
                    return {vars = {card.ability.extra.xmult + (card.ability.extra.gain * playingcardcount), card.ability.extra.gain, sephirapaws_lines.toggle[math.random(#sephirapaws_lines.toggle)]}}
                else
                    return {vars = {card.ability.extra.xmult, card.ability.extra.gain, sephirapaws_lines.toggle[math.random(#sephirapaws_lines.toggle)]}}
                end
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
            badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
        end,

        in_pool = function(self, args)
            if next(SMODS.find_card("j_ring_master")) then
                return true
            elseif next(SMODS.find_card("j_fur_corruptsephirapaws")) then
                return false
            else
                return true
            end
        end
    }
end

local sparkles_lines = { -- SparklesRolf
    normal = {
        '"Yes"',
        '"Bnnuy"',
        '"Spare a carrot for the bunbun?"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'sparkles',
    config = {extra = { xmult = 1.5, suit = "fur_stars" }},
    atlas = 'sparklesslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = 'fur_rarityfurrynonmythic',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = "Fur Mult",
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('fur_stars') or context.other_card:is_suit('six_Stars') then

                return {
                    xmult = card.ability.extra.xmult,
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        if config.joker_lines then
            return {vars = {card.ability.extra.xmult, sparkles_lines.normal[math.random(#sparkles_lines.normal)], localize('fur_stars', 'suits_plural')}}
        else
            return {vars = {card.ability.extra.xmult, sparkles_lines.toggle[math.random(#sparkles_lines.toggle)], localize('fur_stars', 'suits_plural')}}
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
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
        badges[#badges+1] = create_badge(localize("fur_developer"), G.C.FUR_DEVELOPER, G.C.WHITE, 1)
    end,

    in_pool = function(self, args)
        if next(SMODS.find_card("j_ring_master")) then
            return true
        elseif (next(SMODS.find_card("j_fur_corruptsparkles")) or next(SMODS.find_card("j_fur_talismancorruptsparkles"))) then
            return false
        else
            return true
        end
    end
}

local spark_lines = { -- SparkTheBird
    normal = {
        '"I\'M NOT SMALL!!!"',
        '"Hey you down there"',
        '"I\'m not itsy bitsy, I\'m not teny tiny"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker { 
    key = 'spark',
    config = {extra = { xmult = 1.5, xmult2 = 2.25, suit = "Diamonds" }},
    atlas = 'sparkslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = 'fur_rarityfurrynonmythic',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = "Fur Mult",
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('Diamonds') and context.other_card:get_id() == 2 then

                return {
                    xmult = card.ability.extra.xmult2,
                    colour = G.C.MULT
                }
            end

            if context.other_card:is_suit('Diamonds') or context.other_card:get_id() == 2 then

                return {
                    xmult = card.ability.extra.xmult,
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        if config.joker_lines then
            return {vars = {card.ability.extra.xmult, card.ability.extra.xmult2, spark_lines.normal[math.random(#spark_lines.normal)], localize('Diamonds', 'suits_plural')}}
        else
            return {vars = {card.ability.extra.xmult, card.ability.extra.xmult2, spark_lines.toggle[math.random(#spark_lines.toggle)], localize('Diamonds', 'suits_plural')}}
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
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}

local koneko_lines = { -- Koneko
    normal = {
        '"Smash"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'koneko',
    config = {extra = { xmult = 1.5, suit = "hearts" }},
    atlas = 'konekoslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = 'fur_rarityfurrynonmythic',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = "Fur Mult",
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('Hearts') then

                return {
                    xmult = card.ability.extra.xmult,
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        if config.joker_lines then
            return {vars = {card.ability.extra.xmult, koneko_lines.normal[math.random(#koneko_lines.normal)], localize('Hearts', 'suits_plural')}}
        else
            return {vars = {card.ability.extra.xmult, koneko_lines.toggle[math.random(#koneko_lines.toggle)], localize('Hearts', 'suits_plural')}}
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
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}

SMODS.Joker { -- YCH
    key = 'ych',
    config = { selectedjoker = "j_fur_ych", previousselectedjoker = "j_fur_ych", inround = false, extra = { roundsplayed = 0, roundstotal = 5 }},
    atlas = 'baseychslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = 'fur_rarityfurrynonmythic',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = "",
    literally_tenna = true,
    saracrossing = true,
    kris_57 = false,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.setting_blind then
            card.ability.inround = true
            local jokers = {}
            if not context.blueprint then
                for i = 1, #G.jokers.cards do
                    if not (G.jokers.cards[i].debuff or G.jokers.cards[i].config.center.key == "j_fur_ych") and 
                       (G.jokers.cards[i].config.center.rarity == "fur_rarityfurrynonmythic" or G.jokers.cards[i].config.center.rarity == "fur_rarityfurrymythic")
                    then
                        table.insert(jokers, G.jokers.cards[i])
                    end
                end
                local _card = jokers[math.random(#jokers)]

                if _card then
                    card.ability.selectedjoker = _card.label
                    card:juice_up()
                    play_sound("cancel")
                else
                    card.ability.selectedjoker = "j_fur_ych"
                    card:juice_up()
                    play_sound("cancel")
                end
            end
        end

        if ((G.GAME.blind or G.GAME.blind.boss) and context.end_of_round) and (card.ability.extra.roundsplayed < card.ability.extra.roundstotal) and card.ability.inround then
            card.ability.inround = false
            card.ability.extra.roundsplayed = card.ability.extra.roundsplayed + 1

            if card.ability.extra.roundsplayed >= card.ability.extra.roundstotal then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)

                return {
                    extra = {
                        focus = card,
                        message = localize("loyalty_active", "v_dictionary"),
                        no_retrigger = true,
                        colour = G.C.BLUE
                    }
                }
            else
                return {
                    extra = {
                        focus = card,
                        message = card.ability.extra.roundsplayed.."/"..card.ability.extra.roundstotal,
                        colour = G.C.BLUE
                    }
                }
            end
        else
            if card.ability.inround and card.ability.selectedjoker ~= "j_fur_ych" then
                if context.selling_card and context.card.config.center.key == card.ability.selectedjoker and not context.blueprint then
                    card.ability.selectedjoker = "j_fur_ych"
                    card:juice_up()
                    play_sound("cancel")
                end
                if context.selling_self and (card.ability.extra.roundsplayed >= card.ability.extra.roundstotal) and card.ability.selectedjoker ~= "j_fur_ych" then
                    if not context.blueprint and #G.jokers.cards <= (G.jokers.config.card_limit + 1) then
                        local furrytodupe = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i].label == card.ability.selectedjoker then
                                furrytodupe = G.jokers.cards[i]
                                break
                            end
                        end

                        G.E_MANAGER:add_event(Event({
		                	func = function()
                                local dupedfurry = copy_card(furrytodupe, nil, nil, nil, furrytodupe.edition)
                                dupedfurry:add_to_deck()
                                G.jokers:emplace(dupedfurry)
                                card_eval_status_text(dupedfurry, 'extra', nil, nil, nil, { message = localize('k_duplicated_ex'), colour = G.C.BLUE })
		                		return true
		                	end,
		                }))
                    end
                end

                local copiedjoker = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].label == card.ability.selectedjoker then copiedjoker = G.jokers.cards[i] end
                end
                local ret = SMODS.blueprint_effect(card, copiedjoker, context)
                if ret then
                    ret.colour = G.C.BLUE
                end
                return ret
            end
        end

        if context.selling_self and (card.ability.extra.roundsplayed >= card.ability.extra.roundstotal) and card.ability.selectedjoker ~= "j_fur_ych" then
            if not context.blueprint and #G.jokers.cards <= (G.jokers.config.card_limit + 1) then
                local furrytodupe = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].label == card.ability.selectedjoker then
                        furrytodupe = G.jokers.cards[i]
                        break
                    end
                end

                G.E_MANAGER:add_event(Event({
		        	func = function()
                        local dupedfurry = copy_card(furrytodupe, nil, nil, nil, furrytodupe.edition)
                        dupedfurry:add_to_deck()
                        G.jokers:emplace(dupedfurry)
                        card_eval_status_text(dupedfurry, 'extra', nil, nil, nil, { message = localize('k_duplicated_ex'), colour = G.C.BLUE })
		        		return true
		        	end,
		        }))
            end
        end
    end,

    update = function(self, card, dt)
        local complexbackground = config.complex_jokers.current_option
        local jokertarget = card.ability.selectedjoker
        local jokerref = card.config.center
        jokerref.kris_57 = nil
        jokerref.saracrossing = nil

        if jokertarget == "j_fur_astral" then
            jokerref.atlas = "fur_astralychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_cobalt" then
            jokerref.atlas = "fur_cobaltychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_curiousangel" then
            jokerref.atlas = "fur_curiousangelychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_danny" or jokertarget == "j_fur_talismandanny" then
            jokerref.atlas = "fur_dannyychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_diablo2324" then
            jokerref.atlas = "fur_diablo2324ychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_foxxlyduskfur" then
            jokerref.atlas = "fur_foxxlyduskfurychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_ghost" then
            jokerref.atlas = "fur_ghostychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_icesea" then
            jokerref.atlas = "fur_iceseaychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_illy" then
            jokerref.atlas = "fur_illyadoychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_iridia" then
            jokerref.atlas = "fur_iridiaychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_xavierorjose" or jokertarget == "j_fur_talismanxavierorjose" then
            jokerref.atlas = "fur_joseeeeychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_kalik" then
            jokerref.atlas = "fur_kalikychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_koneko" then
            jokerref.atlas = "fur_konekoychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_kris57" or jokertarget == "j_fur_talismankris57"  then
            jokerref.atlas = "fur_kris57ychslab"
            jokerref.kris_57 = true
        elseif jokertarget == "j_fur_luposity" or jokertarget == "j_fur_cryptidluposity" then
            jokerref.atlas = "fur_luposityychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_maltnoodlez" then
            jokerref.atlas = "fur_maltnoodlezychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_nemzata" then
            jokerref.atlas = "fur_nemzataychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_parrotdash" then
            jokerref.atlas = "fur_parrotdashychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_saph" then
            jokerref.atlas = "fur_saphychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_schnackiofficial" then
            jokerref.atlas = "fur_schnackiofficialychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_sephirapaws" or jokertarget == "j_fur_talismansephirapaws" then
            jokerref.atlas = "fur_sephirapawsychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_silver" then
            jokerref.atlas = "fur_silverychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_skips" or jokertarget == "j_fur_multiplayerskips" then
            jokerref.atlas = "fur_skipsychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_soks" then
            jokerref.atlas = "fur_soksychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_sourstone3" or jokertarget == "j_fur_talismansourstone3" then
            jokerref.atlas = "fur_sourstone3ychslab"
            jokerref.kris_57 = true
        elseif jokertarget == "j_fur_spark" then
            jokerref.atlas = "fur_sparkychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_sparkles" then
            jokerref.atlas = "fur_sparklesychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_lume" then
            jokerref.atlas = "fur_lumeychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_ignarilassacire" then
            jokerref.atlas = "fur_ignarilassacireychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_potmario" then
            jokerref.atlas = "fur_potmarioychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_aberrantreptile" or jokertarget == "j_fur_talismanaberrantreptile" then
            jokerref.atlas = "fur_aberrantreptileychslab"
            jokerref.saracrossing = true
        elseif jokertarget == "j_fur_gale" then
            jokerref.atlas = "fur_galeychslab"
            jokerref.saracrossing = true
        
        elseif jokertarget == "j_fur_ych" then
            jokerref.atlas = "fur_baseychslab"
            jokerref.saracrossing = true
        else
            jokerref.atlas = "fur_baseychslab"
            jokerref.saracrossing = true
        end

        if complexbackground == 1 then
            jokerref.pos = { x = 1, y = 0 }
        elseif complexbackground == 2 then
            jokerref.pos = { x = 2, y = 0 }
        end
        if config.complex_jokers.last_option[self.key] ~= config.complex_jokers.current_option then
            config.complex_jokers.last_option[self.key] = config.complex_jokers.current_option
            card:set_sprites(jokerref)
        elseif card.ability.previousselectedjoker ~= card.ability.selectedjoker then
            card.ability.previousselectedjoker = card.ability.selectedjoker
            card:set_sprites(jokerref)
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.roundstotal, card.ability.extra.roundsplayed }}
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}