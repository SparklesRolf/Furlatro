CardSleeves.Sleeve { -- Floofy Sleeve
    key = 'floofysleeve',
    atlas = 'sleeves',
    pos = { x = 0, y = 0 },
    unlocked = false,
    unlock_condition = { deck = "b_fur_randomdeck", stake = "stake_white" },

    apply = function(self)
		local deck = CardSleeves.Sleeve.get_current_deck_key()

		if deck ~= "b_fur_randomdeck" then
        	G.GAME.randomfurry = true
			G.E_MANAGER:add_event(Event({
				func = function()
					if G.jokers then
						local card = create_card('nonmythics', G.jokers, nil, nil, nil, nil, nil, "floofydeck")
						set_sticker_modifiers(card)
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

		if deck ~= "b_fur_randomdeck" then
			if context.context == "eval" and G.GAME.last_blind and G.GAME.last_blind.boss then
				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							if #G.jokers.cards < G.jokers.config.card_limit then
								if SMODS.pseudorandom_probability(card, "sleeve_fur_floofysleeve", 1, 10, "fur_floofysleeve") then
        							local card = create_card('furry', G.jokers, nil, nil, nil, nil, nil, 'furry_poll')
									set_sticker_modifiers(card)
									card:add_to_deck()
									card:start_materialize()
									G.jokers:emplace(card)
								else
									card_eval_status_text( G.jokers, "jokers", nil, nil, nil, { message = localize("k_nope_ex"), colour = G.C.DARK_EDITION })
								end
							else
								card_eval_status_text( G.jokers, "jokers", nil, nil, nil, { message = localize("k_no_room_ex"), colour = G.C.DARK_EDITION })
							end
							return true
						end
					end,
				}))
			end
		end
    end,

    loc_vars = function(self)
		local key
		local numerator, denominator = SMODS.get_probability_vars(card, 1, 10, 'fur_floofydeck')
		if self.get_current_deck_key() == "b_fur_randomdeck" then
			key = self.key .. "_alt"
		else
			key = self.key
		end

		return { key = key, vars = { localize("fur_joker", 'dictionary'), localize("b_jokers", 'dictionary'), localize("k_edition", 'dictionary'), numerator, denominator }}
	end
}

CardSleeves.Sleeve { -- Stargazers Sleeve
    key = 'stargazerssleeve',
    atlas = 'sleeves',
    pos = { x = 1, y = 0 },
    unlocked = false,
    unlock_condition = { deck = "b_fur_stargazingdeck", stake = "stake_white" },

    apply = function(self)
        G.GAME.stargazing = true
        local deck = CardSleeves.Sleeve.get_current_deck_key()
        if deck ~= "b_fur_stargazingdeck" then
            G.E_MANAGER:add_event(Event({
		        func = function()
		    	    if G.jokers then
		    		    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_astral')
						local card2 = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_sparkles')
						set_sticker_modifiers(card)
						set_sticker_modifiers(card2)
		    		    card:add_to_deck()
						card2:add_to_deck()
		    		    card:start_materialize()
						card2:start_materialize()
		    		    G.jokers:emplace(card)
						G.jokers:emplace(card2)
		    	    end
                    if G.consumeables then
                        local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_fur_fallingstar', 'deck')
						local card2 = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_fur_fallingstar', 'deck')
                        card:add_to_deck()
						card2:add_to_deck()
                        G.consumeables:emplace(card)
						G.consumeables:emplace(card2)
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
    unlocked = false,
    unlock_condition = { deck = "b_fur_chipsgaloredeck", stake = "stake_blue" },

    apply = function(self)
        local deck = CardSleeves.Sleeve.get_current_deck_key()

        if deck ~= "b_fur_chipsgaloredeck" then
			G.GAME.stargazing = true
            G.E_MANAGER:add_event(Event({
		        func = function()
		    	    if G.jokers then
		    		    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_cobalt')
						local card2 = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_icesea')
						set_sticker_modifiers(card)
						set_sticker_modifiers(card2)
		    		    card:add_to_deck()
						card2:add_to_deck()
		    		    card:start_materialize()
						card2:start_materialize()
		    		    G.jokers:emplace(card)
						G.jokers:emplace(card2)
		    	    end
                    if G.consumeables then
                        local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_heirophant', 'deck')
						local card2 = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_moon', 'deck')
                        card:add_to_deck()
						card2:add_to_deck()
                        G.consumeables:emplace(card)
						G.consumeables:emplace(card2)
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

CardSleeves.Sleeve { -- Corrupted Sleeve
    key = 'corruptsleeve',
    atlas = 'sleeves',
    pos = { x = 3, y = 0 },
    unlocked = false,
    unlock_condition = { deck = "b_fur_corrupteddeck", stake = "stake_gold" },

    apply = function(self)
        local deck = CardSleeves.Sleeve.get_current_deck_key()

        if deck ~= "b_fur_corrupteddeck" then
			G.GAME.corrupted = true
            G.E_MANAGER:add_event(Event({
		    	func = function()
		    		if G.jokers then
		    			local card = create_card('corruptfurries', G.jokers, nil, nil, nil, nil, nil, "corrupteddeck")
						set_sticker_modifiers(card)
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
		
        if deck ~= "b_fur_corrupteddeck" then
            if context.final_scoring_step then
                local randomchips = math.random(0.01, 10)
		        local randommult = math.random(0.01, 10)

                G.E_MANAGER:add_event(Event({
        	        func = (function()
        	            local text = localize('fur_corrupted')
        	            play_sound('gong', 0.2, 0.3)
        	            play_sound('gong', 0.2, 0.2)
        	            play_sound('tarot1', 1.5)
        	            ease_colour(G.C.UI_CHIPS, {0, 0, 0, 1})
        	            ease_colour(G.C.UI_MULT, {0, 0, 0, 1})
        	            attention_text({
        	                scale = 1.4, text = text, hold = 2, align = 'cm', offset = {x = 0,y = -2.7},major = G.play
        	            })
        	            G.E_MANAGER:add_event(Event({
        	                trigger = 'after',
        	                blockable = false,
        	                blocking = false,
        	                delay =  4.3,
        	                func = (function() 
        	                        ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
        	                        ease_colour(G.C.UI_MULT, G.C.RED, 2)
        	                    return true
        	                end)
        	            }))
        	            G.E_MANAGER:add_event(Event({
        	                trigger = 'after',
        	                blockable = false,
        	                blocking = false,
        	                no_delete = true,
        	                delay =  6.3,
        	                func = (function() 
        	                    G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
        	                    G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
        	                    return true
        	                end)
        	            }))
        	            return true
        	        end)
        	    }))
			    return {
			    	xchips = randomchips,
			    	xmult = randommult,
			    	remove_default_message = true,
			    }
            end
        end
    end,

    loc_vars = function(self)
        local key
		if self.get_current_deck_key() == "b_fur_corrupteddeck" then
			key = self.key .. "_alt"
		else
			key = self.key
		end

		return { key = key, vars = { colours = { HEX("141035") }}}
    end
}