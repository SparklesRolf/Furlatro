local jd_def = JokerDisplay.Definitions
local config = SMODS.current_mod.config

jd_def["j_fur_enviousjoker"] = { -- Envious Joker
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = HEX("FD65FF") },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        local ghostcards = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        for _, scoring_card in pairs(G.hand.highlighted) do
            if scoring_card.config.center.key == "m_fur_ghostcard" then
                if scoring_card:is_suit("fur_stars") then
                    ghostcards = ghostcards + 1
                end
            end
        end

        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:is_suit("fur_stars") then
                    count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        
                    if scoring_card.config.center.key == "m_fur_ghostcard" then
                        ghostcards = ghostcards - 1
                    end
                end
            end
        end
        
        card.joker_display_values.mult = (count + ghostcards) * card.ability.extra.mult
        card.joker_display_values.localized_text = localize("fur_stars", 'suits_plural')
    end
}

jd_def["j_fur_anxiousjoker"] = { -- Anxious Joker
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" }
    },

    calc_function = function(card)
        local mult = 0
        local _, poker_hands, _ = JokerDisplay.evaluate_hand()
        if G.play then
            if poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
                mult = card.ability.extra.mult
            end
        end
        card.joker_display_values.mult = mult
        card.joker_display_values.localized_text = localize("fur_spectrum", 'poker_hands')
    end
}

jd_def["j_fur_trickyjoker"] = { -- Tricky Joker
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.CHIPS },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" }
    },

    calc_function = function(card)
        local chips = 0
        local _, poker_hands, _ = JokerDisplay.evaluate_hand()
        if poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
            chips = card.ability.extra.chips
        end
        card.joker_display_values.chips = chips
        card.joker_display_values.localized_text = localize("fur_spectrum", 'poker_hands')
    end
}

jd_def["j_fur_therainbow"] = { -- The Rainbow
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" }
    },

    calc_function = function(card)
        local xmult = 1
        local _, poker_hands, _ = JokerDisplay.evaluate_hand()
        if poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
            xmult = card.ability.extra.xmult
        end
        card.joker_display_values.xmult = xmult
        card.joker_display_values.localized_text = localize("fur_spectrum", 'poker_hands')
    end
}

jd_def["j_fur_silver"] = { -- SilverSentinel
    text = {
        { text = "+", scale = 0.35, colour = G.C.GOLD },
        { text = "$", colour = G.C.GOLD },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult", colour = G.C.GOLD },
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card.config.center.key == "m_fur_silvercard" then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
        else
            count = 3
        end
        card.joker_display_values.count = count * card.ability.extra.money
        card.joker_display_values.localized_text = localize("fur_silvercard")
    end
}

jd_def["j_fur_astral"] = { -- AstralWarden
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.SECONDARY_SET.Spectral },
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = HEX("FD65FF") },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        local ghostcards = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 10, "fur_astral")
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(G.hand.highlighted) do
                if scoring_card.config.center.key == "m_fur_ghostcard" then
                    if scoring_card:is_suit("fur_stars") then
                        ghostcards = ghostcards + 1
                    end
                end
            end

            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit("fur_stars") then
                        if next(SMODS.find_mod("partner")) then
                            if G.GAME.selected_partner == "pnr_fur_astralpartner" then
                                count = count + (JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand) * 2)
                            else
                                count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand) 
                            end
                        else
                            count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        end
                        
                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            ghostcards = ghostcards - 1
                        end
                    end
                end
            end
        end

        card.joker_display_values.count = count + ghostcards
        card.joker_display_values.localized_text = localize("fur_stars", 'suits_plural')
        card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator } }
    end
}

jd_def["j_fur_kalik"] = { -- KalikHusky
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult" }
            },
            border_colour = G.C.MULT
        },  
    },


    calc_function = function(card)
        local stinkycards = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_fur_stinkcard') then 
                    stinkycards = stinkycards + 1 
                end
            end
        end

        card.joker_display_values.xmult = card.ability.extra.xmult + (card.ability.extra.gain * stinkycards)
    end
}

jd_def["j_fur_saph"] = { -- SaphielleFox
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.SECONDARY_SET.Tarot },
    extra = {
        {
            
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.SUITS.Spades },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        local ghostcards = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 5, "fur_saph")
        for _, scoring_card in pairs(G.hand.highlighted) do
            if scoring_card.config.center.key == "m_fur_ghostcard" then
                if scoring_card:is_suit("Spades") then
                    ghostcards = ghostcards + 1
                end
            end
        end
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:is_suit("Spades") then
                    if next(SMODS.find_mod("partner")) then
                        if G.GAME.selected_partner == "pnr_fur_saphpartner" then
                            count = count + (JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand) * 2)
                        else
                            count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        end
                    else
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                        
                    if scoring_card.config.center.key == "m_fur_ghostcard" then
                        ghostcards = ghostcards - 1
                    end
                end
            end
        end

        card.joker_display_values.count = count + ghostcards
        card.joker_display_values.localized_text = localize("Spades", 'suits_plural')
        card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator } }
    end
}

