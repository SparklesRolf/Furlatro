local furry_mod = SMODS.current_mod
local config = furry_mod.config

--------------------- Joker Atlases -------------------
SMODS.Atlas { -- AstralWarden
    key = 'astralslab',
    path = 'jokers/slabs/astral.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- CobaltTheBluPanda
    key = 'cobaltslab',
    path = 'jokers/slabs/cobalt.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- CuriousAngel
    key = 'curiousangelslab',
    path = 'jokers/slabs/curiousangel.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Danny
    key = 'dannyslab',
    path = 'jokers/slabs/danny.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Diablo2324
    key = 'diablo2324slab',
    path = 'jokers/slabs/diablo2324.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- FoxxlyDuskFur
    key = 'foxxlyduskfurslab',
    path = 'jokers/slabs/foxxlyduskfur.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- GhostFox
    key = 'ghostslab',
    path = 'jokers/slabs/ghost.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Ice Sea
    key = 'iceseaslab',
    path = 'jokers/slabs/icesea.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- illyADo
    key = 'illyadoslab',
    path = 'jokers/slabs/illyado.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Iridia
    key = 'iridiaslab',
    path = 'jokers/slabs/iridia.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Joseeee
    key = 'joseeeeslab',
    path = 'jokers/slabs/joseeee.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- KalikHusky
    key = 'kalikslab',
    path = 'jokers/slabs/kalik.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- The_Koneko
    key = 'konekoslab',
    path = 'jokers/slabs/koneko.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Kris_57
    key = 'kris57slab',
    path = 'jokers/slabs/kris57.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Luposity
    key = 'luposityslab',
    path = 'jokers/slabs/luposity.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- MaltNoodlez
    key = 'maltnoodlezslab',
    path = 'jokers/slabs/maltnoodlez.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Nemzata
    key = 'nemzataslab',
    path = 'jokers/slabs/nemzata.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- ParrotDash
    key = 'parrotdashslab',
    path = 'jokers/slabs/parrotdash.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Saph
    key = 'saphslab',
    path = 'jokers/slabs/saph.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- SchnackiOfficial
    key = 'schnackiofficialslab',
    path = 'jokers/slabs/schnackiofficial.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- SephiraPaws
    key = 'sephirapawsslab',
    path = 'jokers/slabs/sephirapaws.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- SilverSentinel
    key = 'silverslab',
    path = 'jokers/slabs/silver.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- DelusionalSkips
    key = 'skipsslab',
    path = 'jokers/slabs/skips.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- SokaAtArt
    key = 'soksslab',
    path = 'jokers/slabs/soks.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Sourstone :3
    key = 'sourstone3slab',
    path = 'jokers/slabs/sourstone3.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- SparkTheBird
    key = 'sparkslab',
    path = 'jokers/slabs/spark.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- SparklesRolf
    key = 'sparklesslab',
    path = 'jokers/slabs/sparkles.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- CuriousAngel (Corrupt)
    key = 'corruptcuriousangelslab',
    path = 'jokers/slabs/corrupt/curiousangel.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Danny (Corrupt)
    key = 'corruptdannyslab',
    path = 'jokers/slabs/corrupt/danny.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- SephiraPaws (Corrupt)
    key = 'corruptsephirapawsslab',
    path = 'jokers/slabs/corrupt/sephirapaws.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- SparklesRolf (Corrupt)
    key = 'corruptsparklesslab',
    path = 'jokers/slabs/corrupt/sparkles.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Lume
    key = 'lumeslab',
    path = 'jokers/slabs/lume.png',
    px = 71,
    py = 95
}
-------------------------------------------------------

if CardSleeves then -- CardSleeves
    SMODS.Atlas {
        key = 'sleeves',
        path = 'crossmod/Sleeves.png',
        px = 73,
        py = 95
    }
end

