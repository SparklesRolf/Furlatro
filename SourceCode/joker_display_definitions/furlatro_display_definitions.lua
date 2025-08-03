local jd_def = JokerDisplay.Definitions

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
        local mult = 0
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
        
        card.joker_display_values.ghostcards = ghostcards * card.ability.extra.mult
        card.joker_display_values.mult = mult + card.joker_display_values.ghostcards
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
        card.joker_display_values.count = count
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
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        
                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            ghostcards = ghostcards - 1
                        end
                    end
                end
            end
        end
        card.joker_display_values.count = count + ghostcards
        card.joker_display_values.localized_text = localize("fur_stars", 'suits_plural')
        if Cryptid then
            if card.ability.cry_rigged then
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { card.ability.extra.odds, card.ability.extra.odds } }
            else
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
            end
        else
            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
        end
    end
}

jd_def["j_fur_kalik"] = { -- KalikHusky
    text = {
        {
            border_nodes = {
                { text = "+X" },
                { ref_table = "card.joker_display_values", ref_value = "gain" }
            }
        },
        { text = " -> ", scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xmult" }
            }
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
                    if scoring_card.config.center.key == "m_fur_stinkcard" then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
        end
        card.joker_display_values.count = count
        card.joker_display_values.gain = card.ability.extra.gain * count
        card.joker_display_values.localized_text = localize("fur_stinkycard")
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

        card.joker_display_values.count = count + ghostcards
        card.joker_display_values.localized_text = localize("Spades", 'suits_plural')
        if Cryptid then
            if card.ability.cry_rigged then
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { card.ability.extra.odds, card.ability.extra.odds } }
            else
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
            end
        else
            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
        end
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

jd_def["j_fur_ghost"] = { -- GhostFox
    text = {
        {
            border_nodes = {
                { text = "+X" },
                { ref_table = "card.joker_display_values", ref_value = "gain" }
            }
        },
        { text = " -> ", scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xmult" }
            }
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
                        count = count + 1
                    end
                end
            end
        end
        card.joker_display_values.count = count
        card.joker_display_values.gain = card.ability.extra.gain * count
        card.joker_display_values.localized_text = localize("fur_ghostcard")
    end
}

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
            }
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
            }
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
            }
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

jd_def["j_fur_curiousangel"] = { -- CuriousAngel
    text = {
        {
            border_nodes = {
                { text = "+X" },
                { ref_table = "card.joker_display_values", ref_value = "gain" }
            }
        },
        { text = " -> ", scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xmult" }
            }
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

        if Cryptid then
            if card.ability.cry_rigged then
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { card.ability.extra.odds, card.ability.extra.odds } }
            else
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
            end
        else
            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
        end
    end
}

jd_def["j_fur_skips"] = { -- DelusionalSkips
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
        if G.GAME.blind.boss then
            if Cryptid then
                if card.ability.cry_rigged then
                    card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { card.ability.extra.bossodds, card.ability.extra.odds } }
                elseif G.GAME.probabilities.normal > card.ability.extra.bossodds then
                    card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { card.ability.extra.bossodds, card.ability.extra.odds } }
                else
                    card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
                end
            else
                if G.GAME.probabilities.normal > card.ability.extra.bossodds then
                    card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { card.ability.extra.bossodds, card.ability.extra.odds } }
                else
                    card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
                end
            end
        else
            if Cryptid then
                if card.ability.cry_rigged then
                    card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { card.ability.extra.odds, card.ability.extra.odds } }
                else
                    card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
                end
            else
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
            end
        end
        card.joker_display_values.localized_text = localize("fur_skipstext")
    end
}

jd_def["j_fur_illy"] = { -- illyADo
    text = {
        {
            border_nodes = {
                { text = "+X" },
                { ref_table = "card.joker_display_values", ref_value = "gain" }
            }
        },
        { text = " -> ", scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xmult" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" }
    },

    calc_function = function(card)
        local count = 0
        local ghostcards = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        for _, playing_card in ipairs(G.hand.cards) do
            if playing_hand or not playing_card.highlighted then
                if not (playing_card.facing == 'back') and not playing_card.debuff and playing_card:get_id() and playing_card:get_id() == 13 then
                    count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                end
            end
        end

        for _, scoring_card in pairs(G.hand.highlighted) do
            if scoring_card.config.center.key == "m_fur_ghostcard" then
                if scoring_card:get_id() == 13 then
                    ghostcards = ghostcards + 1
                end
            end
        end

        if G.play then
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:get_id() == 13 then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)

                        if scoring_card.config.center.key == "m_fur_ghostcard" then
                            ghostcards = ghostcards - 1
                        end
                    end
                end
            end
        end

        card.joker_display_values.count = count
        card.joker_display_values.gain = card.ability.extra.gain * (count + ghostcards)
        card.joker_display_values.localized_text = localize("King", 'ranks')
    end
}

jd_def["j_fur_cryptidluposity"] = { -- Luposity (Cryptid)
    text = {
        {
            border_nodes = {
                { text = "+X" },
                { ref_table = "card.ability.extra", ref_value = "gain" }
            }
        },
        { text = " -> "},
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xmult" }
            }
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

jd_def["j_fur_luposity"] = { -- Luposity
    text = {
        {
            border_nodes = {
                { text = "+X" },
                { ref_table = "card.ability.extra", ref_value = "gain" }
            }
        },
        { text = " -> "},
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xmult" }
            }
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

jd_def["j_fur_soks"] = { -- SoksAtArt
    text = {
        { text = "+", colour = G.C.BLUE },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult", colour = G.C.BLUE },
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
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
        else
            count = 3
        end
        card.joker_display_values.count = count
        card.joker_display_values.localized_text = localize("fur_sockcard")
        card.joker_display_values.localized_text2 = localize("k_hud_hands")
    end
}