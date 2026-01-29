local furry_mod = SMODS.current_mod

SMODS.Enhancement { -- Ghost Card
    key = 'ghostcard',
    atlas = 'enhancements',
    config = { handlimittriggered = false },
    pos = { x = 0, y = 0 },
    always_scores = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if card.highlighted and not card.config.handlimittriggered then
            card.config.handlimittriggered = true
            SMODS.change_play_limit(1)
            SMODS.change_discard_limit(1)
            SMODS.update_hand_limit_text(true, true)
        end
        if not card.highlighted and card.config.handlimittriggered then
            card.config.handlimittriggered = false
            SMODS.change_play_limit(-1)
            SMODS.change_discard_limit(-1)
            SMODS.update_hand_limit_text(true, true)
        end

        if context.main_scoring and G.hand.config.highlighted_limit ~= 5 and (context.cardarea == G.play or context.cardarea == G.discard) then
            card.config.handlimittriggered = false
            G.hand.config.highlighted_limit = 5
            G.GAME.starting_params.play_limit = 5
            G.GAME.starting_params.discard_limit = 5
            SMODS.update_hand_limit_text(true, true)
        end
    end,

    in_pool = function()
		if next(SMODS.find_card("j_fur_ghost")) then
            return true
        else
            return false
        end
    end
}
SMODS.Enhancement { -- Sock Card
    key = 'sockcard',
    atlas = 'enhancements',
    pos = { x = 1, y = 0 },
    config = { extra = { bonus_discards = 1 }},
    
    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.main_scoring and context.cardarea == G.play then
            ease_discard(card.ability.extra.bonus_discards)

            return {
                message = '+ ' .. card.ability.extra.bonus_discards .. localize("k_hud_discards"),
                card = card,
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.bonus_discards, localize("k_hud_discards")}}
    end
}
SMODS.Enhancement { -- Stinky Card
    key = 'stinkcard',
    atlas = 'enhancements',
    pos = { x = 0, y = 1 },
    config = {},
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    disposable = true,
    
    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.main_scoring and context.cardarea == G.play then
                
            return {
                message = localize("fur_cleansed", "dictionary"),
                card = card,
                colour = G.C.FILTER
            }
        end

        if context.destroy_card == card and context.cardarea == G.play then
            return { remove = true }
        end
    end,

    in_pool = function(self, args)
        if next(SMODS.find_card("j_fur_kalik")) then
            return true
        else
            return false
        end
    end
}
SMODS.Enhancement { -- Silver Card
    key = 'silvercard',
    atlas = 'enhancements',
    pos = { x = 1, y = 1 },
    config = { extra = { chips = 9.99, money = 1 }},
    unlocked = true,
    discovered = true,
    
    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.main_scoring and context.cardarea == G.play then

            return {
                ease_dollars(self.config.extra.money),
                chips = self.config.extra.chips,
                message = '+$' .. self.config.extra.money,
                colour = G.C.MONEY
            }
        end
    end,

    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.money, center.ability.extra.chips}}
    end
}
SMODS.Enhancement { -- Prince Cards
    key = 'princecard',
    atlas = 'enhancements',
    pos = { x = 2, y = 0 },
    config = { partnersynergizetrigger = false, extra = { mult = 0, multgain = 4 }},
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if G.GAME.selected_partner == "pnr_fur_lumepartner" then
            if not card.ability.partnersynergizetrigger then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.multgain = card.ability.extra.multgain * 2
            end
        end

        local princecardcount = 0
        for _, playing_card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, 'm_fur_princecard') then 
                princecardcount = princecardcount + 1 
            end
        end

        if context.main_scoring and context.cardarea == G.play then
            return {
                mult = card.ability.extra.mult + (card.ability.extra.multgain * princecardcount) 
            }
        end
    end,

    loc_vars = function(self, info_queue, center)
        local princecardcount = 0
        if G.GAME.current_round.hands_left > 0 then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_fur_princecard') then 
                    princecardcount = princecardcount + 1 
                end
            end
        end

        return { vars = { center.ability.extra.mult + (center.ability.extra.multgain * princecardcount), center.ability.extra.multgain }}
    end,

    in_pool = function(self, args)
        if next(SMODS.find_card("j_fur_lume")) then
            return true
        else
            return false
        end
    end
}
SMODS.Enhancement { -- Snowflake Cards
    key = 'snowflakecard',
    atlas = 'enhancements',
    pos = { x = 2, y = 1 },
    config = { partnersynergizetrigger = false, extra = { chips = 100, mult = 5 }},
    unlocked = true,
    discovered = true,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if G.GAME.selected_partner == "pnr_fur_galepartner" then
            if not card.ability.partnersynergizetrigger then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.chips = card.ability.extra.chips * 2
                card.ability.extra.mult = card.ability.extra.mult * 2
            end
        end

        if context.main_scoring and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end,

    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.chips, center.ability.extra.mult }}
    end,

    in_pool = function(self, args)
        if next(SMODS.find_card("j_fur_gale")) then
            return true
        else
            return false
        end
    end
}