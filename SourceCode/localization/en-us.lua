return {
	["descriptions"] = {
		["Back"] = {
			["b_fur_randomdeck"] = {
				["name"] = "Floofy Deck",
				["text"] = {
					'Start the run with a random',
            		'{C:common}non-Mythic {C:dark_edition}Furry {C:attention}Joker',
            		'{C:green}#1# in #2#{} chance to create a {C:dark_edition}Furry',
            		'{C:attention}Joker{} when a boss blind is defeated',
            		'{C:inactive}(Must have room)',
				},
			},
			["b_fur_stargazingdeck"] = {
				["name"] = "Stargazers Deck",
				["text"] = {
					'Start the run with',
            		'{C:dark_edition,T:j_fur_astral}AstralWarden{} and {C:dark_edition,T:j_fur_sparkles}SparklesRolf{}',
            		'and {C:attention}2{} Copies of',
            		'{C:tarot,T:c_fur_fallingstar}Falling Stars',
				},
			},
			["b_fur_chipsgaloredeck"] = {
				["name"] = "Chips Galore Deck",
				["text"] = {
					'Start the run with',
            		'{C:dark_edition,T:j_fur_icesea}Ice Sea{} and {C:dark_edition,T:j_fur_cobalt}CobaltTheBluPanda{}',
            		'and {C:attention}1{} copy of',
            		'{C:tarot,T:c_heirophant}The Hierophant{} and {C:tarot,T:c_moon}The Moon',
				},
			},
		},
		["Blind"] = {
			["bl_fur_meteorblind"] = {
				["name"] = "The Meteor",
				["text"] = {
					'All Star cards',
            		'are debuffed',
				},
			},
			["bl_fur_pawblind"] = {
				["name"] = "The Paw",
				["text"] = {
					'All Furry Jokers',
            		'are debuffed',
				},
			},
		},
		["Enhanced"] = {
			["m_fur_ghostcard"] = {
				["name"] = "Ghost Card",
				["text"] = {
					'{C:attention}Always scores{}',
					'When selected, adds',
					'{C:attention}+1 Play/Discard{} limit',
				},
			},
			["m_fur_sockcard"] = {
				["name"] = "Sock Card",
				["text"] = {
					'{C:mult}+#1#{} {C:red}#2#',
            		'when scored',
				},
			},
			["m_fur_stinkcard"] = {
				["name"] = "Stinky Card",
				["text"] = {
            		'{C:attention}Always scores{}',
            		'{C:mult}Destroyed{} when played',
				},
			},
			["m_fur_silvercard"] = {
				["name"] = "Silver Card",
				["text"] = {
					'{C:chips}+#2#{} chips',
            		'{C:money}$#1#{} when scored',
				},
			},
		},
		["Joker"] = {
			["j_fur_enviousjoker"] = {
				["name"] = "Envious Joker",
				["text"] = {
					'Played cards with',
            		'{C:fur_stars}#2#{} suit give',
            		'{C:mult}+#1#{} Mult when scored',
				},
			},
			["j_fur_anxiousjoker"] = {
				["name"] = "Anxious Joker",
				["text"] = {
					'{C:mult}+#1#{} Mult if played',
                	'hand contains',
                	'a {C:attention}#2#',
				},
			},
			["j_fur_trickyjoker"] = {
				["name"] = "Tricky Joker",
				["text"] = {
					'{C:chips}+#1#{} chips if played',
                	'hand contains',
                	'a {C:attention}#2#',
				},
			},
			["j_fur_therainbow"] = {
				["name"] = "The Rainbow",
				["text"] = {
					'{X:mult,C:white}X#1#{} Mult if played',
                	'hand contains',
                	'a {C:attention}#2#',
				},
			},
			["j_fur_silver"] = {
				["name"] = "SilverSentinel",
				["text"] = {
					"Gives an extra {C:money}$#1#{} for",
            		"each scored {C:attention}Silver{} card",
            		'{C:inactive,s:0.8,E:2}#2#',
            		'{C:purple,E:1,s:0.8}twitch.tv/SilverSentinell',
				},
			},
			["j_fur_astral"] = {
				["name"] = "AstralWarden",
				["text"] = {
					'Has a {C:green}#1# in #2#{} chance to',
            		'create a {C:spectral}#5#{} card when',
            		'cards with {C:fur_stars}#4#{} suit are scored',
            		'{C:inactive}(Does not need room, may overflow){}',
            		'{C:inactive,s:0.8,E:2}#3#',
            		'{C:purple,E:1,s:0.8}twitch.tv/AstralWarden',
				},
			},
			["j_fur_ghost"] = {
				["name"] = "GhostFox",
				["text"] = {
					"{C:attention}Enhances{} non enhanced",
					"cards to {C:attention}Ghost{} cards",
					"This Fox gains {X:mult,C:white}X#2#{} Mult",
            		"when {C:attention}Ghost{} cards are scored",
            		"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
            		'{C:inactive,s:0.8,E:2}#3#',
            		'{C:purple,E:1,s:0.8}twitch.tv/GhostFawx',
				},
			},
			["j_fur_kalik"] = {
				["name"] = "KalikHusky",
				["text"] = {
					"Adds one {C:attention}Stinky{} card",
            		"to deck when {C:attention}Blind{} is selected",
            		"Gains {X:mult,C:white}X#2#{} Mult for each",
            		"{C:attention}Stinky{} card in your {C:attention}full deck",
            		"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
            		'{C:inactive,s:0.8,E:2}#3#',
            		'{C:purple,E:1,s:0.8}twitch.tv/Kalik_Husky',
				},
			},
			["j_fur_saph"] = {
				["name"] = "SaphiélleFox",
				["text"] = {
					'Has a {C:green}#1# in #2#{} chance to',
            		'create a {C:tarot}#5#{} card when',
            		'cards with {C:spades}#4#{} suit are scored',
            		'{C:inactive}(Does not need room, may overflow){}',
            		'{C:inactive,s:0.8,E:2}#3#',
            		'{C:purple,E:1,s:0.8}twitch.tv/SaphielleFox',
				},
			},
			["j_fur_cobalt"] = {
				["name"] = "CobaltTheBluPanda",
				["text"] = {
					"This Panda gives",
            		"{X:chips,C:white}X#1#{} Chips when cards",
            		"with {C:clubs}#3#{} suit are scored",
            		'{C:inactive,s:0.8,E:2}#2#',
				},
			},
			["j_fur_icesea"] = {
				["name"] = "Ice Sea",
				["text"] = {
					"This Otter gives {X:chips,C:white}X#1#{} Chips",
            		"when {C:attention}#3#{} are scored",
            		'{C:inactive,s:0.8,E:2}#2#'
				},
			},
			["j_fur_sparkles"] = {
				["name"] = "SparklesRolf",
				["text"] = {
					"This Bunny gives",
            		"{X:mult,C:white}X#1#{} Mult when cards",
            		"with {C:fur_stars}#3#{} suit are scored",
            		'{C:inactive,s:0.8,E:2}#2#',
            		'{C:purple,E:1,s:0.8}twitch.tv/SparklesRolf',
				},
			},
			["j_fur_spark"] = {
				["name"] = "SparkTheBird",
				["text"] = {
					'This Bird gives {X:mult,C:white}X#1#{} Mult',
            		'when {C:attention}2s{} of {C:attention}any suit{} OR',
            		'{C:diamonds}#4#{} of {C:attention}any rank{} are scored',
            		'{X:mult,C:white}X#2#{} Mult if a {C:attention}2 of {C:diamonds}#4#{}',
					'is scored',
            		'{C:inactive,s:0.8,E:2}#3#',
            		'{C:purple,E:1,s:0.8}twitch.tv/SparkTheBird'
				},
			},
			["j_fur_koneko"] = {
				["name"] = "The_Koneko",
				["text"] = {
					"This Cat gives",
            		"{X:mult,C:white}X#1#{} Mult when cards",
            		"with {C:hearts}#3#{} suit are scored",
            		'{C:inactive,s:0.8,E:2}#2#',
            		'{C:purple,E:1,s:0.8}twitch.tv/The_Koneko'
				},
			},
			["j_fur_curiousangel"] = {
				["name"] = "CuriousAngel",
				["text"] = {
					'Has a {C:green}#3# in #4#{} chance to apply',
            		'{C:dark_edition}#6#{} to {C:attention}scored{} cards or {C:attention}Jokers',
            		'{C:inactive}(Will not override existing editions)',
            		'This DeerFox gains {X:mult,C:white}X#2#{} Mult when',
            		'{C:dark_edition}#6#{} playing cards are scored',
            		'{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)',
            		'{C:inactive,s:0.8,E:2}#5#',
            		'{C:purple,E:1,s:0.8}twitch.tv/AngelDeerFox'
				},
			},
			["j_fur_skips"] = {
				["name"] = "DelusionalSkips",
				["text"] = {
					'Has a {C:green}#1# in #2#{} chance',
            		'to {C:attention}instantly{} win the blind',
					'{C:inactive}(Boss blinds max out at #4#/#2# odds)',
            		'When {C:attention}skipping blinds{} spawn',
            		'a {C:attention}Skips Tag{}',
            		'{C:inactive,s:0.8,E:2}#3#',
            		'{C:purple,E:1,s:0.8}twitch.tv/DelusionalSkips'
				},
			},
			["j_fur_illy"] = {
				["name"] = "illyADo",
				["text"] = {
					"This Stoat gains {X:mult,C:white}X#2#{}",
            		"mult for each {C:attention}#4#{}",
            		"scored and held in hand",
            		"during the round",
            		"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
            		'{C:inactive,s:0.8,E:2}#3#',
            		'{C:purple,E:1,s:0.8}twitch.tv/illyADo_'
				},
			},
			["j_fur_cryptidluposity"] = {
				["name"] = "Luposity",
				["text"] = {
					'This Wolf gains {X:mult,C:white}X#2#{} Mult',
                	'when {C:green}#4#{} cards are used',
                	'{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} mult)',
                	'{C:inactive,s:0.8,E:2}#3#',
                	'{C:purple,E:1,s:0.8}twitch.tv/Luposity'
				},
			},
			["j_fur_luposity"] = {
				["name"] = "Luposity",
				["text"] = {
					'This Wolf gains {X:mult,C:white}X#2#{} Mult',
                	'when {C:attention}#4#{} are used',
                	'{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} mult)',
                	'{C:inactive,s:0.8,E:2}#3#',
                	'{C:purple,E:1,s:0.8}twitch.tv/Luposity'
				},
			},
			["j_fur_soks"] = {
				["name"] = "SoksAtArt",
				["text"] = {
					"This Goat gives",
            		"{C:blue}+#1# #3#{} when {C:attention}Sock{}",
            		"cards are scored",
            		'{C:inactive,s:0.8,E:2}#2#',
            		'{C:purple,E:1,s:0.8}twitch.tv/SoksAtArt'
				},
			},
			["j_fur_talismansephirapaws"] = {
				["name"] = "SephiraPaws",
				["text"] = {
					"This Kitsune gains {X:dark_edition,C:white}^#2#{} Mult",
            		"when you {C:attention}discard{} your",
					"{C:attention}most played{} poker hand",
            		"{C:inactive}(Works once per round)",
            		"{C:inactive}(Currently {X:dark_edition,C:white}^#1#{C:inactive} Mult and{C:attention} #3#{C:inactive})",
					'{C:inactive,s:0.8,E:2}#4#',
				}
			},
			["j_fur_sephirapaws"] = {
				["name"] = "SephiraPaws",
				["text"] = {
					"This Kitsune gains {X:mult,C:white}X#2#{} Mult",
                	"for each {C:attention}playing card{} in",
                	"your {C:attention}full deck",
                	"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                	'{C:inactive,s:0.8,E:2}#3#',
				}
			},
			["j_fur_talismanxavierorjose"] = {
				["name"] = "Joseeeeee",
				["text"] = {
					'{C:green}#1# in #2#{} chance to {C:attention}enhance{} non-enhanced',
            		'cards to a {C:attention}random{} enhancement',
            		'{C:green}#1# in #3#{} chance to {C:attention}remove{} the {C:attention}enhancement{}',
            		'from scored cards for {X:money,C:white}+X#5#{} {C:money}$',
            		'At {C:attention}end of round{}, sets {C:money}${} to',
					'{C:inactive}({C:money}current ${C:inactive} x {C:money}#4#{C:inactive})',
            		'{C:inactive,s:0.8,E:2}#6#',
				},
			},
			["j_fur_xavierorjose"] = {
				["name"] = "Joseeeeee",
				["text"] = {
					'{C:green}#1# in #2#{} chance to {C:attention}enhance{} non-enhanced',
            		'cards to a {C:attention}random{} enhancement',
            		'{C:green}#1# in #3#{} chance to {C:attention}remove{} the',
            		'{C:attention}enhancement{} from scored cards for {C:money}+$#5#{}',
            		'At {C:attention}end of round{}, gives {C:money}$#4#{}',
            		'{C:inactive,s:0.8,E:2}#6#',
				},
			},
			["j_fur_foxxlyduskfur"] = {
				["name"] = "FoxxlyDuskFur",
				["text"] = {
					'This Fox gains {X:mult,C:white}X#2#{} Mult',
					'when {C:attention}rerolling{} or {C:attention}buying',
					'items from the shop',
					'{C:dark_edition}Synergy:{} Mult scales {C:attention}twice as',
					'{C:attention}fast{} if you have {C:attention}Dusk',
					'{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)',
					'{C:inactive,s:0.8,E:2}#3#',
					'{C:purple,E:1,s:0.8}twitch.tv/FoxxlyDuskFur'
				},
			},
			["j_fur_talismancorruptcuriousangel"] = {
				["name"] = "CuriousAngel (Corrupted)",
				["text"] = {
					'Applies {C:dark_edition}#4#{} to {C:attention}scored{} cards or {C:attention}Jokers',
            		'{C:inactive}(Will override existing editions)',
					'{C:inactive}(Will not target corrupt jokers)',
            		'This DeerFox gains {X:dark_edition,C:white}^#2#{} Mult when',
            		'{C:dark_edition}#4#{} playing cards are scored',
            		'{C:inactive}(Currently {X:dark_edition,C:white}^#1#{C:inactive} Mult)',
            		'{C:inactive,s:0.8,E:2}#3#',
            		'{C:purple,E:1,s:0.8}twitch.tv/AngelDeerFox'
				},
			},
			["j_fur_corruptcuriousangel"] = {
				["name"] = "CuriousAngel (Corrupted)",
				["text"] = {
					'Applies {C:dark_edition}#4#{} to {C:attention}scored{} cards or {C:attention}Jokers',
            		'{C:inactive}(Will override existing editions)',
					'{C:inactive}(Will not target corrupt jokers)',
            		'This DeerFox gains {X:mult,C:white}X#2#{} Mult when',
            		'{C:dark_edition}#4#{} playing cards are scored',
            		'{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)',
            		'{C:inactive,s:0.8,E:2}#3#',
            		'{C:purple,E:1,s:0.8}twitch.tv/AngelDeerFox'
				},
			},
			["j_fur_talismancorruptsparkles"] = {
				["name"] = "SparklesRolf (Hate)",
				["text"] = {
					'At the end of {C:attention}scoring hand{}, this Bunny',
					'scores {X:dark_edition,C:white}^#1#{} Mult and levels',
					'up {C:attention}played poker hand{} by {C:attention}#2#',
					'when cards with {C:hearts}#4#{} suit are scored',
					'{C:inactive}(Will destroy effected cards)',
					'{V:1,s:1.2,E:1}#3#',
					'{C:inactive,s:0.8,E:1}AU: {C:attention,s:0.8,E:1}UNDERTALE',
					'{C:purple,E:1,s:0.8}twitch.tv/SparklesRolf'
				},
			},
			["j_fur_corruptsparkles"] = {
				["name"] = "SparklesRolf (Hate)",
				["text"] = {
					'At the end of {C:attention}scoring hand{}, this Bunny',
					'scores {X:mult,C:white}X#1#{} Mult and levels',
					'up {C:attention}played poker hand{} by {C:attention}#2#',
					'when cards with {C:hearts}#4#{} suit are scored',
					'{C:inactive}(Will destroy effected cards)',
					'{V:1,s:1.2,E:1}#3#',
					'{C:inactive,s:0.8,E:1}AU: {C:attention,s:0.8,E:1}UNDERTALE',
					'{C:purple,E:1,s:0.8}twitch.tv/SparklesRolf'
				},
			},
		},
		["Mod"] = {
			["Furlatro"] = {
				["name"] = "Furlatro",
				["text"] = {
					"{C:edition,E:1,s:1.3}THE{} Furry modpack for balatro. A passion side project brought to life!",
					" ",
					"Introduces {C:attention}20 {C:dark_edition,E:1,s:1.3}Furry{} Jokers, each with unique effects!",
					"Adds a new rarity: {C:blue,E:1,s:1.3}Mythic{}! These are ultra powerful jokers",
					"that can elevate your score to new heights",
					" ",
					"Coding by myself with some functions and lines from other mods,",
					"all of which are credited here and in the code next to their lines!",
					"{C:attention,E:2,s:1.3}Cryptid{}, {C:attention,E:2,s:1.3}SixSuits{}, and {C:attention,E:2,s:1.3}VanillaRemade{}",
					" ",
					"All artists are credited on their respective cards! Go check them out!",
					"Face card art by {C:attention,E:2,s:1.3}Yrense{} on Vgen",
					" ",
					"Want a custom {C:attention,E:2,s:1.3}Furry Joker{}",
					"assist with {C:attention,E:2,s:1.3}Localization{}, or to just chat with others. Join the Discord! <3",
					"{C:white,E:1,s:1.5}discord.gg/fCnxr4dWfh",
				},
			},
		},
		["Other"] = {
			["p_fur_miniuncommon"] = {
				["name"] = "Mini Uncommon Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:uncommon}Uncommon {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_uncommon"] = {
				["name"] = "Uncommon Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:uncommon}Uncommon {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_jumbouncommon"] = {
				["name"] = "Jumbo Uncommon Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:uncommon}Uncommon {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_specialuncommon"] = {
				["name"] = "Special Uncommon Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:uncommon}Uncommon {C:dark_edition}Furry{} Jokers',
					'with a guranteed {C:attention}edition',
				},
			},
			["p_fur_minirare"] = {
				["name"] = "Mini Rare Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:rare}Rare {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_rare"] = {
				["name"] = "Rare Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:rare}Rare {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_jumborare"] = {
				["name"] = "Jumbo Rare Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:rare}Rare {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_specialrare"] = {
				["name"] = "Special Rare Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:rare}Rare {C:dark_edition}Furry{} Jokers',
					'with a guranteed {C:attention}edition',
				},
			},
			["p_fur_minilegendary"] = {
				["name"] = "Mini Legendary Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:legendary}Legendary {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_legendary"] = {
				["name"] = "Legendary Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:legendary}Legendary {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_jumbolegendary"] = {
				["name"] = "Jumbo Legendary Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:legendary}Legendary {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_speciallegendary"] = {
				["name"] = "Special Legendary Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:legendary}Legendary {C:dark_edition}Furry{} Jokers',
					'with a guranteed {C:attention}edition',
				},
			},
			["p_fur_minimythic"] = {
				["name"] = "Mini Mythic Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:common}Mythic {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_mythic"] = {
				["name"] = "Mythic Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:common}Mythic {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_jumbomythic"] = {
				["name"] = "Jumbo Mythic Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:common}Mythic {C:dark_edition}Furry{} Jokers'
				},
			},
			["p_fur_specialmythic"] = {
				["name"] = "Special Mythic Furry Pack",
				["text"] = {
					'Choose {C:attention}#2#{} of up to {C:attention}#1#{} ',
            		'{C:common}Mythic {C:dark_edition}Furry{} Jokers',
					'with a guranteed {C:attention}edition',
				},
			},
			["fur_redpawseal_seal"] = {
				["name"] = "Paw Seal (Red)",
				["label"] = "Paw Seal",
				["text"] = {
					'Scores {X:mult,C:white}X#1#{} Mult',
				},
			},
			["fur_bluepawseal_seal"] = {
				["name"] = "Paw Seal (Blue)",
				["label"] = "Paw Seal",
				["text"] = {
					'Scores {X:chips,C:white}X#1#{} chips',
				},
			},
			["fur_orangepawseal_seal"] = {
				["name"] = "Paw Seal (Orange)",
				["label"] = "Paw Seal",
				["text"] = {
					'Scores {X:chips,C:white}X#2#{} chips and {X:mult,C:white}X#1#{} Mult',
            		'Gives {C:money}$#3#{}',
            		'{C:green}#6# in #4#{} chance for a {C:tarot}#7#{} card',
            		'{C:green}#6# in #5#{} chance for a {C:spectral}#8#{} card',
            		'{C:inactive}(Consumables may overflow)',
				},
			},
		},
		["Planet"] = {
			["c_fur_kepler62e"] = {
				["name"] = "Kepler-62e",
				["text"] = {
					'({V:1}lvl.#1#{}) Level up',
                	'{C:attention}Spectrum',
                	'{C:mult}+2{} Mult and',
                	'{C:chips}+15{} chips',
				},
			},
			["c_fur_kepler62f"] = {
				["name"] = "Kepler-62f",
				["text"] = {
					'({V:1}lvl.#1#{}) Level up',
                	'{C:attention}Straight Spectrum',
                	'{C:mult}+3{} Mult and',
                	'{C:chips}+35{} chips',
				},
			},
			["c_fur_kepler22b"] = {
				["name"] = "Kepler-22b",
				["text"] = {
					'({V:1}lvl.#1#{}) Level up',
                	'{C:attention}Spectrum House',
                	'{C:mult}+3{} Mult and',
                	'{C:chips}+35{} chips',
				},
			},
			["c_fur_kepler20e"] = {
				["name"] = "Kepler-20e",
				["text"] = {
					'({V:1}lvl.#1#{}) Level up',
                	'{C:attention}Spectrum Five',
                	'{C:mult}+4{} Mult and',
                	'{C:chips}+40{} chips',
				},
			},
		},
		["Sleeve"] = {
			["sleeve_fur_floofysleeve"] = {
				["name"] = "Floofy Sleeve",
				["text"] = {
					'Start the run with a random',
            		'{C:common}non-Mythic {C:dark_edition}Furry {C:attention}#1#',
            		'{C:green}#4# in #5#{} chance to create a {C:dark_edition}Furry',
            		'{C:attention}#1#{} when a boss blind is defeated',
            		'{C:inactive}(Must have room)',
				},
			},
			["sleeve_fur_floofysleeve_alt"] = {
				["name"] = "Floofy Sleeve",
				["text"] = {
					'{C:common}Mythic {C:dark_edition}Furries{} can now appear',
					'when starting the run',
					'{C:dark_edition}Furry {C:attention}#2#{} spawned from bosses',
					'have a guaranteed {C:attention}#3#',
				},
			},
			["sleeve_fur_stargazerssleeve"] = {
				["name"] = "Stargazing Sleeve",
				["text"] = {
					'Start the run with',
            		'{C:dark_edition,T:j_fur_astral}AstralWarden{} and {C:dark_edition,T:j_fur_sparkles}SparklesRolf{}',
            		'and {C:attention}2{} Copies of',
            		'{C:tarot,T:c_fur_fallingstar}Falling Stars',
				},
			},
			["sleeve_fur_stargazerssleeve_alt"] = {
				["name"] = "Stargazing Sleeve",
				["text"] = {
					'Convert a {C:attention}random{} suit to {C:fur_stars}Star{} suit',
					'{C:inactive}(If enabled)',
					'Spawns {C:attention}2{} random {C:spectral}#1#{} cards',
					'instead of {C:tarot,T:c_fur_fallingstar}Falling Stars{}',
					'{C:inactive}(Except hidden cards like {C:spectral,T:c_soul}The Soul{C:inactive})'
				},
			},
			["sleeve_fur_chipsgaloresleeve"] = {
				["name"] = "Chips Galore Sleeve",
				["text"] = {
					'Start the run with',
            		'{C:dark_edition,T:j_fur_icesea}Ice Sea{} and {C:dark_edition,T:j_fur_cobalt}CobaltTheBluPanda{}',
            		'and {C:attention}1{} copy of',
            		'{C:tarot,T:c_heirophant}The Heirophant{} and {C:tarot,T:c_moon}The Moon',
				},
			},
			["sleeve_fur_chipsgaloresleeve_alt"] = {
				["name"] = "Chips Galore Sleeve",
				["text"] = {
					'Apply {C:dark_edition,T:e_foil}#3#{} edition to starting {C:attention}#1#',
					'Convert a {C:attention}random{} suit to {C:clubs}#2#{} suit',
					'Start the run with an additional {C:spectral,T:c_black_hole}Black Hole'
				},
			},
		},
		["Spectral"] = {
			["c_fur_kingme"] = {
				["name"] = "King Me!",
				["text"] = {
					"Converts up to",
            		"{C:attention}#1#{} selected cards",
            		"to {C:attention}Kings{}",
				},
			},
			["c_fur_floofball"] = {
				["name"] = "Floofball",
				["text"] = {
					"Creates a random",
            		"{C:dark_edition}Furry{} {C:attention}Joker{}",
            		"Sets money to {C:money}$0{}",
            		"{C:inactive}(Must have room)",
				},
			},
			["c_fur_rednotarystamp"] = {
				["name"] = "Notary Stamp (Red)",
				["text"] = {
					'Add a {C:attention}Paw Seal (Red)',
            		'to {C:attention}#1#{} selected',
            		'card in your hand',
				},
			},
			["c_fur_bluenotarystamp"] = {
				["name"] = "Notary Stamp (Blue)",
				["text"] = {
					'Add a {C:attention}Paw Seal (Blue)',
            		'to {C:attention}#1#{} selected',
            		'card in your hand',
				},
			},
			["c_fur_orangenotarystamp"] = {
				["name"] = "Notary Stamp (Orange)",
				["text"] = {
					'Add a {C:attention}Paw Seal (Orange)',
            		'to {C:attention}#1#{} selected',
            		'card in your hand',
				},
			},
		},
		["Tag"] = {
			["tag_fur_furrytag"] = {
				["name"] = "Paw Tag",
				["text"] = {
					'Shop has a free',
            		'{C:dark_edition}Furry{} Joker',
				},
			},
			["tag_fur_foilfurrytag"] = {
				["name"] = "Foil Paw Tag",
				["text"] = {
					'Shop has a free',
            		'{C:dark_edition}#1# Furry{} Joker',
				},
			},
			["tag_fur_holofurrytag"] = {
				["name"] = "Holo Paw Tag",
				["text"] = {
					'Shop has a free',
            		'{C:dark_edition}#1# Furry{} Joker',
				},
			},
			["tag_fur_polyfurrytag"] = {
				["name"] = "Polychrome Paw Tag",
				["text"] = {
					'Shop has a free',
            		'{C:dark_edition}#1# Furry{} Joker',
				},
			},
			["tag_fur_negativefurrytag"] = {
				["name"] = "Negative Paw Tag",
				["text"] = {
					'Shop has a free',
            		'{C:dark_edition}#1# Furry{} Joker',
				},
			},
			["tag_fur_skipstag"] = {
				["name"] = "Skips Tag",
				["text"] = {
					'Gives a free',
            		'random {C:dark_edition}Furry{} Pack',
				},
			},
		},
		["Tarot"] = {
			["c_fur_fallingstar"] = {
				["name"] = "Falling Star",
				["text"] = {
					'Converts up to',
            		'{C:attention}#1#{} selected cards',
            		'to {C:fur_stars}#2#{}',
				},
			},
			["c_fur_spirits"] = {
				["name"] = "Ghost spirits",
				["text"] = {
					'Enhances up to',
            		'{C:attention}#1#{} selected cards',
            		'to {C:attention}Ghost{} cards',
				},
			},
			["c_fur_playingsocks"] = {
				["name"] = "Playing Socks",
				["text"] = {
					'Enhances up to',
            		'{C:attention}#1#{} selected cards',
            		'to {C:attention}Sock{} cards',
				},
			},
			["c_fur_treasurechest"] = {
				["name"] = "Treasure Chest",
				["text"] = {
					'Enhances up to',
            		'{C:attention}#1#{} selected cards',
            		'to {C:attention}Silver{} cards',
				},
			},
		},
		["thedarkness"] = {
			["c_fur_thedarknessconsumesyou"] = {
				["name"] = "???",
			}
		},
	},

	["misc"] = {
		["achievement_descriptions"] = {
			["ach_fur_darksideofthedeck"] = {
				'Have at least 52 Negative cards',
            	'in your deck in a single run',
			},
			["ach_fur_thedreamteam"] = {
				'Have SparklesRolf, illyADo,',
            	'and GhostFox in a single run',
			},
			["ach_fur_closetedfurry"] = {
				'Defeat The Paw without',
            	'Furry Jokers',
			},
			["ach_fur_againstallodds"] = {
				'Defeat The Paw with at',
            	'least 4 Furry Jokers',
			},
			["ach_fur_imouttahere"] = {
				'Win a blind with the',
            	'effect of DelusionalSkips',
			},
			["ach_fur_savedbythebuzzer"] = {
				'Win a boss blind with the',
            	'effect of DelusionalSkips',
			},
			["ach_fur_heartofthechips"] = {
				'Apply Foil Edition',
            	'to Ice Sea',
			},
			["ach_fur_thewholegang"] = {
				'Have all Furry Jokers',
            	'in a single run',
			},
			["ach_fur_e621"] = {
				'Score exactly e621 in a single hand',
				'*Requires Talisman*',
			},
			["ach_fur_doubledown"] = {
				'Discard 10 or more',
            	'cards at once',
			},
			["ach_fur_maxedout"] = {
				'Win both Mult Maxing and',
            	'Chips Maxing Challenges',
			},
			["ach_fur_ineedashower"] = {
				'Have at least 26 Stinky cards',
            	'in your deck in a single run',
			},
			["ach_fur_ghosted"] = {
				'Play a hand of 5 or',
            	'more Ghost cards',
			},
			["ach_fur_enhancedspectrum"] = {
				'Score each Furlatro enhanced',
            	'card in a single hand',
			},
			["ach_fur_youaregae"] = {
				'Why Are You Gae',
			},
			["ach_fur_ultimatecollector"] = {
				'Have all Mythic Furries',
            	'in a single run',
			},
			["ach_fur_dirtylaundry"] = {
				'Score a Sock card',
            	'with a Stinky card',
			},
			["ach_fur_welcometothefandom"] = {
				'Have 1 Furry Joker',
			},
			["ach_fur_ghostedsquared"] = {
				'Score 10 or more cards',
            	'in a single hand',
			},
			["ach_fur_fursuitmoney"] = {
				'Have at least $3500+',
            	'in a single run',
			},
		},
		["achievement_names"] = {
			["ach_fur_darksideofthedeck"] = "Dark Side of the Deck",
			["ach_fur_thedreamteam"] = "The Dream Team",
			["ach_fur_closetedfurry"] = "Closeted Furry",
			["ach_fur_againstallodds"] = "Against All Odds",
			["ach_fur_imouttahere"] = "I'm Outta Here",
			["ach_fur_savedbythebuzzer"] = "Saved by the Buzzer",
			["ach_fur_heartofthechips"] = "Heart of the Chips",
			["ach_fur_thewholegang"] = "The Whole Gang",
			["ach_fur_e621"] = "e621",
			["ach_fur_doubledown"] = "Double Down",
			["ach_fur_maxedout"] = "Maxed out",
			["ach_fur_ineedashower"] = "I Need a Shower",
			["ach_fur_ghosted"] = "Ghosted",
			["ach_fur_enhancedspectrum"] = "Enhanced Spectrum",
			["ach_fur_youaregae"] = "You Are Gae",
			["ach_fur_ultimatecollector"] = "Ultimate Collector",
			["ach_fur_dirtylaundry"] = "Dirty Laundry",
			["ach_fur_welcometothefandom"] = "Welcome to the Fandom",
			["ach_fur_ghostedsquared"] = "Ghosted Squared",
			["ach_fur_fursuitmoney"] = "Fursuit Money",
		},
		["challenge_names"] = {
			["c_fur_challengechipsmaxing"] = "Chips Maxing",
			["c_fur_challengemultmaxing"] = "Mult Maxing",
			["c_fur_challengenegativenancy"] = "Negative Nancy",
		},
		["collabs"] = {
			["Clubs"] = {
				["8"] = "Furlatro (The Dream Team)",
			},
			["Diamonds"] = {
				["8"] = "Furlatro (The Dream Team)",
			},
			["Hearts"] = {
				["8"] = "Furlatro (The Dream Team)",
			},
			["Spades"] = {
				["8"] = "Furlatro (The Dream Team)",
			},
			["fur_stars"] = {
				["2"] = "Furlatro (The Dream Team)",
			},
		},
		["dictionary"] = {
			["k_fur_rarityfurry"] = "Furry",
			["fur_startoggle"] = "Start With Star Suit",
			["fur_pokerhands"] = "Expanded Poker Hands",
			["fur_complexjokers"] = "Complex Joker Bases",
			["fur_smallersouls"] = "Smaller Joker Souls",
			["fur_jokerquotes"] = "Show Joker Quotes",
			["fur_restartrequired"] = "*Requires Restart*",
			["fur_restartrecommended"] = "*Restart Recommended*",

			["fur_kalikstink"] = "Kalik Stink!",
			["fur_angelnegated"] = "Negated!",
			["fur_skipstag"] = "+Skips Tag",
			["fur_ghostcardtrigger"] = "Ghosted!",
			["fur_corrupted"] = "Corrupted!",

			["fur_enhanced"] = "Enhanced!",
			["fur_cleansed"] = "Cleansed!",
			["fur_ghostcard"] = "Ghost Cards",
			["fur_sockcard"] = "Sock Cards",
			["fur_stinkycard"] = "Stinky Cards",
			["fur_silvercard"] = "Silver Cards",
			["fur_bonuscard"] = "Bonus Cards",

			["fur_plusconsumable"] = "Consumable",
			["fur_consumableused"] = "Consumable Used",
			["fur_codeused"] = "Code Used",
			["fur_skipstext"] = "Blind Win",
			["fur_joker"] = "Joker",
		},
		["labels"] = {
			["k_fur_rarityfurry"] = "Furry",
			["fur_mythic"] = "Mythic",
			["fur_corrupt"] = "Corrupted",
			["fur_redpawseal_seal"] = "Paw Seal",
			["fur_bluepawseal_seal"] = "Paw Seal",
			["fur_orangepawseal_seal"] = "Paw Seal",
		},
		["poker_hand_descriptions"] = {
			["fur_spectrum"] = {
				'5 cards that have',
                'unique suits',
			},
			["fur_straightspectrum"] = {
				'5 cards that have',
                'unique suits and are in a',
                'row (consecutive ranks)',
			},
			["fur_spectrumhouse"] = {
				'5 cards that have',
                'unique suits with a',
                'Three of a Kind and a pair',
			},
			["fur_spectrumfive"] = {
				'5 cards that share the same',
                'rank and has unique suits',
			},
		},
        ["poker_hands"] = {
			["fur_spectrum"] = "Spectrum",
			["fur_straightspectrum"] = "Straight Spectrum",
			["fur_straightspectrum_2"] = "Royal Spectrum",
			["fur_spectrumhouse"] = "Spectrum House",
			["fur_spectrumfive"] = "Spectrum Five",
		},
		["suits_plural"] = {
			["fur_stars"] = "Stars",
		},
		["suits_singular"] = {
			["fur_stars"] = "Star",
		},
		["v_text"] = {
			["ch_c_fur_no_mult"] = {"All {C:mult}Mult{} related cards are banned"},
			["ch_c_fur_no_chips"] = {"All {C:chips}Chips{} related cards are banned"},
			["ch_c_fur_planet_exception"] = {"except {C:planet}Planet{} cards"},
			["ch_c_fur_curiousangel_start"] = {"Start the run with an {C:legendary}Eternal{} {X:dark_edition,C:white}CuriousAngel"},
		},
    },
}