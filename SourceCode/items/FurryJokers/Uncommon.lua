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




local silver_lines = { -- SilverSentinel
    normal = {
        '"Gonna finger ur bum"',
        '"Live, Laugh, Love"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'silver',
    config = {extra = { money = 3 }},
    atlas = 'furryjokers',
    pos = {x = 4, y = 1},
    soul_pos = {x = 5, y = 1},
    order = 1,
    rarity = 'fur_rarityfurry',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["uncommonfurries"] = true,
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    saracrossing = true,

    calculate = function(self, card, context)
        if self.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, "m_fur_silvercard") then
                ease_dollars(card.ability.extra.money)
                
                return {
                    extra = {focus = card, message = "+$" ..card.ability.extra.money},
                    colour = G.C.MONEY
                }
            end          
        end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_silvercard
        if config.joker_lines then
            return { vars = { card.ability.extra.money, silver_lines.normal[math.random(#silver_lines.normal)]}}
        else
            return { vars = { card.ability.extra.money, silver_lines.toggle[math.random(#silver_lines.toggle)]}}
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("uncommon", 'labels'), G.C.RARITY[2], G.C.WHITE, 1)
    end
}