local furry_mod = SMODS.current_mod

SMODS.Tag { -- Base Tag
    key = 'furrytag',
    atlas = 'furrytags',
    pos = {x = 0, y = 0},
    config = { type = 'store_joker_create' },
    discovered = true,

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
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end
					card:start_materialize()
					card.ability.couponed = true
					card.cost = 0
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
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end
                    card:start_materialize()
					card.ability.couponed = true
					card.cost = 0
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
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end
                    card:start_materialize()
					card.ability.couponed = true
					card.cost = 0
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
    min_ante = 2,

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
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end
                    card:start_materialize()
					card.ability.couponed = true
					card.cost = 0
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
    min_ante = 4,

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
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end
                    card:start_materialize()
					card.ability.couponed = true
					card.cost = 0
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
		if context.type == 'shop_final_pass' then
			tag:yep('+', G.C.DARK_EDITION,function()
				local possible = {"p_fur_miniuncommon", "p_fur_uncommon", "p_fur_jumbouncommon", "p_fur_specialuncommon", "p_fur_minirare", "p_fur_rare", "p_fur_jumborare", "p_fur_specialrare", "p_fur_minilegendary", "p_fur_legendary", "p_fur_jumbolegendary", "p_fur_speciallegendary", "p_fur_minimythic", "p_fur_mythic", "p_fur_jumbomythic", "p_fur_specialmythic"}
            	local key = possible[math.random(#possible)]
				local booster = SMODS.add_booster_to_shop(key)

				booster.from_tag = true
				booster.ability.couponed = true
				booster:set_cost(0)
				return true
			end)
			tag.triggered = true
            return true
		end
	end,

    in_pool = function()
		return false
	end,
}

SMODS.Tag { -- Uncommon Paw Tag
	key = 'uncommonpawtag',
    atlas = 'furrytags',
    pos = {x = 0, y = 1},
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
				card = create_card("uncommonfurries", context.area, nil, nil, nil, nil, nil, "ufta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY[2], function()
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end
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
        return {vars = { localize("uncommon", 'labels') }}
    end
}

SMODS.Tag { -- Rare Paw Tag
	key = 'rarepawtag',
    atlas = 'furrytags',
    pos = {x = 1, y = 1},
    discovered = true,
	min_ante = 4,

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
				card = create_card("rarefurries", context.area, nil, nil, nil, nil, nil, "rfta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY[3], function()
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end
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
        return {vars = { localize("rare", 'labels') }}
    end
}

SMODS.Tag { -- Legendary Paw Tag
	key = 'legendarypawtag',
    atlas = 'furrytags',
    pos = {x = 2, y = 1},
    discovered = true,
	min_ante = 5,

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
				card = create_card("legendaryfurries", context.area, nil, nil, nil, nil, nil, "lfta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY[4], function()
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end
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
        return {vars = { localize("legendary", 'labels') }}
    end
}

SMODS.Tag { -- Mythic Paw Tag
	key = 'mythicpawtag',
    atlas = 'furrytags',
    pos = {x = 3, y = 1},
    discovered = true,
	min_ante = 6,

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
				card = create_card("mythicfurries", context.area, nil, nil, nil, nil, nil, "mfta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.FUR_MYTHIC, function()
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end
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
        return {vars = { localize("fur_mythic", 'labels') }}
    end
}