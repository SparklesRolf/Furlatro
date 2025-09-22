local furry_mod = SMODS.current_mod
local config = SMODS.current_mod.config

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
    atlas = 'furryjokers',
    pos = {x = 2, y = 2},
    soul_pos = {x = 3, y = 2},
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

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}

local foxxlydusk_lines = {
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
    config = {extra = { xmult = 1, gain = 0.05 }},
    atlas = 'furryjokers2',
    pos = { x = 4, y = 0 },
    soul_pos = { x = 5, y = 0 },
    rarity = 'fur_rarityfurry',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["legendaryfurries"] = true,
    },
    cost = 25,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    raffle_winners29_8_2025 = true,
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        local duskcards = 0
        local randomshopbuy = foxxlydusk_lines.shopbuy[math.random(#foxxlydusk_lines.shopbuy)]
        local randomshopend = foxxlydusk_lines.shopend[math.random(#foxxlydusk_lines.shopend)]

        if context.reroll_shop or context.buying_card or context.open_booster then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.key == "j_dusk" then
                    duskcards = duskcards + 1
                end
            end
            
            if duskcards >= 1 then
                card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.gain * 2)

                return {
                    extra = {message = randomshopbuy, colour = G.C.FILTER},
                }
            else
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                return {
                    extra = {message = randomshopbuy, colour = G.C.FILTER},
                }
            end
        end

        if context.ending_shop then
            
            return {
                extra = {message = randomshopend, colour = G.C.FILTER},
            }
        end
        
        if context.joker_main and context.cardarea == G.jokers then
            
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
    atlas = 'furryjokers',
    pos = {x = 4, y = 2},
    soul_pos = {x = 5, y = 2},
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

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}

if not Talisman then
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
        key = "sephirapaws",
        config = { extra = { xmult = 1, gain = 0.1 }},
        atlas = 'furryjokers2',
        pos = { x = 0, y = 0 },
        soul_pos = { x = 1, y = 0 },
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

            if G.playing_cards then
                if not context.blueprint then
                    for _, playing_card in ipairs(G.playing_cards) do
                        playingcardcount = playingcardcount + 1
                    end
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

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
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
    atlas = 'furryjokers',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
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
            if context.other_card:is_suit('fur_stars') then

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

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
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
    atlas = 'furryjokers',
    pos = { x = 0, y = 4 },
    soul_pos = { x = 1, y = 4 },
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
    atlas = 'furryjokers',
    pos = { x = 0, y = 3 },
    soul_pos = { x = 1, y = 3 },
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

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("legendary", 'labels'), G.C.RARITY[4], G.C.WHITE, 1)
    end
}