jd_def["j_fur_cobalt"] = { -- CobaltTheBluPanda
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xchips" }
            },
            border_colour = G.C.CHIPS
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.SUITS.Clubs },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        local ghostcards = 0
        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            for _, scoring_card in pairs(G.hand.highlighted) do
                if scoring_card.config.center.key == "m_fur_ghostcard" then
                    if scoring_card:is_suit("Clubs") then
                        ghostcards = ghostcards + 1
                    end
                end
            end

            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit("Clubs") then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        
                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            ghostcards = ghostcards - 1
                        end
                    end
                end
            end
        else
            count = 3
        end

        card.joker_display_values.count = count + ghostcards
        card.joker_display_values.xchips = card.ability.extra.xchips ^ (count + ghostcards)
        card.joker_display_values.localized_text = localize("Clubs", 'suits_plural')
    end
}

if config.jokerdisplay_scaling then -- GhostFox
    jd_def["j_fur_ghost"] = {
        text = {
            {
                border_nodes = {
                    { text = "+X" },
                    { ref_table = "card.joker_display_values", ref_value = "gain" }
                },
                border_colour = G.C.MULT
            },
            { text = " -> ", scale = 0.35 },
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                },
                border_colour = G.C.MULT
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" }
        },
    
        calc_function = function(card)
            local count = 0
            if G.play then
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(G.hand.highlighted) do
                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        end
                    end
                end
            end
            card.joker_display_values.gain = count * card.ability.extra.gain
            card.joker_display_values.count = count
            card.joker_display_values.localized_text = localize("fur_ghostcard")
        end
    }
else
    jd_def["j_fur_ghost"] = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                },
                border_colour = G.C.MULT
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" }
        },

        calc_function = function(card)
            local count = 0
            if G.play then
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(G.hand.highlighted) do
                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        end
                    end
                end
            end
            card.joker_display_values.count = count
            card.joker_display_values.localized_text = localize("fur_ghostcard")
        end
    }
end

jd_def["j_fur_icesea"] = { -- IceSea
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xchips" }
            },
            border_colour = G.C.CHIPS
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card.config.center.key == "m_bonus" then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
        end
        card.joker_display_values.count = count
        card.joker_display_values.xchips = card.ability.extra.xchips ^ count
        card.joker_display_values.localized_text = localize("fur_bonuscard")
    end
}

jd_def["j_fur_sparkles"] = { -- SparklesRolf
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult" }
            },
            border_colour = G.C.MULT
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = HEX("FD65FF") },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        local ghostcards = 0
        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            for _, scoring_card in pairs(G.hand.highlighted) do
                if scoring_card.config.center.key == "m_fur_ghostcard" then
                    if scoring_card:is_suit("fur_stars") then
                        ghostcards = ghostcards + 1
                    end
                end
            end

            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit("fur_stars") then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        
                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            ghostcards = ghostcards - 1
                        end
                    end
                end
            end
        else
            count = 3
        end
        card.joker_display_values.count = count + ghostcards
        card.joker_display_values.xmult = card.ability.extra.xmult ^ (count + ghostcards)
        card.joker_display_values.localized_text = localize("fur_stars", 'suits_plural')
    end
}

jd_def["j_fur_spark"] = { -- SparkTheBird
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmulttotal" }
            },
            border_colour = G.C.MULT
        },
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.SUITS.Diamonds },
        { text = ", " },
        { ref_table = "card.joker_display_values", ref_value = "localized_text2", colour = G.C.ORANGE },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        local count2 = 0
        local ghostcards = 0
        local ghostcards2 = 0
        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            for _, scoring_card in pairs(G.hand.highlighted) do
                if scoring_card.config.center.key == "m_fur_ghostcard" then
                    if scoring_card:is_suit("Diamonds") and scoring_card:get_id() == 2 then
                        ghostcards2 = ghostcards2 + 1
                    end

                    if scoring_card:is_suit("Diamonds") or scoring_card:get_id() == 2 then
                        ghostcards = ghostcards + 1
                    end
                end
            end

            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit("Diamonds") and scoring_card:get_id() == 2 then
                        count2 = count2 + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        count = count - 1

                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            ghostcards2 = ghostcards2 - 1
                        end
                    end

                    if scoring_card:is_suit("Diamonds") or scoring_card:get_id() == 2 then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        
                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            ghostcards = ghostcards - 1
                        end
                    end
                end
            end
        end
        card.joker_display_values.count = count
        card.joker_display_values.count2 = count2
        card.joker_display_values.xmult = card.ability.extra.xmult ^ (count + ghostcards)
        card.joker_display_values.xmult2 = card.ability.extra.xmult2 ^ (count2 + ghostcards2)
        card.joker_display_values.xmulttotal = card.joker_display_values.xmult * card.joker_display_values.xmult2
        card.joker_display_values.localized_text = localize("Diamonds", 'suits_plural')
        card.joker_display_values.localized_text2 = localize("2", 'ranks')
    end
}

