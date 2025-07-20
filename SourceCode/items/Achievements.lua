local furry_mod = SMODS.current_mod

SMODS.Atlas {
    key = 'achievementtrophies',
    path = 'Trophies.png',
    px = 66,
    py = 66
}

SMODS.Achievement { -- The Dark Side of the Deck
    key = 'darksideofthedeck',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        local negativecardtablesize = 0
        if args.type == 'modify_deck' then
            local negativecards = {}
            for i = 1, #G.playing_cards do
				if 
                    (G.playing_cards[i].edition and G.playing_cards[i].edition.negative) 
                then
					table.insert(negativecards, G.playing_cards)
				end
			end
            for _ in pairs(negativecards) do
                negativecardtablesize = negativecardtablesize + 1
            end
        end

        if negativecardtablesize >= 52 then
            return true
        end
    end
}

SMODS.Achievement { -- The Dream Team
    key = 'thedreamteam',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        if 
            next(SMODS.find_card('j_fur_sparkles')) and
            next(SMODS.find_card('j_fur_illy')) and
            next(SMODS.find_card('j_fur_ghost')) 
        then
            return true
        end
    end
}

SMODS.Achievement { -- Closeted Furry
    key = 'closetedfurry',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        local furryjokertablesize = 1
        if args.type == 'round_win' and G.GAME.blind.config.blind.key == "bl_fur_pawblind" then
            local furryjokers = {}
            for i = 1, #G.jokers.cards do
				if 
                    G.jokers.cards[i].config.center.rarity == "fur_rarityfurry"
                then
                    table.insert(furryjokers, G.jokers)
                end
            end

            local furryjokertablesize = 0
            for _ in pairs(furryjokers) do
                furryjokertablesize = furryjokertablesize + 1
            end

            if furryjokertablesize == 0 then
                return true
            end
        end
    end
}

SMODS.Achievement { -- Against All Odds
    key = 'againstallodds',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        local debuffedfurryjokertablesize = 0
        if args.type == 'round_win' and G.GAME.blind.config.blind.key == "bl_fur_pawblind" then
            local debuffedfurryjokers = {}
            for i = 1, #G.jokers.cards do
				if 
                    G.jokers.cards[i].config.center.rarity == "fur_rarityfurry"
                then
                    table.insert(debuffedfurryjokers, G.jokers)
                end
            end
            for _ in pairs(debuffedfurryjokers) do
                debuffedfurryjokertablesize = debuffedfurryjokertablesize + 1
            end
        end

        if debuffedfurryjokertablesize >= 4 then
            return true
        end
    end
}

SMODS.Achievement { -- I'm Outta Here
    key = 'imouttahere',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        if args.type == 'round_win' then
            if G.GAME.chips == G.GAME.blind.chips and G.GAME.fur_ach_conditions.skips_ability_triggered == true then
                return true
            end
        end
    end
}

SMODS.Achievement { -- Saved By The Buzzer
    key = 'savedbythebuzzer',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        if args.type == 'round_win' then
            if G.GAME.chips == G.GAME.blind.chips and G.GAME.fur_ach_conditions.skips_ability_triggered == true then
                if G.GAME.blind.boss then
                    return true
                end
            end
        end
    end
}

SMODS.Achievement { -- Heart Of The Chips
    key = 'heartofthechips',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        if args.type == "modify_jokers" then
            for i = 1, #G.jokers.cards do
				if 
                    G.jokers.cards[i].config.center.key == "j_fur_icesea" 
                    and (G.jokers.cards[i].edition and G.jokers.cards[i].edition.foil) 
                then
					return true
				end
			end
        end
    end
}

SMODS.Achievement { -- The Whole Gang
    key = 'thewholegang',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        if 
            next(SMODS.find_card('j_fur_sparkles')) and
            next(SMODS.find_card('j_fur_illy')) and
            next(SMODS.find_card('j_fur_ghost')) and
            next(SMODS.find_card('j_fur_soks')) and
            next(SMODS.find_card('j_fur_kalik')) and
            next(SMODS.find_card('j_fur_silver')) and
            next(SMODS.find_card('j_fur_astral')) and
            next(SMODS.find_card('j_fur_cobalt')) and
            next(SMODS.find_card('j_fur_icesea')) and
            next(SMODS.find_card('j_fur_koneko')) and
            next(SMODS.find_card('j_fur_saph')) and
            next(SMODS.find_card('j_fur_skips')) and
            next(SMODS.find_card('j_fur_spark')) and
            next(SMODS.find_card('j_fur_luposity')) and
            next(SMODS.find_card('j_fur_curiousangel'))
        then
            return true
        end
    end
}

