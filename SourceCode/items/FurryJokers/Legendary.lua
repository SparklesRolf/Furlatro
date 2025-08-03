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
        if self.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, "m_bonus") then

                return {
                    xchips = card.ability.extra.xchips,
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
        if self.debuff then return nil end
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
        if self.debuff then return nil end
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
        if self.debuff then return nil end
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