jd_def["j_fur_koneko"] = { -- The_Koneko
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult" }
            },
            border_colour = G.C.MULT
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.SUITS.Hearts },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        local ghostcards = 0
        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            for _, scoring_card in pairs(G.hand.highlighted) do
                if scoring_card.config.center.key == "m_fur_ghostcard" then
                    if scoring_card:is_suit("Hearts") then
                        ghostcards = ghostcards + 1
                    end
                end
            end

            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit("Hearts") then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        
                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            ghostcards = ghostcards - 1
                        end
                    end
                end
            end
        else
            count = 3
        end
        card.joker_display_values.xmult = card.ability.extra.xmult ^ (count + ghostcards)
        card.joker_display_values.localized_text = localize("Hearts", 'suits_plural')
    end
}

if config.jokerdisplay_scaling then -- CuriousAngel
    jd_def["j_fur_curiousangel"] = {
        text = {
            {
                border_nodes = {
                    { text = "+X" },
                    { ref_table = "card.joker_display_values", ref_value = "gain" }
                },
                border_colour = G.C.MULT
            },
            { text = " -> ", scale = 0.35 },
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                },
                border_colour = G.C.MULT
            }
        },
        extra = {
            {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "odds" },
                { text = ")" },
            }
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
            { text = ")" }
        },

        calc_function = function(card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, 15, "fur_curiousangel")
            local count = 0
            local ghostcards = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            for _, scoring_card in pairs(G.hand.highlighted) do
                if scoring_card.config.center.key == "m_fur_ghostcard" then
                    if (scoring_card.edition and scoring_card.edition.negative) then
                        ghostcards = ghostcards + 1
                    end
                end
            end
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if (scoring_card.edition and scoring_card.edition.negative) then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)

                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            ghostcards = ghostcards - 1
                        end
                    end
                end
            end

            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator } }
            card.joker_display_values.gain = card.ability.extra.gain * (count + ghostcards)
            card.joker_display_values.localized_text = localize("negative", 'labels')
        end
    }
else
    jd_def["j_fur_curiousangel"] = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                },
                border_colour = G.C.MULT
            }
        },
        extra = {
            {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "odds" },
                { text = ")" },
            }
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
            { text = ")" }
        },

        calc_function = function(card)
            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator } }
            card.joker_display_values.gain = card.ability.extra.gain * (count + ghostcards)
            card.joker_display_values.localized_text = localize("negative", 'labels')
        end
    }
end

if next(SMODS.find_mod("Multiplayer")) then -- DelusionalSkips
    jd_def["j_fur_multiplayerskips"] = {
        text = {
            { text = "(", colour = G.C.GREEN },
            { ref_table = "card.joker_display_values", ref_value = "odds", colour = G.C.GREEN },
            { text = ")", colour = G.C.GREEN },
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" }
        },

        calc_function = function(card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, 15, "fur_skips")

            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator }}
            card.joker_display_values.localized_text = localize("fur_skipstext")
        end
    }
else
    jd_def["j_fur_skips"] = {
        text = {
            { text = "(", colour = G.C.GREEN },
            { ref_table = "card.joker_display_values", ref_value = "odds", colour = G.C.GREEN },
            { text = ")", colour = G.C.GREEN },
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" }
        },

        calc_function = function(card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, 15, "fur_skips")

            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator }}
            card.joker_display_values.localized_text = localize("fur_skipstext")
        end
    }
end

if config.jokerdisplay_scaling then -- illyADo
    jd_def["j_fur_illy"] = {
        text = {
            {
                border_nodes = {
                    { text = "+X" },
                    { ref_table = "card.joker_display_values", ref_value = "gain" }
                },
                border_colour = G.C.MULT
            },
            { text = " -> ", scale = 0.35 },
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                },
                border_colour = G.C.MULT
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" }
        },

        calc_function = function(card)
            local count = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            for _, playing_card in ipairs(G.hand.cards) do
                if playing_hand or not playing_card.highlighted then
                    if not (playing_card.facing == 'back') and not playing_card.debuff and playing_card:get_id() and playing_card:get_id() == 13 then
                        count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                    end
                end
            end

            if G.play then
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card:get_id() == 13 then
                            count = count + 1
                        end
                    end
                end
            end

            card.joker_display_values.count = count
            card.joker_display_values.gain = card.ability.extra.gain * count
            card.joker_display_values.localized_text = localize("King", 'ranks')
        end
    }  
else
    jd_def["j_fur_illy"] = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                },
                border_colour = G.C.MULT
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" }
        },

        calc_function = function(card)
            card.joker_display_values.localized_text = localize("King", 'ranks')
        end
    }
end

