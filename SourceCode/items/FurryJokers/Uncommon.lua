local furry_mod = SMODS.current_mod
local config = furry_mod.config

local jose_lines = { -- Jose
    normal = {
        '"Joseeeeeeeeeeeeeeee"',
        '"No way Jose!"',
    },
    toggle = {
        '',
    }
}
if not Talisman then 
    SMODS.Joker {
        key = 'xavierorjose',
        config = { partnersynergizetrigger = false, extra = { money = 3, moneygain = 1 }},
        atlas = 'joseeeeslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = "fur_rarityfurry",
        pools = {
            ["furry"] = true,
            ["nonmythics"] = true,
            ["uncommonfurries"] = true,
        },
        cost = 7,
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
                if not card.ability.partnersynergizetrigger or card.ability.extra.moneygain == 1 then
                    card.ability.partnersynergizetrigger = true
                    card.ability.extra.moneygain = card.ability.extra.moneygain * 2
                end
            end

            if context.individual and context.cardarea == G.play then
                local playingcard = context.other_card
                local enhancements = pseudorandom_element(G.P_CENTER_POOLS["Enhanced"], pseudoseed("j_fur_xavierorjose"))
                
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
                                colour = G.C.FILTER,
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

                            card.ability.extra.money = card.ability.extra.money + card.ability.extra.moneygain

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
            return card.ability.extra.money
        end,

        loc_vars = function(self, info_queue, card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, 3, 'fur_xavierorjose')
            local numerator2, denominator2 = SMODS.get_probability_vars(card, 1, 5, 'fur_xavierorjose2')
            
            if config.joker_lines then
                return {vars = { numerator, denominator, numerator2, denominator2, card.ability.extra.money, card.ability.extra.moneygain, jose_lines.normal[math.random(#jose_lines.normal)]}}
            else
                return {vars = { numerator, denominator, numerator2, denominator2, card.ability.extra.money, card.ability.extra.moneygain, jose_lines.toggle[math.random(#jose_lines.toggle)]}}
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
            badges[#badges+1] = create_badge(localize("uncommon", 'labels'), G.C.RARITY[2], G.C.WHITE, 1)
        end,
    }
end

local parrotdash_lines = { -- ParrotDash
    normal = {
        '"Shoutout to gay foxgirls"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'parrotdash',
    config = { partnersynergizetrigger = false, fakeanteincreasetrigger = false, fakerounds = 0, fakeante = 1, extra = { mult = 4 }},
    atlas = 'parrotdashslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
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
    raffle_winners31_10_2025 = true,
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if G.GAME.selected_partner == "pnr_fur_parrotdashpartner" then
            if not card.ability.partnersynergizetrigger or card.ability.extra.mult == 4 then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.mult = card.ability.extra.mult * 2
            end
        end

        if context.setting_blind then
            card.ability.fakeanteincreasetrigger = true
            card.ability.fakerounds = card.ability.fakerounds + 1
        end
    
        if context.joker_main and context.cardarea == G.jokers then
            if next(SMODS.find_mod("Multiplayer")) then
                if MP.GAME.lives >= 0 then
                    return {
                        mult = card.ability.extra.mult + (card.ability.fakeante * card.ability.fakerounds)
                    }
                else
                    return {
                        mult = card.ability.extra.mult + (G.GAME.round_resets.ante * G.GAME.round)
                    }
                end
            else
                return {
                    mult = card.ability.extra.mult + (G.GAME.round_resets.ante * G.GAME.round)
                }
            end
        end

        if context.end_of_round and G.GAME.blind.boss and card.ability.fakeanteincreasetrigger then
            card.ability.fakeanteincreasetrigger = false
            card.ability.fakeante = card.ability.fakeante + 1
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
        if next(SMODS.find_mod("Multiplayer")) then
            if MP.GAME.lives >= 0 then
                return { vars = { card.ability.extra.mult, (card.ability.extra.mult + (card.ability.fakeante * card.ability.fakerounds)), parrotdash_lines.normal[math.random(#parrotdash_lines.normal)], localize("k_ante"), localize("k_round") }}
            else
                return { vars = { card.ability.extra.mult, (card.ability.extra.mult + (G.GAME.round_resets.ante * G.GAME.round)), parrotdash_lines.normal[math.random(#parrotdash_lines.normal)], localize("k_ante"), localize("k_round") }}
            end
        else
            return { vars = { card.ability.extra.mult, (card.ability.extra.mult + (G.GAME.round_resets.ante * G.GAME.round)), parrotdash_lines.normal[math.random(#parrotdash_lines.normal)], localize("k_ante"), localize("k_round") }}
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("uncommon", 'labels'), G.C.RARITY[2], G.C.WHITE, 1)
    end
}

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
    config = { partnersynergizetrigger = false, extra = { money = 9 }},
    atlas = 'silverslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
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
        if G.GAME.selected_partner == "pnr_fur_silverpartner" then
            if not card.ability.partnersynergizetrigger or card.ability.extra.money == 3 then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.money = card.ability.extra.money * 2
            end
        end

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
        badges[#badges+1] = create_badge(localize("uncommon", 'labels'), G.C.RARITY[2], G.C.WHITE, 1)
    end
}