local furry_mod = SMODS.current_mod
local config = SMODS.current_mod.config

SMODS.Back { -- Floofy Deck
    key = 'randomdeck',
    atlas = 'furrydecks',
    pos = { x = 0, y = 0 },
    discovered = true,
    config = { extra = { odds = 10 }},

    apply = function(self)
        G.GAME.randomdeck = true
		if CardSleeves then
			if G.GAME.selected_sleeve == 'sleeve_fur_floofysleeve' then
				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							local card = create_card('furry', G.jokers, nil, nil, nil, nil, nil, "floofydeck")
							card:add_to_deck()
							card:start_materialize()
							G.jokers:emplace(card)
							return true
						end
					end,
				}))
			else
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
		else
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

    calculate = function(self, back, context)
		if context.context == "eval" and G.GAME.last_blind and G.GAME.last_blind.boss then
			if G.jokers then
				if CardSleeves then
					if G.GAME.selected_sleeve == 'sleeve_fur_floofysleeve' then
						if #G.jokers.cards < G.jokers.config.card_limit then
							if pseudorandom("furrydeck") < G.GAME.probabilities.normal/self.config.extra.odds then
								local edition = poll_edition('standard_edition'..G.GAME.round_resets.ante, 2, false, true)
        						local card = create_card('furry', G.jokers, nil, nil, nil, nil, nil, 'furry_poll')
								card:add_to_deck()
								card:start_materialize()
								card:set_edition(edition, true)
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
					else
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
				else
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
		end
	end,

	loc_vars = function(self)
		return { vars = { G.GAME.probabilities.normal, self.config.extra.odds }}
	end,
}

SMODS.Back { -- Stargazing Deck
    key = 'stargazingdeck',
    atlas = 'furrydecks',
    pos = { x = 1, y = 0 },
    discovered = true,

    apply = function(self)
        G.GAME.stargazing = true
		if CardSleeves then
			if G.GAME.selected_sleeve == 'sleeve_fur_stargazerssleeve' then
				if config.star_suit then
					local possiblesuits = {"Hearts", "Clubs", "Spades", "Diamonds"}
					local suittarget = possiblesuits[math.random(#possiblesuits)]
					G.E_MANAGER:add_event(Event({
            			func = function()
            			    for k, v in pairs(G.playing_cards) do
            			        if v.base.suit == suittarget then 
            			            v:change_suit('fur_stars')
            			        end
            			    end
            			return true
            			end
        			}))
				end

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
        	    	        local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'starsleeve')
        	    	        card:add_to_deck()
        	    	        G.consumeables:emplace(card)
        	    	    end
        	    	    if G.consumeables then
        	    	        local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'starsleeve')
        	    	        card:add_to_deck()
        	    	        G.consumeables:emplace(card)
        	    	    end
        	    	    return true
					end
				}))
			else
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
		else
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
    end
}

SMODS.Back { -- Chips Galore Deck
    key = 'chipsgaloredeck',
    atlas = 'furrydecks',
    pos = { x = 2, y = 0 },
    discovered = true,

    apply = function(self)
        G.GAME.stargazing = true
		if CardSleeves then
			if G.GAME.selected_sleeve == 'sleeve_fur_chipsgaloresleeve' then
				if config.star_suit then
					local possiblesuits = {"Hearts", "Spades", "Diamonds", "fur_stars"}
					local suittarget = possiblesuits[math.random(#possiblesuits)]
					G.E_MANAGER:add_event(Event({
            			func = function()
            			    for k, v in pairs(G.playing_cards) do
            			        if v.base.suit == suittarget then 
            			            v:change_suit('Clubs')
            			        end
            			    end
            			return true
            			end
        			}))
				else
					local possiblesuits = {"Hearts", "Spades", "Diamonds"}
					local suittarget = possiblesuits[math.random(#possiblesuits)]
					G.E_MANAGER:add_event(Event({
            			func = function()
            			    for k, v in pairs(G.playing_cards) do
            			        if v.base.suit == suittarget then 
            			            v:change_suit('Clubs')
            			        end
            			    end
            			return true
            			end
        			}))
				end
					
				G.E_MANAGER:add_event(Event({
            		func = function()
            		    for k, v in pairs(G.playing_cards) do
            		        if v.base.suit == suittarget then 
            		            v:change_suit('Clubs')
            		        end
            		    end
            		return true
            		end
        		}))

				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_cobalt')
							card:set_edition({foil = true}, true)
							card:add_to_deck()
							card:start_materialize()
							G.jokers:emplace(card)
						end
        		        if G.jokers then
							local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_icesea')
							card:set_edition({foil = true}, true)
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
						if G.consumeables then
        		            local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_black_hole', 'deck')
        		            card:add_to_deck()
        		            G.consumeables:emplace(card)
        		        end
        		        return true
					end
				}))
			else
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
		else
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

	loc_vars = function(self, info_queue, card)
		return { vars = {  }}
	end
}