SMODS.Achievement { -- e621
    key = 'e621',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        if args.type == "chip_score" and to_big(args.chips) >= to_big(1) * to_big(10) ^ to_big(621) and to_big(args.chips) < to_big(1) * to_big(10) ^ to_big(622) then
           return true
        end
    end
}

SMODS.Achievement { -- Double Down
    key = 'doubledown',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
		if args.type == "discard_custom" and #G.hand.highlighted >= 10 then
            return true
        end
    end
}

SMODS.Achievement { -- Maxed Out
    key = 'maxedout',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
		local maxchallengesbeaten = 0
		if G.PROFILES[G.SETTINGS.profile].challenge_progress.completed["c_fur_challengemultmaxing"] then
			maxchallengesbeaten = maxchallengesbeaten + 1
		end
		if G.PROFILES[G.SETTINGS.profile].challenge_progress.completed["c_fur_challengechipsmaxing"] then
			maxchallengesbeaten = maxchallengesbeaten + 1
		end

		if maxchallengesbeaten == 2 then
			return true
		end
    end
}

SMODS.Achievement { -- I Need a Shower
    key = 'ineedashower',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        local stinkycards = 0
        if args.type == 'hand' then
            if G.playing_cards then
                for i = 1, #G.playing_cards do
					if G.playing_cards[i].config.center.key == "m_fur_stinkcard" then
						stinkycards = stinkycards + 1
					end
				end
            end

            if stinkycards >= 26 then
                return true
            end
        end
    end
}

SMODS.Achievement { -- Ghosted
    key = 'ghosted',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        local ghostcards = 0
        if args.type == 'hand' then
            for k, v in ipairs(args.scoring_hand) do
				if v.config.center.key == "m_fur_ghostcard" then
					ghostcards = ghostcards + 1
				end
			end


            if ghostcards >= 5 and #args.scoring_hand >= 5 then
                return true
            end
        end
    end
}

SMODS.Achievement { -- Enhanced Spectrum
    key = 'enhancedspectrum',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        local ghostcards = 0
        local silvercards = 0
        local stinkcards = 0
        local sockcards = 0
        if args.type == 'hand' then
            for k, v in ipairs(args.scoring_hand) do
				if v.config.center.key == "m_fur_ghostcard" then
					ghostcards = ghostcards + 1
				end
                if v.config.center.key == "m_fur_silvercard" then
					silvercards = silvercards + 1
				end
                if v.config.center.key == "m_fur_stinkcard" then
					stinkcards = stinkcards + 1
				end
                if v.config.center.key == "m_fur_sockcard" then
					sockcards = sockcards + 1
				end
			end


            if ghostcards >= 1 and silvercards >= 1 and stinkcards >= 1 and sockcards >= 1 then
                return true
            end
        end
    end
}

SMODS.Achievement { -- You Are Gae
    key = 'youaregae',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        if args.type == "modify_jokers" then
            for i = 1, #G.jokers.cards do
				if 
                    G.jokers.cards[i].config.center.rarity == "fur_rarityfurry" 
                    and (G.jokers.cards[i].edition and G.jokers.cards[i].edition.polychrome) 
                then
					return true
				end
			end
        end
    end
}

SMODS.Achievement { -- Ultimate Collector
    key = 'ultimatecollector',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self,args)
        if 
            next(SMODS.find_card('j_fur_illy')) and
            next(SMODS.find_card('j_fur_ghost')) and
            next(SMODS.find_card('j_fur_soks')) and
            next(SMODS.find_card('j_fur_skips')) and
            next(SMODS.find_card('j_fur_luposity')) and
            next(SMODS.find_card('j_fur_curiousangel'))
        then
            return true
        end
    end
}

SMODS.Achievement { -- Dirty Laundry
    key = 'dirtylaundry',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self,args)
        local stinkcards = 0
        local sockcards = 0
        if args.type == 'hand' then
            for k, v in ipairs(args.scoring_hand) do
                if v.config.center.key == "m_fur_stinkcard" then
					stinkcards = stinkcards + 1
				end
                if v.config.center.key == "m_fur_sockcard" then
					sockcards = sockcards + 1
				end
			end


            if stinkcards >= 1 and sockcards >= 1 then
                return true
            end
        end
    end
}

SMODS.Achievement { -- Welcome To The Fandom
    key = 'welcometothefandom',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    order = 1,
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        if args.type == "modify_jokers" then
            for i = 1, #G.jokers.cards do
				if 
                    G.jokers.cards[i].config.center.rarity == "fur_rarityfurry"  
                then
					return true
				end
			end
        end
    end
}

SMODS.Achievement { -- Ghosted Squared
    key = 'ghostedsquared',
    atlas = 'achievementtrophies',
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    reset_on_startup = false,
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,

    unlock_condition = function(self, args)
        if args.type == 'hand' then
            if #args.scoring_hand >= 10 then
                return true
            end
        end
    end
}