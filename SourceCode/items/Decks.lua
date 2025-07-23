local furry_mod = SMODS.current_mod

SMODS.Atlas {
    key = 'furrydecks',
    path = 'Decks.png',
    px = 71,
    py = 95,
}

SMODS.Back { -- Floofy Deck
    key = 'randomdeck',
    atlas = 'furrydecks',
    pos = { x = 0, y = 0 },
    discovered = true,
    config = { extra = { odds = 10 }},

    apply = function(self)
        G.GAME.randomdeck = true
        G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card('furry', G.jokers, nil, nil, nil, nil, nil, 'furry_deck')
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
    end,

    calculate = function(self, back, context)
		if context.context == "eval" and G.GAME.last_blind and G.GAME.last_blind.boss then
			if G.jokers then
				if #G.jokers.cards < G.jokers.config.card_limit then
					if pseudorandom("furrydeck") < G.GAME.probabilities.normal/self.config.extra.odds then
						local card = create_card('furry', G.jokers, nil, nil, nil, nil, nil, 'furry_poll')
						card:add_to_deck()
						card:start_materialize()
						G.jokers:emplace(card)
                        return true
					else
						card_eval_status_text(
							G.jokers,
							"jokers",
							nil,
							nil,
							nil,
							{ message = localize("k_nope_ex"), colour = G.C.DARK_EDITION }
						)
					end
				else
					card_eval_status_text(
						G.jokers,
						"jokers",
						nil,
						nil,
						nil,
						{ message = localize("k_no_room_ex"), colour = G.C.DARK_EDITION }
					)
				end
			end
		end
	end,
}

SMODS.Back { -- Stargazing Deck
    key = 'stargazingdeck',
    atlas = 'furrydecks',
    pos = { x = 1, y = 0 },
    discovered = true,

    apply = function(self)
        G.GAME.stargazing = true
        G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_astral')
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
				end
                if G.jokers then
					local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_sparkles')
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
				end
                delay(1)
                if G.consumeables then
                    local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_fur_fallingstar', 'deck')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                end
                if G.consumeables then
                    local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_fur_fallingstar', 'deck')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                end
                return true
			end
		}))
    end
}

SMODS.Back { -- Chips Galore Deck
    key = 'chipsgaloredeck',
    atlas = 'furrydecks',
    pos = { x = 2, y = 0 },
    discovered = true,

    apply = function(self)
        G.GAME.stargazing = true
        G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_cobalt')
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
				end
                if G.jokers then
					local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_icesea')
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
				end
                delay(1)
                if G.consumeables then
                    local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_heirophant', 'deck')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                end
                if G.consumeables then
                    local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_moon', 'deck')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                end
                return true
			end
		}))
    end
}