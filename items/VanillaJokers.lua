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
    effect = "Suit Mult",

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('fur_stars') or context.other_card:is_suit('six_Stars') then

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
if config.poker_hands and not (next(SMODS.find_mod("SixSuits")) or next(SMODS.find_mod("Bunco")) or next(SMODS.find_mod("SpectrumFramework")) or next(SMODS.find_mod("Multiplayer"))) then
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
        effect = "Type Mult",
    
        calculate = function(self, card, context)
            if card.debuff then return nil end
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
        effect = "Fur Type Chips",
    
        calculate = function(self, card, context)
            if card.debuff then return nil end
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
        effect = "Type Mult",
    
        calculate = function(self, card, context)
            if card.debuff then return nil end
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


SMODS.Joker:take_ownership("j_caino", { -- Canio fix for Nemz's Bow or any future custom face cards destruction effects (From Vanilla Remade)
    config = { extra = { xmult = 1, xmultgain = 1 }},

    calculate = function(self, card, context)
        local face_cards = 0

        if context.remove_playing_cards and not context.blueprint then -- Vanilla removal stuff
            for _, removed_card in ipairs(context.removed) do
                if removed_card:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards > 0 then
                card.ability.extra.xmult = card.ability.extra.xmult + (face_cards * card.ability.extra.xmultgain)
                return { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult }}}
            end
        end

        if context.pseudorandom_result and context.result and context.identifier == "fur_nemzsbow" and not context.blueprint then -- Custom check for Nemz's Bow
            local destroyed_cards = {}
            for i = #G.hand.highlighted, 1, -1 do
                destroyed_cards[#destroyed_cards+1] = G.hand.highlighted[i]
            end
            for k, val in ipairs(destroyed_cards) do
                if val:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards > 0 then
                card.ability.extra.xmult = card.ability.extra.xmult + (face_cards * card.ability.extra.xmultgain)
                return { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult }}}
            end
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmultgain, card.ability.extra.xmult }}
    end,

    },
    true
)