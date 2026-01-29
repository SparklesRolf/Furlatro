local furry_mod = SMODS.current_mod

SMODS.Seal { -- Red Paw Seal
    key = 'redpawseal',
    atlas = 'furryseals',
    pos = { x = 0, y = 0 },
    badge_colour = HEX('FF4C40'),
    sound = { sound = 'gold_seal' },
    config = { extra = { xmult = 1.5 }},

    calculate = function(self, card, context)
        if self.debuff then return nil end
        if context.main_scoring and context.cardarea == G.play then

            return {
                xmult = self.config.extra.xmult
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.xmult }}
    end
}

SMODS.Seal { -- Blue Paw Seal
    key = 'bluepawseal',
    atlas = 'furryseals',
    pos = { x = 1, y = 0 },
    badge_colour = HEX('0093FF'),
    sound = { sound = 'gold_seal' },
    config = { extra = { xchips = 1.5 }},

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                xchips = self.config.extra.xchips
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.xchips }}
    end
}

SMODS.Seal { -- Orange Paw Seal
    key = 'orangepawseal',
    atlas = 'furryseals',
    pos = { x = 2, y = 0 },
    badge_colour = HEX('FF884C'),
    sound = { sound = 'gold_seal' },
    config = { extra = { xmult = 1.5, xchips = 1.5, money = 3, odds1 = 5, odds2 = 10 }},

    calculate = function(self, card, context)
        if self.debuff then return nil end
        if context.main_scoring and context.cardarea == G.play then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if SMODS.pseudorandom_probability(card, "fur_orangepawseal_seal", 1, 5, "fur_orangeseal") then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 2
                    G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'pawseal')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 1
                        return {message = localize('k_plus_tarot'), colour = G.C.SECONDARY_SET.Tarot, card = self, true}
                    end)}))
                end
                if SMODS.pseudorandom_probability(card, "fur_orangepawseal_seal", 1, 10, "fur_orangeseal") then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 2
                    G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'pawseal')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 1
                        return {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral, card = self, true}
                    end)}))
                end
            end

            return {
                xmult = self.config.extra.xmult,
                xchips = self.config.extra.xchips,
                ease_dollars(self.config.extra.money),
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 5, "fur_orangeseal")
        local numerator2, denominator2 = SMODS.get_probability_vars(card, 1, 10, "fur_orangeseal")
        return { vars = { self.config.extra.xmult, self.config.extra.xchips, self.config.extra.money,
            denominator, denominator2, numerator, numerator2, localize('tarot', 'labels'), localize('k_spectral')
        }}
    end
}