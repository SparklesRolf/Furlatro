local furry_mod = SMODS.current_mod

SMODS.Atlas {
    key = 'sleeves',
    path = 'Sleeves.png',
    px = 73,
    py = 95
}


CardSleeves.Sleeve { -- Floofy Sleeve
    key = 'floofysleeve',
    atlas = 'sleeves',
    pos = { x = 0, y = 0 },
    config = { odds = 10 },
    unlocked = true,
    unlock_condition = { deck = "Floofy Deck", stake = "stake_white" },

    apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card('furry', G.jokers, nil, nil, nil, nil, nil, "floofysleeve")
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
	end,

    trigger_effect = function(self, args)
		if args.context == "eval" and G.GAME.last_blind and G.GAME.last_blind.boss then
			if G.jokers then
				if #G.jokers.cards < G.jokers.config.card_limit then
					local furry_poll = pseudorandom(pseudoseed("floofydeck"))
					furry = furry_poll / (G.GAME.probabilities.normal or 1)
					if furry_poll < self.config.odds then
						local card = create_card('furry', G.jokers, nil, nil, nil, nil, nil, "floffydeck")
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
							{ message = localize("k_nope_ex"), colour = G.C.RARITY[4] }
						)
					end
				else
					card_eval_status_text(
						G.jokers,
						"jokers",
						nil,
						nil,
						nil,
						{ message = localize("k_no_room_ex"), colour = G.C.RARITY[4] }
					)
				end
			end
		end
	end,

    loc_vars = function(self)
		return { vars = {} }
	end
}

CardSleeves.Sleeve { -- Stargazers Sleeve
    key = 'stargazerssleeve',
    atlas = 'sleeves',
    pos = { x = 1, y = 0 },
    unlocked = true,
    unlock_condition = { deck = "Stargazers Deck", stake = "stake_white" },

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

CardSleeves.Sleeve { -- Chips Galore Sleeve
    key = 'chipsgaloresleeve',
    atlas = 'sleeves',
    pos = { x = 2, y = 0 },
    unlocked = true,
    unlock_condition = { deck = "Chips Galore Deck", stake = "stake_blue" },

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
