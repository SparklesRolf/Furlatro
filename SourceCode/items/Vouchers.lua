local furry_mod = SMODS.current_mod
local config = furry_mod.config

SMODS.Voucher { -- Fur Meet
    key = "furrymeetup",
    atlas = "furryvouchers",
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    cost = 10,
}

SMODS.Voucher { -- Furry Convention
    key = "furryconvention",
    atlas = "furryvouchers",
    pos = { x = 1, y = 0 },
    unlocked = true,
    discovered = true,
    cost = 10,
    requires = { "v_fur_furrymeetup" },
}

































































































--                              You like datamining furry mods don't you
--              #####                                                                      #####      
--              #####                                                                      #####      
--          ####.   +###                                                               ####.   +###   
--          ####.   +###                                                               ####.   +###   
--      ####-       +###                                                           ####-       +###   
--      ####-       +######                                                      ######-       +######
--      ####-          -####                                                    ####              -###
--      ####-          -####                                                 ####+++              -###
--      ####-          -####                                                ####-                 -###
--   ####+++.          .+++####          ###########                     ####+++.                 -###
--   ####                  +###          ############                    ###+                     -###
--   ####                  -+++####      ####+++++++########             ###+                     -###
--   ####                     .####      ###+       +#######             ###+                     -###
--   ####                      ---+###   ###+       .------+###      ####+---                     -###
--   ####                         +###   ###+              +###      ####-                        -###
--   ####                         .---######+-..           .---####  ####-                        -###
--   ####                            .####  ####-             .####  ####-                        -###
--   ####                         .--+##########-              .--+##+---                         -###
--   ####                         +#############-                 -##+                            -###
--   ####                         +##+----------                   --.                            -###
--   ####                         +##-                                                            -###
--   ####                          ...-------------.                                              -###
--   ####                            .#############+                                              -###
--   ####                             .............                                               -###
--   ####                                                                                         -###
--   ####                                                                                         -###
--   ####                                                                                         -###
--   ####                                                                                         -###
--   ####                                                                                         -###
--   ####           -+++++++++++++++++++++++-            .++++++++++++++++++++++++++           -++####
--   ####           +#######################+            -##########################           +###   
--    ######-       +##-      -##########-                  .##########+        -###       .######    
--      ####-       +##-      .##########.                   +#########-        .###       -####      
--##############.   +##-      .##########.                   +#########-        .###   .##############
--##############.   +##-      .##########.                   +#########-        .###   .##############
--###-                        .##########.                   +#########-                          -###
--###-                        .##########.                   +#########-                          -###
--   ####                     .##########.                   +#########-                       +###   
--   ####.                    .##########.                   +#########-                       +###   
--      ####-                                +#########-                                   -####      
--      ####-                                +#########.                                   -####      
--      ####-       -++.   -++.                                          .++-    ++-       -####      
--   ####+++-       .--.   .--                                           .--.    --.       .+++####   
--   ####       .++-   .++-          .###.      -##+       +##-       -++.   -++.              +###   
--   ####        --.    --.           +++.      -++-.      -++.       .--    .--               +###   
--   ####                                -######-   +######                                    +###   
--   ####-                               .++++++.   -+++++-                                   .####   
--   ##################-                                                     +#####################   
--   ##################+......                                         ......+#####################   
--                 ###########-                                       +#######                        
--                 ###########+..........                          ..-########                        
--                        ###############.                        -####                               
--                        ###########+---                          ---####                            
--                               ####-                                +###                            
--                               ####-                                .--+####                        
--                               ####-                                   -####                        
--                               ####-                                    ..-+###                     
--                               ####-                                       +###                     
--                               ####-                                       +###                     
--                               ####-                                       +###                     
--                               ####-                                          -####                 
--                               ####-                                          .####                 
--                               ####-                                          .####                 
--                               ####-                                          .####                 
--                               ####-                                              +###              
--                               ####-                                              +###              
--                               ####-                                              +###              
--                               ####-                                              +###              
--                               ####-                                              +###              
--                               ####-                                              +###              
SMODS.Voucher { -- Boykissers?
    key = "boykisservoucher",
    atlas = "furryvouchers",
    pos = { x = 2, y = 0 },
    unlocked = true,
    discovered = false,
    cost = 25,
    requires = { "v_fur_furryconvention" },

    redeem = function(self, card)
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, "c_fur_floofball", 'fur_boykisservoucher')
                card:add_to_deck()
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
            return true
        end)}))
    end,

    calculate = function(self, card, context)
        if context.round_eval and G.GAME.blind.boss then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, "c_fur_floofball", 'fur_boykisservoucher')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    G.GAME.consumeable_buffer = 0
                return true
            end)}))
        end
    end,
}