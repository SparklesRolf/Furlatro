local furry_mod = SMODS.current_mod
local config = furry_mod.config

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
    rarity = 'fur_rarityfurry',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = 'Chips',
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
    rarity = "fur_rarityfurry",
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

        if context.other_joker and context.other_joker.config.center.rarity == "fur_rarityfurry" and not context.other_joker.debuff then
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
    rarity = 'fur_rarityfurry',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 25,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
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

        if context.reroll_shop or context.buying_card or context.open_booster then
            if not context.blueprint then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                return {
                    extra = {message = randomshopbuy, colour = G.C.FILTER},
                }
            end
        end

        if context.ending_shop then
            if not context.blueprint then
                return {
                    extra = {message = randomshopend, colour = G.C.FILTER},
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
    rarity = 'fur_rarityfurry',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = 'Chips',
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
    rarity = "fur_rarityfurry",
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
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
    rarity = 'fur_rarityfurry',
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
    effect = 'Mult',
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
        rarity = "fur_rarityfurry",
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
            if next(SMODS.find_card("j_fur_corruptsephirapaws")) then
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
    rarity = 'fur_rarityfurry',
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
    effect = 'Mult',
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
    end,

    in_pool = function(self, args)
        if (next(SMODS.find_card("j_fur_corruptsparkles")) or next(SMODS.find_card("j_fur_talismancorruptsparkles"))) then
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
    rarity = 'fur_rarityfurry',
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
    effect = 'Mult',
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
    rarity = 'fur_rarityfurry',
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
    effect = 'Mult',
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