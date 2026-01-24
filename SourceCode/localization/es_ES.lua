return {
    ["descriptions"] = {
        ["Back"] = {
            ["b_fur_randomdeck"] = {
                ["name"] = "Mazo Esponjoso",
                ["text"] = {"Comienza la partida con un", "{C:dark_edition}Joker Furry que no sea {C:common}Mítico",
                            "{C:green}#1# en #2# de probabilidad de crear un {C:dark_edition}Joker",
                            "Furry cuando se derrota la ciega jefe", "{C:inactive}(Debe haber espacio)"}
            },
            ["b_fur_stargazingdeck"] = {
                ["name"] = "Mazo Estelar",
                ["text"] = {"Comienza la partida con un",
                            "{C:dark_edition,T:j_fur_astral}Guardián Astral{} con {C:dark_edition,T:j_fur_sparkles}SparklesRolf{}",
                            "y {C:attention}2{} copias de", "{C:tarot,T:c_fur_fallingstar}Estrella Fugaz"}
            },
            ["b_fur_chipsgaloredeck"] = {
                ["name"] = "Mazo de Fichas a Montones",
                ["text"] = {"Comienza la partida con",
                            "{C:dark_edition,T:j_fur_icesea}Ice Sea{} y {C:dark_edition,T:j_fur_cobalt}CobaltTheBluPanda{}",
                            "y {C:attention}1{} copia de",
                            "{C:tarot,T:c_heirophant}El Hierofante{} y {C:tarot,T:c_moon}La Luna"}
            },
            ["b_fur_corrupteddeck"] = {
                ["name"] = "Mazo Corrupto",
                ["text"] = {"Comienza la partida con", "un Joker {V:1}Corrupto{} descubierto aleatorio",
                            "Al {C:attention}final{} de un cálculo", "{V:1}corrompe{} fichas y Mult"},
                ["unlock"] = {"Usa ???"}
            }
        },
        ["Blind"] = {
            ["bl_fur_meteorblind"] = {
                ["name"] = "El Meteorito",
                ["text"] = {"Todas las cartas de estrellas", "están debilitadas"}
            },
            ["bl_fur_pawblind"] = {
                ["name"] = "La Pata",
                ["text"] = {"Todos los Jokers Furry", "están debilitados"}
            }
        },
        ["Enhanced"] = {
            ["m_fur_ghostcard"] = {
                ["name"] = "Carta Fantasma",
                ["text"] = {"{C:attention}siempre puntúa{}", "Cuando está seleccionada, añade",
                            "{C:attention}+1 límite de Jugar/Descartar{}"}
            },
            ["m_fur_sockcard"] = {
                ["name"] = "Carta Calcetín",
                ["text"] = {"{C:mult}+#1#{} {C:red}#2#", "cuando puntúa"}
            },
            ["m_fur_stinkcard"] = {
                ["name"] = "Carta Apestosa",
                ["text"] = {"{C:attention}siempre puntúa{}", "{C:mult}Se destruye{} cuando se juega"}
            },
            ["m_fur_silvercard"] = {
                ["name"] = "Carta Plateada",
                ["text"] = {"{C:chips}+#2#{} fichas", "{C:money}$#1#{} cuando puntúa"}
            },
            ["m_fur_princecard"] = {
                ["name"] = "Carta Príncipe",
                ["text"] = {"{C:mult}+#1#{} Mult", "Consigue {C:mult}+#2#{} Mult por cada {C:attention}Príncipe",
                            "en tu {C:attention}baraja"}
            }
        },
        ["Joker"] = {
            ["j_fur_enviousjoker"] = {
                ["name"] = "Joker Envidioso",
                ["text"] = {"Las cartas jugadas con", "palo {C:fur_stars}#2#{} dan", "{C:mult}+#1#{} Mult al puntuar"}
            },
            ["j_fur_anxiousjoker"] = {
                ["name"] = "Joker Ansioso",
                ["text"] = {"{C:mult}+#1#{} Mult si la mano jugada", "contiene", "un {C:attention}#2#"}
            },
            ["j_fur_trickyjoker"] = {
                ["name"] = "Joker Travieso",
                ["text"] = {"{C:chips}+#1#{} fichas si la mano jugada", "contiene", "un {C:attention}#2#"}
            },
            ["j_fur_therainbow"] = {
                ["name"] = "El Arcoíris",
                ["text"] = {"{X:mult,C:white}X#1#{} Mult si la mano jugada", "contiene", "un {C:attention}#2#"}
            },
            ["j_fur_silver"] = {
                ["name"] = "SilverSentinel",
                ["text"] = {"Da {C:money}$#1#{} extra por", "cada carta {C:attention}Plateada{} puntuada",
                            "{C:inactive,s:0.8,E:2}#2#", "{C:purple,E:1,s:0.8}twitch.tv/SilverSentinell"}
            },
            ["j_fur_astral"] = {
                ["name"] = "Guardián Astral",
                ["text"] = {"Tiene {C:green}#1# en #2#{} de probabilidad de",
                            "crear una carta {C:spectral}#5#{} cuando",
                            "se puntúan cartas con palo {C:fur_stars}#4#{}", "{C:inactive}(Debe haber espacio)",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/AstralWarden"}
            },
            ["j_fur_ghost"] = {
                ["name"] = "GhostFox",
                ["text"] = {"{C:attention}Mejora{} cartas no mejoradas", "a cartas {C:attention}Fantasma{}",
                            "Este Zorro gana {X:mult,C:white}X#2#{} Mult",
                            "cuando se puntúan cartas {C:attention}Fantasma{}",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/GhostFawx"}
            },
            ["j_fur_kalik"] = {
                ["name"] = "KalikHusky",
                ["text"] = {"Añade una carta {C:attention}Apestosa{}",
                            "al mazo cuando se {C:attention}selecciona una ciega",
                            "Gana {X:mult,C:white}X#2#{} Mult por cada",
                            "carta {C:attention}Apestosa{} en tu {C:attention}baraja completa",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/Kalik_Husky"}
            },
            ["j_fur_saph"] = {
                ["name"] = "SaphiélleFox",
                ["text"] = {"Tiene {C:green}#1# en #2#{} de probabilidad de", "crear una carta {C:tarot}#5#{} cuando",
                            "se puntúan cartas con el palo {C:spades}#4#{}", "{C:inactive}(Debe haber espacio)",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/SaphielleFox"}
            },
            ["j_fur_cobalt"] = {
                ["name"] = "CobaltTheBluPanda",
                ["text"] = {"Este Panda da", "{X:chips,C:white}X#1#{} Fichas cuando cartas",
                            "del palo {C:clubs}#3#{} son puntuadas", "{C:inactive,s:0.8,E:2}#2#"}
            },
            ["j_fur_icesea"] = {
                ["name"] = "Ice Sea",
                ["text"] = {"Esta Nutria da {X:chips,C:white}X#1#{} Fichas", "cuando se puntúan {C:attention}#3#{}",
                            "{C:inactive,s:0.8,E:2}#2#"}
            },
            ["j_fur_sparkles"] = {
                ["name"] = "SparklesRolf",
                ["text"] = {"Este Conejo da", "{X:mult,C:white}X#1#{} Mult cuando cartas",
                            "con el palo {C:fur_stars}#3#{} puntuan", "{C:inactive,s:0.8,E:2}#2#",
                            "{C:purple,E:1,s:0.8}twitch.tv/SparklesRolf"}
            },
            ["j_fur_spark"] = {
                ["name"] = "SparkTheBird",
                ["text"] = {"Este Pájaro da {X:mult,C:white}X#1#{} Mult",
                            "cuando puntúan {C:attention}2s{} de cualquier palo o",
                            "{C:diamonds}#4#{} de cualquier rango",
                            "{X:mult,C:white}X#2#{} Mult si un {C:attention}2{} de {C:diamonds}#4#{}", "puntua",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/SparkTheBird"}
            },
            ["j_fur_koneko"] = {
                ["name"] = "The_Koneko",
                ["text"] = {"Este Gato da", "{X:mult,C:white}X#1#{} Mult cuando cartas",
                            "con el palo {C:hearts}#3#{} son puntuadas", "{C:inactive,s:0.8,E:2}#2#",
                            "{C:purple,E:1,s:0.8}twitch.tv/The_Koneko"}
            },
            ["j_fur_curiousangel"] = {
                ["name"] = "CuriousAngel",
                ["text"] = {"Tiene {C:green}#3# en #4#{} de probabilidad de aplicar",
                            "{C:dark_edition}#6#{} a cartas puntuadas o Jokers",
                            "{C:inactive}(No sobrescribirá ediciones existentes)",
                            "Este CiervoZorro gana {X:mult,C:white}X#2#{} Mult cuando",
                            "puntúan cartas de {C:dark_edition}#6#{}",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#5#", "{C:purple,E:1,s:0.8}twitch.tv/AngelDeerFox"}
            },
            ["j_fur_skips"] = {
                ["name"] = "DelusionalSkips",
                ["text"] = {"Tiene {C:green}#1# en #2#{} de probabilidad",
                            "de ganar {C:attention}instantáneamente{} la ciega",
                            "{C:inactive}(Ciega jefe máximo 4/#4# probabilidades)",
                            "Cuando se {C:attention}saltan ciegas{} aparece", "una {C:attention}Etiqueta Skips{}",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/DelusionalSkips"}
            },
            ["j_fur_multiplayerskips"] = {
                ["name"] = "DelusionalSkips",
                ["text"] = {"Tiene {C:green}#1# en #2#{} de probabilidad",
                            "de ganar {C:attention}instantáneamente{} ciegas no-jefe",
                            "Cuando se {C:attention}saltan ciegas{} aparece", "una {C:attention}Etiqueta Skips{}",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/DelusionalSkips"}
            },
            ["j_fur_illy"] = {
                ["name"] = "illyADo",
                ["text"] = {"Esta Comadreja gana {X:mult,C:white}X#2#{}", "Mult por cada {C:attention}#4#{}",
                            "{C:attention}puntuado{} y {C:attention}en mano", "durante la ronda",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/illyADo_"}
            },
            ["j_fur_cryptidluposity"] = {
                ["name"] = "Luposity",
                ["text"] = {"Este Lobo gana {X:mult,C:white}X#2#{} Mult", "cuando se usan {C:green}#4#{}",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} mult)",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/Luposity"}
            },
            ["j_fur_luposity"] = {
                ["name"] = "Luposity",
                ["text"] = {"Este Lobo gana {X:mult,C:white}X#2#{} Mult", "cuando se usan {C:attention}#4#{}",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} mult)",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/Luposity"}
            },
            ["j_fur_soks"] = {
                ["name"] = "SoksAtArt",
                ["text"] = {"Esta Cabra da", "{C:blue}+#1# #3#{} cuando cartas {C:attention}Calcetín{}",
                            "puntuan", "{C:inactive,s:0.8,E:2}#2#",
                            "{C:purple,E:1,s:0.8}twitch.tv/SoksAtArt"}
            },
            ["j_fur_talismansephirapaws"] = {
                ["name"] = "SephiraPaws",
                ["text"] = {"Este Zorro gana {X:dark_edition,C:white}^#2#{} Mult", "cuando {C:attention}descartas{} tu",
                            "mano de póker más jugada", "{C:inactive}(Funciona una vez por ronda)",
                            "{C:inactive}(Actualmente {X:dark_edition,C:white}^#1#{C:inactive} Mult y{C:attention} #3#{C:inactive})",
                            "{C:inactive,s:0.8,E:2}#4#"}
            },
            ["j_fur_sephirapaws"] = {
                ["name"] = "SephiraPaws",
                ["text"] = {"Este Zorro gana {X:mult,C:white}X#2#{} Mult", "por cada {C:attention}carta de juego{} en",
                            "tu baraja completa", "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#3#"}
            },
            ["j_fur_talismanxavierorjose"] = {
                ["name"] = "Joseeeeee",
                ["text"] = {"{C:green}#1# en #2#{} de probabilidad de {C:attention}mejorar{} cartas no mejoradas",
                            "a una mejora aleatoria",
                            "{C:green}#3# en #4#{} de probabilidad de {C:attention}eliminar{} la mejora",
                            "de cartas puntuadas por {X:money,C:white}+X#5#{} {C:money}$",
                            "Al {C:attention}final de ronda{}, da {C:money}${} igual a",
                            "{C:inactive}({C:money}$ actual {C:inactive} x {C:money}#6#{C:inactive})",
                            "{C:inactive,s:0.8,E:2}#7#"}
            },
            ["j_fur_xavierorjose"] = {
                ["name"] = "Joseeeeee",
                ["text"] = {"{C:green}#1# en #2#{} de probabilidad de {C:attention}mejorar{} cartas no mejoradas",
                            "a una {C:attention}mejora aleatoria{}",
                            "{C:green}#3# en #4#{} de probabilidad de {C:attention}eliminar{} la",
                            "{C:attention}mejora{} de cartas puntuadas por {C:money}+$#6#{}",
                            "Al {C:attention}final de ronda{}, da {C:money}$#5#{}", "{C:inactive,s:0.8,E:2}#7#"}
            },
            ["j_fur_foxxlyduskfur"] = {
                ["name"] = "FoxxlyDuskFur",
                ["text"] = {"Este Zorro gana {X:mult,C:white}X#2#{} Mult",
                            "cuando se {C:attention}reinician{} o {C:attention}compran", "artículos de la tienda",
                            "{C:dark_edition}Sinergia:{} Mult escala dos veces más",
                            "rápido si tienes {C:attention}Dusk",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/FoxxlyDuskFur"}
            },
            ["j_fur_talismancorruptcuriousangel"] = {
                ["name"] = "CuriousAngel (Corrupto)",
                ["text"] = {"Aplica {C:dark_edition}#4#{} a cartas puntuadas o Jokers",
                            "{C:inactive}(Sobrescribirá ediciones existentes)",
                            "{C:inactive}(No afectará jokers corruptos)",
                            "Este CiervoZorro gana {X:dark_edition,C:white}^#2#{} Mult cuando",
                            "se puntúan cartas de juego {C:dark_edition}#4#{}",
                            "{C:inactive}(Actualmente {X:dark_edition,C:white}^#1#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/AngelDeerFox"}
            },
            ["j_fur_corruptcuriousangel"] = {
                ["name"] = "CuriousAngel (Corrupto)",
                ["text"] = {"Aplica {C:dark_edition}#4#{} a cartas puntuadas o Jokers",
                            "{C:inactive}(Sobrescribirá ediciones existentes)",
                            "{C:inactive}(No afectará jokers corruptos)",
                            "Este CiervoZorro gana {X:mult,C:white}X#2#{} Mult cuando",
                            "se puntúan cartas de juego {C:dark_edition}#4#{}",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#3#", "{C:purple,E:1,s:0.8}twitch.tv/AngelDeerFox"}
            },
            ["j_fur_talismancorruptsparkles"] = {
                ["name"] = "SparklesRolf (Odio)",
                ["text"] = {"Al final de {C:attention}puntuar mano{}, este Conejo",
                            "puntúa {X:dark_edition,C:white}^#1#{} Mult y mejora",
                            "la mano de póker jugada en {C:attention}#2#",
                            "cuando se puntúan cartas con {C:hearts}#4#{} palo",
                            "{C:inactive}(Destruirá las cartas afectadas)", "{V:1,s:1.2,E:1}#3#",
                            "{C:inactive,s:0.8,E:1}AU: {C:attention,s:0.8,E:1}UNDERTALE",
                            "{C:purple,E:1,s:0.8}twitch.tv/SparklesRolf"}
            },
            ["j_fur_corruptsparkles"] = {
                ["name"] = "SparklesRolf (Odio)",
                ["text"] = {"Al final de {C:attention}puntuar mano{}, este Conejo",
                            "puntúa {X:mult,C:white}X#1#{} Mult y mejora",
                            "la mano de póker jugada en {C:attention}#2#",
                            "cuando se puntúan cartas con {C:hearts}#4#{} palo",
                            "{C:inactive}(Destruirá las cartas afectadas)", "{V:1,s:1.2,E:1}#3#",
                            "{C:inactive,s:0.8,E:1}AU: {C:attention,s:0.8,E:1}UNDERTALE",
                            "{C:purple,E:1,s:0.8}twitch.tv/SparklesRolf"}
            },
            ["j_fur_talismankris57"] = {
                ["name"] = "Kris_57",
                ["text"] = {"Cuando un {C:attention}5{} puntua, este Joker",
                            "gana {X:dark_edition,C:white}^#4#{} Mult",
                            "Cuando un {C:attention}7{} puntua, este Joker",
                            "gana {X:dark_edition,C:white}^#3#{} fichas",
                            "{C:dark_edition}Sinergia:{} Da {C:money}$#6#{} cuando puntúas",
                            "un {C:attention}5{} o {C:attention}7{} si tienes {C:dark_edition}Iridia",
                            "{C:inactive}(Actualmente {X:dark_edition,C:white}^#1#{C:inactive} fichas y {X:dark_edition,C:white}^#2#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#5#"}
            },
            ["j_fur_kris57"] = {
                ["name"] = "Kris_57",
                ["text"] = {"Cuando un {C:attention}5{} puntua, este Joker", "gana {X:red,C:white}X#4#{} Mult",
                            "Cuando un {C:attention}7{} puntua, este Joker", "gana {X:chips,C:white}X#3#{} fichas",
                            "{C:dark_edition}Sinergia:{} Da {C:money}$#6#{} cuando puntua",
                            "un {C:attention}5{} o {C:attention}7{} si tienes {C:dark_edition}Iridia",
                            "{C:inactive}(Actualmente {X:chips,C:white}X#1#{C:inactive} fichas y {X:mult,C:white}X#2#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#5#"}
            },
            ["j_fur_talismansourstone3"] = {
                ["name"] = "Sourstone :3",
                ["text"] = {"Cuando este Protogen está en la",
                            "ranura {C:attention}más a la izquierda{}, gana {C:money}$#1#",
                            "Cuando este Protogen está en la",
                            "ranura {C:attention}más a la derecha{}, gasta {C:money}$#1#",
                            "para puntuar {X:dark_edition,C:white}^#2#{} Mult", "{C:inactive,s:0.8,E:2}#3#"}
            },
            ["j_fur_sourstone3"] = {
                ["name"] = "Sourstone :3",
                ["text"] = {"Cuando este Protogen está en la",
                            "ranura {C:attention}más a la izquierda{}, gana {C:money}$#1#",
                            "Cuando este Protogen está en la",
                            "ranura {C:attention}más a la derecha{}, gasta {C:money}$#1#",
                            "para puntuar {X:mult,C:white}X#2#{} Mult", "{C:inactive,s:0.8,E:2}#3#"}
            },
            ["j_fur_talismandanny"] = {
                ["name"] = "Danny",
                ["text"] = {"Este GatoDragón {C:red}debilita{} todas las cartas no-{C:fur_stars}#3#{}",
                            "Por cada mano jugada que contiene un {C:attention}Color{}, añade",
                            "{X:dark_edition,C:white}^#2#{} Mult y aplica un {C:blue}Sello de Pata Azul{} a cartas puntuadas",
                            "luego da {X:dark_edition,C:white}^#1#{} Mult", "{C:inactive,s:0.8,E:2}#4#"}
            },
            ["j_fur_danny"] = {
                ["name"] = "Danny",
                ["text"] = {"Este GatoDragón {C:red}debilita{} todas las cartas no-{C:fur_stars}#3#{}",
                            "Por cada mano jugada que contiene un {C:attention}Color{}, añade",
                            "{X:mult,C:white}X#2#{} Mult y aplica un {C:blue}Sello de Pata Azul{} a cartas puntuadas",
                            "luego da {X:mult,C:white}X#1#{} Mult", "{C:inactive,s:0.8,E:2}#4#"}
            },
            ["j_fur_diablo2324"] = {
                ["name"] = "Diablo2324",
                ["text"] = {"Los Jokers {C:dark_edition}Furry{}", "cada uno da {X:mult,C:white}X#1#{} Mult",
                            "{C:inactive,s:0.8,E:2}#2#", "{C:purple,E:1,s:0.8}twitch.tv/Diablo23244"}
            },
            ["j_fur_nemzata"] = {
                ["name"] = "Nemzata",
                ["text"] = {"Cuando una carta es {C:red}eliminada{} por {C:attention}Arco de Nemz",
                            "este Dragón da {C:money}#2#{} monedas {C:inactive}[{C:money}$#1#{C:inactive}]",
                            "{C:inactive}(Eliminará el Arco de Nemz al venderlo)", "{C:inactive,s:0.8,E:2}#3#"}
            },
            ["j_fur_talismancorruptdanny"] = {
                ["name"] = "Danny (Corrupto)",
                ["text"] = {"Este GatoDragón {C:red}debilita{} todas las cartas no-{C:fur_stars}#3#{}",
                            "{C:red}Destruye{} todas las cartas no-{C:fur_stars}#3#{} en mano {C:attention}después{} de jugar una mano",
                            "Por cada mano jugada que contiene un {C:attention}Color{}, añade",
                            "{X:dark_edition,C:white}^#2#{} Mult, {C:dark_edition}#4#{}, y un {C:blue}Sello de Pata Azul{} a cartas puntuadas",
                            "luego da {X:dark_edition,C:white}^#1#{} Mult", "{C:inactive,s:0.8,E:2}#5#"}
            },
            ["j_fur_corruptdanny"] = {
                ["name"] = "Danny (Corrupto)",
                ["text"] = {"Este GatoDragón {C:red}debilita{} todas las cartas no-{C:fur_stars}#3#{}",
                            "{C:red}Destruye{} todas las cartas no-{C:fur_stars}#3#{} en mano {C:attention}después{} de jugar una mano",
                            "Por cada mano jugada que contiene un {C:attention}Color{}, añade",
                            "{X:mult,C:white}X#2#{} Mult, {C:dark_edition}#4#{}, y un {C:blue}Sello de Pata Azul{} a cartas puntuadas",
                            "luego da {X:mult,C:white}X#1#{} Mult", "{C:inactive,s:0.8,E:2}#5#"}
            },
            ["j_fur_iridia"] = {
                ["name"] = "Iridia",
                ["text"] = {"Este Joker puntúa {X:chips,C:white}X#1#{} fichas y",
                            "{X:mult,C:white}X#2#{} Mult cuando {C:attention}cartas de juego{} son puntuadas",
                            "{C:dark_edition}Sinergia:{} Da una carta {C:planet}#4#{} para",
                            "la mano de póker jugada si tienes {C:dark_edition}Kris_57",
                            "{C:inactive}(Debe haber espacio)", "{C:inactive,s:0.8,E:2}#3#",
                            "{C:inactive,s:0.8,E:1}OC: {C:attention,s:0.8,E:1}Kris_57"}
            },
            ["j_fur_maltnoodlez"] = {
                ["name"] = "MaltNoodlez",
                ["text"] = {"Al seleccionar una ciega este Conejo {C:red}debilita",
                            "un Joker aleatorio hasta el {C:attention}final de ronda",
                            "{C:inactive}(Excluyéndose a sí mismo)", "Mientras se juega una ronda, copia la",
                            "habilidad del Joker {C:attention}más a la derecha{}", "{C:inactive,s:0.8,E:2}#1#",
                            "{C:purple,E:1,s:0.8}twitch.tv/MaltNoodlez"}
            },
            ["j_fur_talismancorruptsephirapaws"] = {
                ["name"] = "SephiraPaws (Corrupto)",
                ["text"] = {"Este Zorro gana {X:dark_edition,C:white}^Mult{} dependiendo",
                            "de tu mano de póker {C:attention}descartada{}",
                            "{C:inactive}(Varía de {X:dark_edition,C:white}+^#1#{C:inactive} a {X:dark_edition,C:white}+^#2#{C:inactive} Mult x {C:attention}Nivel de Mano de Póker{C:inactive})",
                            "{C:inactive}(Actualmente {X:dark_edition,C:white}^#3#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#4#"}
            },
            ["j_fur_corruptsephirapaws"] = {
                ["name"] = "SephiraPaws (Corrupto)",
                ["text"] = {"Este Zorro gana {X:mult,C:white}XMult{} dependiendo",
                            "de tu mano de póker {C:attention}descartada{}",
                            "{C:inactive}(Varía de {X:mult,C:white}+X#1#{C:inactive} a {X:mult,C:white}+X#2#{C:inactive} Mult x {C:attention}Nivel de Mano de Póker{C:inactive})",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#3#{C:inactive} Mult)",
                            "{C:inactive,s:0.8,E:2}#4#"}
            },
            ["j_fur_schnackiofficial"] = {
                ["name"] = "SchnackiOfficial",
                ["text"] = {"Este Zorro da", "{X:mult,C:white}X#1#{} Mult cuando cartas",
                            "con {C:spades}#3#{} palo son puntuadas",
                            "{C:dark_edition}Sinergia:{} Multiplica el Mult dado por",
                            "{X:mult,C:white}X1.5{} si tienes {C:attention}Helado", "{C:inactive,s:0.8,E:2}#2#",
                            "{C:purple,E:1,s:0.8}twitch.tv/SchnackiOfficial"}
            },
            ["j_fur_parrotdash"] = {
                ["name"] = "Parrot Dash",
                ["text"] = {"Este Zorro da {C:mult}+Mult{} usando la siguiente fórmula",
                            "{C:mult}#1#{C:inactive} + ({C:attention}#4#{C:inactive} x {C:attention}#5#{C:inactive})",
                            "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Mult)", "{C:inactive,s:0.8,E:2}#3#",
                            "{C:purple,E:1,s:0.8}twitch.tv/Parrot_Dash", "{C:red,E:1,s:0.8}youtube.com/@ParrotDash"}
            },
            ["j_fur_lume"] = {
                ["name"] = "Lume",
                ["text"] = {"{C:attention}Mejora{} cartas no mejoradas",
                            "{C:attention}#2#{} a cartas {C:attention}Príncipe{}",
                            "Por cada carta {C:attention}Príncipe{} puntuada",
                            "este DragónGato da {X:mult,C:white}X#1#{} Mult", "{C:inactive,s:0.8,E:2}#3#",
                            "{C:purple,E:1,s:0.8}twitch.tv/Lume"}
            }
        },
        ["Mod"] = {
            ["Furlatro"] = {
                ["name"] = "Furlatro",
                ["text"] = {"{C:edition,E:1,s:1.3}EL{} modpack Furry para Balatro. ¡Un proyecto de pasión llevado a la vida!",
                            " ",
                            "Introduce {C:attention}32 {C:dark_edition,E:1,s:1.3}Jokers Furry{}, ¡cada uno con efectos únicos!",
                            "Añade una nueva rareza: {C:blue,E:1,s:1.3}Mítica{}! Estos son jokers ultra poderosos",
                            "que pueden elevar tu puntuación a nuevas alturas", " ",
                            "Codificado por mí mismo con algunas funciones y líneas de otros mods,",
                            "¡todos los cuales son acreditados aquí y en el código junto a sus líneas!",
                            "{C:attention,E:2,s:1.3}Cryptid{}, {C:attention,E:2,s:1.3}SixSuits{}, {C:attention,E:2,s:1.3}VanillaRemade{}, {C:attention,E:2,s:1.3}SpectrumFramework{}, y {C:attention,E:2,s:1.3}PartnerAPI{}",
                            " ", "¡Todos los artistas son acreditados en sus respectivas cartas! ¡Ve a consultarlos!",
                            "Arte de cartas de figuras por {C:attention,E:2,s:1.3}Yrense{} en Vgen", " ",
                            "¿Quieres un {C:attention,E:2,s:1.3}Joker Furry{} personalizado,",
                            "ayudar con la {C:attention,E:2,s:1.3}Localización{}, o simplemente conversar con otros. ¡Únete al Discord! <3",
                            "{s:0.9}Haz clic para unirte:{C:dark_edition,E:1,s:1.5}https://discord.gg/fCnxr4dWfh{}",
                            " ", "¡Enorme agradecimiento a los ayudantes de localización a continuación! <3",
                            "{C:attention}FR{}: Luria12", "{C:attention}ES{}: GoblinKing"}
            }
        },
        ["Other"] = {
            ["p_fur_miniuncommon"] = {
                ["name"] = "Mini Paquete Furry Poco Comun",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:uncommon}Jokers Furry {C:dark_edition}Poco Comunes{}"}
            },
            ["p_fur_uncommon"] = {
                ["name"] = "Paquete Furry Poco Comun",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:uncommon}Jokers Furry {C:dark_edition}Poco Comunes{}"}
            },
            ["p_fur_jumbouncommon"] = {
                ["name"] = "Paquete Furry Poco Comun Jumbo",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:uncommon}Jokers Furry {C:dark_edition}Poco Comunes{}"}
            },
            ["p_fur_specialuncommon"] = {
                ["name"] = "Paquete Furry Poco Comun Especial",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:uncommon}Jokers Furry {C:dark_edition}Poco Comunes{}",
                            "con una {C:attention}edición{} garantizada"}
            },
            ["p_fur_minirare"] = {
                ["name"] = "Mini Paquete Furry Raro",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:rare}Jokers Furry {C:dark_edition}Raros{}"}
            },
            ["p_fur_rare"] = {
                ["name"] = "Paquete Furry Raro",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:rare}Jokers Furry {C:dark_edition}Raros{}"}
            },
            ["p_fur_jumborare"] = {
                ["name"] = "Paquete Furry Raro Jumbo",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:rare}Jokers Furry {C:dark_edition}Raros{}"}
            },
            ["p_fur_specialrare"] = {
                ["name"] = "Paquete Furry Raro Especial",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:rare}Jokers Furry {C:dark_edition}Raros{}",
                            "con una {C:attention}edición{} garantizada"}
            },
            ["p_fur_minilegendary"] = {
                ["name"] = "Mini Paquete Furry Legendario",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:legendary}Jokers Furry {C:dark_edition}Legendarios{}"}
            },
            ["p_fur_legendary"] = {
                ["name"] = "Paquete Furry Legendario",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:legendary}Jokers Furry {C:dark_edition}Legendarios{}"}
            },
            ["p_fur_jumbolegendary"] = {
                ["name"] = "Paquete Furry Legendario Jumbo",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:legendary}Jokers Furry {C:dark_edition}Legendarios{}"}
            },
            ["p_fur_speciallegendary"] = {
                ["name"] = "Paquete Furry Legendario Especial",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:legendary}Jokers Furry {C:dark_edition}Legendarios{}",
                            "con una {C:attention}edición{} garantizada"}
            },
            ["p_fur_minimythic"] = {
                ["name"] = "Mini Paquete Furry Mítico",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:common}Jokers Furry {C:dark_edition}Míticos{}"}
            },
            ["p_fur_mythic"] = {
                ["name"] = "Paquete Furry Mítico",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:common}Jokers Furry {C:dark_edition}Míticos{}"}
            },
            ["p_fur_jumbomythic"] = {
                ["name"] = "Paquete Furry Mítico Jumbo",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:common}Jokers Furry {C:dark_edition}Míticos{}"}
            },
            ["p_fur_specialmythic"] = {
                ["name"] = "Paquete Furry Mítico Especial",
                ["text"] = {"Elige {C:attention}#2#{} de hasta {C:attention}#1#{} ",
                            "{C:common}Jokers Furry {C:dark_edition}Míticos{}",
                            "con una {C:attention}edición{} garantizada"}
            },
            ["fur_redpawseal_seal"] = {
                ["name"] = "Sello de Pata (Rojo)",
                ["label"] = "Sello de Pata",
                ["text"] = {"Puntúa {X:mult,C:white}X#1#{} Mult"}
            },
            ["fur_bluepawseal_seal"] = {
                ["name"] = "Sello de Pata (Azul)",
                ["label"] = "Sello de Pata",
                ["text"] = {"Puntúa {X:chips,C:white}X#1#{} fichas"}
            },
            ["fur_orangepawseal_seal"] = {
                ["name"] = "Sello de Pata (Naranja)",
                ["label"] = "Sello de Pata",
                ["text"] = {"Puntúa {X:chips,C:white}X#2#{} fichas y {X:mult,C:white}X#1#{} Mult",
                            "Da {C:money}$#3#{}", "{C:green}#6# en #4#{} de probabilidad de una carta {C:tarot}#7#{}",
                            "{C:green}#6# en #5#{} de probabilidad de una carta {C:spectral}#8#{}",
                            "{C:inactive}(Debe haber espacio)"}
            }
        },
        ["Partner"] = {
            ["pnr_fur_sparklespartner"] = {
                ["name"] = "SparklesRolf",
                ["text"] = {"Primera {C:attention}carta puntuada{}", "con el palo {C:fur_stars}#3#{}",
                            "da {X:mult,C:white}X#1#{} Mult"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SparklesRolf{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_sparklespartner_alt"] = {
                ["name"] = "SparklesRolf",
                ["text"] = {"La primera carta {C:attention}puntuada{} con el palo {C:fur_stars}#3#",
                            "genera una {C:tarot,T:c_fur_fallingstar}Estrella Fugaz",
                            "{C:inactive}(Funciona una vez por ronda)",
                            "{C:inactive}(Actualmente {C:attention}#2#{C:inactive})"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SparklesRolf{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_illypartner"] = {
                ["name"] = "illyADo",
                ["text"] = {"Primera {C:attention}carta puntuada{} con", "rango {C:attention}#3#{} aumenta",
                            "Mult por {X:mult,C:white}X#2#{}",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Mult)"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}illyADo{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_illypartner_alt"] = {
                ["name"] = "illyADo",
                ["text"] = {"Todos los {C:attention}#4#{} son", "tratados como rango {C:attention}#3#{}"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}illyADo{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_ghostpartner"] = {
                ["name"] = "GhostFox",
                ["text"] = {"Primera {C:attention}carta puntuada{} será", "mejorada a",
                            "una {C:attention}Carta Fantasma"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}GhostFox{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_ghostpartner_alt"] = {
                ["name"] = "GhostFox",
                ["text"] = {"{C:dark_edition}GhostFox{} escala al", "{C:attention}doble{} de velocidad"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}GhostFox{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_sokspartner"] = {
                ["name"] = "SoksAtArt",
                ["text"] = {"Cada {C:attention}3ra{} carta", "{C:attention}Carta Calcetín{} puntuada da",
                            "{C:blue}+1 #2#", "{C:inactive}({C:attention}#1# {C:inactive}restante)"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SoksAtArt{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_sokspartner_alt"] = {
                ["name"] = "SoksAtArt",
                ["text"] = {"{C:attention}Duplica{} el {C:blue}#2#", "dado por {C:dark_edition}SoksAtArt"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SoksAtArt{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_kalikpartner"] = {
                ["name"] = "KalikHusky",
                ["text"] = {"Cada {C:attention}2da{} ronda", "generará una {C:attention}Carta Apestosa",
                            "{C:inactive}({C:attention}#1# {C:inactive}restante)",
                            "Gana {X:mult,C:white}X#3#{} Mult por", "cada {C:attention}Carta Apestosa{} en el mazo",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Mult)"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}KalikHusky{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_kalikpartner_alt"] = {
                ["name"] = "KalikHusky",
                ["text"] = {"{C:dark_edition}KalikHusky{} escala al", "{C:attention}cuádruple{} de velocidad"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}KalikHusky{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_silverpartner"] = {
                ["name"] = "SilverSentinel",
                ["text"] = {"Da {C:money}$#1#{} extra por", "cada carta {C:attention}Plateada{} puntuada"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SilverSentinel{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_silverpartner_alt"] = {
                ["name"] = "SilverSentinel",
                ["text"] = {"Primera {C:attention}Carta Plateada puntuada{}",
                            "genera un {C:tarot,T:c_fur_treasurechest}Cofre del Tesoro",
                            "{C:inactive}(Funciona una vez por ronda)",
                            "{C:inactive}(Actualmente {C:attention}#2#{C:inactive})",
                            "{C:dark_edition}SilverSentinel{} también da", "{C:attention}doble{} de dinero"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SilverSentinel{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_astralpartner"] = {
                ["name"] = "Guardián Astral",
                ["text"] = {"Tiene {C:green}#1# en #2#{} de probabilidad de", "crear una carta {C:spectral}#3#{}",
                            "cuando cartas con {C:fur_stars}#4#", "palo son {C:attention}puntuadas",
                            "{C:inactive}(Funciona una vez por ronda)",
                            "{C:inactive}(Actualmente {C:attention}#5#{C:inactive})"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Guardián Astral{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_astralpartner_alt"] = {
                ["name"] = "Guardián Astral",
                ["text"] = {"{C:dark_edition}Guardián Astral{} genera {C:attention}2{}",
                            "cartas {C:spectral}#3#{} en lugar de {C:attention}1",
                            "{C:inactive}(No necesita espacio, puede desbordar)"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Guardián Astral{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_cobaltpartner"] = {
                ["name"] = "CobaltTheBluPanda",
                ["text"] = {"La primera {C:attention}carta puntuada{}", "con el palo {C:clubs}#3#{}",
                            "da {X:chips,C:white}X#1#{} fichas"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}illyADo{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_cobaltpartner_alt"] = {
                ["name"] = "CobaltTheBluPanda",
                ["text"] = {"La primera carta {C:attention}puntuada{} con el palo {C:clubs}#3#",
                            "genera {C:tarot,T:c_moon}La Luna", "{C:inactive}(Funciona una vez por ronda)",
                            "{C:inactive}(Actualmente {C:attention}#2#{C:inactive})"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}illyADo{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_iceseapartner"] = {
                ["name"] = "IceSea",
                ["text"] = {"Primera {C:attention}carta puntuada{} será", "mejorada a", "una {C:attention}Carta Bono"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}IceSea{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_iceseapartner_alt"] = {
                ["name"] = "IceSea",
                ["text"] = {"Primera {C:attention}Carta Bono puntuando{}",
                            "genera {C:tarot,T:c_hierophant}El Hierofante", "{C:inactive}(Funciona una vez por ronda)",
                            "{C:inactive}(Actualmente {C:attention}#1#{C:inactive})"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}IceSea{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_konekopartner"] = {
                ["name"] = "The_Koneko",
                ["text"] = {"Primera {C:attention}carta puntuada{}", "con {C:hearts}#3#{} palo",
                            "da {X:mult,C:white}X#1#{} Mult"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}The_Koneko{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_konekopartner_alt"] = {
                ["name"] = "The_Koneko",
                ["text"] = {"La primera carta {C:attention}puntuando{} con {C:hearts}#3#",
                            "palo genera {C:tarot,T:c_sun}El Sol", "{C:inactive}(Funciona una vez por ronda)",
                            "{C:inactive}(Actualmente {C:attention}#2#{C:inactive})"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}The_Koneko{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_saphpartner"] = {
                ["name"] = "SaphiélleFox",
                ["text"] = {"Tiene una {C:green}#1# en #2#{} probabilidad de", "crear una carta {C:tarot}#3#{}",
                            "cuando cartas con {C:spades}#4#", "palo son {C:attention}puntuadas",
                            "{C:inactive}(Funciona una vez por ronda)",
                            "{C:inactive}(Actualmente {C:attention}#5#{C:inactive})"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SaphiélleFox{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_saphpartner_alt"] = {
                ["name"] = "SaphiélleFox",
                ["text"] = {"{C:dark_edition}SaphiélleFox{} genera {C:attention}2{}",
                            "cartas {C:tarot}#3#{} en lugar de {C:attention}1",
                            "{C:inactive}(No necesita espacio, puede desbordar)"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SaphiélleFox{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_skipspartner"] = {
                ["name"] = "DelusionalSkips",
                ["text"] = {"Tiene una {C:green}#1# en #2#{} probabilidad de",
                            "ganar instantáneamente cegueras no-{C:attention}jefe{}",
                            "Por cada {C:attention}2{} cegueras saltadas", "genera una {C:attention}Etiqueta Skips",
                            "{C:inactive}({C:attention}#3#{C:inactive} restante)"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}DelusionalSkips{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_skipspartner_alt"] = {
                ["name"] = "DelusionalSkips",
                ["text"] = {"{C:attention}Duplica{} las {C:green}probabilidades{} y",
                            "{C:attention}etiquetas{} dadas por {C:dark_edition}DelusionalSkips"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}DelusionalSkips{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_sparkpartner"] = {
                ["name"] = "SparkTheBird",
                ["text"] = {"Primera {C:attention}carta puntuada{} da {X:mult,C:white}X#1#{} Mult",
                            "cuando se puntúan {C:attention}2s{} de {C:attention}cualquier palo{} o",
                            "{C:diamonds}#4#{} de {C:attention}cualquier rango{}",
                            "{X:mult,C:white}X#2#{} Mult si un {C:attention}2{} de {C:diamonds}#4#{}", "es puntuado"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SparkTheBird{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_sparkpartner_alt"] = {
                ["name"] = "SparkTheBird",
                ["text"] = {"La primera carta {C:attention}puntuando{} con {C:diamonds}#4#",
                            "palo genera {C:tarot,T:c_star}La Estrella", "{C:inactive}(Funciona una vez por ronda)",
                            "{C:inactive}(Actualmente {C:attention}#3#{C:inactive})"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SparkTheBird{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_lupositypartner"] = {
                ["name"] = "Luposity",
                ["text"] = {"Al {C:attention}final de ronda{} añade una",
                            "{C:attention}galleta{} al {C:dark_edition}tarro de galletas",
                            "Cuando {C:attention}se hace clic{}, genera un",
                            "{C:attention}galleta{} consumible aleatoria",
                            "{C:inactive}(Capacidad del tarro: {C:attention}#1#{C:inactive})"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Luposity{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_lupositypartner_alt"] = {
                ["name"] = "Luposity",
                ["text"] = {"Al {C:attention}final de ronda{} añade una",
                            "{C:attention}galleta{} al {C:dark_edition}tarro de galletas",
                            "Cuando {C:attention}se hace clic{}, genera un",
                            "{C:attention}galleta{} consumible aleatoria",
                            "{C:inactive}(Capacidad del tarro: {C:attention}#1#{C:inactive})",
                            "Consumibles de {C:attention}galleta{} usados escalan",
                            "{C:dark_edition}Luposity{} al {C:attention}quíntuple{} de velocidad"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Luposity{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_curiousangelpartner"] = {
                ["name"] = "CuriousAngel",
                ["text"] = {"Si la primera {C:attention}carta puntuada{} es {C:dark_edition}#3#",
                            "este CiervoZorro gana {X:mult,C:white}X#4#{} Mult",
                            "si no lo es, tiene una {C:green}#1# en #2#{} probabilidad de convertirse en {C:dark_edition}#3#",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#5#{C:inactive} Mult)"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}CuriousAngel{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_curiousangelpartner_alt"] = {
                ["name"] = "CuriousAngel",
                ["text"] = {"{C:attention}Duplica{} las {C:green}probabilidades{} y",
                            "{C:attention}escalado{} para {C:dark_edition}CuriousAngel"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}CuriousAngel{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_sephirapawspartner"] = {
                ["name"] = "SephiraPaws",
                ["text"] = {"Este Zorro gana {X:mult,C:white}X#2#{} Mult por cada",
                            "{C:attention}carta de juego{} en tu {C:attention}baraja completa",
                            "{C:attention}cuando {C:attention}descartas{} tu",
                            "mano de póker {C:attention}más jugada{}", "{C:inactive}(Funciona una vez por ronda)",
                            "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Mult y{C:attention} #3#{C:inactive})"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SephiraPaws{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_sephirapawspartner_alt"] = {
                ["name"] = "SephiraPaws",
                ["text"] = {"{C:dark_edition}SephiraPaws{} escala al", "{C:attention}doble{} de velocidad"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SephiraPaws{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_xavierorjosepartner"] = {
                ["name"] = "Joseeeeee",
                ["text"] = {"Primera {C:attention}carta puntuada{} será", "{C:attention}mejorada{} a una",
                            "{C:attention}mejora{} aleatoria"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Joseeeeee{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_xavierorjosepartner_alt"] = {
                ["name"] = "Joseeeeee",
                ["text"] = {"{C:attention}Duplica{} las {C:green}probabilidades{} y",
                            "{C:attention}escalado{} para {C:dark_edition}Joseeeeee"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Joseeeeee{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_foxxlyduskfurpartner"] = {
                ["name"] = "FoxxlyDuskFur",
                ["text"] = {"Da {C:attention}1{}", "{C:green}Reinicio{} gratis por tienda"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}FoxxlyDuskFur{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_foxxlyduskfurpartner_alt"] = {
                ["name"] = "FoxxlyDuskFur",
                ["text"] = {"Da {C:attention}1{}", "{C:green}Reinicio{} gratis por tienda",
                            "{C:dark_edition}FoxxlyDuskFur{} escala", "{C:attention}doble{} de rápido",
                            "{C:inactive}(Escalado se acumula con sinergia)"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}FoxxlyDuskFur{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_kris57partner"] = {
                ["name"] = "Kris_57",
                ["text"] = {"Primer {C:attention}5 puntuado{}", "aumenta Mult por {X:mult,C:white}X#1#",
                            "Primer {C:attention}7 puntuado{}", "aumenta fichas por {X:chips,C:white}X#2#",
                            "{C:inactive}(Actualmente {X:chips,C:white}X#4#{C:inactive} fichas y {X:mult,C:white}X#3#{C:inactive} Mult)"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Kris_57{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_kris57partner_alt"] = {
                ["name"] = "Kris_57",
                ["text"] = {"{C:dark_edition}Kris_57{} escala al", "{C:attention}doble{} de velocidad",
                            "y da {C:attention}doble{} de {C:money}$"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Kris_57{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_sourstone3partner"] = {
                ["name"] = "Sourstone :3",
                ["text"] = {"Al {C:attention}puntuar manos{}, guarda",
                            "{C:money}$2.5{} en el {C:dark_edition}balance actual",
                            "{C:attention}Clic izquierdo{} para retirar todo el {C:money}$ disponible",
                            "{C:attention}Clic derecho{} para gastar {C:money}$2.5{}",
                            "del {C:money}${} disponible para puntuar {X:mult,C:white}X#1#{} Mult",
                            "{C:inactive}(Balance actual: {C:money}$#2#{C:inactive} / Estado Mult: {C:attention}#3#{C:inactive})"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Sourstone :3{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_sourstone3partner_alt"] = {
                ["name"] = "Sourstone :3",
                ["text"] = {"{C:dark_edition}Sourstone :3{} ya no", "toma dinero al puntuar Mult"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Sourstone :3{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_maltnoodlezpartner"] = {
                ["name"] = "MaltNoodlez",
                ["text"] = {"Al {C:attention}establecer cegueras {C:red}debilita",
                            "un Joker {C:attention}aleatorio{} hasta el {C:attention}final de ronda",
                            "Mientras {C:attention}se juega una ronda{}, copia la",
                            "habilidad del Joker {C:attention}más a la derecha{}"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}MaltNoodlez{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_maltnoodlezpartner_alt"] = {
                ["name"] = "MaltNoodlez",
                ["text"] = {"{C:dark_edition}MaltNoodlez{} ya no debilita",
                            "Jokers al {C:attention}establecer cegueras",
                            "Mientras {C:attention}se juega una ronda{}, copia la",
                            "habilidad del Joker {C:attention}más a la derecha{}"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}MaltNoodlez{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_nemzatapartner"] = {
                ["name"] = "Nemzata",
                ["text"] = {"{C:attention}Clic izquierdo{} para disparar una flecha",
                            "a una {C:attention}carta de juego{} aleatoria",
                            "{C:green}#1# en #2#{} probabilidad de {C:red}eliminar{} la carta",
                            "Cada {C:attention}eliminación{} guarda {C:money}250{} monedas {C:inactive}[{C:money}$2.5{C:inactive}]",
                            "{C:attention}Clic derecho{} para cobrar todas las monedas guardadas",
                            "Al {C:attention}establecer cegueras{}, restaura toda la munición",
                            "{C:inactive}(Capacidad de munición: {C:attention}#3#{C:inactive}/3 / Monedas actuales: {C:money}#4# {C:inactive}[{C:money}$#5#{C:inactive}])"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Nemzata{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_nemzatapartner_alt"] = {
                ["name"] = "Nemzata",
                ["text"] = {"{C:dark_edition}Nemzata{} da", "{C:attention}doble{} de monedas",
                            "La munición en {C:tarot}Arco de Nemz{} es", "aumentada en {C:attention}2"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Nemzata{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_schnackiofficialpartner"] = {
                ["name"] = "SchnackiOfficial",
                ["text"] = {"Primera {C:attention}carta puntuada{}", "con {C:spades}#3#{} palo",
                            "da {X:mult,C:white}X#1#{} Mult"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SchnackiOfficial{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_schnackiofficialpartner_alt"] = {
                ["name"] = "SchnackiOfficial",
                ["text"] = {"La primera carta {C:attention}puntuando{} con {C:spades}#3#",
                            "palo genera {C:tarot,T:c_world}El Mundo", "{C:inactive}(Funciona una vez por ronda)",
                            "{C:inactive}(Actualmente {C:attention}#2#{C:inactive})"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}SchnackiOfficial{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_diablo2324partner"] = {
                ["name"] = "Diablo2324",
                ["text"] = {"Los Jokers {C:dark_edition}Furry{}", "cada uno da {X:mult,C:white}X#1#{} Mult"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Diablo2324{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_diablo2324partner_alt"] = {
                ["name"] = "Diablo2324",
                ["text"] = {"{C:dark_edition}Diablo2324{} es", "{C:attention}doble{} de fuerte"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Diablo2324{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_dannypartner"] = {
                ["name"] = "Danny",
                ["text"] = {"Este GatoDragón {C:attention}debilita{} todas las cartas no-{C:fur_stars}#3#{}",
                            "Por cada {C:attention}mano jugada{} que contiene un {C:attention}Color{}, añade",
                            "{X:mult,C:white}X#1#{} Mult y aplica un {C:blue}Sello de Pata Azul{} a la {C:attention}primera{} carta",
                            "La primera carta {C:attention}puntuada {C:fur_stars}#3#{} da {X:mult,C:white}X#2#{} Mult"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Danny{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_dannypartner_alt"] = {
                ["name"] = "Danny",
                ["text"] = {"{C:dark_edition}Danny{} es {C:attention}doble", "de fuerte y ya no",
                            "debilita cartas no-{C:fur_stars}#3#{}"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Danny{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_iridiapartner"] = {
                ["name"] = "Iridia",
                ["text"] = {"Primera {C:attention}carta puntuada{} da",
                            "{X:chips,C:white}X#1#{} fichas y {X:mult,C:white}X#2#{} Mult"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Iridia{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_iridiapartner_alt"] = {
                ["name"] = "Iridia",
                ["text"] = {"{C:dark_edition}Iridia{} es", "{C:attention}doble{} de fuerte"},
                ["unlock"] = {"Gana una partida con", "{C:dark_edition}Iridia{} en",
                              "dificultad {C:attention}Apuesta Dorada{}"}
            },
            ["pnr_fur_parrotdashpartner"] = {
                ["name"] = "Parrot Dash",
                ["text"] = {"Este Zorro da {C:mult}+Mult{} usando la siguiente fórmula",
                            "{C:mult}#1#{C:inactive} + ({C:attention}#3#{C:inactive} x {C:attention}#4#{C:inactive})",
                            "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Mult)"}
            },
            ["pnr_fur_parrotdashpartner_alt"] = {
                ["name"] = "Parrot Dash",
                ["text"] = {"{C:attention}Duplica{} los valores usados",
                            "para la fórmula de {C:dark_edition}Parrot Dash{}", "{C:inactive}(Excepto #3# y #4#)"}
            },
            ["pnr_fur_lumepartner"] = {
                ["name"] = "Lume",
                ["text"] = {"Si la primera {C:attention}carta puntuada{} es una",
                            "carta {C:attention}Príncipe{}, este DragónGato da {X:mult,C:white}X#1#{} Mult",
                            "si no lo es, mejórala a una carta {C:attention}Príncipe{} si es una {C:attention}Carta de Figura"}
            },
            ["pnr_fur_lumepartner_alt"] = {
                ["name"] = "Lume",
                ["text"] = {"{C:attention}Duplica{} los valores para",
                            "{C:dark_edition}Lume{} y cartas {C:attention}Príncipe{}"}
            }
        },
        ["Planet"] = {
            ["c_fur_kepler62e"] = {
                ["name"] = "Kepler-62e",
                ["text"] = {"({V:1}nivel.#1#{}) Mejora", "{C:attention}Espectro", "{C:mult}+2{} Mult y",
                            "{C:chips}+15{} fichas"}
            },
            ["c_fur_kepler62f"] = {
                ["name"] = "Kepler-62f",
                ["text"] = {"({V:1}nivel.#1#{}) Mejora", "{C:attention}Espectro Recta", "{C:mult}+3{} Mult y",
                            "{C:chips}+35{} fichas"}
            },
            ["c_fur_kepler22b"] = {
                ["name"] = "Kepler-22b",
                ["text"] = {"({V:1}nivel.#1#{}) Mejora", "{C:attention}Casa Espectro", "{C:mult}+3{} Mult y",
                            "{C:chips}+35{} fichas"}
            },
            ["c_fur_kepler20e"] = {
                ["name"] = "Kepler-20e",
                ["text"] = {"({V:1}nivel.#1#{}) Mejora", "{C:attention}Cinco Espectro", "{C:mult}+4{} Mult y",
                            "{C:chips}+40{} fichas"}
            }
        },
        ["Sleeve"] = {
            ["sleeve_fur_floofysleeve"] = {
                ["name"] = "Manga Esponjosa",
                ["text"] = {"Comienza la partida con un", "{C:dark_edition}Furry{} #1# aleatorio no-{C:common}Mítico",
                            "{C:green}#4# en #5#{} probabilidad de crear un {C:dark_edition}Furry",
                            "#1# cuando se derrota una ciega jefe", "{C:inactive}(Debe haber espacio)"}
            },
            ["sleeve_fur_floofysleeve_alt"] = {
                ["name"] = "Manga Esponjosa",
                ["text"] = {"{C:common}Furries Míticos{} ahora pueden aparecer", "al comenzar la partida",
                            "{C:dark_edition}Furry{} #2# generado por jefes", "tiene una {C:attention}#3#{} garantizada"}
            },
            ["sleeve_fur_stargazerssleeve"] = {
                ["name"] = "Manga Estelar",
                ["text"] = {"Comienza la partida con",
                            "{C:dark_edition,T:j_fur_astral}Guardián Astral{} y {C:dark_edition,T:j_fur_sparkles}SparklesRolf{}",
                            "y {C:attention}2{} Copias de", "{C:tarot,T:c_fur_fallingstar}Estrellas Fugaces"}
            },
            ["sleeve_fur_stargazerssleeve_alt"] = {
                ["name"] = "Manga Estelar",
                ["text"] = {"Convierte un palo {C:attention}aleatorio{} a palo {C:fur_stars}Estrella{}",
                            "{C:inactive}(Si está habilitado)",
                            "Genera {C:attention}2{} cartas {C:spectral}#1#{} aleatorias",
                            "en lugar de {C:tarot,T:c_fur_fallingstar}Estrellas Fugaces{}",
                            "{C:inactive}(Excepto cartas ocultas como {C:spectral,T:c_soul}El Alma{C:inactive})"}
            },
            ["sleeve_fur_chipsgaloresleeve"] = {
                ["name"] = "Manga de Fichas a Montones",
                ["text"] = {"Comienza la partida con",
                            "{C:dark_edition,T:j_fur_icesea}Ice Sea{} y {C:dark_edition,T:j_fur_cobalt}CobaltTheBluPanda{}",
                            "y {C:attention}1{} copia de",
                            "{C:tarot,T:c_heirophant}El Hierofante{} y {C:tarot,T:c_moon}La Luna"}
            },
            ["sleeve_fur_chipsgaloresleeve_alt"] = {
                ["name"] = "Manga de Fichas a Montones",
                ["text"] = {"Aplica edición {C:dark_edition,T:e_foil}#3#{} a #1# inicial",
                            "Convierte un palo {C:attention}aleatorio{} a palo {C:clubs}#2#{}",
                            "Comienza la partida con un {C:spectral,T:c_black_hole}Agujero Negro{} adicional"}
            },
            ["sleeve_fur_corruptsleeve"] = {
                ["name"] = "Manga Corrupta",
                ["text"] = {"Comienza la partida con", "un Joker {V:1}Corrupto{} descubierto aleatorio",
                            "Al {C:attention}final{} del cálculo", "{V:1}corrompe{} fichas y Mult"}
            },
            ["sleeve_fur_corruptsleeve_alt"] = {
                ["name"] = "Manga Corrupta",
                ["text"] = {"La corrupción del {V:1}Mazo Corrupto{} es", "{C:attention}cinco veces{} más fuerte"}
            }
        },
        ["Spectral"] = {
            ["c_fur_kingme"] = {
                ["name"] = "¡Rey Me!",
                ["text"] = {"Convierte hasta", "{C:attention}#1#{} cartas seleccionadas", "a {C:attention}Reyes{}"}
            },
            ["c_fur_floofball"] = {
                ["name"] = "Bola Esponjosa",
                ["text"] = {"Crea un", "{C:dark_edition}Furry{} {C:attention}Joker{} aleatorio",
                            "Establece dinero en {C:money}$0{}", "{C:inactive}(Debe haber espacio)"}
            },
            ["c_fur_rednotarystamp"] = {
                ["name"] = "Sello Notarial (Rojo)",
                ["text"] = {"Añade un {C:attention}Sello de Pata (Rojo)", "a {C:attention}#1#{} carta seleccionada",
                            "en tu mano"}
            },
            ["c_fur_bluenotarystamp"] = {
                ["name"] = "Sello Notarial (Azul)",
                ["text"] = {"Añade un {C:attention}Sello de Pata (Azul)", "a {C:attention}#1#{} carta seleccionada",
                            "en tu mano"}
            },
            ["c_fur_orangenotarystamp"] = {
                ["name"] = "Sello Notarial (Naranja)",
                ["text"] = {"Añade un {C:attention}Sello de Pata (Naranja)", "a {C:attention}#1#{} carta seleccionada",
                            "en tu mano"}
            }
        },
        ["Tag"] = {
            ["tag_fur_furrytag"] = {
                ["name"] = "Etiqueta de Pata",
                ["text"] = {"La tienda tiene un", "{C:dark_edition}Joker Furry{} gratis"}
            },
            ["tag_fur_foilfurrytag"] = {
                ["name"] = "Etiqueta de Pata Foil",
                ["text"] = {"La tienda tiene un", "{C:dark_edition}#1# Furry{} Joker gratis"}
            },
            ["tag_fur_holofurrytag"] = {
                ["name"] = "Etiqueta de Pata Holo",
                ["text"] = {"La tienda tiene un", "{C:dark_edition}#1# Furry{} Joker gratis"}
            },
            ["tag_fur_polyfurrytag"] = {
                ["name"] = "Etiqueta de Pata Policromo",
                ["text"] = {"La tienda tiene un", "{C:dark_edition}#1# Furry{} Joker gratis"}
            },
            ["tag_fur_negativefurrytag"] = {
                ["name"] = "Etiqueta de Pata Negativa",
                ["text"] = {"La tienda tiene un", "{C:dark_edition}#1# Furry{} Joker gratis"}
            },
            ["tag_fur_skipstag"] = {
                ["name"] = "Etiqueta Skips",
                ["text"] = {"Próxima tienda tiene un", "paquete {C:dark_edition}Furry{} aleatorio gratis"}
            },
            ["tag_fur_uncommonpawtag"] = {
                ["name"] = "Etiqueta de Pata Poco Comun",
                ["text"] = {"La tienda tiene un", "{C:uncommon}#1# {C:dark_edition}Joker Furry{} gratis"}
            },
            ["tag_fur_rarepawtag"] = {
                ["name"] = "Etiqueta de Pata Rara",
                ["text"] = {"La tienda tiene un", "{C:rare}#1# {C:dark_edition}Joker Furry{} gratis"}
            },
            ["tag_fur_legendarypawtag"] = {
                ["name"] = "Etiqueta de Pata Legendaria",
                ["text"] = {"La tienda tiene un", "{C:legendary}#1# {C:dark_edition}Joker Furry{} gratis"}
            },
            ["tag_fur_mythicpawtag"] = {
                ["name"] = "Etiqueta de Pata Mítica",
                ["text"] = {"La tienda tiene un", "{C:common}#1# {C:dark_edition}Joker Furry{} gratis"}
            }
        },
        ["Tarot"] = {
            ["c_fur_fallingstar"] = {
                ["name"] = "Estrella Fugaz",
                ["text"] = {"Convierte hasta", "{C:attention}#1#{} cartas seleccionadas", "a {C:fur_stars}#2#{}"}
            },
            ["c_fur_playingsocks"] = {
                ["name"] = "Calcetines Jugadores",
                ["text"] = {"Mejora hasta", "{C:attention}#1#{} cartas seleccionadas",
                            "a cartas {C:attention}Calcetín{}"}
            },
            ["c_fur_treasurechest"] = {
                ["name"] = "Cofre del Tesoro",
                ["text"] = {"Mejora hasta", "{C:attention}#1#{} cartas seleccionadas",
                            "a cartas {C:attention}Plateadas{}"}
            }
        },
        ["thedarkness"] = {
            ["c_fur_thedarknessconsumesyou"] = {
                ["name"] = "???"
            }
        },
        ["lupocookies"] = {
            ["c_fur_chocolatechipcookie"] = {
                ["name"] = "Galleta de Chocolate",
                ["text"] = {"Aumenta la ganancia de Mult", "de {C:dark_edition}Luposity{} por {X:mult,C:white}X0.25"}
            },
            ["c_fur_buttercookie"] = {
                ["name"] = "Galleta de Mantequilla",
                ["text"] = {"Aumenta aleatoriamente las {C:dark_edition}ranuras de Joker{}",
                            "{C:dark_edition}ranuras de consumible{} o {C:dark_edition}tamaño de mano",
                            "por {C:attention}#1#"}
            },
            ["c_fur_doublechocolatechipcookie"] = {
                ["name"] = "Galleta de Chocolate Doble",
                ["text"] = {"Mejora una {C:attention}mano de póker aleatoria",
                            "y {C:attention}duplica{} fichas o Mult", "{C:inactive}(Incluye manos ocultas)"}
            },
            ["c_fur_rainbowchocolatechipcookie"] = {
                ["name"] = "Galleta de Chocolate Arcoíris",
                ["text"] = {"Mejora una {C:attention}mano de póker aleatoria", "{C:inactive}(Incluye manos ocultas)"}
            },
            ["c_fur_sugarcookie"] = {
                ["name"] = "Galleta de Azúcar",
                ["text"] = {"Mejora tu {C:attention}última mano de póker", "jugada",
                            "{C:inactive}(Actualmente {C:attention}#1#{C:inactive})"}
            },
            ["c_fur_fortunecookie"] = {
                ["name"] = "Galleta de la Fortuna",
                ["text"] = {"Crea una carta", "{C:tarot}#1#{} aleatoria", "{C:inactive}(Debe haber espacio)"}
            },
            ["c_fur_oatmealraisincookie"] = {
                ["name"] = "Galleta de Avena y Pasas",
                ["text"] = {"{C:red}Duplica{} el objetivo de la ciega",
                            "Da {C:attention}#1#{} {C:attention}Etiquetas{} aleatorias"}
            }
        },
        ["jokerconsumables"] = {
            ["c_fur_nemzsbow"] = {
                ["name"] = "Arco de Nemz",
                ["text"] = {"Tiene una {C:green}#1# en #2#{} probabilidad de {C:red}eliminar",
                            "la carta {C:attention}#3#{} seleccionada cuando se usa",
                            "Al {C:attention}seleccionar cegueras{}, restaura toda la munición",
                            "{C:inactive}(Munición actual: {C:attention}#4#{C:inactive}/#5#)"}
            }
        }
    },
    ["misc"] = {
        ["achievement_descriptions"] = {
            ["ach_fur_darksideofthedeck"] = {"Tener al menos 52 cartas Negativas", "en tu mazo en una sola partida"},
            ["ach_fur_thedreamteam"] = {"Tener SparklesRolf, illyADo,", "y GhostFox en una sola partida"},
            ["ach_fur_closetedfurry"] = {"Derrotar La Pata sin", "Jokers Furry"},
            ["ach_fur_againstallodds"] = {"Derrotar La Pata con al", "menos 4 Jokers Furry"},
            ["ach_fur_imouttahere"] = {"Ganar una ceguera con el", "efecto de DelusionalSkips"},
            ["ach_fur_savedbythebuzzer"] = {"Ganar una ceguera jefe con el", "efecto de DelusionalSkips"},
            ["ach_fur_heartofthechips"] = {"Aplicar Edición Foil", "a Ice Sea"},
            ["ach_fur_thewholegang"] = {"Tener todos los Jokers Furry", "en una sola partida"},
            ["ach_fur_e621"] = {"Puntuar exactamente e621 en una sola mano", "*Requiere Talismán*"},
            ["ach_fur_doubledown"] = {"Descartar 10 o más", "cartas a la vez"},
            ["ach_fur_maxedout"] = {"Ganar ambos desafíos de Maximización", "de Mult y Fichas"},
            ["ach_fur_ineedashower"] = {"Tener al menos 26 cartas Apestosas", "en tu mazo en una sola partida"},
            ["ach_fur_ghosted"] = {"Jugar una mano de 5 o", "más cartas Fantasma"},
            ["ach_fur_enhancedspectrum"] = {"Puntuar cada carta mejorada", "de Furlatro en una sola mano"},
            ["ach_fur_youaregae"] = {"¿Por qué Eres Gae?"},
            ["ach_fur_ultimatecollector"] = {"Tener todos los Furries Míticos", "en una sola partida"},
            ["ach_fur_dirtylaundry"] = {"Puntuar una carta Calcetín", "con una carta Apestosa"},
            ["ach_fur_welcometothefandom"] = {"Tener 1 Joker Furry"},
            ["ach_fur_ghostedsquared"] = {"Puntuar 10 o más cartas", "en una sola mano"},
            ["ach_fur_fursuitmoney"] = {"Tener al menos $3500+", "en una sola partida"},
            ["ach_fur_ohno"] = {"Usar ???"},
            ["ach_fur_teamwipe"] = {"Eliminar 3 cartas en una sola", "ronda con Arco de Nemz"},
            ["ach_fur_teamwipeplus"] = {"Eliminar 5 cartas en una sola", "ronda con Arco de Nemz"},
            ["ach_fur_doublerainbow"] = {"Aplicar Edición Policromo", "a El Arcoíris"}
        },
        ["achievement_names"] = {
            ["ach_fur_darksideofthedeck"] = "Lado Oscuro de la Baraja",
            ["ach_fur_thedreamteam"] = "El Equipo Soñado",
            ["ach_fur_closetedfurry"] = "Furry en el Armario",
            ["ach_fur_againstallodds"] = "Contra Todas las Probabilidades",
            ["ach_fur_imouttahere"] = "Me Largo de Aquí",
            ["ach_fur_savedbythebuzzer"] = "Salvado por la Campana",
            ["ach_fur_heartofthechips"] = "Corazón de las Fichas",
            ["ach_fur_thewholegang"] = "Toda la Pandilla",
            ["ach_fur_e621"] = "e621",
            ["ach_fur_doubledown"] = "Doble Apuesta",
            ["ach_fur_maxedout"] = "Maximizado",
            ["ach_fur_ineedashower"] = "Necesito una Ducha",
            ["ach_fur_ghosted"] = "Fantasmal",
            ["ach_fur_enhancedspectrum"] = "Espectro Mejorado",
            ["ach_fur_youaregae"] = "Eres Gae",
            ["ach_fur_ultimatecollector"] = "Coleccionista Supremo",
            ["ach_fur_dirtylaundry"] = "Ropa Sucia",
            ["ach_fur_welcometothefandom"] = "Bienvenido al Fandom",
            ["ach_fur_ghostedsquared"] = "Fantasmal al Cuadrado",
            ["ach_fur_fursuitmoney"] = "Dinero de Fursuit",
            ["ach_fur_ohno"] = "Oh no...",
            ["ach_fur_teamwipe"] = "Barrido de Equipo",
            ["ach_fur_teamwipeplus"] = "Barrido de Equipo+",
            ["ach_fur_doublerainbow"] = "Doble Arcoíris"
        },
        ["challenge_names"] = {
            ["c_fur_challengechipsmaxing"] = "Maximización de Fichas",
            ["c_fur_challengemultmaxing"] = "Maximización de Mult",
            ["c_fur_challengenegativenancy"] = "Nancy Negativa"
        },
        ["collabs"] = {
            ["Clubs"] = {
                ["8"] = "Furlatro (El Equipo Soñado)"
            },
            ["Diamonds"] = {
                ["8"] = "Furlatro (El Equipo Soñado)"
            },
            ["Hearts"] = {
                ["8"] = "Furlatro (El Equipo Soñado)"
            },
            ["Spades"] = {
                ["8"] = "Furlatro (El Equipo Soñado)"
            },
            ["fur_stars"] = {
                ["2"] = "Furlatro (El Equipo Soñado)"
            }
        },
        ["dictionary"] = {
            ["k_fur_rarityfurry"] = "Furry",
            ["fur_startoggle"] = "Comenzar con Palo Estrella",
            ["fur_pokerhands"] = "Manos de Póker Espectro",
            ["fur_complexjokers"] = "Bases de Joker Complejos",
            ["fur_jokerquotes"] = "Mostrar Citas de Joker",
            ["fur_jokerdisplayscaling"] = "Mostrar Escalado de Visualización de Joker",
            ["fur_restartrequired"] = "*Requiere Reiniciar*",
            ["fur_restartrecommended"] = "*Reinicio Recomendado*",
            ["fur_enabled"] = "Habilitado",
            ["fur_disabled"] = "Deshabilitado",
            ["fur_kalikstink"] = "¡Kalik Apesta!",
            ["fur_angelnegated"] = "¡Negado!",
            ["fur_skipstag"] = "+Etiqueta Skips",
            ["fur_ghostcardtrigger"] = "¡Fantasmal!",
            ["fur_princecardtrigger"] = "¡Realeza!",
            ["fur_corrupted"] = "¡Corrupto!",
            ["fur_cookie"] = "¡Galleta!",
            ["fur_cookiestored"] = "Galleta Guardada",
            ["fur_enhanced"] = "¡Mejorado!",
            ["fur_sealed"] = "¡Sellado!",
            ["fur_cleansed"] = "¡Purificado!",
            ["fur_elim"] = "¡Eliminado!",
            ["fur_jokerslotplus"] = "Ranura de Joker",
            ["fur_consumeableslotplus"] = "Ranura de Consumible",
            ["fur_handsizeplus"] = "Tamaño de Mano",
            ["fur_ghostcard"] = "Cartas Fantasma",
            ["fur_sockcard"] = "Cartas Calcetín",
            ["fur_stinkycard"] = "Cartas Apestosas",
            ["fur_silvercard"] = "Cartas Plateadas",
            ["fur_bonuscard"] = "Cartas Bono",
            ["fur_princecard"] = "Cartas Príncipe",
            ["fur_plusconsumable"] = "Consumible",
            ["fur_consumableused"] = "Consumible Usado",
            ["fur_shopbuyreroll"] = "Comprar o Reiniciar",
            ["fur_codeused"] = "Código Usado",
            ["fur_skipstext"] = "Victoria de Ceguera",
            ["fur_joker"] = "Joker",
            ["fur_jdelim"] = "Eliminación"
        },
        ["labels"] = {
            ["k_fur_rarityfurry"] = "Furry",
            ["fur_mythic"] = "Mítica",
            ["fur_corrupt"] = "Corrupto",
            ["fur_redpawseal_seal"] = "Sello de Pata",
            ["fur_bluepawseal_seal"] = "Sello de Pata",
            ["fur_orangepawseal_seal"] = "Sello de Pata"
        },
        ["poker_hand_descriptions"] = {
            ["fur_spectrum"] = {"5 cartas que tienen", "palos únicos"},
            ["fur_straightspectrum"] = {"5 cartas que tienen", "palos únicos y están en una",
                                        "fila (rangos consecutivos)"},
            ["fur_spectrumhouse"] = {"5 cartas que tienen", "palos únicos con un", "Trio y un par"},
            ["fur_spectrumfive"] = {"5 cartas que comparten el mismo", "rango y tienen palos únicos"}
        },
        ["poker_hands"] = {
            ["fur_spectrum"] = "Espectro",
            ["fur_straightspectrum"] = "Espectro Recta",
            ["fur_straightspectrum_2"] = "Espectro Real",
            ["fur_spectrumhouse"] = "Casa Espectro",
            ["fur_spectrumfive"] = "Cinco Espectro"
        },
        ["suits_plural"] = {
            ["fur_stars"] = "Estrellas"
        },
        ["suits_singular"] = {
            ["fur_stars"] = "Estrella"
        },
        ["v_text"] = {
            ["ch_c_fur_no_mult"] = {"Todas las cartas relacionadas con {C:mult}Mult{} están prohibidas"},
            ["ch_c_fur_no_chips"] = {"Todas las cartas relacionadas con {C:chips}Fichas{} están prohibidas"},
            ["ch_c_fur_planet_exception"] = {"excepto cartas {C:planet}Planeta{}"},
            ["ch_c_fur_curiousangel_start"] = {"Comienza la partida con un {C:legendary}Eterno{} {C:dark_edition}CuriousAngel"}
        }
    }
}
