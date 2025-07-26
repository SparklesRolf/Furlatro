local furry_mod = SMODS.current_mod
local config = SMODS.current_mod.config

local exoplanet = function(self, card, badges) -- Planet Badge, From SixSuits
    badges[#badges + 1] = create_badge('Exoplanet', get_type_colour(self or card.config, card), nil, 1.2)
end

SMODS.Atlas {
    key = 'consumables',
    path = 'Consumables.png',
    px = '71',
    py = '95'
}

-- Tarots
SMODS.Consumable { -- Falling Star
    key = 'fallingstar',
    set = 'Tarot',
    atlas = 'consumables',
    pos = { x = 0, y = 0 },
    config = { extra = { suit_conv = "fur_stars", amount = 3 }},
    cost = 3,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= self.config.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.1, func = function() G.hand.highlighted[i]:change_suit("fur_stars");return true end }))
        end
        delay ( 0.5 )
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
        end
        G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.2, func = function() G.hand:unhighlight_all(); return true end }))
        delay( 0.5 )
    end,
    
    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.amount, localize('fur_stars', 'suits_plural')}}
    end

}

SMODS.Consumable { -- Playing Socks
    key = 'playingsocks',
    set = 'Tarot',
    atlas = 'consumables',
    pos = { x = 2, y = 0 },
    config = { extra = { mod_conv = 'm_fur_sockcard', amount = 2 }},
    cost = 3,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= self.config.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.1, func = function() G.hand.highlighted[i]:set_ability(G.P_CENTERS[card.ability.extra.mod_conv]);return true end }))
        end
        delay ( 0.5 )
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
        end
        G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.2, func = function() G.hand:unhighlight_all(); return true end }))
        delay( 0.5 )
    end,
    
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_sockcard
        return { vars = {center.ability.extra.amount}}
    end
}

SMODS.Consumable { -- Treasure Chest
    key = 'treasurechest',
    set = 'Tarot',
    atlas = 'consumables',
    pos = { x = 3, y = 0 },
    config = { extra = { mod_conv = 'm_fur_silvercard', amount = 3 }},
    cost = 4,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= self.config.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.1, func = function() G.hand.highlighted[i]:set_ability(G.P_CENTERS[card.ability.extra.mod_conv]);return true end }))
        end
        delay( 0.5 )
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
        end
        G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.2, func = function() G.hand:unhighlight_all(); return true end }))
        delay( 0.5 )
    end,

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_silvercard
        return { vars = {center.ability.extra.amount}}
    end
}

-- Spectrals
SMODS.Consumable { -- King Me!
    key = 'kingme',
    set = 'Spectral',
    atlas = 'consumables',
    pos = { x = 0, y = 1 },
    soul_pos = { x = 0, y = 3 },
    config = { extra = { amount = 5 }},
    cost = 4,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= self.config.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local card = G.hand.highlighted[i]
            if card.base.suit == 'Hearts' then
                local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
                G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
                G.E_MANAGER:add_event( Event ({ func = function()
                    local _suit = 'H_'
                    card:set_base( G.P_CARDS[ _suit..'K' ])
                return true end }))
            elseif card.base.suit == 'Spades' then
                local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
                G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
                G.E_MANAGER:add_event( Event ({ func = function()
                    local _suit = 'S_'
                    card:set_base( G.P_CARDS[ _suit..'K' ])
                return true end }))
            elseif card.base.suit == 'Diamonds' then
                local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
                G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
                G.E_MANAGER:add_event( Event ({ func = function()
                    local _suit = 'D_'
                    card:set_base( G.P_CARDS[ _suit..'K' ])
                return true end }))
            elseif card.base.suit == 'Clubs' then
                local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
                G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
                G.E_MANAGER:add_event( Event ({ func = function()
                    local _suit = 'C_'
                    card:set_base( G.P_CARDS[ _suit..'K' ])
                return true end }))
            else
                local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
                G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
                G.E_MANAGER:add_event( Event ({ func = function()
                    local _suit = 'fur_Stars_'
                    card:set_base( G.P_CARDS[ _suit..'K' ])
                return true end }))
            end            
        end
        delay ( 1.0 )
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
        end
        G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.2, func = function() G.hand:unhighlight_all(); return true end }))
        delay( 0.5 )
    end,

    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.amount}}
    end

}

SMODS.Consumable { -- Floofball
    key = 'floofball',
    set = 'Spectral',
    atlas = 'consumables',
    pos = { x = 1, y = 1 },
    soul_pos = { x = 1, y = 3 },
    cost = 4,
    discovered = true,

    can_use = function(self, card)
        if #G.jokers.cards < G.jokers.config.card_limit then
            return true
        end
        return false
    end,

    use = function(self, card, area, copier)
        play_sound('timpani')
        local new_card = create_card("Joker", G.jokers, nil, "fur_rarityfurry", nil, nil, nil, 'floofball')
        new_card:add_to_deck()
        G.jokers:emplace(new_card)
        if G.GAME.dollars ~= 0 then
            ease_dollars(- G.GAME.dollars, true)
        end
    end
}

