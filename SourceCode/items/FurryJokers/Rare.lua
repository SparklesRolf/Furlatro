local furry_mod = SMODS.current_mod
local config = SMODS.current_mod.config

local astral_lines = { -- AstralWarden
    normal = {
        '"Fuck off..."',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'astral',
    config = {extra = { odds = 10 }},
    atlas = 'furryjokers',
    pos = {x = 0, y = 2},
    soul_pos = {x = 1, y = 2},
    rarity = 'fur_rarityfurry',
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["rarefurries"] = true,
    },
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('fur_stars') then
                if pseudorandom("j_fur_astral") < G.GAME.probabilities.normal/card.ability.extra.odds then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'fur_astral')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                    
                    return {
                        message = localize('k_plus_spectral'),
                        colour = G.C.SECONDARY_SET.Spectral,
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        if config.joker_lines then
            if Cryptid then
                if card.ability.cry_rigged then
                    return {vars = {card.ability.extra.odds, card.ability.extra.odds, astral_lines.normal[math.random(#astral_lines.normal)], localize('fur_stars', 'suits_plural'), localize('k_spectral')}}
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, astral_lines.normal[math.random(#astral_lines.normal)], localize('fur_stars', 'suits_plural'), localize('k_spectral')}}
                end
            else
                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, astral_lines.normal[math.random(#astral_lines.normal)], localize('fur_stars', 'suits_plural'), localize('k_spectral')}}
            end
        else
            if Cryptid then
                if card.ability.cry_rigged then
                    return {vars = {card.ability.extra.odds, card.ability.extra.odds, astral_lines.toggle[math.random(#astral_lines.toggle)], localize('fur_stars', 'suits_plural'), localize('k_spectral')}}
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, astral_lines.toggle[math.random(#astral_lines.toggle)], localize('fur_stars', 'suits_plural'), localize('k_spectral')}}
                end
            else
                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, astral_lines.toggle[math.random(#astral_lines.toggle)], localize('fur_stars', 'suits_plural'), localize('k_spectral')}}
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("rare", 'labels'), G.C.RARITY[3], G.C.WHITE, 1)
    end
}

local kalik_lines = { -- KalikHusky
    normal = {
        '"I\'m not stinky!"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'kalik',
    config = {extra = { xmult = 1, gain = 0.1 }},
    atlas = 'furryjokers',
    pos = {x = 2, y = 1},
    soul_pos = {x = 3, y = 1},
    rarity = 'fur_rarityfurry',
    cost = 10,
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["rarefurries"] = true,
    },
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = 'Mult',
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function() 
                    local front = pseudorandom_element(G.P_CARDS, pseudoseed('stink_fr'))
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS.m_fur_stinkcard, {playing_card = G.playing_card})
                    card:start_materialize({G.C.SECONDARY_SET.Enhanced})
                    G.play:emplace(card)
                    table.insert(G.playing_cards, card)
                    return true
                end}))
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize("fur_kalikstink"), colour = G.C.SECONDARY_SET.Enhanced})

            G.E_MANAGER:add_event(Event({
                func = function() 
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    return true
                end}))
                draw_card(G.play,G.deck, 90,'up', nil)  

            playing_card_joker_effects({true})
        end
        
        if context.joker_main then
            if card.debuff then return nil end
            local stinkycards = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_fur_stinkcard') then 
                    stinkycards = stinkycards + 1 
                end
            end

            return {
                xmult = card.ability.extra.xmult + (card.ability.extra.gain * stinkycards),
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_stinkcard

        local stinkycards = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_fur_stinkcard') then 
                    stinkycards = stinkycards + 1 
                end
            end
        end
        if config.joker_lines then
            return { vars = {card.ability.extra.xmult + (card.ability.extra.gain * stinkycards), card.ability.extra.gain, kalik_lines.normal[math.random(#kalik_lines.normal)]}}
        else
            return { vars = {card.ability.extra.xmult + (card.ability.extra.gain * stinkycards), card.ability.extra.gain, kalik_lines.toggle[math.random(#kalik_lines.toggle)]}}
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("rare", 'labels'), G.C.RARITY[3], G.C.WHITE, 1)
    end
}

local saph_lines = { -- SaphielleFox
    normal = {
        '"I\'m not a bottom!!"',
    },
    toggle = {
        '',
    }
}
SMODS.Joker {
    key = 'saph',
    config = {extra = { odds = 5 }},
    atlas = 'furryjokers',
    pos = { x = 2, y = 3 },
    soul_pos = { x = 3, y = 3 },
    rarity = 'fur_rarityfurry',
    cost = 10,
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["rarefurries"] = true,
    },
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('Spades') then
                if pseudorandom("j_fur_saph") < G.GAME.probabilities.normal/card.ability.extra.odds then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'fur_saph')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                    
                    return {
                        message = localize('k_plus_tarot'),
                        colour = G.C.SECONDARY_SET.Tarot,
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        if config.joker_lines then
            if Cryptid then
                if card.ability.cry_rigged then
                    return {vars = {card.ability.extra.odds, card.ability.extra.odds, saph_lines.normal[math.random(#saph_lines.normal)], localize('Spades' , 'suits_plural'), localize('k_tarot')}}
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, saph_lines.normal[math.random(#saph_lines.normal)], localize('Spades' , 'suits_plural'), localize('k_tarot')}}
                end
            else
                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, saph_lines.normal[math.random(#saph_lines.normal)], localize('Spades' , 'suits_plural'), localize('k_tarot')}}
            end
        else
            if Cryptid then
                if card.ability.cry_rigged then
                    return {vars = {card.ability.extra.odds, card.ability.extra.odds, saph_lines.toggle[math.random(#saph_lines.toggle)], localize('Spades' , 'suits_plural'), localize('k_tarot')}}
                else
                    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, saph_lines.toggle[math.random(#saph_lines.toggle)], localize('Spades' , 'suits_plural'), localize('k_tarot')}}
                end
            else
                return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, saph_lines.toggle[math.random(#saph_lines.toggle)], localize('Spades' , 'suits_plural'), localize('k_tarot')}}
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize("rare", 'labels'), G.C.RARITY[3], G.C.WHITE, 1)
    end
}