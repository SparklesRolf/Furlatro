local furry_mod = SMODS.current_mod

SMODS.Tag { -- Base Tag
    key = 'furrytag',
    atlas = 'furrytags',
    pos = {x = 0, y = 0},
    config = { type = 'store_joker_create' },
    discovered = true,
    min_ante = 3,

    apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == 'fur_rarityfurry' and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.fur_rarityfurry > rares_in_posession[1] then
				card = create_card("furry", context.area, nil, nil, nil, nil, nil, "fta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY.DARK_EDITION, function()
					card:start_materialize()
					card.ability.couponed = true
					card:set_cost(0)
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,
}

SMODS.Tag { -- Foil Tag
    key = 'foilfurrytag',
    atlas = 'furrytags',
    pos = {x = 1, y = 0},
    config = { type = 'store_joker_create' },
    discovered = true,
    min_ante = 3,

    apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == 'fur_rarityfurry' and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.fur_rarityfurry > rares_in_posession[1] then
				card = create_card("furry", context.area, nil, nil, nil, nil, nil, "fta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				card:set_edition({foil = true}, true)
				tag:yep("+", G.C.RARITY.DARK_EDITION, function()
                    card:start_materialize()
					card.ability.couponed = true
					card:set_cost(0)
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,

    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
        return {vars = {localize('foil', 'labels')}}
    end
}

SMODS.Tag { -- Holo Tag
    key = 'holofurrytag',
    atlas = 'furrytags',
    pos = {x = 2, y = 0},
    config = { type = 'store_joker_create' },
    discovered = true,
    min_ante = 3,

    apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == 'fur_rarityfurry' and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.fur_rarityfurry > rares_in_posession[1] then
				card = create_card("furry", context.area, nil, nil, nil, nil, nil, "fta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				card:set_edition({holo = true}, true)
				tag:yep("+", G.C.RARITY.DARK_EDITION, function()
                    card:start_materialize()
					card.ability.couponed = true
					card:set_cost(0)
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,

    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
        return {vars = {localize('holographic', 'labels')}}
    end
}

SMODS.Tag { -- Poly Tag
    key = 'polyfurrytag',
    atlas = 'furrytags',
    pos = {x = 3, y = 0},
    config = { type = 'store_joker_create' },
    discovered = true,
    min_ante = 3,

    apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == 'fur_rarityfurry' and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.fur_rarityfurry > rares_in_posession[1] then
				card = create_card("furry", context.area, nil, nil, nil, nil, nil, "fta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				card:set_edition({polychrome = true}, true)
				tag:yep("+", G.C.RARITY.DARK_EDITION, function()
                    card:start_materialize()
					card.ability.couponed = true
					card:set_cost(0)
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,

    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
        return {vars = {localize('polychrome', 'labels')}}
    end
}

SMODS.Tag { -- Negative Tag
    key = 'negativefurrytag',
    atlas = 'furrytags',
    pos = {x = 4, y = 0},
    config = { type = 'store_joker_create' },
    discovered = true,
    min_ante = 3,

    apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == 'fur_rarityfurry' and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.fur_rarityfurry > rares_in_posession[1] then
				card = create_card("furry", context.area, nil, nil, nil, nil, nil, "fta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				card:set_edition({negative = true}, true)
				tag:yep("+", G.C.RARITY.DARK_EDITION, function()
                    card:start_materialize()
					card.ability.couponed = true
					card:set_cost(0)
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,

    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return {vars = {localize('negative', 'labels')}}
    end
}

SMODS.Tag { -- Skips Tag
    key = 'skipstag',
    atlas = 'furrytags',
    pos = {x = 5, y = 0},
    discovered = true,

    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            tag:yep('+', G.C.DARK_EDITION,function() 
                local possible = {"p_fur_miniuncommon", "p_fur_uncommon", "p_fur_jumbouncommon", "p_fur_specialuncommon", "p_fur_minirare", "p_fur_rare", "p_fur_jumborare", "p_fur_specialrare", "p_fur_minilegendary", "p_fur_legendary", "p_fur_jumbolegendary", "p_fur_speciallegendary", "p_fur_minimythic", "p_fur_mythic", "p_fur_jumbomythic", "p_fur_specialmythic"}
                local key = possible[math.random(#possible)]
				local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
        end
	end,

    in_pool = function()
		return false
	end,

    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_fur_furrypack_7
    end
}