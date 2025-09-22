local furry_mod = SMODS.current_mod

SMODS.Enhancement { -- Ghost Card
    key = 'ghostcard',
    atlas = 'enhancements',
    pos = { x = 0, y = 0 },
    always_scores = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.cardarea == G.hand and G.hand.highlighted then
            local ghostcards = {}
            local ghostcardcount = 0
            for i = 1, #G.hand.highlighted do
				if 
                    G.hand.highlighted[i].config.center.key == "m_fur_ghostcard"
                then
                    table.insert(ghostcards, G.hand.highlighted)
                end
            end
            for _ in pairs(ghostcards) do
                ghostcardcount = ghostcardcount + 1
            end

            G.hand.config.highlighted_limit = 5
            G.GAME.starting_params.play_limit = 5
            G.GAME.starting_params.discard_limit = 5
            SMODS.update_hand_limit_text(true, true)

            for i = 1, ghostcardcount do
				SMODS.change_play_limit(1)
                SMODS.change_discard_limit(1)
                SMODS.update_hand_limit_text(true, true)
            end
        end

        if context.main_scoring and context.cardarea == G.play then
            G.hand.config.highlighted_limit = 5
            G.GAME.starting_params.play_limit = 5
            G.GAME.starting_params.discard_limit = 5
            SMODS.update_hand_limit_text(true, true)
        end
    end,

    in_pool = function()
        for i = 1, #G.jokers.cards do
		    if G.jokers.cards[i].config.center.key == "j_fur_ghost" then
                return true
            else
                return false
            end
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
        return false
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