if config.jokerdisplay_scaling then -- Luposity
    if Cryptid then
        jd_def["j_fur_cryptidluposity"] = { 
            text = {
                {
                    border_nodes = {
                        { text = "+X" },
                        { ref_table = "card.ability.extra", ref_value = "gain" }
                    },
                    border_colour = G.C.MULT
                },
                { text = " -> ", scale = 0.35 },
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },
        
            calc_function = function(card)
                card.joker_display_values.localized_text = localize("fur_codeused")
            end
        }
    else
        jd_def["j_fur_luposity"] = {
            text = {
                {
                    border_nodes = {
                        { text = "+X" },
                        { ref_table = "card.ability.extra", ref_value = "gain" }
                    },
                    border_colour = G.C.MULT
                },
                { text = " -> ", scale = 0.35 },
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("fur_consumableused")
            end
        }   
    end
else
    if Cryptid then
        jd_def["j_fur_cryptidluposity"] = {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("fur_codeused")
            end
        }
    else
        jd_def["j_fur_luposity"] = {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("fur_consumableused")
            end
        }
    end
end

jd_def["j_fur_soks"] = { -- SoksAtArt
    text = {
        { text = "+", colour = G.C.BLUE },
        { ref_table = "card.joker_display_values", ref_value = "total", retrigger_type = "mult", colour = G.C.BLUE },
        { text = " " },
        { ref_table = "card.joker_display_values", ref_value = "localized_text2" },
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card.config.center.key == "m_fur_sockcard" then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
        else
            count = 3
        end
        card.joker_display_values.total = count * card.ability.extra.bonus_hands
        card.joker_display_values.localized_text = localize("fur_sockcard")
        card.joker_display_values.localized_text2 = localize("k_hud_hands")
    end
}

if Talisman then -- SephiraPaws
    if config.jokerdisplay_scaling then
        jd_def["j_fur_talismansephirapaws"] = {
            text = {
                {
                    border_nodes = {
                        { text = "+^" },
                        { ref_table = "card.joker_display_values", ref_value = "upgradeamount" }
                    },
                    border_colour = G.C.DARK_EDITION
                },
                { text = " -> ", scale = 0.35 },
                {
                    border_nodes = {
                        { text = "^" },
                        { ref_table = "card.ability.extra", ref_value = "emult" }
                    },
                    border_colour = G.C.DARK_EDITION
                },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.ability", ref_value = "discardstate", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                if card.ability.discardstate == "Active" then
                    card.joker_display_values.upgradeamount = card.ability.extra.emultgain
                else
                    card.joker_display_values.upgradeamount = 0
                end
            end
        }
    else
        jd_def["j_fur_talismansephirapaws"] = {
            text = {
                {
                    border_nodes = {
                        { text = "^" },
                        { ref_table = "card.ability.extra", ref_value = "emult" }
                    },
                    border_colour = G.C.DARK_EDITION
                },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.ability", ref_value = "discardstate", colour = G.C.ORANGE },
                { text = ")" }
            },
        }
    end
else
    jd_def["j_fur_sephirapaws"] = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "xmult" }
                },
                border_colour = G.C.MULT
            }
        },
    
        calc_function = function(card)
            local playingcardcount = 0
        
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    playingcardcount = playingcardcount + 1
                end
            end
        
            card.joker_display_values.xmult = card.ability.extra.xmult + (card.ability.extra.gain * playingcardcount) 
        end
    }
end

if Talisman then -- Joseeeeee
    jd_def["j_fur_talismanxavierorjose"] = {
        text = {
            { text = "+$", colour = G.C.MONEY },
            { ref_table = "card.joker_display_values", ref_value = "money", colour = G.C.MONEY },
        },
        reminder_text = {
            { text = "(", colour = G.C.UI.TEXT_INACTIVE },
            { ref_table = "card.joker_display_values", ref_value = "currentmoney", colour = G.C.MONEY },
            { text = " x ", colour = G.C.UI.TEXT_INACTIVE },
            { ref_table = "card.ability.extra", ref_value = "xmoney", colour = G.C.MONEY },
            { text = ")", colour = G.C.UI.TEXT_INACTIVE },
        },

        calc_function = function(card)
            local currentmoney = to_number(G.GAME.dollars)
            card.joker_display_values.currentmoney = currentmoney
            card.joker_display_values.money = currentmoney * card.ability.extra.xmoney
        end
    }
else
    jd_def["j_fur_xavierorjose"] = {
        text = {
            { text = "+$", colour = G.C.MONEY },
            { ref_table = "card.ability.extra", ref_value = "money", colour = G.C.MONEY },
        },
    }
end

if config.jokerdisplay_scaling then -- FoxxlyDuskFur
    jd_def["j_fur_foxxlyduskfur"] = {
        text = {
            {
                border_nodes = {
                    { text = "+X" },
                    { ref_table = "card.ability.extra", ref_value = "gain" }
                },
                border_colour = G.C.MULT
            },
            { text = " -> ", scale = 0.35 },
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                },
                border_colour = G.C.MULT
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" }
        },

        calc_function = function(card)
            card.joker_display_values.localized_text = localize("fur_shopbuyreroll", "dictionary")
        end
    }
else
    jd_def["j_fur_foxxlyduskfur"] = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                },
                border_colour = G.C.MULT
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" }
        },

        calc_function = function(card)
            card.joker_display_values.localized_text = localize("fur_shopbuyreroll", "dictionary")
        end
    }
end

