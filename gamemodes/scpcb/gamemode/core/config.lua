-- Core loading
CreateConVar(scp_cb.prefix .. "nstamina_max", "22", FCVAR_REPLICATED + FCVAR_ARCHIVE , "" );
CreateConVar(scp_cb.prefix .. "nstamina_regenmul", "2", FCVAR_REPLICATED + FCVAR_ARCHIVE , "" );
CreateConVar(scp_cb.prefix .. "nstamina_decaymul", "0.5", FCVAR_REPLICATED + FCVAR_ARCHIVE , "" );

CreateClientConVar(scp_cb.prefix .. "hud_enabled", "1", true, false, "Allows to disable/enable the interface");

CreateConVar(scp_cb.prefix .. "blinking_enabled", "1", FCVAR_REPLICATED + FCVAR_ARCHIVE)
CreateConVar(scp_cb.prefix .. "blinking_enabled_npcs", "1", FCVAR_REPLICATED + FCVAR_ARCHIVE)
CreateConVar(scp_cb.prefix .. "blinking_npc_tickrate", "60", FCVAR_REPLICATED + FCVAR_ARCHIVE)
CreateConVar(scp_cb.prefix .. "blinking_interval", "7", FCVAR_REPLICATED + FCVAR_ARCHIVE)
CreateConVar(scp_cb.prefix .. "blinking_duration", "0.6", FCVAR_REPLICATED + FCVAR_ARCHIVE)
CreateConVar(scp_cb.prefix .. "blinking_eyesClosedRatio", "0.7", FCVAR_REPLICATED + FCVAR_ARCHIVE)

if game.GetMap() == "rp_zone_tsade_v1d" then
    whitelist_interacts = {
        ["prop_door_rotating"]      = true,
        ["class C_BaseEntity"]      = true -- Button lmao
    }

    blacklist_interacts = {
        ["models/agency/doors/door56.mdl"]                                          = true,
        ["models/props/storedoor1.mdl"]                                             = true,
        ["models/props_doors/doormainmetalwindowsmall01.mdl"]                       = true,
        ["models/props_am/am_stall_door.mdl"]                                       = true,
        ["models/props_doors/doormainmetalwindowsmall01.mdl"]                       = true,
        ["models/props/de_nuke/hr_nuke/metal_door_001/metal_door_001_low.mdl"]      = true,
        ["models/props_c17/door01_left.mdl"]                                        = true
    }

    button_list = {
        ["*738"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*739"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*581"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },
        
        ["*776"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*646"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*487"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*476"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*5"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*559"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*563"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*467"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*665"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*159"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*5"] = {
            status          = true,
            card_level      = 5,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*56"] = {
            status          = true,
            card_level      = 6,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*401"] = {
            status          = true,
            card_level      = 6,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*432"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*290"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*193"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*782"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*781"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*699"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*248"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*445"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*442"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*443"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*444"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*291"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*438"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*284"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*114"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*693"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*542"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*381"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*516"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*328"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*464"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*390"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*531"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*491"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*106"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*410"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*569"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*564"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*675"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*674"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*542"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*359"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*358"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*723"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*374"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*271"] = {
            status          = false,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*287"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*775"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*261"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*437"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*264"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*543"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*355"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*753"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*642"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },
        
        ["*187"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*749"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*116"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*115"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*718"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*455"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*201"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*204"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*70"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*18"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*102"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*67"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*17"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*164"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*84"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*74"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*77"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*62"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*83"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*165"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*162"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*519"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*520"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*163"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*451"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*207"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*387"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*580"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*729"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*393"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*728"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*535"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*669"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*97"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*98"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*745"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*732"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*733"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*734"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*725"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*747"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*744"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },
        
        ["*724"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*743"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*746"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*742"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*735"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*536"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*666"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*629"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*11"] = {
            status          = true,
            card_level      = 5,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*103"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*420"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*528"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*798"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*796"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/LeverFlip.ogg",
            sound_true      = "scpcb/LeverFlip.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*452"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*479"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*482"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*671"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*230"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*326"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*647"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*46"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*49"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*417"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*461"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*820"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*458"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*414"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*80"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*219"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*220"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*28"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*218"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*216"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*215"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*214"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*127"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*217"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*473"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*302"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*229"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*311"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*828"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*431"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*702"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*299"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*314"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*308"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*470"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*488"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*378"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*558"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*384"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*375"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*275"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*129"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*586"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*590"] = {
            status          = true,
            card_level      = 5,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*31"] = {
            status          = true,
            card_level      = 5,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*45"] = {
            status          = true,
            card_level      = 5,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*679"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*678"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*687"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*686"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*272"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*278"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*587"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*172"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*428"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*825"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*804"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*96"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*89"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*407"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*241"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*240"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*138"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*307"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*194"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*628"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*200"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*188"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*210"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*143"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*144"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*829"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*423"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*411"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*149"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*716"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*107"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/KeycardUse2.ogg",
            sound_true      = "scpcb/KeycardUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*122"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*575"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*576"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*632"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*239"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*181"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*139"] = {
            status          = true,
            card_level      = 5,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*10"] = {
            status          = true,
            card_level      = 5,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*232"] = {
            status          = true,
            card_level      = 5,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*23"] = {
            status          = true,
            card_level      = 6,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*135"] = {
            status          = false,
            card_level      = 6,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        --ALarm
        ["*267"] = {
            status          = false,
            card_level      = 6,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*27"] = {
            status          = false,
            card_level      = 6,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*245"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*238"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*177"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*236"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*234"] = {
            status          = true,
            card_level      = 3,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*402"] = {
            status          = true,
            card_level      = 6,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },
        
        ["*22"] = {
            status          = true,
            card_level      = 5,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*213"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*247"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*639"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*640"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*398"] = {
            status          = true,
            card_level      = 2,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*21"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*253"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*606"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*607"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*633"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*268"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*571"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*572"] = {
            status          = true,
            card_level      = 4,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*371"] = {
            status          = true,
            card_level      = 1,
            sound_false     = "scpcb/ScannerUse2.ogg",
            sound_true      = "scpcb/ScannerUse1.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*598"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/PickItem0.ogg",
            sound_true      = "scpcb/PickItem0.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*592"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/PickItem0.ogg",
            sound_true      = "scpcb/PickItem0.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*506"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*513"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*507"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*512"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*365"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*366"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*524"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*441"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*650"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*694"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        },

        ["*695"] = {
            status          = true,
            card_level      = 0,
            sound_false     = "scpcb/Button2.ogg",
            sound_true      = "scpcb/Button.ogg",

            hand_color = Color(255, 255, 255, 255)
        }
    }
end

scp_cb:Message(1, "Config is loaded");