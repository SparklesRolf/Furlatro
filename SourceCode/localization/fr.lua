return {
	["descriptions"] = {
		["Back"] = {
			["b_fur_randomdeck"] = {
				["name"] = "Floofy Deck",
				["text"] = {
					'Start the run with a random',
            		'non-{C:common}Mythic {C:dark_edition}Furry Joker',
            		'{C:green}#1# in #2#{} chance to create a {C:dark_edition}Furry',
            		'Joker when a boss blind is defeated',
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
			["b_fur_corrupteddeck"] = {
				["name"] = "Corrupted Deck",
				["text"] = {
					"Start the run with",
					"a random discovered {V:1}Corrupted{} Joker",
					"At the {C:attention}end{} of calculation",
					"{V:1}corrupt{} chips and Mult",
				},
				["unlock"] = {
					"Use ???",
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
            		'{C:inactive}(Must have room)',
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
            		'{C:inactive}(Must have room)',
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
            		'when {C:attention}2s{} of {C:attention}any suit{} or',
            		'{C:diamonds}#4#{} of {C:attention}any rank{} are scored',
            		'{X:mult,C:white}X#2#{} Mult if a {C:attention}2{} of {C:diamonds}#4#{}',
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
					'{C:inactive}(Boss blinds max out at 4/#4# odds)',
            		'When {C:attention}skipping blinds{} spawn',
            		'a {C:attention}Skips Tag{}',
            		'{C:inactive,s:0.8,E:2}#3#',
            		'{C:purple,E:1,s:0.8}twitch.tv/DelusionalSkips'
				},
			},
			["j_fur_multiplayerskips"] = {
				["name"] = "DelusionalSkips",
				["text"] = {
					'Has a {C:green}#1# in #2#{} chance',
            		'to {C:attention}instantly{} win non-boss blinds',
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
            		"Mult for each {C:attention}#4#{}",
            		"{C:attention}scored{} and {C:attention}held in hand",
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
            		'At {C:attention}end of round{}, gives {C:money}${} equal to',
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
			["j_fur_talismankris57"] = {
				["name"] = "Kris_57",
				["text"] = {
					"When a {C:attention}5{} is scored, this Joker",
                	"gains {X:dark_edition,C:white}^#4#{} Mult",
					"When a {C:attention}7{} is scored, this Joker",
                	"gains {X:dark_edition,C:white}^#3#{} chips",
					"{C:dark_edition}Synergy:{} Gives {C:money}$#6#{} when you score",
					"a {C:attention}5{} or {C:attention}7{} if you have {C:dark_edition}Iridia",
                	"{C:inactive}(Currently {X:dark_edition,C:white}^#1#{C:inactive} chips and {X:dark_edition,C:white}^#2#{C:inactive} Mult)",
					"{C:inactive,s:0.8,E:2}#5#",
				},
			},
			["j_fur_kris57"] = {
				["name"] = "Kris_57",
				["text"] = {
					"When a {C:attention}5{} is scored, this Joker",
                	"gains {X:red,C:white}X#4#{} Mult",
					"When a {C:attention}7{} is scored, this Joker",
                	"gains {X:chips,C:white}X#3#{} chips",
					"{C:dark_edition}Synergy:{} Gives {C:money}$#6#{} when you score",
					"a {C:attention}5{} or {C:attention}7{} if you have {C:dark_edition}Iridia",
                	"{C:inactive}(Currently {X:chips,C:white}X#1#{C:inactive} chips and {X:mult,C:white}X#2#{C:inactive} Mult)",
					"{C:inactive,s:0.8,E:2}#5#",
				},
			},
			["j_fur_talismansourstone3"] = {
				["name"] = "Sourstone :3",
				["text"] = {
					"When this Protogen is in the",
                	"{C:attention}leftmost{} slot, gain {C:money}$#1#",
                	"When this Protogen is in the",
                	"{C:attention}rightmost{} slot, spend {C:money}$#1#",
                	"to score {X:dark_edition,C:white}^#2#{} Mult",
					"{C:inactive,s:0.8,E:2}#3#",
				},
			},
			["j_fur_sourstone3"] = {
				["name"] = "Sourstone :3",
				["text"] = {
					"When this Protogen is in the",
                	"{C:attention}leftmost{} slot, gain {C:money}$#1#",
                	"When this Protogen is in the",
                	"{C:attention}rightmost{} slot, spend {C:money}$#1#",
                	"to score {X:mult,C:white}X#2#{} Mult",
					"{C:inactive,s:0.8,E:2}#3#",
				},
			},
			["j_fur_talismandanny"] = {
				["name"] = "Danny",
				["text"] = {
					"This CatDragon {C:attention}debuffs{} all non-{C:fur_stars}#3#{} cards",
                	"For each {C:attention}played hand{} that contains a {C:attention}Flush{}, add",
                	"{X:dark_edition,C:white}^#2#{} Mult and apply a {C:blue}Blue Paw Seal{} to {C:attention}scored cards",
                	"Each {C:attention}scored {C:fur_stars}#3#{} card gives {X:dark_edition,C:white}^#1#{} Mult",
					"{C:inactive,s:0.8,E:2}#4#",
				},
			},
			["j_fur_danny"] = {
				["name"] = "Danny",
				["text"] = {
					"This CatDragon {C:attention}debuffs{} all non-{C:fur_stars}#3#{} cards",
                	"For each {C:attention}played hand{} that contains a {C:attention}Flush{}, add",
                	"{X:mult,C:white}X#2#{} Mult and apply a {C:blue}Blue Paw Seal{} to {C:attention}scored cards",
                	"Each {C:attention}scored {C:fur_stars}#3#{} card gives {X:mult,C:white}X#1#{} Mult",
					"{C:inactive,s:0.8,E:2}#4#",
				},
			},
			["j_fur_diablo2324"] = {
				["name"] = "Diablo2324",
				["text"] = {
					"{C:dark_edition}Furry{} Jokers",
            		"each give {X:mult,C:white}X#1#{} Mult",
            		"{C:inactive,s:0.8,E:2}#2#",
					"{C:purple,E:1,s:0.8}twitch.tv/Diablo23244"
				},
			},
			["j_fur_nemzata"] = {
				["name"] = "Nemzata",
				["text"] = {
					"When a card is {C:attention}eliminated{} by {C:attention}Nemz's Bow",
            		"this Dragon gives {C:money}#2#{} coins {C:inactive}[{C:money}$#1#{C:inactive}]",
            		"{C:inactive}(Will remove Nemz's Bow when sold)",
            		"{C:inactive,s:0.8,E:2}#3#",
				},
			},
			["j_fur_talismancorruptdanny"] = {
				["name"] = "Danny (Corrupted)",
				["text"] = {
					"This CatDragon {C:attention}debuffs{} all non-{C:fur_stars}#3#{} cards",
                	"{C:red}Destroys{} all non-{C:fur_stars}#3#{} cards in hand {C:attention}after{} playing a hand",
                	"For each {C:attention}played hand{} that contains a {C:attention}Flush{}, add",
                	"{X:dark_edition,C:white}^#2#{} Mult, {C:dark_edition}#4#{}, and a {C:blue}Blue Paw Seal{} to {C:attention}scored cards",
                	"Each {C:attention}scored {C:fur_stars}#3#{} card gives {X:dark_edition,C:white}^#1#{} Mult",
                	"{C:inactive,s:0.8,E:2}#5#",
				},
			},
			["j_fur_corruptdanny"] = {
				["name"] = "Danny (Corrupted)",
				["text"] = {
					"This CatDragon {C:attention}debuffs{} all non-{C:fur_stars}#3#{} cards",
                	"{C:red}Destroys{} all non-{C:fur_stars}#3#{} cards in hand {C:attention}after{} playing a hand",
                	"For each {C:attention}played hand{} that contains a {C:attention}Flush{}, add",
                	"{X:mult,C:white}X#2#{} Mult, {C:dark_edition}#4#{}, and a {C:blue}Blue Paw Seal{} to {C:attention}scored cards",
                	"Each {C:attention}scored {C:fur_stars}#3#{} card gives {X:mult,C:white}X#1#{} Mult",
					"{C:inactive,s:0.8,E:2}#5#",
				},
			},
			["j_fur_iridia"] = {
				["name"] = "Iridia",
				["text"] = {
					"This Joker scores {X:chips,C:white}X#1#{} chips and",
            		"{X:mult,C:white}X#2#{} Mult when {C:attention}playing {C:attention}cards{} are scored",
					"{C:dark_edition}Synergy:{} Gives a {C:planet}#4#{} card for",
					"played {C:attention}poker hand{} if you have {C:dark_edition}Kris_57",
					"{C:inactive}(Must have room)",
            		"{C:inactive,s:0.8,E:2}#3#",
					"{C:inactive,s:0.8,E:1}OC: {C:attention,s:0.8,E:1}Kris_57",
				}
			},
			["j_fur_maltnoodlez"] = {
				["name"] = "MaltNoodlez",
				["text"] = {
					"When {C:attention}selecting blinds{} this Bunny {C:red}debuffs",
            		"one {C:attention}random{} Joker until {C:attention}end of round",
            		"{C:inactive}(Excluding itself)",
					"While {C:attention}playing a round{}, copy the",
            		"ability of the {C:attention}rightmost{} Joker",
            		"{C:inactive,s:0.8,E:2}#1#",
		    		"{C:purple,E:1,s:0.8}twitch.tv/MaltNoodlez",
				},
			},
			["j_fur_talismancorrputsephirapaws"] = {
				["name"] = "SephiraPaws (Corrupted)",
				["text"] = {
					"This Kitsune gains {X:dark_edition,C:white}^Mult{} depending",
                	"on your {C:attention}discarded{} poker hand",
                	"{C:inactive}(Ranges from {X:dark_edition,C:white}+^#1#{C:inactive} to {X:dark_edition,C:white}+^#2#{C:inactive} Mult x {C:attention}Poker Hand lvl{C:inactive})",
                	"{C:inactive}(Currently {X:dark_edition,C:white}^#3#{C:inactive} Mult)",
                	"{C:inactive,s:0.8,E:2}#4#",
				},
			},
			["j_fur_corrputsephirapaws"] = {
				["name"] = "SephiraPaws (Corrupted)",
				["text"] = {
					"This Kitsune gains {X:mult,C:white}XMult{} depending",
                	"on your {C:attention}discarded{} poker hand",
                	"{C:inactive}(Ranges from {X:mult,C:white}+X#1#{C:inactive} to {X:mult,C:white}+X#2#{C:inactive} Mult x {C:attention}Poker Hand lvl{C:inactive})",
                	"{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)",
                	"{C:inactive,s:0.8,E:2}#4#",
				},
			},
			["j_fur_schnackiofficial"] = {
				["name"] = "SchnackiOfficial",
				["text"] = {
					"This Folf gives",
            		"{X:mult,C:white}X#1#{} Mult when cards",
            		"with {C:spades}#3#{} suit are scored",
					"{C:dark_edition}Synergy:{C:attention} Multiply{} the Mult given by",
					"{X:mult,C:white}X1.5{} if you have {C:attention}Ice Cream",
            		"{C:inactive,s:0.8,E:2}#2#",
            		"{C:purple,E:1,s:0.8}twitch.tv/SchnackiOfficial",
				},
			},
			["j_fur_parrotdash"] = {
				["name"] = "Parrot Dash",
				["text"] = {
					"This Fox gives {C:mult}+Mult{} using the below formula",
            		"{C:mult}#1#{C:inactive} + ({C:attention}#4#{C:inactive} x {C:attention}#5#{C:inactive})",
            		"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
            		"{C:inactive,s:0.8,E:2}#3#",
            		"{C:purple,E:1,s:0.8}twitch.tv/Parrot_Dash",
            		"{C:red,E:1,s:0.8}youtube.com/@ParrotDash",
				},
			},
			["j_fur_lume"] = {
				["name"] = "Lume",
				["text"] = {
					"{C:attention}Enhances{} non enhanced",
            		"{C:attention}#2#{} to {C:attention}Prince{} cards",
            		"For every scored {C:attention}Prince{} card",
            		"this DragonCat gives {X:mult,C:white}X#1#{} Mult",
            		"{C:inactive,s:0.8,E:2}#3#",
            		"{C:purple,E:1,s:0.8}twitch.tv/Lume",
				},
			},
		},
		["Mod"] = {
			["Furlatro"] = {
				["name"] = "Furlatro",
				["text"] = {
					"{C:edition,E:1,s:1.3}THE{} Furry modpack for balatro. A passion side project brought to life!",
					" ",
					"Introduces {C:attention}32 {C:dark_edition,E:1,s:1.3}Furry{} Jokers, each with unique effects!",
					"Adds a new rarity: {C:blue,E:1,s:1.3}Mythic{}! These are ultra powerful jokers",
					"that can elevate your score to new heights",
					" ",
					"Coding by myself with some functions and lines from other mods,",
					"all of which are credited here and in the code next to their lines!",
					"{C:attention,E:2,s:1.3}Cryptid{}, {C:attention,E:2,s:1.3}SixSuits{}, {C:attention,E:2,s:1.3}VanillaRemade{}, {C:attention,E:2,s:1.3}SpectrumFramework{}, and {C:attention,E:2,s:1.3}PartnerAPI{}",
					" ",
					"All artists are credited on their respective cards! Go check them out!",
					"Face card art by {C:attention,E:2,s:1.3}Yrense{} on Vgen",
					" ",
					"Want a custom {C:attention,E:2,s:1.3}Furry Joker{}",
					"assist with {C:attention,E:2,s:1.3}Localization{}, or to just chat with others. Join the Discord! <3",
					"{s:0.9}Click to join:{C:dark_edition,E:1,s:1.5}https://discord.gg/fCnxr4dWfh{}",
					" ",
					"Huge thanks to the localization helpers below <3",
					"{C:attention}FR{}: Luria12",
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
					'with a guaranteed {C:attention}edition',
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
					'with a guaranteed {C:attention}edition',
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
					'with a guaranteed {C:attention}edition',
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
					'with a guaranteed {C:attention}edition',
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
            		'{C:inactive}(Must have room)',
				},
			},
		},
		["Partner"] = {
			["pnr_fur_sparklespartner"] = {
				["name"] = "SparklesRolf",
				["text"] = {
					"First {C:attention}scored card{}",
					"with {C:fur_stars}#3#{} suit",
					"gives {X:mult,C:white}X#1#{} Mult",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SparklesRolf{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_sparklespartner_alt"] = {
				["name"] = "SparklesRolf",
				["text"] = {
					"First {C:attention}scoring card{} with {C:fur_stars}#3#",
					"suit spawns a {C:tarot,T:c_fur_fallingstar}Falling Star",
					"{C:inactive}(Works once per round)",
					"{C:inactive}(Currently {C:attention}#2#{C:inactive})",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SparklesRolf{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_illypartner"] = {
				["name"] = "illyADo",
				["text"] = {
					"First {C:attention}scored card{} with",
					"{C:attention}#3#{} rank increases",
					"Mult by {X:mult,C:white}X#2#{}",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}illyADo{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_illypartner_alt"] = {
				["name"] = "illyADo",
				["text"] = {
					"All {C:attention}#4#{} are",
					"treated as {C:attention}#3#{} rank",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}illyADo{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_ghostpartner"] = {
				["name"] = "GhostFox",
				["text"] = {
					"First {C:attention}scored card{} will",
					"be enhanced to",
					"a {C:attention}Ghost Card",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}GhostFox{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_ghostpartner_alt"] = {
				["name"] = "GhostFox",
				["text"] = {
					"{C:dark_edition}GhostFox{} scales at",
					"{C:attention}double{} the rate",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}GhostFox{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_sokspartner"] = {
				["name"] = "SoksAtArt",
				["text"] = {
					"Every {C:attention}3rd{} scored",
					"{C:attention}Sock Card{} gives",
					"{C:blue}+1 #2#",
					"{C:inactive}({C:attention}#1# {C:inactive}remaining)"
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SoksAtArt{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_sokspartner_alt"] = {
				["name"] = "SoksAtArt",
				["text"] = {
					"{C:attention}Doubles{} the {C:blue}#2#",
					"given by {C:dark_edition}SoksAtArt"
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SoksAtArt{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_kalikpartner"] = {
				["name"] = "KalikHusky",
				["text"] = {
					"Every {C:attention}2nd{} round",
					"will spawn a {C:attention}Stinky Card",
					"{C:inactive}({C:attention}#1# {C:inactive}remaining)",
					"Gains {X:mult,C:white}X#3#{} Mult per",
					"{C:attention}Stinky Card{} in deck",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}KalikHusky{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_kalikpartner_alt"] = {
				["name"] = "KalikHusky",
				["text"] = {
					"{C:dark_edition}KalikHusky{} scales at",
					"{C:attention}four times{} the rate",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}KalikHusky{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_silverpartner"] = {
				["name"] = "SilverSentinel",
				["text"] = {
					"Gives an extra {C:money}$#1#{} for",
            		"each scored {C:attention}Silver{} card",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SilverSentinel{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_silverpartner_alt"] = {
				["name"] = "SilverSentinel",
				["text"] = {
					"First {C:attention}Silver Card scored{}",
					"spawns a {C:tarot,T:c_fur_treasurechest}Treasure Chest",
					"{C:inactive}(Works once per round)",
					"{C:inactive}(Currently {C:attention}#2#{C:inactive})",
					"{C:dark_edition}SilverSentinel{} also gives",
					"{C:attention}double{} the money",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SilverSentinel{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_astralpartner"] = {
				["name"] = "AstralWarden",
				["text"] = {
					"Has a {C:green}#1# in #2#{} chance to",
					"create a {C:spectral}#3#{} card",
					"when cards with {C:fur_stars}#4#",
					"suit are {C:attention}scored",
					"{C:inactive}(Works once per round)",
					"{C:inactive}(Currently {C:attention}#5#{C:inactive})",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}AstralWarden{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_astralpartner_alt"] = {
				["name"] = "AstralWarden",
				["text"] = {
					"{C:dark_edition}AstralWarden{} spawns {C:attention}2{}",
					"{C:spectral}#3#{} cards instead of {C:attention}1",
					"{C:inactive}(Does not need room, may overflow)",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}AstralWarden{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_cobaltpartner"] = {
				["name"] = "CobaltTheBluPanda",
				["text"] = {
					"First {C:attention}scored card{}",
					"with {C:clubs}#3#{} suit",
					"gives {X:chips,C:white}X#1#{} chips",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}illyADo{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_cobaltpartner_alt"] = {
				["name"] = "CobaltTheBluPanda",
				["text"] = {
					"First {C:attention}scoring card{} with {C:clubs}#3#",
					"suit spawns {C:tarot,T:c_moon}The Moon",
					"{C:inactive}(Works once per round)",
					"{C:inactive}(Currently {C:attention}#2#{C:inactive})",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}illyADo{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_iceseapartner"] = {
				["name"] = "IceSea",
				["text"] = {
					"First {C:attention}scored card{} will",
					"be enhanced to",
					"a {C:attention}Bonus Card",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}IceSea{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_iceseapartner_alt"] = {
				["name"] = "IceSea",
				["text"] = {
					"First scoring {C:attention}Bonus Card{}",
					"spawns {C:tarot,T:c_heirophant}The Heirophant",
					"{C:inactive}(Works once per round)",
					"{C:inactive}(Currently {C:attention}#1#{C:inactive})",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}IceSea{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_konekopartner"] = {
				["name"] = "The_Koneko",
				["text"] = {
					"First {C:attention}scored card{}",
					"with {C:hearts}#3#{} suit",
					"gives {X:mult,C:white}X#1#{} Mult",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}The_Koneko{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_konekopartner_alt"] = {
				["name"] = "The_Koneko",
				["text"] = {
					"First {C:attention}scoring card{} with {C:hearts}#3#",
					"suit spawns {C:tarot,T:c_sun}The Sun",
					"{C:inactive}(Works once per round)",
					"{C:inactive}(Currently {C:attention}#2#{C:inactive})",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}The_Koneko{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_saphpartner"] = {
				["name"] = "SaphiélleFox",
				["text"] = {
					"Has a {C:green}#1# in #2#{} chance to",
					"create a {C:tarot}#3#{} card",
					"when cards with {C:spades}#4#",
					"suit are {C:attention}scored",
					"{C:inactive}(Works once per round)",
					"{C:inactive}(Currently {C:attention}#5#{C:inactive})",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SaphiélleFox{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_saphpartner_alt"] = {
				["name"] = "SaphiélleFox",
				["text"] = {
					"{C:dark_edition}SaphiélleFox{} spawns {C:attention}2{}",
					"{C:tarot}#3#{} cards instead of {C:attention}1",
					"{C:inactive}(Does not need room, may overflow)",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SaphiélleFox{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_skipspartner"] = {
				["name"] = "DelusionalSkips",
				["text"] = {
					"Has a {C:green}#1# in #2#{} chance to",
					"instantly win non-{C:attention}boss{} blinds",
					"For every {C:attention}2{} blinds skipped",
					"spawn a {C:attention}Skips Tag",
					"{C:inactive}({C:attention}#3#{C:inactive} remaining)"
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}DelusionalSkips{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_skipspartner_alt"] = {
				["name"] = "DelusionalSkips",
				["text"] = {
					"{C:attention}Double{} the {C:green}odds{} and",
					"{C:attention}tags{} given by {C:dark_edition}DelusionalSkips"
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}DelusionalSkips{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_sparkpartner"] = {
				["name"] = "SparkTheBird",
				["text"] = {
					"First {C:attention}scored card{} gives {X:mult,C:white}X#1#{} Mult",
            		"when {C:attention}2s{} of {C:attention}any suit{} or",
            		"{C:diamonds}#4#{} of {C:attention}any rank{} are scored",
            		"{X:mult,C:white}X#2#{} Mult if a {C:attention}2{} of {C:diamonds}#4#{}",
					"is scored",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SparkTheBird{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_sparkpartner_alt"] = {
				["name"] = "SparkTheBird",
				["text"] = {
					"First {C:attention}scoring card{} with {C:diamonds}#4#",
					"suit spawns {C:tarot,T:c_star}The Star",
					"{C:inactive}(Works once per round)",
					"{C:inactive}(Currently {C:attention}#3#{C:inactive})",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SparkTheBird{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_lupositypartner"] = {
				["name"] = "Luposity",
				["text"] = {
					"At {C:attention}end of round{} add a",
					"{C:attention}cookie{} to the {C:dark_edition}cookie jar",
					"When {C:attention}clicked{}, generate a",
					"random {C:attention}cookie{} consumable",
					"{C:inactive}(Cookie jar capacity: {C:attention}#1#{C:inactive})",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Luposity{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_lupositypartner_alt"] = {
				["name"] = "Luposity",
				["text"] = {
					"At {C:attention}end of round{} add a",
					"{C:attention}cookie{} to the {C:dark_edition}cookie jar",
					"When {C:attention}clicked{}, generate a",
					"random {C:attention}cookie{} consumable",
					"{C:inactive}(Cookie jar capacity: {C:attention}#1#{C:inactive})",
					"Used {C:attention}cookie{} consumables scale",
					"{C:dark_edition}Luposity{} at {C:attention}five times{} the rate"
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Luposity{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_curiousangelpartner"] = {
				["name"] = "CuriousAngel",
				["text"] = {
					"First {C:attention}scored card{} has a",
					"{C:green}#1# in #2#{} chance to become {C:dark_edition}#3#",
					"This DeerFox gains {X:mult,C:white}X#4#{} Mult when the",
            		"{C:attention}first {C:dark_edition}#3#{} card is scored",
            		"{C:inactive}(Currently {X:mult,C:white}X#5#{C:inactive} Mult)",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}CuriousAngel{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_curiousangelpartner_alt"] = {
				["name"] = "CuriousAngel",
				["text"] = {
					"{C:attention}Double{} the {C:green}odds{} and",
					"{C:attention}scaling{} for {C:dark_edition}CuriousAngel",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}CuriousAngel{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_sephirapawspartner"] = {
				["name"] = "SephiraPaws",
				["text"] = {
					"This Kitsune gains {X:mult,C:white}X#2#{} Mult for each",
            		"{C:attention}playing card{} in your {C:attention}full",
					"{C:attention}deck{} when you {C:attention}discard{} your",
					"{C:attention}most played{} poker hand",
            		"{C:inactive}(Works once per round)",
            		"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult and{C:attention} #3#{C:inactive})",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SephiraPaws{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_sephirapawspartner_alt"] = {
				["name"] = "SephiraPaws",
				["text"] = {
					"{C:dark_edition}SephiraPaws{} scales at",
					"{C:attention}double{} the rate",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SephiraPaws{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_xavierorjosepartner"] = {
				["name"] = "Joseeeeee",
				["text"] = {
					"First {C:attention}scored card{} will",
					"be {C:attention}enhanced{} to a",
					"{C:attention}random{} enhancement",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Joseeeeee{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_xavierorjosepartner_alt"] = {
				["name"] = "Joseeeeee",
				["text"] = {
					"{C:attention}Double{} the {C:green}odds{} and",
					"{C:attention}scaling{} for {C:dark_edition}Joseeeeee",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Joseeeeee{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_foxxlyduskfurpartner"] = {
				["name"] = "FoxxlyDuskFur",
				["text"] = {
					"Gives {C:attention}1{} free",
					"{C:green}Reroll{} per shop",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}FoxxlyDuskFur{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_foxxlyduskfurpartner_alt"] = {
				["name"] = "FoxxlyDuskFur",
				["text"] = {
					"Gives {C:attention}1{} free",
					"{C:green}Reroll{} per shop",
					"{C:dark_edition}FoxxlyDuskFur{} scales",
					"{C:attention}twice{} as fast",
					"{C:inactive}(Scaling stacks with synergy)",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}FoxxlyDuskFur{} on",
                    "{C:attention}Gold Stake{} difficulty",
				}
			},
			["pnr_fur_kris57partner"] = {
				["name"] = "Kris_57",
				["text"] = {
					"First {C:attention}scored 5{}",
					"increases Mult by {X:mult,C:white}X#1#",
					"First {C:attention}scored 7{}",
					"increases chips by {X:chips,C:white}X#2#",
					"{C:inactive}(Currently {X:chips,C:white}X#4#{C:inactive} chips and {X:mult,C:white}X#3#{C:inactive} Mult)",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Kris_57{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_kris57partner_alt"] = {
				["name"] = "Kris_57",
				["text"] = {
					"{C:dark_edition}Kris_57{} scales at",
					"{C:attention}double{} the rate",
					"and gives {C:attention}double{} the {C:money}$",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Kris_57{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_sourstone3partner"] = {
				["name"] = "Sourstone :3",
				["text"] = {
					"When {C:attention}scoring hands{}, store",
					"{C:money}$2.5{} into the {C:dark_edition}current balance",
					"{C:attention}Left click{} to withdraw all available {C:money}$",
					"{C:attention}Right click{} to spend {C:money}$2.5{}",
					"of available {C:money}${} to score {X:mult,C:white}X#1#{} Mult",
					"{C:inactive}(Current balance: {C:money}$#2#{C:inactive} / Mult state: {C:attention}#3#{C:inactive})"
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Sourstone :3{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_sourstone3partner_alt"] = {
				["name"] = "Sourstone :3",
				["text"] = {
					"{C:dark_edition}Sourstone :3{} no longer",
					"takes money when scoring Mult"
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Sourstone :3{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_maltnoodlezpartner"] = {
				["name"] = "MaltNoodlez",
				["text"] = {
					"When {C:attention}setting blinds {C:red}debuff",
            		"one {C:attention}random{} Joker until {C:attention}end of round",
					"While {C:attention}playing a round{}, copy the",
            		"ability of the {C:attention}rightmost{} Joker",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}MaltNoodlez{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_maltnoodlezpartner_alt"] = {
				["name"] = "MaltNoodlez",
				["text"] = {
					"{C:dark_edition}MaltNoodlez{} no longer debuffs",
					"Jokers when {C:attention}setting blinds",
					"While {C:attention}playing a round{}, copy the",
            		"ability of the {C:attention}rightmost{} Joker",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}MaltNoodlez{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_nemzatapartner"] = {
				["name"] = "Nemzata",
				["text"] = {
					"{C:attention}Left click{} to shoot an arrow",
					"at a {C:attention}random{} playing card",
					"{C:green}#1# in #2#{} chance to {C:red}eliminate{} the card",
					"Each {C:attention}elimination{} stores {C:money}250{} coins {C:inactive}[{C:money}$2.5{C:inactive}]",
					"{C:attention}Right click{} to cash out all stored coins",
					"When {C:attention}setting blinds{}, restore all ammo",
					"{C:inactive}(Ammo capacity: {C:attention}#3#{C:inactive}/3 / Current coins: {C:money}#4# {C:inactive}[{C:money}$#5#{C:inactive}])",
					
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Nemzata{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_nemzatapartner_alt"] = {
				["name"] = "Nemzata",
				["text"] = {
					"{C:dark_edition}Nemzata{} gives",
					"{C:attention}double{} the coins",
					"The ammo on {C:tarot}Nemz's Bow{} is",
					"increased by {C:attention}2"
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Nemzata{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_schnackiofficialpartner"] = {
				["name"] = "SchnackiOfficial",
				["text"] = {
					"First {C:attention}scored card{}",
					"with {C:spades}#3#{} suit",
					"gives {X:mult,C:white}X#1#{} Mult",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SchnackiOfficial{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_schnackiofficialpartner_alt"] = {
				["name"] = "SchnackiOfficial",
				["text"] = {
					"First {C:attention}scoring card{} with {C:spades}#3#",
					"suit spawns {C:tarot,T:c_world}The World",
					"{C:inactive}(Works once per round)",
					"{C:inactive}(Currently {C:attention}#2#{C:inactive})",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}SchnackiOfficial{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_diablo2324partner"] = {
				["name"] = "Diablo2324",
				["text"] = {
					"{C:dark_edition}Furry{} Jokers",
            		"each give {X:mult,C:white}X#1#{} Mult",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Diablo2324{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_diablo2324partner_alt"] = {
				["name"] = "Diablo2324",
				["text"] = {
					"{C:dark_edition}Diablo2324{} is",
					"{C:attention}twice{} as strong"
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Diablo2324{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_dannypartner"] = {
				["name"] = "Danny",
				["text"] = {
					"This CatDragon {C:attention}debuffs{} all non-{C:fur_stars}#3#{} cards",
                	"For each {C:attention}played hand{} that contains a {C:attention}Flush{}, add",
                	"{X:mult,C:white}X#1#{} Mult and apply a {C:blue}Blue Paw Seal{} to the {C:attention}first{} card",
                	"First {C:attention}scored {C:fur_stars}#3#{} card gives {X:mult,C:white}X#2#{} Mult",
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Danny{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_dannypartner_alt"] = {
				["name"] = "Danny",
				["text"] = {
					"{C:dark_edition}Danny{} is {C:attention}twice",
					"as strong and no longer",
					"debuffs non-{C:fur_stars}#3#{} cards",

				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Danny{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_iridiapartner"] = {
				["name"] = "Iridia",
				["text"] = {
					"First {C:attention}scored card{} gives",
					"{X:chips,C:white}X#1#{} chips and {X:mult,C:white}X#2#{} Mult"
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Iridia{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_iridiapartner_alt"] = {
				["name"] = "Iridia",
				["text"] = {
					"{C:dark_edition}Iridia{} is",
					"{C:attention}twice{} as strong"
				},
				["unlock"] = {
					"Win a run with",
                    "{C:dark_edition}Iridia{} on",
                    "{C:attention}Gold Stake{} difficulty",
				},
			},
			["pnr_fur_parrotdashpartner"] = {
				["name"] = "Parrot Dash",
				["text"] = {
					"This Fox gives {C:mult}+Mult{} using the below formula",
            		"{C:mult}#1#{C:inactive} + ({C:attention}#3#{C:inactive} x {C:attention}#4#{C:inactive})",
            		"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
				},
			},
			["pnr_fur_parrotdashpartner_alt"] = {
				["name"] = "Parrot Dash",
				["text"] = {
					"{C:attention}Double{} the values used",
					"for {C:dark_edition}Parrot Dash{}'s formula",
					"{C:inactive}(Except Ante and Rounds)",
				},
			},
			["pnr_fur_lumepartner"] = {
				["name"] = "Lume",
				["text"] = {
					"First scored {C:attention}Face Card",
					"will be enhanced to a {C:attention}Prince{} card",
					"or First scored {C:attention}Prince{} card",
					"gives {X:mult,C:white}X#1#{} Mult",
				},
			},
			["pnr_fur_lumepartner_alt"] = {
				["name"] = "Lume",
				["text"] = {
					"{C:attention}Doubles{} the values for",
					"{C:dark_edition}Lume{} and {C:attention}Prince{} cards",
				},
			},
		},
		["Planet"] = {
			["c_fur_kepler62e"] = {
				["name"] = "Kepler-62e",
				["text"] = {
					'({V:1}niv.#1#{}) Niveau supérieur',
                	'{C:attention}Spectre',
                	'{C:mult}+2{} au Multi. et',
                	'{C:chips}+15{} Jetons',
				},
			},
			["c_fur_kepler62f"] = {
				["name"] = "Kepler-62f",
				["text"] = {
					'({V:1}niv.#1#{}) Niveau supérieur',
                	'{C:attention}Spectre Suite',
                	'{C:mult}+3{} au Multi. et',
                	'{C:chips}+35{} Jetons',
				},
			},
			["c_fur_kepler22b"] = {
				["name"] = "Kepler-22b",
				["text"] = {
					'({V:1}niv.#1#{}) Niveau supérieur',
                	'{C:attention}Spectre pleine',
                	'{C:mult}+3{} au Multi. et',
                	'{C:chips}+35{} Jetons',
				},
			},
			["c_fur_kepler20e"] = {
				["name"] = "Kepler-20e",
				["text"] = {
					'({V:1}niv.#1#{}) Niveau supérieur',
                	'{C:attention}Spectre cinq',
                	'{C:mult}+4{} au Multi. et',
                	'{C:chips}+40{} Jetons',
				},
			},
		},
		["Sleeve"] = {
			["sleeve_fur_floofysleeve"] = {
				["name"] = "Floofy Sleeve",
				["text"] = {
					'Start the run with a random',
            		'non-{C:common}Mythic {C:dark_edition}Furry{} #1#',
            		'{C:green}#4# in #5#{} chance to create a {C:dark_edition}Furry',
            		'#1# when a boss blind is defeated',
            		'{C:inactive}(Must have room)',
				},
			},
			["sleeve_fur_floofysleeve_alt"] = {
				["name"] = "Floofy Sleeve",
				["text"] = {
					'{C:common}Mythic {C:dark_edition}Furries{} can now appear',
					'when starting the run',
					'{C:dark_edition}Furry{} #2# spawned from bosses',
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
					'Apply {C:dark_edition,T:e_foil}#3#{} edition to starting #1#',
					'Convert a {C:attention}random{} suit to {C:clubs}#2#{} suit',
					'Start the run with an additional {C:spectral,T:c_black_hole}Black Hole'
				},
			},
			["sleeve_fur_corruptsleeve"] = {
				["name"] = "Corrupted Sleeve",
				["text"] = {
					"Start the run with",
					"a random discovered {V:1}Corrupted{} Joker",
					"At the {C:attention}end{} of calculation",
					"{V:1}corrupt{} chips and Mult",
				},
			},
			["sleeve_fur_corruptsleeve_alt"] = {
				["name"] = "Corrupted Sleeve",
				["text"] = {
					"{V:1}Corrupted Deck{}'s corruption is",
					"stronger by {C:attention}five times"
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
					'Next shop has a free',
            		'random {C:dark_edition}Furry{} Pack',
				},
			},
			["tag_fur_uncommonpawtag"] = {
				["name"] = "Uncommon Paw Tag",
				["text"] = {
					'Shop has a free',
            		'{C:uncommon}#1# {C:dark_edition}Furry{} Joker',
				},
			},
			["tag_fur_rarepawtag"] = {
				["name"] = "Rare Paw Tag",
				["text"] = {
					'Shop has a free',
            		'{C:rare}#1# {C:dark_edition}Furry{} Joker',
				},
			},
			["tag_fur_legendarypawtag"] = {
				["name"] = "Legendary Paw Tag",
				["text"] = {
					'Shop has a free',
            		'{C:legendary}#1# {C:dark_edition}Furry{} Joker',
				},
			},
			["tag_fur_mythicpawtag"] = {
				["name"] = "Mythic Paw Tag",
				["text"] = {
					'Shop has a free',
            		'{C:common}#1# {C:dark_edition}Furry{} Joker',
				},
			},
		},
		["Tarot"] = {
			["c_fur_fallingstar"] = {
				["name"] = "Étoile filante",
				["text"] = {
					"Convertit jusqu'à",
            		"{C:attention}#1#{} cartes sélectionnées",
            		"pour les changer en {C:fur_stars}#2#{}",
				},
			},
			["c_fur_playingsocks"] = {
				["name"] = "Chaussettes de jeu",
				["text"] = {
					"Améliore {C:attention}#1#",
            		"cartes sélectionnées en",
            		"Carte de {C:attention}chaussettes",
				},
			},
			["c_fur_treasurechest"] = {
				["name"] = "Coffre au Trésor",
				["text"] = {
					"Améliore {C:attention}#1#",
            		"cartes sélectionnées en",
            		"Carte {C:attention}d'argent",
				},
			},
			
		},
		["thedarkness"] = {
			["c_fur_thedarknessconsumesyou"] = {
				["name"] = "???",
			}
		},
		["jokerconsumables"] = {
			["c_fur_nemzsbow"] = {
				["name"] = "Nemz's Bow",
				["text"] = {
					"Has a {C:green}#1# in #2#{} chance to {C:red}eliminate",
            		"{C:attention}#3#{} selected card when used",
            		"When {C:attention}selecting blinds{}, restore all ammo",
            		"{C:inactive}(Current ammo: {C:attention}#4#{C:inactive}/#5#)",
				},
			},
		},
		["lupocookies"] = {
			["c_fur_chocolatechipcookie"] = {
				["name"] = "Chocolate Chip Cookie",
				["text"] = {
					"Increases {C:dark_edition}Luposity{}'s",
					"Mult gain by {X:mult,C:white}X0.25",
				},
			},
			["c_fur_buttercookie"] = {
				["name"] = "Butter Cookie",
				["text"] = {
					"Randomly increases {C:dark_edition}Joker slots{}",
					"{C:dark_edition}Consumable slots{} or {C:dark_edition}Hand size",
					"by {C:attention}#1#",
				},
			},
			["c_fur_doublechocolatechipcookie"] = {
				["name"] = "Double Chocolate Chip Cookie",
				["text"] = {
					"Level up a {C:attention}random",
					"poker hand and {C:attention}double",
					"chips or Mult",
					"{C:inactive}(Includes hidden hands)",
				},
			},
			["c_fur_rainbowchocolatechipcookie"] = {
				["name"] = "Rainbow Chocolate Chip Cookie",
				["text"] = {
					"Level up a {C:attention}random",
					"poker hand",
					"{C:inactive}(Includes hidden hands)",
				},
			},
			["c_fur_sugarcookie"] = {
				["name"] = "Sugar Cookie",
				["text"] = {
					"Levels up your {C:attention}last played",
					"poker hand",
					"{C:inactive}(Currently {C:attention}#1#{C:inactive})",
				},
			},
			["c_fur_fortunecookie"] = {
				["name"] = "Fortune Cookie",
				["text"] = {
					"Creates a random",
					"{C:tarot}#1#{} card",
					"{C:inactive}(Must have room)",
				},
			},
			["c_fur_oatmealraisincookie"] = {
				["name"] = "Oatmeal Raisin Cookie",
				["text"] = {
					"{C:red}Doubles{} the blind target",
					"Gives {C:attention}#1#{} random {C:attention}Tags",
				},
			},
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
			["ach_fur_ohno"] = {
				'Use ???',
			},
			["ach_fur_teamwipe"] = {
				'Eliminate 3 cards in a single',
				'round with Nemz\'s Bow',
			},
			["ach_fur_teamwipeplus"] = {
				'Eliminate 5 cards in a single',
				'round with Nemz\'s Bow',
			},
			["ach_fur_doublerainbow"] = {
				'Apply Polychrome Edition',
				'to The Rainbow',
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
			["ach_fur_ohno"] = "Oh no...",
			["ach_fur_teamwipe"] = "Team Wipe",
			["ach_fur_teamwipeplus"] = "Team Wipe+",
			["ach_fur_doublerainbow"] = "Double Rainbow",
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
			["fur_pokerhands"] = "Spectrum Poker Hands",
			["fur_complexjokers"] = "Complex Joker Bases",
			["fur_jokerquotes"] = "Show Joker Quotes",
			["fur_jokerdisplayscaling"] = "Show JokerDisplay Scaling",
			["fur_restartrequired"] = "*Requires Restart*",
			["fur_restartrecommended"] = "*Restart Recommended*",
			["fur_enabled"] = "Enabled",
			["fur_disabled"] = "Disabled",

			["fur_kalikstink"] = "Kalik Stink!",
			["fur_angelnegated"] = "Negated!",
			["fur_skipstag"] = "+Skips Tag",
			["fur_ghostcardtrigger"] = "Ghosted!",
			["fur_princecardtrigger"] = "Royalty!",
			["fur_corrupted"] = "Corrupted!",
			["fur_cookie"] = "Cookie!",
			["fur_cookiestored"] = "Cookie Stored",

			["fur_enhanced"] = "Enhanced!",
			["fur_sealed"] = "Sealed!",
			["fur_cleansed"] = "Cleansed!",
			["fur_elim"] = "Eliminated!",
			["fur_jokerslotplus"] = "Joker Slot",
			["fur_consumeableslotplus"] = "Consumable Slot",
			["fur_handsizeplus"] = "Hand Size",

			["fur_ghostcard"] = "Ghost Cards",
			["fur_sockcard"] = "Sock Cards",
			["fur_stinkycard"] = "Stinky Cards",
			["fur_silvercard"] = "Silver Cards",
			["fur_bonuscard"] = "Bonus Cards",
			["fur_princecard"] = "Prince Cards",
			["fur_plusconsumable"] = "Consumable",
			["fur_consumableused"] = "Consumable Used",
			["fur_shopbuyreroll"] = "Purchase or Reroll",
			["fur_codeused"] = "Code Used",
			["fur_skipstext"] = "Blind Win",
			["fur_joker"] = "Joker",
			["fur_jdelim"] = "Elimination",
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
			["fur_spectrum"] = "Spectre",
			["fur_straightspectrum"] = "Spectre Suite",
			["fur_straightspectrum_2"] = "Spectre Royal",
			["fur_spectrumhouse"] = "Spectre Pleine",
			["fur_spectrumfive"] = "Spectre Cinq",
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
			["ch_c_fur_curiousangel_start"] = {"Start the run with an {C:legendary}Eternal{} {C:dark_edition}CuriousAngel"},
		},
    },
}