if next(SMODS.find_mod("partner")) then -- PartnerAPI assets
    SMODS.Atlas { -- Partners
        key = "FurryPartners",
        path = "crossmod/Partners.png",
        px = 46,
        py = 58
    }
    SMODS.Atlas { -- Cookies
        key = "cookies",
        path = "crossmod/PartnerAPIcookies.png",
        px = 71,
        py = 95
    }
end

SMODS.Atlas { -- Achievements
    key = 'achievementtrophies',
    path = 'Trophies.png',
    px = 66,
    py = 66
}
SMODS.Atlas { -- Blinds
    key = 'blinds',
    path = 'Blinds.png',
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    px = 34,
    py = 34,
}
SMODS.Atlas { -- Boosters
    key = 'boosters',
    path = 'Boosters.png',
    px = 71,
    py = 95,
}
SMODS.Atlas { -- Consumables
    key = 'consumables',
    path = 'Consumables.png',
    px = '71',
    py = '95'
}
SMODS.Atlas { -- Decks
    key = 'furrydecks',
    path = 'Decks.png',
    px = 71,
    py = 95,
}
SMODS.Atlas { -- Enhancements
    key = 'enhancements',
    path = 'Enhancements.png',
    px = '71',
    py = '95'
}
SMODS.Atlas { -- Seals
    key = 'furryseals',
    path = 'Seals.png',
    px = 71,
    py = 95
}
SMODS.Atlas { -- Tags
    key = 'furrytags',
    path = 'Tags.png',
    px = 34,
    py = 34,
}
SMODS.Atlas { -- Vanilla Jokers
    key = 'vanillajoker',
    path = 'jokers/BasicJokers.png',
    px = 71,
    py = 95
}
-- Card Stuffs
SMODS.Atlas { key = "lc_cards", path = '8BitDeck.png', px = 71, py = 95 }
SMODS.Atlas { key = "hc_cards", path = '8BitDeck_opt2.png', px = 71, py = 95 }
SMODS.Atlas { key = "lc_ui", path = 'ui_assets.png', px = 18, py = 18 }
SMODS.Atlas { key = "hc_ui", path = 'ui_assets_opt2.png', px = 18, py = 18 }

--------------------- Deck Skins -------------------
-- The Dream Team
SMODS.Atlas {
    key = 'thedreamteamclubscollab_lc',
    px = 71,
    py = 95,
    path = 'skins/deck/thedreamteam/Clubs.png',
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
    key = 'thedreamteamclubscollab_hc',
    px = 71,
    py = 95,
    path = 'skins/deck/thedreamteam/Clubs_opt2.png',
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
    key = 'thedreamteamdiamondscollab_lc',
    px = 71,
    py = 95,
    path = 'skins/deck/thedreamteam/Diamonds.png',
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
    key = 'thedreamteamdiamondscollab_hc',
    px = 71,
    py = 95,
    path = 'skins/deck/thedreamteam/Diamonds_opt2.png',
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
    key = 'thedreamteamheartscollab_lc',
    px = 71,
    py = 95,
    path = 'skins/deck/thedreamteam/Hearts.png',
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
    key = 'thedreamteamheartscollab_hc',
    px = 71,
    py = 95,
    path = 'skins/deck/thedreamteam/Hearts_opt2.png',
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
    key = 'thedreamteamspadescollab_lc',
    px = 71,
    py = 95,
    path = 'skins/deck/thedreamteam/Spades.png',
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
    key = 'thedreamteamspadescollab_hc',
    px = 71,
    py = 95,
    path = 'skins/deck/thedreamteam/Spades_opt2.png',
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
    key = 'thedreamteamstarscollab_lc',
    px = 71,
    py = 95,
    path = 'skins/deck/thedreamteam/Stars.png',
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
    key = 'thedreamteamstarscollab_hc',
    px = 71,
    py = 95,
    path = 'skins/deck/thedreamteam/Stars_opt2.png',
    atlas_table = 'ASSET_ATLAS',
}
----------------------------------------------------