SMODS.Consumable { -- Notary Stamp (Red)
    key = 'rednotarystamp',
    set = 'Spectral',
    atlas = 'consumables',
    pos = { x = 2, y = 1 },
    soul_pos = { x = 2, y = 3 },
    config = { extra = { amount = 1 }},
    cost = 4,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= self.config.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                G.hand.highlighted[i]:juice_up(0.3, 0.5)
                return true end }))
        
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                conv_card:set_seal('fur_redpawseal', nil, true)
                return true end }))
        
            delay(0.5)
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        end
    end,

    in_pool = function(self, args)
        if G.GAME.round_resets.ante >= 3 then
            return true
        else 
            return false
        end
    end,

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_SEALS.fur_redpawseal
        return { vars = {center.ability.extra.amount}}
    end
}

SMODS.Consumable { -- Notary Stamp (Blue)
    key = 'bluenotarystamp',
    set = 'Spectral',
    atlas = 'consumables',
    pos = { x = 3, y = 1 },
    soul_pos = { x = 3, y = 3 },
    config = { extra = { amount = 1 }},
    cost = 4,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= self.config.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                G.hand.highlighted[i]:juice_up(0.3, 0.5)
                return true end }))
        
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                conv_card:set_seal('fur_bluepawseal', nil, true)
                return true end }))
        
            delay(0.5)
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        end
    end,

    in_pool = function(self, args)
        if G.GAME.round_resets.ante >= 3 then
            return true
        else 
            return false
        end
    end,

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_SEALS.fur_bluepawseal
        return { vars = {center.ability.extra.amount}}
    end
}

SMODS.Consumable { -- Notary Stamp (Orange)
    key = 'orangenotarystamp',
    set = 'Spectral',
    atlas = 'consumables',
    pos = { x = 4, y = 1 },
    soul_pos = { x = 4, y = 3 },
    config = { extra = { amount = 1 }},
    cost = 4,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= self.config.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                G.hand.highlighted[i]:juice_up(0.3, 0.5)
                return true end }))
        
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                conv_card:set_seal('fur_orangepawseal', nil, true)
                return true end }))
        
            delay(0.5)
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        end
    end,

    in_pool = function(self, args)
        if G.GAME.round_resets.ante >= 6 then
            return true
        else 
            return false
        end
    end,

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_SEALS.fur_orangepawseal
        return { vars = {center.ability.extra.amount}}
    end
}

-- Planets
if config.poker_hands then 
    SMODS.Consumable { -- Kepler-62e
        key = 'kepler62e',
        set = 'Planet',
        atlas = 'consumables',
        pos = { x = 0, y = 2 },
        config = { hand_type = 'fur_spectrum' },
        cost = 3,
        discovered = true,
        set_card_type_badge = exoplanet,

        can_use = function(self, card)
		    return true
	    end,

        loc_vars = function(self, info_queue, center)
            return { vars = {
                number_format(G.GAME.hands["fur_spectrum"].level), 
                colours = {(
				    to_big(G.GAME.hands["fur_spectrum"].level) == to_big(1) and G.C.UI.TEXT_DARK
				    or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["fur_spectrum"].level)):to_number()]
			    )},
            }}
        end
    }

    SMODS.Consumable { -- Kepler-62f
        key = 'kepler62f',
        set = 'Planet',
        atlas = 'consumables',
        pos = { x = 1, y = 2 },
        config = { hand_type = 'fur_straightspectrum' },
        cost = 3,
        discovered = true,
        set_card_type_badge = exoplanet,

        can_use = function(self, card)
		    return true
	    end,

        loc_vars = function(self, info_queue, center)
            return { vars = {
                number_format(G.GAME.hands["fur_straightspectrum"].level), 
                colours = {(
				    to_big(G.GAME.hands["fur_straightspectrum"].level) == to_big(1) and G.C.UI.TEXT_DARK
				    or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["fur_straightspectrum"].level)):to_number()]
			    )},
            }}
        end
    }

    SMODS.Consumable { -- Kepler-22b
        key = 'kepler22b',
        set = 'Planet',
        atlas = 'consumables',
        pos = { x = 2, y = 2 },
        config = { hand_type = 'fur_spectrumhouse', softlock = true },
        softlock = true,
        cost = 3,
        discovered = true,
        set_card_type_badge = exoplanet,

        can_use = function(self, card)
		    return true
	    end,

        loc_vars = function(self, info_queue, center)
            return { vars = {
                number_format(G.GAME.hands["fur_spectrumhouse"].level), 
                colours = {(
				    to_big(G.GAME.hands["fur_spectrumhouse"].level) == to_big(1) and G.C.UI.TEXT_DARK
				    or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["fur_spectrumhouse"].level)):to_number()]
			    )},
            }}
        end
    }

    SMODS.Consumable { -- Kepler-20e
        key = 'kepler20e',
        set = 'Planet',
        atlas = 'consumables',
        pos = { x = 3, y = 2 },
        config = { hand_type = 'fur_spectrumfive', softlock = true },
        softlock = true,
        cost = 3,
        discovered = true,
        set_card_type_badge = exoplanet,

        can_use = function(self, card)
		    return true
	    end,

        loc_vars = function(self, info_queue, center)
            return { vars = {
                number_format(G.GAME.hands["fur_spectrumfive"].level), 
                colours = {(
				    to_big(G.GAME.hands["fur_spectrumfive"].level) == to_big(1) and G.C.UI.TEXT_DARK
				    or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["fur_spectrumfive"].level)):to_number()]
			    )},
            }}
        end
    }
end