if Talisman then -- Corrupt CuriousAngel
    if config.jokerdisplay_scaling then
        jd_def["j_fur_talismancorruptcuriousangel"] = {
            text = {
                {
                    border_nodes = {
                        { text = "+^" },
                        { ref_table = "card.joker_display_values", ref_value = "gain" }
                    },
                    border_colour = G.C.DARK_EDITION
                },
                { text = " -> ", scale = 0.35 },
                {
                    border_nodes = {
                        { text = "^" },
                        { ref_table = "card.ability.extra", ref_value = "emult" }
                    },
                    border_colour = G.C.DARK_EDITION
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
                { text = ")" }
            },

            calc_function = function(card)
                local count = 0
                local ghostcards = 0
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                for _, scoring_card in pairs(G.hand.highlighted) do
                    if scoring_card.config.center.key == "m_fur_ghostcard" then
                        if (scoring_card.edition and scoring_card.edition.negative) then
                            ghostcards = ghostcards + 1
                        end
                    end
                end

                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if (scoring_card.edition and scoring_card.edition.negative) then
                            count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        
                            if scoring_card.config.center.key == "m_fur_ghostcard" then
                                ghostcards = ghostcards - 1
                            end
                        end
                    end
                end
                card.joker_display_values.gain = card.ability.extra.gain * (count + ghostcards)
                card.joker_display_values.localized_text = localize("negative", 'labels')
            end
        }
    else
        jd_def["j_fur_talismancorruptcuriousangel"] = {
            text = {
                {
                    border_nodes = {
                        { text = "^" },
                        { ref_table = "card.ability.extra", ref_value = "emult" }
                    },
                    border_colour = G.C.DARK_EDITION
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("negative", 'labels')
            end
        }
    end
else
    if config.jokerdisplay_scaling then
        jd_def["j_fur_corruptcuriousangel"] = {
            text = {
                {
                    border_nodes = {
                        { text = "+X" },
                        { ref_table = "card.joker_display_values", ref_value = "gain" }
                    },
                    border_colour = G.C.MULT
                },
                { text = " -> ", scale = 0.35 },
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
                { text = ")" }
            },

            calc_function = function(card)
                local count = 0
                local ghostcards = 0
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                for _, scoring_card in pairs(G.hand.highlighted) do
                    if scoring_card.config.center.key == "m_fur_ghostcard" then
                        if (scoring_card.edition and scoring_card.edition.negative) then
                            ghostcards = ghostcards + 1
                        end
                    end
                end

                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if (scoring_card.edition and scoring_card.edition.negative) then
                            count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        
                            if scoring_card.config.center.key == "m_fur_ghostcard" then
                                ghostcards = ghostcards - 1
                            end
                        end
                    end
                end

                card.joker_display_values.gain = card.ability.extra.gain * (count + ghostcards)
                card.joker_display_values.localized_text = localize("negative", 'labels')
            end
        }
    else
        jd_def["j_fur_corruptcuriousangel"] = {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("negative", 'labels')
            end
        }
    end
end

if Talisman then -- Corrupt Sparkles
    jd_def["j_fur_talismancorruptsparkles"] = {
        text = {
            {
                border_nodes = {
                    { text = "^" },
                    { ref_table = "card.joker_display_values", ref_value = "emult" }
                },
                border_colour = G.C.DARK_EDITION
            }
        },
        extra = {
            {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "count" },
                { text = " Level(s)" },
            }
        },
        extra_config = { colour = G.C.FILTER, scale = 0.3 },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.SUITS.Hearts },
            { text = ")" }
        },

        calc_function = function(card)
            local count = 0
            local ghostcards = 0
            if G.play then
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                for _, scoring_card in pairs(G.hand.highlighted) do
                    if scoring_card.config.center.key == "m_fur_ghostcard" then
                        if scoring_card:is_suit("Hearts") then
                            ghostcards = ghostcards + 1
                        end
                    end
                end

                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card:is_suit("Hearts") then
                            count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)

                            if scoring_card.config.center.key == "m_fur_ghostcard" then
                                ghostcards = ghostcards - 1
                            end
                        end
                    end
                end
            else
                count = 3
            end

            card.joker_display_values.count = count + ghostcards
            card.joker_display_values.emult = card.ability.extra.emult ^ (count + ghostcards)
            card.joker_display_values.localized_text = localize("Hearts", 'suits_plural')
        end
    }
else
    jd_def["j_fur_corruptsparkles"] = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "xmult" }
                },
                border_colour = G.C.MULT
            }
        },
        extra = {
            {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "count" },
                { text = " Level(s)" },
            }
        },
        extra_config = { colour = G.C.FILTER, scale = 0.3 },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.SUITS.Hearts },
            { text = ")" }
        },
    
        calc_function = function(card)
            local count = 0
            local ghostcards = 0
            if G.play then
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                for _, scoring_card in pairs(G.hand.highlighted) do
                    if scoring_card.config.center.key == "m_fur_ghostcard" then
                        if scoring_card:is_suit("Hearts") then
                            ghostcards = ghostcards + 1
                        end
                    end
                end
            
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card:is_suit("Hearts") then
                            count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                            
                            if scoring_card.config.center.key == "m_fur_ghostcard" then
                                ghostcards = ghostcards - 1
                            end
                        end
                    end
                end
            else
                count = 3
            end
        
            card.joker_display_values.count = count + ghostcards
            card.joker_display_values.xmult = card.ability.extra.xmult ^ (count + ghostcards)
            card.joker_display_values.localized_text = localize("Hearts", 'suits_plural')
        end
    }
end

