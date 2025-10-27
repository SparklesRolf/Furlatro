local furry_mod = SMODS.current_mod
local config = SMODS.current_mod.config

if not Talisman then
    local jose_lines = { -- Jose
            normal = {
                '"Joseeeeeeeeeeeeeeee"',
                '"No way Jose!"',
            },
            toggle = {
                '',
            }
        }
    SMODS.Joker {
        key = 'xavierorjose',
        config = { extra = { odds1 = 3, odds2 = 5, money = 3, moneygain = 1 }},
        atlas = 'furryjokers2',
        pos = { x = 2, y = 0 },
        soul_pos = { x = 3, y = 0 },
        rarity = "fur_rarityfurry",
        pools = {
            ["furry"] = true,
            ["nonmythics"] = true,
            ["uncommonfurries"] = true,
        },
        cost = 7,
        blueprint_compat = true,
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
                else
                    if pseudorandom("j_fur_xavierorjose") < G.GAME.probabilities.normal/card.ability.extra.odds2 then
                        if not context.blueprint then
                            card.ability.extra.money = card.ability.extra.money + card.ability.extra.moneygain
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

            if context.end_of_round and context.cardarea == G.jokers then
                return {
                    extra = { focus = card, message = '+$'.. card.ability.extra.money, colour = G.C.MONEY },
                    card = card,
                    ease_dollars(card.ability.extra.money)
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                if Cryptid then
                    if card.ability.cry_rigged then
                        return {vars = {card.ability.extra.odds2, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.money, card.ability.extra.moneygain, jose_lines.normal[math.random(#jose_lines.normal)]}}
                    else
                        return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.money, card.ability.extra.moneygain, jose_lines.normal[math.random(#jose_lines.normal)]}}
                    end
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.money, card.ability.extra.moneygain, jose_lines.normal[math.random(#jose_lines.normal)]}}
                end
            else
                if Cryptid then
                    if card.ability.cry_rigged then
                        return {vars = {card.ability.extra.odds2, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.money, card.ability.extra.moneygain, jose_lines.toggle[math.random(#jose_lines.toggle)]}}
                    else
                        return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.money, card.ability.extra.moneygain, jose_lines.toggle[math.random(#jose_lines.toggle)]}}
                    end
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.money, card.ability.extra.moneygain, jose_lines.toggle[math.random(#jose_lines.toggle)]}}
                end
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("uncommon", 'labels'), G.C.RARITY[2], G.C.WHITE, 1)
        end,
    }
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
        if card.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, "m_fur_silvercard") then
                ease_dollars(card.ability.extra.money)
                
                return {
                    extra = {focus = card, message = "+$" .. card.ability.extra.money, colour = G.C.MONEY},
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