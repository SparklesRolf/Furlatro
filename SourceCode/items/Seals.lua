local furry_mod = SMODS.current_mod

SMODS.Atlas {
    key = 'furryseals',
    path = 'Seals.png',
    px = 71,
    py = 95
}

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
    config = { extra = { xmult = 1.5, xchips = 1.5, money = 1, bonushands = 1, odds1 = 5, odds2 = 10 }},

    calculate = function(self, card, context)
        if self.debuff then return nil end
        if context.main_scoring and context.cardarea == G.play then
            if pseudorandom("pawseal") < G.GAME.probabilities.normal/self.config.extra.odds1 then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 2
                G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                        local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'pawseal')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        G.GAME.consumeable_buffer = 1
                    return {message = '+1 Tarot', colour = G.C.SECONDARY_SET.Tarot, card = self, true}
                end)}))
            end
            if pseudorandom("pawseal") < G.GAME.probabilities.normal/self.config.extra.odds2 then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 2
                G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                        local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'pawseal')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        G.GAME.consumeable_buffer = 1
                    return {message = '+1 Spectral', colour = G.C.SECONDARY_SET.Spectral, card = self, true}
                end)}))
            end

            return {
                xmult = self.config.extra.xmult,
                xchips = self.config.extra.xchips,
                ease_dollars(self.config.extra.money),
                ease_hands_played(self.config.extra.bonushands)
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.xmult, self.config.extra.xchips, self.config.extra.money, self.config.extra.bonushands, 
            self.config.extra.odds1, self.config.extra.odds2, G.GAME.probabilities.normal, localize('tarot', 'labels'), localize('k_spectral'),
            localize('k_hud_hands')
        }}
    end
}