jd_def["j_fur_diablo2324"] = { -- Diablo 2324
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "total" }
            },
            border_colour = G.C.MULT
        },
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "count", colour = G.C.ORANGE },
        { text = "x" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.rarity == "fur_rarityfurry" then
                count = count + 1
            end
        end

        card.joker_display_values.count = count
        card.joker_display_values.total = card.ability.extra.xmult ^ count
        card.joker_display_values.localized_text = localize("k_fur_rarityfurry")
    end
}

jd_def["j_fur_nemzata"] = { -- Nemzata
    text = {
        { text = "+$", colour = G.C.MONEY },
        { ref_table = "card.ability.extra", ref_value = "money", colour = G.C.MONEY }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" }
    },

    calc_function = function(card)
        card.joker_display_values.localized_text = localize("fur_jdelim")
    end
}

if config.jokerdisplay_scaling then -- Danny
    if Talisman then
        jd_def["j_fur_talismandanny"] = {
            text = {
                {
                    border_nodes = {
                        { text = "+^" },
                        { ref_table = "card.ability.extra", ref_value = "emultgain" }
                    },
                    border_colour = G.C.DARK_EDITION
                },
                { text = " -> ", scale = 0.35 },
                {
                    border_nodes = {
                        { text = "^" },
                        { ref_table = "card.ability.extra", ref_value = "emult" }
                    },
                    border_colour = G.C.DARK_EDITION
                },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("Flush", 'poker_hands')
            end
        }
    else
        jd_def["j_fur_danny"] = {
            text = {
                {
                    border_nodes = {
                        { text = "+X" },
                        { ref_table = "card.ability.extra", ref_value = "xmultgain" }
                    },
                    border_colour = G.C.MULT
                },
                { text = " -> ", scale = 0.35 },
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("Flush", 'poker_hands')
            end
        }
    end
else
    if Talisman then
        jd_def["j_fur_talismandanny"] = {
            text = {
                {
                    border_nodes = {
                        { text = "^" },
                        { ref_table = "card.ability.extra", ref_value = "emult" }
                    },
                    border_colour = G.C.DARK_EDITION
                },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("Flush", 'poker_hands')
            end
        }
    else
        jd_def["j_fur_danny"] = {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("Flush", 'poker_hands')
            end
        }
    end
end

if Talisman then -- Kris_57
    jd_def["j_fur_talismankris57"] = {
        text = {
            {
                border_nodes = {
                    { text = "^" },
                    { ref_table = "card.ability.extra", ref_value = "emult" }
                },
                border_colour = G.C.MULT
            },
            { text = " & ", scale = 0.35 },
            {
                border_nodes = {
                    { text = "^" },
                    { ref_table = "card.ability.extra", ref_value = "echips" }
                },
                border_colour = G.C.CHIPS
            },
        },
        reminder_text = {
            { text = "( " },
            { text = "5", colour = G.C.ORANGE },
            { text = "," },
            { text = "7", colour = G.C.ORANGE },
            { text = " )" },
        },  
    }
else
    jd_def["j_fur_kris57"] = {
        text = {
            {
                border_nodes = {
                    { text = "^" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                },
                border_colour = G.C.MULT
            },
            { text = " & ", scale = 0.35 },
            {
                border_nodes = {
                    { text = "^" },
                    { ref_table = "card.ability.extra", ref_value = "xchips" }
                },
                border_colour = G.C.CHIPS
            },
        },
        reminder_text = {
            { text = "( " },
            { text = "5", colour = G.C.ORANGE },
            { text = "," },
            { text = "7", colour = G.C.ORANGE },
            { text = " )" },
        },  
    }
end

if Talisman then -- Sourstone :3
    jd_def["j_fur_talismansourstone3"] = {
        text = {
            { text = "$", colour = G.C.MONEY },
            { ref_table = "card.joker_display_values", ref_value = "money", colour = G.C.MONEY },
            { text = " "},
            {
                border_nodes = {
                    { text = "^" },
                    { ref_table = "card.joker_display_values", ref_value = "emult"}
                },
                border_colour = G.C.DARK_EDITION
            }
        },

        calc_function = function(card)
            local money = 0
            local emult = 0
            if G.jokers.cards[1] == card then
                money = card.ability.extra.money
                emult = 1
            elseif G.jokers.cards[#G.jokers.cards] == card then
                money = (-1 * card.ability.extra.money)
                emult = card.ability.extra.emult
            else
                money = 0
                emult = 1
            end

            card.joker_display_values.money = money
            card.joker_display_values.emult = emult
        end
    }
else
    jd_def["j_fur_sourstone3"] = {
        text = {
            { text = "$", colour = G.C.MONEY },
            { ref_table = "card.joker_display_values", ref_value = "money", colour = G.C.MONEY },
            { text = " "},
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "xmult"}
                },
                border_colour = G.C.MULT
            }
        },

        calc_function = function(card)
            local money = 0
            local xmult = 0
            if G.jokers.cards[1] == card then
                money = card.ability.extra.money
                xmult = 1
            elseif G.jokers.cards[#G.jokers.cards] == card then
                money = (-1 * card.ability.extra.money)
                xmult = card.ability.extra.xmult
            else
                money = 0
                xmult = 1
            end
            
            card.joker_display_values.money = money
            card.joker_display_values.xmult = xmult
        end
    }
end

if config.jokerdisplay_scaling then -- Danny (Corrupt)
    if Talisman then
        jd_def["j_fur_talismancorruptdanny"] = {
            text = {
                {
                    border_nodes = {
                        { text = "+^" },
                        { ref_table = "card.ability.extra", ref_value = "emultgain" }
                    },
                    border_colour = G.C.DARK_EDITION
                },
                { text = " -> ", scale = 0.35 },
                {
                    border_nodes = {
                        { text = "^" },
                        { ref_table = "card.ability.extra", ref_value = "emult" }
                    },
                    border_colour = G.C.DARK_EDITION
                },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("Flush", 'poker_hands')
            end
        }
    else
        jd_def["j_fur_corruptdanny"] = {
            text = {
                {
                    border_nodes = {
                        { text = "+X" },
                        { ref_table = "card.ability.extra", ref_value = "xmultgain" }
                    },
                    border_colour = G.C.MULT
                },
                { text = " -> ", scale = 0.35 },
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("Flush", 'poker_hands')
            end
        }
    end
else
    if Talisman then
        jd_def["j_fur_talismancorruptdanny"] = {
            text = {
                {
                    border_nodes = {
                        { text = "^" },
                        { ref_table = "card.ability.extra", ref_value = "emult" }
                    },
                    border_colour = G.C.DARK_EDITION
                },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("Flush", 'poker_hands')
            end
        }
    else
        jd_def["j_fur_corruptdanny"] = {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("Flush", 'poker_hands')
            end
        }
    end
end

jd_def["j_fur_maltnoodlez"] = { -- Maltnoodlez
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "blueprint_compat", colour = G.C.RED },
        { text = ")" }
    },
    calc_function = function(card)
        local copied_joker, copied_debuff = JokerDisplay.calculate_blueprint_copy(card)
        card.joker_display_values.blueprint_compat = localize('k_incompatible')
        JokerDisplay.copy_display(card, copied_joker, copied_debuff)
    end,
    get_blueprint_joker = function(card)
        return G.jokers.cards[#G.jokers.cards]
    end
}

if config.jokerdisplay_scaling then -- SephiraPaws (Corrupt)
    if Talisman then
        jd_def["j_fur_talismancorruptsephirapaws"] = {
            text = {
                {
                    border_nodes = {
                        { text = "+^" },
                        { ref_table = "card.joker_display_values", ref_value = "emultgain" }
                    },
                    border_colour = G.C.DARK_EDITION
                },
                { text = " -> ", scale = 0.35 },
                {
                    border_nodes = {
                        { text = "^" },
                        { ref_table = "card.ability.extra", ref_value = "emult" }
                    },
                    border_colour = G.C.DARK_EDITION
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                local selectedhandtype = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                local gain = card.ability.extra.emultgain
                for handname, values in pairs(G.GAME.hands) do
                    if handname == selectedhandtype then
                        if selectedhandtype == "Flush Five" then -- (+^5)
                            gain = (gain * 1) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Flush House" then -- (+^4)
                            gain = (gain * 0.8) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "fur_spectrumfive" or selectedhandtype == "six_Spectrum Five" or selectedhandtype == "spectrum_Spectrum Five" then -- (+^3.5)
                            gain = (gain * 0.7) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Five of a Kind" then -- (+^3)
                            gain = (gain * 0.6) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Straight Flush" then -- (+^2.5)
                            gain = (gain * 0.5) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "fur_spectrumhouse" or selectedhandtype == "six_Spectrum House" or selectedhandtype == "spectrum_Spectrum House" then -- (+^2)
                            gain = (gain * 0.4) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Four of a Kind" then -- (+^1)
                            gain = (gain * 0.2) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "fur_straightspectrum" or selectedhandtype == "six_Straight Spectrum" or selectedhandtype == "spectrum_Straight Spectrum" then -- (+^0.75)
                            gain = (gain * 0.15) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Flush" then -- (+^0.5)
                            gain = (gain * 0.1) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Full House" then -- (+^0.4)
                            gain = (gain * 0.08) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Straight" then -- (+^0.35)
                            gain = (gain * 0.07) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Three of a Kind" then -- (+^0.3)
                            gain = (gain * 0.06) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "fur_spectrum" or selectedhandtype == "six_Spectrum" or selectedhandtype == "spectrum_Spectrum" then -- (+^0.25)
                            gain = (gain * 0.05) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Two Pair" then -- (+^0.1)
                            gain = (gain * 0.02) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Pair" then -- (+^0.05)
                            gain = (gain * 0.01) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "High Card" then -- (+^0.01)
                            gain = (gain * 0.002) * G.GAME.hands[handname].level
                        else -- Other modded hands fallback (+^1 Mult)
                            gain = (gain * 0.2) * G.GAME.hands[handname].level
                        end
                        break
                    end
                end

                card.joker_display_values.emultgain = gain
                card.joker_display_values.localized_text = localize("k_hud_discards")
            end
        }
    else
        jd_def["j_fur_corruptsephirapaws"] = {
            text = {
                {
                    border_nodes = {
                        { text = "+X" },
                        { ref_table = "card.joker_display_values", ref_value = "xmultgain" }
                    },
                    border_colour = G.C.MULT
                },
                { text = " -> ", scale = 0.35 },
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                local selectedhandtype = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                local gain = card.ability.extra.xmultgain
                for handname, values in pairs(G.GAME.hands) do
                    if handname == selectedhandtype then
                        if selectedhandtype == "Flush Five" then -- (+^5)
                            gain = (gain * 1) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Flush House" then -- (+^4)
                            gain = (gain * 0.8) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "fur_spectrumfive" or selectedhandtype == "six_Spectrum Five" or selectedhandtype == "spectrum_Spectrum Five" then -- (+^3.5)
                            gain = (gain * 0.7) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Five of a Kind" then -- (+^3)
                            gain = (gain * 0.6) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Straight Flush" then -- (+^2.5)
                            gain = (gain * 0.5) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "fur_spectrumhouse" or selectedhandtype == "six_Spectrum House" or selectedhandtype == "spectrum_Spectrum House" then -- (+^2)
                            gain = (gain * 0.4) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Four of a Kind" then -- (+^1)
                            gain = (gain * 0.2) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "fur_straightspectrum" or selectedhandtype == "six_Straight Spectrum" or selectedhandtype == "spectrum_Straight Spectrum" then -- (+^0.75)
                            gain = (gain * 0.15) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Flush" then -- (+^0.5)
                            gain = (gain * 0.1) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Full House" then -- (+^0.4)
                            gain = (gain * 0.08) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Straight" then -- (+^0.35)
                            gain = (gain * 0.07) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Three of a Kind" then -- (+^0.3)
                            gain = (gain * 0.06) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "fur_spectrum" or selectedhandtype == "six_Spectrum" or selectedhandtype == "spectrum_Spectrum" then -- (+^0.25)
                            gain = (gain * 0.05) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Two Pair" then -- (+^0.1)
                            gain = (gain * 0.02) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "Pair" then -- (+^0.05)
                            gain = (gain * 0.01) * G.GAME.hands[handname].level
                        elseif selectedhandtype == "High Card" then -- (+^0.01)
                            gain = (gain * 0.002) * G.GAME.hands[handname].level
                        else -- Other modded hands fallback (+^1 Mult)
                            gain = (gain * 0.2) * G.GAME.hands[handname].level
                        end
                        break
                    end
                end

                card.joker_display_values.xmultgain = gain
                card.joker_display_values.localized_text = localize("k_hud_discards")
            end
        }
    end
else
    if Talisman then
        jd_def["j_fur_talismancorruptsephirapaws"] = {
            text = {
                {
                    border_nodes = {
                        { text = "^" },
                        { ref_table = "card.ability.extra", ref_value = "emult" }
                    },
                    border_colour = G.C.DARK_EDITION
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("k_hud_discards")
            end
        }
    else
        jd_def["j_fur_corruptsephirapaws"] = {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    },
                    border_colour = G.C.MULT
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("k_hud_discards")
            end
        }
    end
end

jd_def["j_fur_iridia"] = { -- Kris_57 (OC: Iridia)
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xchips" }
            },
            border_colour = G.C.CHIPS
        },
        { text = " & ", scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult" }
            },
            border_colour = G.C.MULT
        }
    },

    calc_function = function(card)
        local count = 0
        local ghostcards = 0
        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            for _, scoring_card in pairs(G.hand.highlighted) do
                if scoring_card.config.center.key == "m_fur_ghostcard" then
                    ghostcards = ghostcards + 1
                end
            end

            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    
                    if scoring_card.config.center.key == "m_fur_ghostcard" then
                        ghostcards = ghostcards - 1
                    end
                end
            end
        else
            count = 3
        end

        card.joker_display_values.xchips = card.ability.extra.xchips ^ (count + ghostcards)
        card.joker_display_values.xmult = card.ability.extra.xmult ^ (count + ghostcards)
        card.joker_display_values.localized_text = localize("fur_stars", 'suits_plural')
    end
}

jd_def["j_fur_schnackiofficial"] = { -- SchnackiOfficial
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult" }
            },
            border_colour = G.C.MULT
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.SUITS.Spades },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        local ghostcards = 0
        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            for _, scoring_card in pairs(G.hand.highlighted) do
                if scoring_card.config.center.key == "m_fur_ghostcard" then
                    if scoring_card:is_suit("Spades") then
                        ghostcards = ghostcards + 1
                    end
                end
            end

            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit("Spades") then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        
                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            ghostcards = ghostcards - 1
                        end
                    end
                end
            end
        else
            count = 3
        end
        card.joker_display_values.count = count + ghostcards
        card.joker_display_values.xmult = card.ability.extra.xmult ^ (count + ghostcards)
        card.joker_display_values.localized_text = localize("Spades", 'suits_plural')
    end
}

jd_def["j_fur_lume"] = { -- Lume
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xmult" }
            },
            border_colour = G.C.MULT
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0

        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card.config.center.key == "m_fur_princecard" then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
        else
            count = 3
        end
        card.joker_display_values.xmult = card.ability.extra.xmult ^ count
        card.joker_display_values.localized_text = localize("fur_princecard")
    end
}