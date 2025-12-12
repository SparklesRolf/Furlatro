local furry_mod = SMODS.current_mod
local config = furry_mod.config

SMODS.Joker { -- Envious Joker
    key = 'enviousjoker',
    config = { extra = { mult = 3, suit = "fur_stars" }},
    atlas = 'vanillajoker',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,

    calculate = function(self, card, context)
        if self.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('fur_stars') then

                return {
                    mult = card.ability.extra.mult,
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, localize('fur_stars', 'suits_singular')}}
    end
}

if next(SMODS.find_mod("SixSuits")) or next(SMODS.find_mod("Bunco")) or next(SMODS.find_mod("SpectrumFramework")) then
    return
else
    SMODS.Joker { -- Anxious Joker
        key = 'anxiousjoker',
        config = { type = "fur_spectrum", extra = { mult = 10 }},
        atlas = 'vanillajoker',
        pos = { x = 1, y = 0 },
        rarity = 1,
        cost = 5,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        effect = nil,

        calculate = function(self, card, context)
            if self.debuff then return nil end
            if context.joker_main and (next(context.poker_hands['fur_spectrum']) or next(context.poker_hands['fur_straightspectrum'])
                or next(context.poker_hands['fur_spectrumhouse']) or next(context.poker_hands['fur_spectrumfive'])) then
                
                return {
                    mult = card.ability.extra.mult,
                    colour = G.C.MULT
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            return { vars = {card.ability.extra.mult, localize('fur_spectrum', 'poker_hands')}}
        end,
        
        in_pool = function(self, args)
            if config.poker_hands then
                return true
            else
                return false
            end
        end
    }

    SMODS.Joker { -- Tricky Joker
        key = 'trickyjoker',
        config = { type = "fur_spectrum", extra = { chips = 80 }},
        atlas = 'vanillajoker',
        pos = { x = 2, y = 0 },
        rarity = 1,
        cost = 5,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        effect = nil,

        calculate = function(self, card, context)
            if self.debuff then return nil end
            if context.joker_main and (next(context.poker_hands['fur_spectrum']) or next(context.poker_hands['fur_straightspectrum'])
                or next(context.poker_hands['fur_spectrumhouse']) or next(context.poker_hands['fur_spectrumfive'])) then
                
                return {
                    chips = card.ability.extra.chips,
                    colour = G.C.MULT
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            return { vars = {card.ability.extra.chips, localize('fur_spectrum', 'poker_hands')}}
        end,
        
        in_pool = function(self, args)
            if config.poker_hands then
                return true
            else
                return false
            end
        end
    }

    SMODS.Joker { -- The Rainbow
        key = 'therainbow',
        config = { type = "fur_spectrum", extra = { xmult = 1.5 }},
        atlas = 'vanillajoker',
        pos = { x = 3, y = 0 },
        rarity = 3,
        cost = 8,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        effect = nil,

        calculate = function(self, card, context)
            if self.debuff then return nil end
            if context.joker_main and (next(context.poker_hands['fur_spectrum']) or next(context.poker_hands['fur_straightspectrum'])
                or next(context.poker_hands['fur_spectrumhouse']) or next(context.poker_hands['fur_spectrumfive'])) then
                
                return {
                    xmult = card.ability.extra.xmult,
                    colour = G.C.MULT
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            return { vars = {card.ability.extra.xmult, localize('fur_spectrum', 'poker_hands')}}
        end,
        
        in_pool = function(self, args)
            if config.poker_hands then
                return true
            else
                return false
            end
        end
    }
end