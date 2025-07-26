local furry_mod = SMODS.current_mod
local config = SMODS.current_mod.config

-- Load Suit & UI assets
SMODS.Atlas { key = "lc_cards", path = '8BitDeck.png', px = 71, py = 95 }
SMODS.Atlas { key = "hc_cards", path = '8BitDeck_opt2.png', px = 71, py = 95 }
SMODS.Atlas { key = "lc_ui", path = 'ui_assets.png', px = 18, py = 18 }
SMODS.Atlas { key = "hc_ui", path = 'ui_assets_opt2.png', px = 18, py = 18 }

-- Add in modded suit
local function allow_suits(self, args)
    if args and args.initial_deck then
        return config.star_suit
    end
    return true
end

local star_suit = SMODS.Suit {
    key = 'stars',
    card_key = 'Stars',
    hc_atlas = 'hc_cards',
    lc_atlas = 'lc_cards',
    hc_ui_atlas = 'hc_ui',
    lc_ui_atlas = 'lc_ui',
    pos = { y = 0 },
    ui_pos = { x = 0, y = 0 },
    hc_colour = HEX('F200F5'),
    lc_colour = HEX('FD65FF'),
    in_pool = allow_suits
}




if config.poker_hands then -- Evaluation code and hand values from SixSuits
    SMODS.PokerHandPart {
        key = 'spectrum',
        func = function(hand)
            local suits = {}
            for _, v in ipairs(SMODS.Suit.obj_buffer) do
                suits[v] = 0
            end
            if #hand < 5 then return {} end
            for i = 1, #hand do
                if hand[i].ability.name ~= 'Wild Card' then
                    for k, v in pairs(suits) do
                        if hand[i]:is_suit(k, nil, true) and v == 0 then
                            suits[k] = v + 1; break
                        end
                    end
                end
            end
            for i = 1, #hand do
                if hand[i].ability.name == 'Wild Card' then
                    for k, v in pairs(suits) do
                        if hand[i]:is_suit(k, nil, true) and v == 0 then
                            suits[k] = v + 1; break
                        end
                    end
                end
            end
            local num_suits = 0
            for _, v in pairs(suits) do
                if v > 0 then num_suits = num_suits + 1 end
            end
            return (num_suits >= 5) and { hand } or {}
        end
    }

    SMODS.PokerHand { -- Spectrum
        key = 'spectrum',
        mult = 3,
        chips = 20,
        l_mult = 2,
        l_chips = 15,
        example = {
            { 'fur_Stars_A', true },
            { 'S_K', true },
            { 'H_T', true },
            { 'C_5', true },
            { 'D_4', true },
        },

        evaluate = function(parts, hand)
            return parts.fur_spectrum
        end
    }

    SMODS.PokerHand { -- Straight Spectrum
        key = 'straightspectrum',
        mult = 6,
        chips = 60,
        l_mult = 3,
        l_chips = 35,
        example = {
            { 'fur_Stars_J', true },
            { 'S_T', true },
            { 'H_9', true },
            { 'C_8', true },
            { 'D_7', true },
        },

        evaluate = function(parts)
            if not next(parts.fur_spectrum) or not next(parts._straight) then return {} end
            return { SMODS.merge_lists (parts.fur_spectrum, parts._straight) }
        end,

        modify_display_text = function(self, _cards, scoring_hand)
            local royal = true
            for j = 1, #scoring_hand do
                local rank = SMODS.Ranks[scoring_hand[j].base.value]
                royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
            end
            if royal then
                return self.key .. '_2'
            end
        end
    }

    SMODS.PokerHand { -- Spectrum House
        key = 'spectrumhouse',
        visible = false,
        mult = 7,
        chips = 80,
        l_mult = 3,
        l_chips = 35,
        example = {
            { 'fur_Stars_K', true },
            { 'S_K', true },
            { 'H_K', true },
            { 'C_2', true },
            { 'D_2', true },
        },

        evaluate = function(parts)
            if #parts._3 < 1 or #parts._2 < 2 or not next(parts.fur_spectrum) then return {} end
            return { SMODS.merge_lists (parts._all_pairs, parts.fur_spectrum) }
        end,
    }

    SMODS.PokerHand { -- Spectrum Five
        key = 'spectrumfive',
        visible = false,
        mult = 14,
        chips = 120,
        l_mult = 4,
        l_chips = 40,
        example = {
            { 'fur_Stars_A', true },
            { 'S_A', true },
            { 'H_A', true },
            { 'C_A', true },
            { 'D_A', true },
        },

        evaluate = function(parts)
            if not next(parts._5) or not next(parts.fur_spectrum) then return {} end
            return { SMODS.merge_lists (parts._5, parts.fur_spectrum) }
        end,
    }
end




SMODS.Atlas { -- Blinds
    key = 'blinds',
    path = 'Blinds.png',
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    px = 34,
    py = 34,
}

SMODS.Blind { -- The Meteor
    key = 'meteorblind',
    atlas = "blinds",
    pos = { x = 0, y = 0 },
    weight = 1,
    dollars = 5,
    discovered = true,
    contrast = 5,
    mult = 2,
    boss = { min = 0, max = 10 },
    boss_colour = HEX('FD65FF'),
    debuff = {
        suit = 'fur_stars'
    },
}

SMODS.Blind { -- The Paw
    key = 'pawblind',
    atlas = "blinds",
    pos = { x = 0, y = 1 },
    weight = 1,
    dollars = 8,
    discovered = true,
    contrast = 5,
    mult = 2,
    boss = { showdown = true },
    boss_colour = G.C.DARK_EDITION,

    recalc_debuff = function(self, card, from_blind)
		if (card.area == G.jokers) and not G.GAME.blind.disabled and card.config.center.rarity == 'fur_rarityfurry' then
			return true
		end
		return false
	end,
}

SMODS.Blind:take_ownership('bl_final_leaf', { -- This bitch appearently broke itself with the mod so we fix the veggie just in case (From Vanilla Remade)
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.debuff_card and context.debuff_card.area ~= G.jokers then
                return {
                    debuff = true
                }
            end
            if context.selling_card and context.card.ability.set == 'Joker' then
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        blind:disable()
                        return true
                    end
                }))
            end
        end
    end
}, 
    true
)