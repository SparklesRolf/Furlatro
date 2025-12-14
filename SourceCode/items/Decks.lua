local furry_mod = SMODS.current_mod
local config = furry_mod.config

SMODS.Back { -- Floofy Deck
    key = 'randomdeck',
    atlas = 'furrydecks',
    pos = { x = 0, y = 0 },
    discovered = true,

    apply = function(self)
        G.GAME.randomfurry = true
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local jokertype = nil
					if G.GAME.selected_sleeve == "sleeve_fur_floofysleeve" then
						jokertype = "mythicfurries"
					else
						jokertype = "nonmythics"
					end
					local card = create_card(jokertype, G.jokers, nil, nil, nil, nil, nil, "floofydeck")
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end

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
			G.E_MANAGER:add_event(Event({
				func = function()
					if G.jokers then
						if #G.jokers.cards < G.jokers.config.card_limit then
							if SMODS.pseudorandom_probability(card, "b_fur_randomdeck", 1, 10, "fur_randomdeck") then
								local edition = poll_edition('standard_edition'..G.GAME.round_resets.ante, 2, false, true)
        						local card = create_card('furry', G.jokers, nil, nil, nil, nil, nil, 'furry_poll')
								local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        						if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        						    card:set_eternal(true)
        						elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        						    card:set_perishable(true)
        						end
        						if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        						    card:set_rental(true)
        						end

								card:add_to_deck()
								card:start_materialize()
								if G.GAME.selected_sleeve == "sleeve_fur_floofysleeve" then
									card:set_edition(edition, true)
								end
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
	end,

	loc_vars = function(self)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, 10, 'fur_floofydeck')
		return { vars = { numerator, denominator }}
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
					local card2 = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_sparkles')
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
					local eternal_perishable_poll2 = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end
					if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll2 > 0.7 then
        			    card2:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll2 > 0.4) and (eternal_perishable_poll2 <= 0.7)) then
        			    card2:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card2:set_rental(true)
        			end

					card:add_to_deck()
					card2:add_to_deck()
					card:start_materialize()
					card2:start_materialize()
					G.jokers:emplace(card)
					G.jokers:emplace(card2)
				end
				if G.consumeables then
					if G.GAME.selected_sleeve == "sleeve_fur_stargazerssleeve" then
						local card = create_card("Spectral", G.consumeables, nil, nil, nil, nil, nil, 'starsleeve')
        	    		local card2 = create_card("Spectral", G.consumeables, nil, nil, nil, nil, nil, 'starsleeve')
						card:add_to_deck()
						card2:add_to_deck()
        	    		G.consumeables:emplace(card)
						G.consumeables:emplace(card2)
					else
						local card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, 'c_fur_fallingstar', 'deck')
        	    	    local card2 = create_card("Tarot", G.consumeables, nil, nil, nil, nil, 'c_fur_fallingstar', 'deck')
						card:add_to_deck()
						card2:add_to_deck()
        	    		G.consumeables:emplace(card)
						G.consumeables:emplace(card2)
					end
					
				end
				return true
			end,
		}))
		
		if G.GAME.selected_sleeve == "sleeve_fur_stargazerssleeve" then
			if config.star_suit then
				local possiblesuits = {"Hearts", "Spades", "Diamonds", "Clubs"}
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
		end
    end
}

SMODS.Back { -- Chips Galore Deck
    key = 'chipsgaloredeck',
    atlas = 'furrydecks',
    pos = { x = 2, y = 0 },
    discovered = true,

    apply = function(self)
        G.GAME.chipsgalore = true
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_cobalt')
					local card2 = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_fur_icesea')
					local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
					local eternal_perishable_poll2 = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
					card:add_to_deck()
					card2:add_to_deck()
					card:start_materialize()
					card2:start_materialize()
					if G.GAME.selected_sleeve == "sleeve_fur_chipsgaloresleeve" then
						card:set_edition({foil = true}, true)
						card2:set_edition({foil = true}, true)
					end
        			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
        			    card:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
        			    card:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card:set_rental(true)
        			end
					if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll2 > 0.7 then
        			    card2:set_eternal(true)
        			elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll2 > 0.4) and (eternal_perishable_poll2 <= 0.7)) then
        			    card2:set_perishable(true)
        			end
        			if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
        			    card2:set_rental(true)
        			end

					G.jokers:emplace(card)
					G.jokers:emplace(card2)
				end
				if G.consumeables then
					if G.GAME.selected_sleeve == "sleeve_fur_chipsgaloresleeve" then
						local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_heirophant', 'deck')
						local card2 = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_moon', 'deck')
						local card3 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_black_hole', 'deck')
        		    	card:add_to_deck()
						card2:add_to_deck()
						card3:add_to_deck()
        		    	G.consumeables:emplace(card)
						G.consumeables:emplace(card2)
						G.consumeables:emplace(card3)
					else
						local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_heirophant', 'deck')
						local card2 = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_moon', 'deck')
        		    	card:add_to_deck()
						card2:add_to_deck()
        		    	G.consumeables:emplace(card)
						G.consumeables:emplace(card2)
					end
				end
				return true
			end,
		}))

		if G.GAME.selected_sleeve == "sleeve_fur_chipsgaloresleeve" then
			local possiblesuits = {}
			if config.star_suit then
				possiblesuits = {"Hearts", "Spades", "Diamonds", "fur_stars"}
			else
				possiblesuits = {"Hearts", "Spades", "Diamonds"}
			end

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
    end,
}

SMODS.Back { -- Corrupted Deck
    key = 'corrupteddeck',
    atlas = 'furrydecks',
    pos = { x = 3, y = 0 },
	unlocked = false,

    apply = function(self)
        G.GAME.corrupted = true
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card('corruptfurries', G.jokers, nil, nil, nil, nil, nil, "corrupteddeck")
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
    end,

	calculate = function(self, back, context)
		if context.final_scoring_step then
			if G.GAME.selected_sleeve == 'sleeve_fur_corruptsleeve' then
				local randomchips = math.random(0.002, 50)
				local randommult = math.random(0.002, 50)
			else
				local randomchips = math.random(0.01, 10)
				local randommult = math.random(0.01, 10)
			end
        	
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
	end,

	loc_vars = function(self)
		return { vars = { colours = { HEX("141035") }}}
	end,

	check_for_unlock = function(self, args)
		if args.type == 'used_???' then 
			return true
		end
	end
}