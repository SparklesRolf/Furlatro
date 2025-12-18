Partner_API.Partner { -- SparklesRolf
    key = "sparklespartner",
    name = "SparklesRolf (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 0, y = 0 },
    atlas = "FurryPartners",
    config = { spawnstate = "Inactive", extra = { xmult = 1.5 }},
    link_config = { j_fur_sparkles = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if context.setting_blind then
            card.ability.spawnstate = "Active"

            if link_level == 1 then
                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
            end
        end

        if context.individual and context.cardarea == G.play then
            local first_star = nil
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit("fur_stars") or context.scoring_hand[i]:is_suit("six_Stars") then
                    first_star = context.scoring_hand[i]
                    break
                end
            end

            if context.other_card == first_star then
                if link_level == 1 then
                    if card.ability.spawnstate == "Active" then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_fur_fallingstar', 'pnr_fur_sparklespartner')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                            end)
                        }))

                        card.ability.spawnstate = "Inactive"
                        return {
                            extra = {
                                message = localize('k_plus_tarot'),
                                colour = G.C.SECONDARY_SET.Tarot,
                                card = card,
                            }
                        }
                    end
                else
                    return {
                        extra = {
                            xmult = card.ability.extra.xmult,
                            colour = G.C.MULT,
                            card = card,
                        }
                    }
                end
            end
        end

        if context.end_of_round then
            card.ability.spawnstate = "Inactive"
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
            info_queue[#info_queue + 1] = G.P_CENTERS.c_fur_fallingstar
        end
        return { key = key, vars = { card.ability.extra.xmult, card.ability.spawnstate, localize('fur_stars', 'suits_plural') }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_sparkles" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- illyADo
    key = "illypartner",
    name = "illyADo (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 1, y = 0 },
    atlas = "FurryPartners",
    config = { extra = { xmult = 1, gain = 0.05 }},
    link_config = { j_fur_illy = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if link_level ~= 1 then
            if context.individual and context.cardarea == G.play then 
                local first_king = nil
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:get_id() == 13 then
                        first_king = context.scoring_hand[i]
                        break
                    end
                end

                if context.other_card == first_king then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                    return {
                        extra = {
                            card = card, 
                            message = localize('k_upgrade_ex'), 
                            colour = G.C.FILTER
                        }
                    }
                end
            end

            if context.joker_main then
                return {
                    xmult = card.ability.extra.xmult,
                    colour = G.C.MULT,
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then key = key .. "_alt" end
        return { key = key, vars = { card.ability.extra.xmult, card.ability.extra.gain, localize("King", 'ranks'), localize("k_face_cards")}}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_illy" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- GhostFox
    key = "ghostpartner",
    name = "GhostFox (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 2, y = 0 },
    atlas = "FurryPartners",
    link_config = { j_fur_ghost = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        if context.hand_drawn then -- Ghost card hand limit reset shnanegains
            G.hand.config.highlighted_limit = 5
            G.GAME.starting_params.play_limit = 5
            G.GAME.starting_params.discard_limit = 5
            SMODS.update_hand_limit_text(true, true)
        end

        if link_level ~= 1 then
            if context.individual and context.cardarea == G.play then
                local first_card = nil
                for i = 1, #context.scoring_hand do
                    if context.other_card == context.scoring_hand[1] then
                        first_card = context.scoring_hand[i]
                        break
                    end
                end

                if context.other_card == first_card then
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        first_card:set_ability(G.P_CENTERS['m_fur_ghostcard']);
                        first_card:juice_up(0.5, 0.5)
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
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        else
            info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_ghostcard
        end
        return { key = key }
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_ghost" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- SoksAtArt
    key = "sokspartner",
    name = "Soks (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 3, y = 0 },
    atlas = "FurryPartners",
    config = { remainingtriggers = 3, extra = { bonushands = 1, remainingtriggers = 2 }},
    link_config = { j_fur_soks = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if link_level ~= 1 then
            if context.individual and context.cardarea == G.play then
                if card.ability.extra.remainingtriggers == 0 then
                    if SMODS.has_enhancement(context.other_card, 'm_fur_sockcard') then
                        ease_hands_played(card.ability.extra.bonushands)
                        card.ability.extra.remainingtriggers = 2
                        card.ability.remainingtriggers = 3

                        return {
                            extra = {focus = card, message = '+1' .. localize("k_hud_hands"), colour = G.C.CHIPS},
                        }
                    end
                else
                    if SMODS.has_enhancement(context.other_card, 'm_fur_sockcard') then
                        card.ability.extra.remainingtriggers = card.ability.extra.remainingtriggers - 1
                        card.ability.remainingtriggers = card.ability.remainingtriggers - 1
                    end
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt"
        else
            info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_sockcard 
        end
        return { key = key, vars = { card.ability.remainingtriggers, localize("k_hud_hands") }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_soks" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Kalik
    key = "kalikpartner",
    name = "Kalik (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 4, y = 0 },
    atlas = "FurryPartners",
    config = { remainingrounds = 2, extra = { xmult = 1, gain = 0.05 }},
    link_config = { j_fur_kalik = 1 },

    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.remainingrounds = card.ability.remainingrounds - 1

            if card.ability.remainingrounds == 0 then
                card.ability.remainingrounds = 2
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
        end

        if context.joker_main then
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
        local link_level = self:get_link_level()
        local key = self.key
        local stinkycards = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_fur_stinkcard') then 
                    stinkycards = stinkycards + 1 
                end
            end
        end

        if link_level == 1 then 
            key = key .. "_alt" 
        else
            info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_stinkcard
        end
        return { key = key, vars = { card.ability.remainingrounds, card.ability.extra.xmult + (card.ability.extra.gain * stinkycards), card.ability.extra.gain }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_kalik" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- SilverSentinell
    key = "silverpartner",
    name = "SilverSentinell (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 5, y = 0 },
    atlas = "FurryPartners",
    config = { spawnstate = "Inactive", extra = { money = 3 }},
    link_config = { j_fur_silver = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        if context.setting_blind then
            card.ability.spawnstate = "Active"

            if link_level == 1 then
                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
            end
        end

        if context.individual and context.cardarea == G.play then
            local first_silver_card = nil
            for i = 1, #context.scoring_hand do
                if SMODS.has_enhancement(context.other_card, 'm_fur_silvercard') then
                    first_silver_card = context.scoring_hand[i]
                    break
                end
            end

            if link_level == 1 then
                if context.other_card == first_silver_card then
                    if card.ability.spawnstate == "Active" then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_fur_treasurechest', 'pnr_fur_silverpartner')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                            end)
                        }))
                    
                        card.ability.spawnstate = "Inactive"
                        return {
                            extra = {
                                    message = localize('k_plus_tarot'),
                                    colour = G.C.SECONDARY_SET.Tarot,
                                    card = card,
                            }
                        }
                    end
                end
            else
                if SMODS.has_enhancement(context.other_card, "m_fur_silvercard") then
                    ease_dollars(card.ability.extra.money)

                    return {
                        extra = {focus = card, message = "+$" .. card.ability.extra.money, colour = G.C.MONEY},
                    }
                end
            end        
        end

        if context.end_of_round then
            card.ability.spawnstate = "Inactive"
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        else
            info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_silvercard
        end
        return { key = key, vars = { card.ability.extra.money, card.ability.spawnstate }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_silver" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- AstralWarden
    key = "astralpartner",
    name = "AstralWarden (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 0, y = 1 },
    atlas = "FurryPartners",
    config = { spawnstate = "Inactive" },
    link_config = { j_fur_astral = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if link_level ~= 1 then
            if context.setting_blind then
                card.ability.spawnstate = "Active"

                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
            end

            if context.individual and context.cardarea == G.play then
                if card.ability.spawnstate == "Active" then 
                    if context.other_card:is_suit('fur_stars') or context.other_card:is_suit('six_Stars') then
                        if SMODS.pseudorandom_probability(card, "pnr_fur_astralpartner", 1, 10, "pnr_astralpartner") then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                    local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'pnr_fur_astral')
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                return true
                            end)}))

                            card.ability.spawnstate = "Inctive"
                            return {
                                message = localize('k_plus_spectral'),
                                colour = G.C.SECONDARY_SET.Spectral,
                            }
                        end
                    end
                end
            end

            if context.end_of_round then
                card.ability.spawnstate = "Inactive"
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 10, "pnr_astralpartner")

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { numerator, denominator, localize('k_spectral'), localize('fur_stars', 'suits_plural'), card.ability.spawnstate }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_astral" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- CobaltTheBluPanda
    key = "cobaltpartner",
    name = "CobaltTheBluPanda (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 1, y = 1 },
    atlas = "FurryPartners",
    config = { spawnstate = "Inactive", extra = { xchips = 1.5 }},
    link_config = { j_fur_cobalt = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if context.setting_blind then
            card.ability.spawnstate = "Active"

            if link_level == 1 then
                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
            end
        end

        if context.individual and context.cardarea == G.play then
            local first_club = nil
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit("Clubs") then
                    first_club = context.scoring_hand[i]
                    break
                end
            end

            if context.other_card == first_club then
                if link_level == 1 then
                    if card.ability.spawnstate == "Active" then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_moon', 'pnr_fur_cobaltpartner')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                            end)
                        }))
                        
                        card.ability.spawnstate = "Inactive"
                        return {
                            extra = {
                                message = localize('k_plus_tarot'),
                                colour = G.C.SECONDARY_SET.Tarot,
                                card = card,
                            }
                        }
                    end
                else
                    return {
                        extra = {
                            xchips = card.ability.extra.xchips,
                            sound = "fur_xchip",
                            colour = G.C.CHIPS
                        }
                    }
                end
            end
        end

        if context.end_of_round then
            card.ability.spawnstate = "Inactive"
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
            info_queue[#info_queue + 1] = G.P_CENTERS.c_moon
        end
        return { key = key, vars = { card.ability.extra.xchips, card.ability.spawnstate, localize('Clubs', 'suits_plural') }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_cobalt" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- IceSea
    key = "iceseapartner",
    name = "IceSea (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 2, y = 1 },
    atlas = "FurryPartners",
    config = { spawnstate = "Inactive" },
    link_config = { j_fur_icesea = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if context.setting_blind then
            card.ability.spawnstate = "Active"

            if link_level == 1 then
                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
            end
        end

        if context.individual and context.cardarea == G.play then
            local first_card = nil

            if link_level == 1 then
                if card.ability.spawnstate == "Active" then
                    if SMODS.has_enhancement(context.other_card, "m_bonus") then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_heirophant', 'pnr_fur_iceseapartner')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                            end)
                        }))

                        card.ability.spawnstate = "Inactive"
                        return {
                            extra = {
                                message = localize('k_plus_tarot'),
                                colour = G.C.SECONDARY_SET.Tarot,
                                card = card,
                            }
                        }
                    end
                end
            else
                for i = 1, #context.scoring_hand do
                    if context.other_card == context.scoring_hand[1] then
                        first_card = context.scoring_hand[i]
                        break
                    end
                end

                if context.other_card == first_card then
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        first_card:set_ability(G.P_CENTERS['m_bonus']);
                        first_card:juice_up(0.5, 0.5)
                        return true
                    end}))

                    return {
                        message = localize('fur_enhanced', 'dictionary'),
                        colour = G.C.FILTER
                    }
                end
            end
        end

        if context.end_of_round then
            card.ability.spawnstate = "Inactive"
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus

        if link_level == 1 then 
            key = key .. "_alt" 
            info_queue[#info_queue + 1] = G.P_CENTERS.c_heirophant
        end
        return { key = key, vars = { card.ability.spawnstate }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_icesea" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Koneko
    key = "konekopartner",
    name = "The_Koneko (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 3, y = 1 },
    atlas = "FurryPartners",
    config = { spawnstate = "Inactive", extra = { xmult = 1.5 }},
    link_config = { j_fur_koneko = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if context.setting_blind then
            card.ability.spawnstate = "Active"

            if link_level == 1 then
                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
            end
        end

        if context.individual and context.cardarea == G.play then
            local first_heart = nil
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit("Hearts") then
                    first_heart = context.scoring_hand[i]
                    break
                end
            end

            if context.other_card == first_heart then
                if link_level == 1 then
                    if card.ability.spawnstate == "Active" then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_sun', 'pnr_fur_konekopartner')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                            end)
                        }))
                        
                        card.ability.spawnstate = "Inactive"
                        return {
                            extra = {
                                message = localize('k_plus_tarot'),
                                colour = G.C.SECONDARY_SET.Tarot,
                                card = card,
                            }
                        }
                    end
                else
                    return {
                        extra = {
                            xmult = card.ability.extra.xmult,
                            colour = G.C.MULT
                        }
                    }
                end
            end
        end

        if context.end_of_round then
            card.ability.spawnstate = "Inactive"
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
            info_queue[#info_queue + 1] = G.P_CENTERS.c_sun
        end
        return { key = key, vars = { card.ability.extra.xmult, card.ability.spawnstate, localize('Hearts', 'suits_plural') }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_koneko" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- SaphielleFox
    key = "saphpartner",
    name = "SaphielleFox (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 4, y = 1 },
    atlas = "FurryPartners",
    config = { spawnstate = "Inactive" },
    link_config = { j_fur_saph = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if link_level ~= 1 then
            if context.setting_blind then
                card.ability.spawnstate = "Active"

                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
            end

            if context.individual and context.cardarea == G.play then
                if card.ability.spawnstate == "Active" then
                    if context.other_card:is_suit('Spades') then
                        if SMODS.pseudorandom_probability(card, "pnr_fur_saphpartner", 1, 5, "pnr_saphpartner") then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                    local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'pnr_fur_saph')
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                return true
                            end)}))
                        
                            card.ability.spawnstate = "Inctive"
                            return {
                                message = localize('k_plus_tarot'),
                                colour = G.C.SECONDARY_SET.Tarot,
                            }
                        end
                    end
                end
            end

            if context.end_of_round then
                card.ability.spawnstate = "Inactive"
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 5, "fur_curiousangel")

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { numerator, denominator, localize('k_tarot'), localize('Spades', 'suits_plural'), card.ability.spawnstate }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_saph" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- DelusionalSkips
    key = "skipspartner",
    name = "DelusionalSkips (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 5, y = 1 },
    atlas = "FurryPartners",
    config = { remainingrounds = 2 },
    link_config = { j_fur_skips = 1, j_fur_multiplayerskips = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if link_level ~= 1 then
            if context.skip_blind then
                if card.ability.remainingrounds ~= 1 then
                    card.ability.remainingrounds = card.ability.remainingrounds - 1

                    return {
                        extra = {
                            card = card,
                            message = card.ability.remainingrounds .. " Remaining",
                            colour = G.C.FILTER
                        }
                    }
                else
                    card.ability.remainingrounds = 2

                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            add_tag(Tag('tag_fur_skipstag'))
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                            return true
                        end)
                    }))
                    return {
                        extra = {card = card, message = localize('fur_skipstag')},
                    }
                end
            end

            if context.first_hand_drawn then
                if not G.GAME.blind.boss then
                    if SMODS.pseudorandom_probability(card, "pnr_fur_skips", 1, 30, "pnr_skips") then
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
                            message = localize("Skipped", 'blind_states'),
                            colour = G.C.SECONDARY_SET.FILTER
                        }
                    end
                end
            end
        else
            if G.GAME.blind.boss then
                if (G.GAME.probabilities.normal * 2) > 4 then
                    if context.fix_probability and context.identifier == "fur_skips" then
                        return {
                            numerator = 4
                        }
                    end
                else
                    if context.mod_probability and context.identifier == "fur_skips" then
                        return {
                            numerator = context.numerator * 2
                        }
                    end
                end
            else
                if context.mod_probability and context.identifier == "fur_skips" then
                    return {
                        numerator = context.numerator * 2
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 30, 'pnr_skips')

        if link_level == 1 then 
            key = key .. "_alt" 
            info_queue[#info_queue + 1] = G.P_CENTERS.tag_fur_skipstag
        end
        return { key = key, vars = { numerator, denominator, card.ability.remainingrounds }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_skips" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- SparkTheBird
    key = "sparkpartner",
    name = "SparkTheBird (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 0, y = 2 },
    atlas = "FurryPartners",
    config = { spawnstate = "Inactive", extra = { xmult = 1.5, xmult2 = 2.25 }},
    link_config = { j_fur_spark = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if context.setting_blind then
            card.ability.spawnstate = "Active"

            if link_level == 1 then
                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
            end
        end

        if context.individual and context.cardarea == G.play then
            local first_diamond = nil
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit("Diamonds") then
                    first_diamond = context.scoring_hand[i]
                    break
                end
            end

            if context.other_card == first_diamond then
                if link_level == 1 then
                    if card.ability.spawnstate == "Active" then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_star', 'pnr_fur_sparkpartner')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                            end)
                        }))
                        
                        card.ability.spawnstate = "Inactive"
                        return {
                            extra = {
                                message = localize('k_plus_tarot'),
                                colour = G.C.SECONDARY_SET.Tarot,
                                card = card,
                            }
                        }
                    end
                else
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
            end
        end

        if context.end_of_round then
            card.ability.spawnstate = "Inactive"
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
            info_queue[#info_queue + 1] = G.P_CENTERS.c_star
        end
        return { key = key, vars = { card.ability.extra.xmult, card.ability.extra.xmult2, card.ability.spawnstate, localize('Diamonds', 'suits_plural') }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_spark" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Luposity
    key = "lupositypartner",
    name = "Luposity (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 1, y = 2 },
    atlas = "FurryPartners",
    config = { cookiejarfilled = "False", extra = { cookiejarcapacity = 0 }},
    link_config = { j_fur_luposity = 1, j_fur_cryptidluposity = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if context.ending_shop then
            card.ability.cookiejarfilled = "False"
        end

        if context.partner_click and card.ability.extra.cookiejarcapacity > 0 then
            card.ability.extra.cookiejarcapacity = card.ability.extra.cookiejarcapacity - 1

            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                local card = create_card('lupocookies', G.consumeables, nil, nil, nil, nil, nil, 'pnr_fur_lupositypartner')
                card:add_to_deck()
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
                return true
                end)
            }))
                        
            return {
                extra = {
                    message = "+1 " .. localize('fur_cookie', 'dictionary'),
                    colour = G.C.DARK_EDITION,
                    card = card,
                }
            }
        end

        if context.end_of_round then
            if card.ability.cookiejarfilled == "False" then
                card.ability.cookiejarfilled = "True"
                card.ability.extra.cookiejarcapacity = card.ability.extra.cookiejarcapacity + 1

                return {
                    extra = {
                        message = localize("fur_cookiestored"),
                        colour = G.C.FILTER
                    }
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { card.ability.extra.cookiejarcapacity }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_luposity" or v.key == "j_fur_cryptidluposity" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- CuriousAngel
    key = "curiousangelpartner",
    name = "CuriousAngel (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 2, y = 2 },
    atlas = "FurryPartners",
    config = { extra = { xmult = 1, gain = 0.05 }},
    link_config = { j_fur_curiousangel = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        local playingcard = context.other_card

        if link_level == 1 then
            if G.GAME then
                if context.mod_probability and context.identifier == "fur_curiousangel" then
                    return {
                        numerator = context.numerator * 2
                    }
                end
            end
        end

        if context.individual and context.cardarea == G.play then
            local first_card = nil
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[1] then
                    first_card = context.scoring_hand[i]
                    break
                end
            end

            if context.other_card == first_card then
                if link_level ~= 1 then
                    if not playingcard.edition then
                        if SMODS.pseudorandom_probability(card, "pnr_fur_curiousangelparter", 1, 15, "pnr_curiousangel") then
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
                    else
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
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 15, 'pnr_curiousangel')

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { numerator, denominator, localize('negative', 'labels'), card.ability.extra.gain, card.ability.extra.xmult }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_curiousangel" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- SephiraPaws
    key = "sephirapawspartner",
    name = "SephiraPaws (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 3, y = 2 },
    atlas = "FurryPartners",
    config = { discardstate = "Inactive", extra = { xmult = 1, gain = 0.005 }},
    link_config = { j_fur_sephirapaws = 1, j_fur_talismansephirapaws = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        local playingcardcount = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                playingcardcount = playingcardcount + 1
            end
        end

        if link_level ~= 1 then
            if context.setting_blind then
                card.ability.discardstate = "Active"

                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
            end
        
            if context.pre_discard and not context.hook then -- From VanillaRemade
                local upgrademult = true
                local selectedhandtype = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                local play_more_than = (G.GAME.hands[selectedhandtype].played or 0)
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= selectedhandtype and values.played >= play_more_than and SMODS.is_poker_hand_visible(handname) then
                        upgrademult = false
                        break
                    end
                end

                if upgrademult and card.ability.discardstate == "Active" then
                    card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.gain * playingcardcount)
                    card.ability.discardstate = "Inactive"
                    return {
                        message = localize('k_upgrade_ex'),
                        card = card,
                        colour = G.C.FILTER
                    }
                end
            end

            if context.joker_main and card.ability.extra.xmult >= 1 then
                return {
                    xmult = card.ability.extra.xmult,
                    colour = G.C.MULT,
                }
            end

            if context.end_of_round then
                card.ability.discardstate = "Inactive"
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { card.ability.extra.xmult, card.ability.extra.gain, card.ability.discardstate }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_sephirapaws" or v.key == "j_fur_talismansephirapaws" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Joseeee
    key = "xavierorjosepartner",
    name = "Joseeee (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 4, y = 2 },
    atlas = "FurryPartners",
    link_config = { j_fur_xavierorjose = 1, j_fur_talismanxavierorjose = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        local playingcard = context.other_card
        local enhancements = pseudorandom_element(G.P_CENTER_POOLS["Enhanced"], pseudoseed("j_fur_xavierorjose"))

        if link_level ~= 1 then
            if context.individual and context.cardarea == G.play then
                local first_card = nil
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[1] then
                        first_card = context.scoring_hand[i]
                        break
                    end
                end

                if context.other_card == first_card then
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
            end
        else
            if G.GAME then
                if context.mod_probability and context.identifier == "fur_xavierorjose" then
                    return {
                        numerator = context.numerator * 2
                    }
                end
                if context.mod_probability and context.identifier == "fur_xavierorjose2" then
                    return {
                        numerator = context.numerator * 2
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = {  }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_xavierorjose" or v.key == "j_fur_talismanxavierorjose" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- FoxxlyDuskFur
    key = "foxxlyduskfurpartner",
    name = "FoxxlyDuskFur (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 5, y = 2 },
    atlas = "FurryPartners",
    config = { partnertriggered = "False", extra = { rerolls = 1 }},
    link_config = { j_fur_foxxlyduskfur = 1 },

    calculate = function(self, card, context)
        if context.end_of_round and card.ability.partnertriggered == "False" then
            card.ability.partnertriggered = "True"
            SMODS.change_free_rerolls(card.ability.extra.rerolls)
        end

        if context.ending_shop then
            card.ability.extra.rerolls = 0
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { card.ability.extra.rerolls }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_foxxlyduskfur" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Kris_57
    key = "kris57partner",
    name = "Kris_57 (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 0, y = 3 },
    atlas = "FurryPartners",
    config = { extra = { xchips = 1, xmult = 1, xchipsgain = 0.05, xmultgain = 0.05 }},
    link_config = { j_fur_kris57 = 1, j_fur_talismankris57 = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if link_level ~= 1 then
            if context.individual and context.cardarea == G.play then
                local first_5 = nil
                local first_7 = nil
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:get_id() == 5 then
                        first_5 = context.scoring_hand[i]
                        break
                    end
                end
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:get_id() == 7 then
                        first_7 = context.scoring_hand[i]
                        break
                    end
                end


                if context.other_card == first_5 then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultgain

                    return {
                        extra = {
                            card = card, 
                            message = localize('k_upgrade_ex'), 
                            colour = G.C.FILTER
                        }
                    }
                elseif context.other_card == first_7 then
                    card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsgain

                    return {
                        extra = {
                            card = card, 
                            message = localize('k_upgrade_ex'), 
                            colour = G.C.FILTER
                        }
                    }
                end
            end

            if context.joker_main then
                return {
                    extra = {
                        xmult = card.ability.extra.xmult,
                        xchips = card.ability.extra.xchips,
                        card = card,
                    }
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { card.ability.extra.xmultgain, card.ability.extra.xchipsgain, card.ability.extra.xmult, card.ability.extra.xchips }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_kris57" or v.key == "j_fur_talismankris57" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Sourstone :3
    key = "sourstone3partner",
    name = "Sourstone :3 (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 1, y = 3 },
    atlas = "FurryPartners",
    config = { xmultstate = "Inactive", extra = { currentmoney = 0, xmult = 1.5 }},
    link_config = { j_fur_sourstone3 = 1, j_fur_talismansourstone3 = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if link_level ~= 1 then

            if context.before and card.ability.xmultstate ~= "Active" then
                card.ability.extra.currentmoney = card.ability.extra.currentmoney + 2.5
                
                return {
                    extra = {
                        card = card,
                        message = "+$2.5",
                        colour = G.C.MONEY
                    }
                }
            end

            if context.partner_click and card.ability.extra.currentmoney > 0 then
                ease_dollars(card.ability.extra.currentmoney)
                card.ability.extra.currentmoney = 0

                return {
                    extra = {
                        card = card,
                        message = "+$",
                        colour = G.C.MONEY
                    }
                }
            end

            if context.partner_R_click and card.ability.xmultstate == "Inactive" and card.ability.extra.currentmoney >= 2.5 then
                card.ability.extra.currentmoney = card.ability.extra.currentmoney - 2.5
                card.ability.xmultstate = "Active"

                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
            end

            if context.joker_main and card.ability.xmultstate == "Active" then
                card.ability.xmultstate = "Inactive"

                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { card.ability.extra.xmult, card.ability.extra.currentmoney, card.ability.xmultstate }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_sourstone3" or v.key == "j_fur_talismansourstone3" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- MaltNoodlez
    key = "maltnoodlezpartner",
    name = "MaltNoodlez (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 2, y = 3 },
    atlas = "FurryPartners",
    config = { inround = false },
    link_config = { j_fur_maltnoodlez = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        if context.setting_blind then
            card.ability.inround = true
            
            if link_level ~= 1 then
                local jokers = {}
                local debuffedjoker = {}
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

        if (G.GAME.blind or G.GAME.blind.boss) and context.end_of_round then -- From VanillaRemade
            card.ability.inround = false
            local jokers = {}
            local debuffedjoker = {}
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
        elseif card.ability.inround then
            local ret = SMODS.blueprint_effect(card, G.jokers.cards[#G.jokers.cards], context)
            if ret then
                ret.colour = G.C.FILTER
            end
            return ret
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key }
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_maltnoodlez" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Nemzata
    key = "nemzatapartner",
    name = "Nemzata (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 3, y = 3 },
    atlas = "FurryPartners",
    config = { inround = "False", extra = { ammo = 3, coins = 0 }},
    link_config = { j_fur_nemzata = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if context.setting_blind then
            card.ability.extra.ammo = 3
            card.ability.inround = "True"
        end

        if link_level ~= 1 then
            if context.partner_click and card.ability.inround == "True" and card.ability.extra.ammo > 0 then
                card.ability.extra.ammo = card.ability.extra.ammo - 1

                if SMODS.pseudorandom_probability(card, "pnr_fur_nemzata", 1, 5, "pnr_fur_nemzata") then
                    local playingcard = pseudorandom_element(G.hand.cards, pseudoseed('pnr_nemzata'))
                    card.ability.extra.coins = card.ability.extra.coins + 250

                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        playingcard:highlight(true)
                        delay(0.5)
                        attention_text({
                            text = localize("fur_elim"),
                            major = playingcard,
                            backdrop_colour = G.C.MONEY
                        })
                        playingcard:start_dissolve(nil, i == #G.hand.highlighted)
                        return true 
                    end}))
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('whoosh2');
                        return true 
                    end}))
                else
                    local playingcard = pseudorandom_element(G.hand.cards, pseudoseed('pnr_nemzata'))
                    G.E_MANAGER:add_event(Event({ 
                    trigger = 'after', 
                    delay = 0.2,
                    func = function()
                        playingcard:highlight(true)
                        delay(0.5)
                        attention_text({
                            text = localize("k_nope_ex"),
                            major = playingcard,
                            backdrop_colour = G.C.SECONDARY_SET.Tarot
                        })
                        return true 
                    end}))
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        playingcard:highlight(false)
                        play_sound('tarot2', 0.76, 0.4);
                        return true 
                    end}))
                    play_sound('tarot2', 1, 0.4)
                end
            end

            if context.partner_R_click and card.ability.extra.coins > 0 then
                ease_dollars(card.ability.extra.coins / 100)
                card.ability.extra.coins = 0

                return {
                    extra = {
                        card = card,
                        message = "+$",
                        colour = G.C.MONEY
                    }
                }
            end
        end

        if context.end_of_round then
            card.ability.inround = "False"
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 5, "pnr_nemzata")

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { numerator, denominator, card.ability.extra.ammo, card.ability.extra.coins, card.ability.extra.coins / 100 }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_nemzata" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- SchnackiOfficial
    key = "schnackiofficialpartner",
    name = "SchnackiOfficial (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 4, y = 3 },
    atlas = "FurryPartners",
    config = { spawnstate = "Inactive", extra = { xmult = 1.5 }},
    link_config = { j_fur_schnackiofficial = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        if context.setting_blind then
            card.ability.spawnstate = "Active"

            if link_level == 1 then
                return {
                    message = localize("loyalty_active", "v_dictionary"),
                    card = card,
                }
            end
        end

        if context.individual and context.cardarea == G.play then
            local first_spade = nil
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit("Spades") then
                    first_spade = context.scoring_hand[i]
                    break
                end
            end

            if context.other_card == first_spade then
                if link_level == 1 then
                    if card.ability.spawnstate == "Active" then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_world', 'pnr_fur_schnackiofficialpartner')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                            end)
                        }))

                        card.ability.spawnstate = "Inactive"
                        return {
                            extra = {
                                message = localize('k_plus_tarot'),
                                colour = G.C.SECONDARY_SET.Tarot,
                                card = card,
                            }
                        }
                    end
                else
                    return {
                        extra = {
                            xmult = card.ability.extra.xmult,
                            card = card,
                        }
                    }
                end
            end
        end

        if context.end_of_round then
            card.ability.spawnstate = "Inactive"
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
            info_queue[#info_queue + 1] = G.P_CENTERS.c_world
        end
        return { key = key, vars = { card.ability.extra.xmult, card.ability.spawnstate, localize('Spades', 'suits_plural') }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_schnackiofficial" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Danny
    key = "dannypartner",
    name = "Danny (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 5, y = 3 },
    atlas = "FurryPartners",
    config = { extra = { xmult = 1, xmultgain = 0.05 }},
    link_config = { j_fur_danny = 1, j_fur_talismandanny = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        local playingcard = context.other_card

        if link_level ~= 1 then
            if context.hand_drawn then
                for i = 1, #G.playing_cards do
                    if not (G.playing_cards[i]:is_suit("fur_stars") or G.playing_cards[i]:is_suit("six_Stars")) then
                        G.playing_cards[i]:set_debuff(true)
                    end
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
                local first_card = nil
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[1] then
                        first_card = context.scoring_hand[i]
                        break
                    end
                end

                if context.other_card == first_card then
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
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { card.ability.extra.xmultgain, card.ability.extra.xmult, localize('fur_stars', 'suits_singular') }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_danny" or v.key == "j_fur_talismandanny" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Diablo
    key = "diablo2324partner",
    name = "Diablo2324 (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 0, y = 4 },
    atlas = "FurryPartners",
    config = { extra = { xmult = 1.25 }},
    link_config = { j_fur_diablo2324 = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        
        if link_level ~= 1 then
            if context.other_joker and context.other_joker.config.center.rarity == "fur_rarityfurry" and not context.other_joker.debuff then
                return {
                    xmult = card.ability.extra.xmult,
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { card.ability.extra.xmult }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_diablo" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Parrot Dash
    key = "parrotdashpartner",
    name = "Parrot Dash (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 1, y = 4 },
    atlas = "FurryPartners",
    config = { fakeanteincreasetrigger = true, fakerounds = 0, fakeante = 1, extra = { mult = 2 }},
    link_config = { j_fur_parrotdash = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if link_level ~= 1 then
            if context.setting_blind then
                card.ability.fakeanteincreasetrigger = true
                card.ability.fakerounds = card.ability.fakerounds + 1
            end
        
            if context.joker_main then
                if next(SMODS.find_mod("Multiplayer")) then
                    if MP.GAME.lives > 0 then
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
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        if next(SMODS.find_mod("Multiplayer")) then
            if MP.GAME.lives > 0 then
                return { key = key, vars = { card.ability.extra.mult, (card.ability.extra.mult + (card.ability.fakeante * card.ability.fakerounds)), localize("k_ante"), localize("k_round") }}
            else
                return { key = key, vars = { card.ability.extra.mult, (card.ability.extra.mult + (G.GAME.round_resets.ante * G.GAME.round)), localize("k_ante"), localize("k_round") }}
            end
        else
            return { key = key, vars = { card.ability.extra.mult, (card.ability.extra.mult + (G.GAME.round_resets.ante * G.GAME.round)), localize("k_ante"), localize("k_round") }}
        end
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_parrotdash" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Iridia
    key = "iridiapartner",
    name = "Iridia (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 2, y = 4 },
    atlas = "FurryPartners",
    config = { extra = { xchips = 1.75, xmult = 1.75 }},
    link_config = { j_fur_iridia = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()

        if link_level ~= 1 then
            if context.individual and context.cardarea == G.play then
                local first_card = nil
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[1] then
                        first_card = context.scoring_hand[i]
                        break
                    end
                end

                if context.other_card == first_card then
                    return {
                        xchips = card.ability.extra.xchips,
                        xmult = card.ability.extra.xmult
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { card.ability.extra.xchips, card.ability.extra.xmult }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_iridia" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

Partner_API.Partner { -- Lume
    key = "lumepartner",
    name = "Lume (Partner)",
    unlocked = false,
    discovered = true,
    pos = { x = 3, y = 4 },
    atlas = "FurryPartners",
    config = { extra = { xmult = 2 }},
    link_config = { j_fur_lume = 1 },

    calculate = function(self, card, context)
        local link_level = self:get_link_level()
        local playingcard = context.other_card

        if link_level ~= 1 then
            if context.individual and context.cardarea == G.play then
                local first_face = nil
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_face() or SMODS.has_enhancement(context.other_card, 'm_fur_princecard') then
                        first_face = context.scoring_hand[i]
                        break
                    end
                end

                if context.other_card == first_face then
                    if SMODS.has_enhancement(context.other_card, 'm_fur_princecard') then        
                        return {
                            xmult = card.ability.extra.xmult
                        }
                    end

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
    end,

    loc_vars = function(self, info_queue, card)
        local link_level = self:get_link_level()
        local key = self.key

        if link_level == 1 then 
            key = key .. "_alt" 
        end
        return { key = key, vars = { card.ability.extra.xmult }}
    end,

    check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_fur_lume" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

------------------CONSUMABLES---------------------
SMODS.ConsumableType { -- Cookies
    key = "lupocookies",
    loc_txt = {
        name = "Cookies",
        collection = "Cookies",
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase or use",
			    "this card in an",
			    "unseeded run to",
			    "learn what it does",
            },
        },
    },
    primary_colour = G.C.ORANGE,
    secondary_colour = G.C.ORANGE,
    collection_rows = { 6, 2 }
}

SMODS.Consumable { -- Chocolate Chip
    key = 'chocolatechipcookie',
    set = 'lupocookies',
    atlas = 'cookies',
    pos = { x = 0, y = 0 },
    pixel_size = { w = 66, h = 66 },
    cost = 5,
    discovered = true,

    can_use = function(self, card)
        if next(SMODS.find_card("j_fur_luposity")) or next(SMODS.find_card("j_fur_cryptidluposity")) then
            return true
        else
            return false
        end
    end,

    loc_vars = function(self, info_queue, card)
        if Cryptid then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_fur_cryptidluposity
        else
            info_queue[#info_queue + 1] = G.P_CENTERS.j_fur_luposity
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("PartnerAPI", G.C.DARK_EDITION, G.C.WHITE, 1)
    end,

    in_pool = function(self, args)
        if (next(SMODS.find_card("j_fur_luposity")) or next(SMODS.find_card("j_fur_cryptidluposity"))) then
            return true
        else
            return false
        end
    end
}

SMODS.Consumable { -- Butter Cookie
    key = 'buttercookie',
    set = 'lupocookies',
    atlas = 'cookies',
    pos = { x = 1, y = 0 },
    pixel_size = { w = 66, h = 66 },
    config = { extra = { amount = 1 }},
    cost = 5,
    discovered = true,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local increasetargetlist = { "Joker slots", "Consumable slots", "Hand" }
        local increasetargetselection = increasetargetlist[math.random(#increasetargetlist)]

        if increasetargetselection == "Joker slots" then
            G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.amount
            card_eval_status_text(G.jokers, 'extra', nil, nil, nil, { message = "+"..card.ability.extra.amount.." "..localize("fur_jokerslotplus", 'dictionary'), colour = G.C.FILTER })
        elseif increasetargetselection == "Consumable slots" then
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.amount
            card_eval_status_text(G.consumeables, 'extra', nil, nil, nil, { message = "+"..card.ability.extra.amount.." "..localize("fur_consumeableslotplus", 'dictionary'), colour = G.C.SECONDARY_SET.Tarot })
        elseif increasetargetselection == "Hand" then
            G.hand:change_size(card.ability.extra.amount)
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = "+"..card.ability.extra.amount.." "..localize("fur_handsizeplus", 'dictionary'), colour = G.C.DARK_EDITION })
            if G.GAME.blind.chips > 0 then
                SMODS.draw_cards(1)
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("PartnerAPI", G.C.DARK_EDITION, G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.amount }}
    end
}

SMODS.Consumable { -- Double Chocolate Chip Cookie
    key = 'doublechocolatechipcookie',
    set = 'lupocookies',
    atlas = 'cookies',
    pos = { x = 2, y = 0 },
    pixel_size = { w = 66, h = 66 },
    cost = 5,
    discovered = true,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local scoretype = { "Chips", "Mult" }
        local scoretarget = scoretype[math.random(#scoretype)]
        local pokerhandtarget = pseudorandom_element(G.handlist, pseudoseed("c_fur_doublechocolatechipcookie"))

        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {handname = localize(pokerhandtarget, 'poker_hands'), chips = G.GAME.hands[pokerhandtarget].chips, mult = G.GAME.hands[pokerhandtarget].mult, level = G.GAME.hands[pokerhandtarget].level})
        delay(1)
        card:juice_up(1, 0.5)

        if scoretarget == "Chips" then
            update_hand_text({sound = 'xchips', delay = 0.3}, {handname = localize(pokerhandtarget, 'poker_hands'), chips = "X2", mult = G.GAME.hands[pokerhandtarget].mult, level = G.GAME.hands[pokerhandtarget].level})
            G.GAME.hands[pokerhandtarget].chips = G.GAME.hands[pokerhandtarget].chips * 2
            delay(1)
        elseif scoretarget == "Mult" then
            update_hand_text({sound = 'multhit2', delay = 0.3}, {handname = localize(pokerhandtarget, 'poker_hands'), chips = G.GAME.hands[pokerhandtarget].chips, mult = "X2", level = G.GAME.hands[pokerhandtarget].level})
            G.GAME.hands[pokerhandtarget].mult = G.GAME.hands[pokerhandtarget].mult * 2
            delay(1)
        end

        card:juice_up(1, 0.5)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {handname = localize(pokerhandtarget, 'poker_hands'), chips = G.GAME.hands[pokerhandtarget].chips, mult = G.GAME.hands[pokerhandtarget].mult, level = "+1"})
        G.GAME.hands[pokerhandtarget].level = G.GAME.hands[pokerhandtarget].level + 1
        delay(2)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {handname = "", chips = "0", mult = "0", level = ""})
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("PartnerAPI", G.C.DARK_EDITION, G.C.WHITE, 1)
    end
}

SMODS.Consumable { -- Rainbow Chocolate Chip Cookie
    key = 'rainbowchocolatechipcookie',
    set = 'lupocookies',
    atlas = 'cookies',
    pos = { x = 3, y = 0 },
    pixel_size = { w = 66, h = 66 },
    cost = 3,
    discovered = true,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local pokerhandtarget = pseudorandom_element(G.handlist, pseudoseed("c_fur_rainbowchocolatechipcookie"))
        SMODS.smart_level_up_hand(card, pokerhandtarget, false, 1)
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("PartnerAPI", G.C.DARK_EDITION, G.C.WHITE, 1)
    end
}

SMODS.Consumable { -- Sugar Cookie
    key = 'sugarcookie',
    set = 'lupocookies',
    atlas = 'cookies',
    pos = { x = 0, y = 1 },
    pixel_size = { w = 66, h = 66 },
    cost = 3,
    discovered = true,

    can_use = function(self, card)
        if G.GAME.last_hand_played ~= nil then
            return true
        else
            return false
        end
    end,

    use = function(self, card, area, copier)
        SMODS.smart_level_up_hand(card, G.GAME.last_hand_played, false, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.last_hand_played }}
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("PartnerAPI", G.C.DARK_EDITION, G.C.WHITE, 1)
    end
}

SMODS.Consumable { -- Fortune Cookie
    key = 'fortunecookie',
    set = 'lupocookies',
    atlas = 'cookies',
    pos = { x = 1, y = 1 },
    pixel_size = { w = 66, h = 66 },
    cost = 3,
    discovered = true,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'c_fur_fortunecookie')
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
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("PartnerAPI", G.C.DARK_EDITION, G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { localize('k_tarot')}}
    end,
}

SMODS.Consumable { -- Oatmeal Raisin
    key = 'oatmealraisincookie',
    set = 'lupocookies',
    atlas = 'cookies',
    pos = { x = 2, y = 1 },
    pixel_size = { w = 66, h = 66 },
    config = { extra = { amount = 3 }},
    cost = 3,
    discovered = true,

    can_use = function(self, card)
        if Talisman then
            if next(SMODS.find_mod("Multiplayer")) then
                if not MP.is_pvp_boss() and to_number(G.GAME.blind.chips) > 0 then
                    return true
                end
            elseif to_number(G.GAME.blind.chips) > 0 then
                return true
            else
                return false
            end
        else
            if next(SMODS.find_mod("Multiplayer")) then
                if not MP.is_pvp_boss() and G.GAME.blind.chips > 0 then
                    return true
                end
            elseif G.GAME.blind.chips > 0 then
                return true
            else
                return false
            end
        end
    end,

    use = function(self, card, area, copier)
        if Talisman then
            G.GAME.blind.chips = to_number(G.GAME.blind.chips) * 2
        else
            G.GAME.blind.chips = G.GAME.blind.chips * 2
        end
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        SMODS.juice_up_blind()
        play_sound('cancel')

        delay(1)
        G.E_MANAGER:add_event(Event({
            func = (function()
                while card.ability.extra.amount > 0 do -- From Balatro source
                    local it = 1
                    local pool, pool_key = get_current_pool('Tag', nil, nil, append)
                    local tag = pseudorandom_element(pool, pseudoseed(pool_key))
                    while tag == 'UNAVAILABLE' do
                        it = it + 1
                        tag = pseudorandom_element(pool, pseudoseed(pool_key..'_resample'..it))
                    end
                    add_tag(Tag(tag))
                    card.ability.extra.amount = card.ability.extra.amount - 1
                end
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end)
        }))
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.amount }}
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("PartnerAPI", G.C.DARK_EDITION, G.C.WHITE, 1)
    end
}