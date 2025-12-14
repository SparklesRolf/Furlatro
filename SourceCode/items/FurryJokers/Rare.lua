local furry_mod = SMODS.current_mod
local config = furry_mod.config

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
    atlas = 'astralslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
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
            if context.other_card:is_suit('fur_stars') or context.other_card:is_suit('six_Stars') then
                if G.GAME.selected_partner == "pnr_fur_astralpartner" then
                    if SMODS.pseudorandom_probability(card, "j_fur_astral", 1, 10, "fur_astral") then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 2
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'fur_astral')
                                local card2 = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'fur_astral')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 1
                                card2:add_to_deck()
                                G.consumeables:emplace(card2)
                                G.GAME.consumeable_buffer = 0
                            return true
                        end)}))
                        
                        return {
                            message = localize('k_plus_spectral'),
                            colour = G.C.SECONDARY_SET.Spectral,
                        }
                    end
                else
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        if SMODS.pseudorandom_probability(card, "j_fur_astral", 1, 10, "fur_astral") then
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
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 10, 'fur_astral')

        if config.joker_lines then
            return {vars = {numerator, denominator, astral_lines.normal[math.random(#astral_lines.normal)], localize('fur_stars', 'suits_plural'), localize('k_spectral')}}
        else
            return {vars = {numerator, denominator, astral_lines.toggle[math.random(#astral_lines.toggle)], localize('fur_stars', 'suits_plural'), localize('k_spectral')}}
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
        badges[#badges+1] = create_badge(localize("rare", 'labels'), G.C.RARITY[3], G.C.WHITE, 1)
    end
}

local danny_lines = {
    normal = {
        '"Can you pet me please..."',
        '"Meow!"',
        '"Bwah"',
        '"Silly"',
        '"Am I a good kitty...?"',
    },
    toggle = {
        '',
    }
}
if not Talisman then -- Danny
    SMODS.Joker {
        key = "danny",
        config = { partnersynergizetrigger = false, extra = { xmult = 1, xmultgain = 0.1 }},
        atlas = 'dannyslab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = "fur_rarityfurry",
        pools = {
            ["furry"] = true,
            ["nonmythics"] = true,
            ["rarefurries"] = true
        },
        cost = 10,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        raffle_winners31_10_2025 = true,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            local playingcard = context.other_card
            if G.GAME.selected_partner == "pnr_fur_dannypartner" then
                if not card.ability.partnersynergizetrigger or card.ability.extra.xmultgain == 0.1 then
                    card.ability.partnersynergizetrigger = true
                    card.ability.extra.xmultgain = card.ability.extra.xmultgain * 2
                end
            end

            if context.before and (next(context.poker_hands['Flush']) or next(context.poker_hands['Flush House'])
                or next(context.poker_hands['Flush Five']) or next(context.poker_hands['Straight Flush'])) then
                if not context.blueprint then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultgain

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                    }
                end
            end

            if context.individual and context.cardarea == G.play and (next(context.poker_hands['Flush']) or next(context.poker_hands['Flush House'])
                or next(context.poker_hands['Flush Five']) or next(context.poker_hands['Straight Flush'])) then
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
            if G.GAME.selected_partner ~= "pnr_fur_dannypartner" then
	    	    if G.deck and card.added_to_deck then
	    		    for i, v in pairs(G.deck.cards) do
	    		    	if not (v:is_suit("fur_stars") or v:is_suit('six_Stars')) then
	    		    		v:set_debuff(true)
	    		    	end
	    		    end
	    	    end
	    	    if G.hand and card.added_to_deck then
	    		    for i, v in pairs(G.hand.cards) do
	    		    	if not (v:is_suit("fur_stars") or v:is_suit('six_Stars')) then
	    		    		v:set_debuff(true)
	    		    	end
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
                return { vars = { card.ability.extra.xmult, card.ability.extra.xmultgain, localize('fur_stars', 'suits_singular'), danny_lines.normal[math.random(#danny_lines.normal)] }}
            else
                return { vars = { card.ability.extra.xmult, card.ability.extra.xmultgain, localize('fur_stars', 'suits_singular'), danny_lines.toggle[math.random(#danny_lines.toggle)] }}
            end
        end,

        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize("rare", 'labels'), G.C.RARITY[3], G.C.WHITE, 1)
        end,

        in_pool = function(self, args)
            if next(SMODS.find_card("j_fur_corruptdanny")) then
                return false
            else
                return true
            end
        end
    }
end

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
    config = { partnersynergizetrigger = false, extra = { xmult = 1, gain = 0.1 }},
    atlas = 'kalikslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
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
        if G.GAME.selected_partner == "pnr_fur_kalikpartner" then
            if not card.ability.partnersynergizetrigger or card.ability.extra.gain == 0.1 then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.gain = card.ability.extra.gain * 4
            end
        end

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
        badges[#badges+1] = create_badge(localize("rare", 'labels'), G.C.RARITY[3], G.C.WHITE, 1)
    end
}

local maltnoodlez_lines = { -- MaltNoodlez
    normal = {
        '',
    },
    toggle = {
        '',
    },
}
SMODS.Joker {
    key = 'maltnoodlez',
    config = { inround = false },
    atlas = 'maltnoodlezslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = "fur_rarityfurry",
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["rarefurries"] = true,
    },
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.setting_blind then
            card.ability.inround = true

            if G.GAME.selected_partner == "pnr_fur_maltnoodlezpartner" then
                return {
                    extra = {
                        card = card,
                        message = localize("k_nope_ex"),
                        colour = G.C.FILTER
                    }
                }
            else
                local jokers = {}
                local debuffedjoker = {}
                if not context.blueprint then
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].debuff then SMODS.recalc_debuff(G.jokers.cards[i]) end
                    end
                    for i = 1, #G.jokers.cards do
                        if not (G.jokers.cards[i].debuff or G.jokers.cards[i].config.center.key == "j_fur_maltnoodlez") then
                            table.insert(jokers, G.jokers.cards[i])
                        end
                    end
                    local _card = jokers[math.random(#jokers)]

                    if _card then
                            debuffedjoker = _card
                            SMODS.debuff_card(debuffedjoker, true, "fur_maltnoodlez")
                            _card:juice_up()
                            play_sound("cancel")
                    end
                end
            end
        end

        if (G.GAME.blind or G.GAME.blind.boss) and context.end_of_round then -- From VanillaRemade
            card.ability.inround = false
            local jokers = {}
            local debuffedjoker = {}
            if not context.blueprint then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].debuff then SMODS.recalc_debuff(G.jokers.cards[i]) end
                end
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].debuff then
                        table.insert(jokers, G.jokers.cards[i])
                    end
                end
                local _card = jokers[math.random(#jokers)]
                
                if _card then
                    debuffedjoker = _card
                    SMODS.debuff_card(debuffedjoker, false, "fur_maltnoodlez")
                    _card:juice_up()
                end
            end
        elseif card.ability.inround then
            local ret = SMODS.blueprint_effect(card, G.jokers.cards[#G.jokers.cards], context)
            if ret then
                ret.colour = G.C.FILTER
            end
            return ret
        end
    end,

    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then -- From VanillaRemade
            local compatible = G.jokers.cards[#G.jokers.cards] and G.jokers.cards[#G.jokers.cards] ~= card and
                G.jokers.cards[#G.jokers.cards].config.center.blueprint_compat
            main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                            }
                        }
                    }
                }
            }

            if config.joker_lines then
                return { main_end = main_end, vars = { maltnoodlez_lines.normal[math.random(#maltnoodlez_lines.normal)] }}
            else
                return { main_end = main_end, vars = { maltnoodlez_lines.toggle[math.random(#maltnoodlez_lines.toggle)] }}
            end
        end

        if config.joker_lines then
            return { vars = { maltnoodlez_lines.normal[math.random(#maltnoodlez_lines.normal)] }}
        else
            return { vars = { maltnoodlez_lines.toggle[math.random(#maltnoodlez_lines.toggle)] }}
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
        badges[#badges+1] = create_badge(localize("rare", 'labels'), G.C.RARITY[3], G.C.WHITE, 1)
    end
}

local nemzata_lines = { -- Nemzata
    normal = {
        '"Hamburger~"',
        '"Sometimes I dream about cheese"',
        '*sigh* "They hate us"',
        '"This game hates me.....\'Cuz its true"',
        '"Bow main, bow gang"',
    },
    toggle = {
        '',
    },
}
SMODS.Joker {
    key = "nemzata",
    config = { eliminatedcards = 0, partnersynergizetrigger = false, extra = { money = 5 }},
    atlas = 'nemzataslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
    rarity = "fur_rarityfurry",
    pools = {
        ["furry"] = true,
        ["nonmythics"] = true,
        ["rarefurries"] = true
    },
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    saracrossing = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if G.GAME.selected_partner == "pnr_fur_nemzatapartner" then
            if not card.ability.partnersynergizetrigger or card.ability.extra.money == 5 then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.money = card.ability.extra.money * 2
            end
        end

        if context.setting_blind then
            card.ability.eliminatedcards = 0
        end

        if context.pseudorandom_result and context.result and context.identifier == "fur_nemzsbow" then
            card.ability.eliminatedcards = card.ability.eliminatedcards + 1
            ease_dollars(card.ability.extra.money)
            if card.ability.eliminatedcards >= 3 then
                if card.ability.eliminatedcards >= 5 then
                    check_for_unlock({ type = "nemzplus_ability_triggered" })
                else
                    check_for_unlock({ type = "nemz_ability_triggered" })
                end
            end

            return {
                extra = {
                    focus = card,
                    message = "+$" .. card.ability.extra.money,
                    colour = G.C.MONEY
                }
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, "c_fur_nemzsbow", 'fur_astral')
                card:add_to_deck()
                card.ability.eternal = true
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
            return true
        end)}))
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_fur_nemzsbow
        local coins = (card.ability.extra.money * 100)

        if config.joker_lines then
            return { vars = { card.ability.extra.money, coins, nemzata_lines.normal[math.random(#nemzata_lines.normal)] }}
        else
            return { vars = { card.ability.extra.money, coins, nemzata_lines.toggle[math.random(#nemzata_lines.toggle)] }}
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
    atlas = 'saphslab',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
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
                if G.GAME.selected_partner == "pnr_fur_saphpartner" then
                    if SMODS.pseudorandom_probability(card, "j_fur_saph", 1, 5, "fur_saph") then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 2
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'fur_saph')
                                local card2 = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'fur_saph')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 1
                                card2:add_to_deck()
                                G.consumeables:emplace(card2)
                                G.GAME.consumeable_buffer = 0
                            return true
                        end)}))
                        
                        return {
                            message = localize('k_plus_tarot'),
                            colour = G.C.SECONDARY_SET.Tarot,
                        }
                    end
                else
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        if SMODS.pseudorandom_probability(card, "j_fur_saph", 1, 5, "fur_saph") then
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
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 5, 'fur_saph')
        
        if config.joker_lines then
            return {vars = {numerator, denominator, saph_lines.normal[math.random(#saph_lines.normal)], localize('Spades' , 'suits_plural'), localize('k_tarot')}}
        else
            return {vars = {numerator, denominator, saph_lines.toggle[math.random(#saph_lines.toggle)], localize('Spades' , 'suits_plural'), localize('k_tarot')}}
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
        badges[#badges+1] = create_badge(localize("rare", 'labels'), G.C.RARITY[3], G.C.WHITE, 1)
    end
}

local sourstone_lines = { -- Sourstone :3
    normal = {
        '',
    },
    toggle = {
        '',
    },
}
if not Talisman then
    SMODS.Joker {
        key = 'sourstone3',
        config = { extra = { money = 5, xmult = 3 }},
        atlas = 'sourstone3slab',
        pos = { x = 1, y = 0 },
        soul_pos = { x = 0, y = 0 },
        rarity = "fur_rarityfurry",
        pools = {
            ["furry"] = true,
            ["nonmythics"] = true,
            ["rarefurries"] = true
        },
        cost = 10,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        kris_57 = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            
            if context.joker_main and context.cardarea == G.jokers then
                if G.jokers.cards[1] == card then
                    ease_dollars(card.ability.extra.money)

                    return {
                        extra = {
                            card = card, 
                            message = "+$" .. card.ability.extra.money, 
                            colour = G.C.MONEY
                        },
                    }
                elseif G.jokers.cards[#G.jokers.cards] == card then
                    if G.GAME.selected_partner == "pnr_fur_sourstone3partner" then
                        return {
                            xmult = card.ability.extra.xmult
                        }
                    else
                        ease_dollars(-card.ability.extra.money, true)

                        return {
                            xmult = card.ability.extra.xmult
                        }
                    end
                end
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return { vars = { card.ability.extra.money, card.ability.extra.xmult, sourstone_lines.normal[math.random(#sourstone_lines.normal)] }}
            else
                return { vars = { card.ability.extra.money, card.ability.extra.xmult, sourstone_lines.toggle[math.random(#sourstone_lines.toggle)] }}
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
            badges[#badges+1] = create_badge(localize("rare", 'labels'), G.C.RARITY[3], G.C.WHITE, 1)
        end
    }
end