local furry_mod = SMODS.current_mod

CardSleeves.Sleeve { -- Floofy Sleeve
    key = 'floofysleeve',
    atlas = 'sleeves',
    pos = { x = 0, y = 0 },
    config = { odds = 10, playing_round = "false" },
    unlocked = true,
    unlock_condition = { deck = "Floofy Deck", stake = "stake_white" },

    apply = function(self)
        G.GAME.randomdeck = true
        local deck = CardSleeves.Sleeve.get_current_deck_key()
        if deck ~= "b_fur_randomdeck" then
            G.E_MANAGER:add_event(Event({
				func = function()
					if G.jokers then
						local card = create_card('nonmythics', G.jokers, nil, nil, nil, nil, nil, "floofydeck")
						card:add_to_deck()
						card:start_materialize()
						G.jokers:emplace(card)
						return true
					end
				end,
			}))
        end
    end,

    calculate = function(self, sleeve, context)
        local deck = CardSleeves.Sleeve.get_current_deck_key()

        if context.setting_blind then
            if deck ~= "b_fur_randomdeck" then
                self.config.playing_round = "true"
            end
        end

        if context.end_of_round then
            if context.end_of_round and G.GAME.last_blind and G.GAME.last_blind.boss then
                if self.config.playing_round == "true" then
                    if deck ~= "b_fur_randomdeck" then
                        self.config.playing_round = "false"
                        if #G.jokers.cards < G.jokers.config.card_limit then
		            		if pseudorandom("furrysleeve") < G.GAME.probabilities.normal/self.config.odds then
		            			local card = create_card('furry', G.jokers, nil, nil, nil, nil, nil, 'furry_poll')
		            			card:add_to_deck()
		            			card:start_materialize()
		            			G.jokers:emplace(card)
                                return true
		            		else
                                return {
		            			    card_eval_status_text(
		            			    	G.jokers,
		            			    	"jokers",
		            			    	nil,
		            			    	nil,
		            			    	nil,
		            			    	{ message = localize("k_nope_ex"), colour = G.C.DARK_EDITION }
		            			    )
                                }
		            		end
		            	else
                            return {
		            		    card_eval_status_text(
		            		    	G.jokers,
		            		    	"jokers",
		            		    	nil,
		            		    	nil,
		            		    	nil,
		            		    	{ message = localize("k_no_room_ex"), colour = G.C.DARK_EDITION }
		            		    )
                            }
		            	end
                    end
                end
            else
                self.config.playing_round = "false"
            end
        end
    end,

    loc_vars = function(self)
		local key
		if self.get_current_deck_key() == "b_fur_randomdeck" then
			key = self.key .. "_alt"
		else
			key = self.key
		end

		return { key = key, vars = { localize("fur_joker", 'dictionary'), localize("b_jokers", 'dictionary'), localize("k_edition", 'dictionary'), G.GAME.probabilities.normal, self.config.odds }}
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
        local deck = CardSleeves.Sleeve.get_current_deck_key()
        if deck ~= "b_fur_stargazingdeck" then
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
    end,

    loc_vars = function(self)
		local key
		if self.get_current_deck_key() == "b_fur_stargazingdeck" then
			key = self.key .. "_alt"
		else
			key = self.key
		end

		return { key = key, vars = { localize("k_spectral", 'dictionary') } }
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
        local deck = CardSleeves.Sleeve.get_current_deck_key()
        if deck ~= "b_fur_chipsgaloredeck" then
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
    end,

    loc_vars = function(self)
        local key
		if self.get_current_deck_key() == "b_fur_chipsgaloredeck" then
			key = self.key .. "_alt"
		else
			key = self.key
		end

		return { key = key, vars = { localize("b_jokers", 'dictionary'), localize("Clubs", 'suits_singular'), localize("foil", 'labels') }}
    end
}
