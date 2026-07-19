------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@166",
    position = "0x0",
    scale    = 1,
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "wofi --show drun"

local screenShot = "grim -g \"$(slurp)\""

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function () 
  hl.exec_cmd("~/.local/bin/autostart.sh --hypr")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env ("XCURSOR_THEME", "Adwaita")
hl.env("LIBVA_DRIVER_NAME","nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME","nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT","auto")
hl.env("QT_QPA_PLATFORMTHEME","qt6ct")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 0,

        border_size = 2,

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "master",

        col = {
          active_border   = "rgb(e3e3e3)",
          inactive_border = "rgb(3e3e3e)"
        },
    },

    decoration = {
        rounding       = 0,
        rounding_power = 0,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = { enabled = false },
        blur = {
            enabled   = true,
            size      = 3,
            passes    = 3,
            vibrancy  = 0,
        },},
    animations = { enabled = true },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "workspaces",  enabled = true,  speed = 2, bezier = "default", style="slidevert"})
hl.animation({ leaf = "windows",     enabled = true,  speed = 3, bezier = "default"})
hl.animation({ leaf = "zoomFactor",  enabled = true,  speed = 5, bezier = "default"})
hl.animation({ leaf = "global",      enabled = true,  speed = 3, bezier = "default"})

hl.animation({ leaf = "layers",      enabled = false, speed = 3, bezier = "default"})
hl.animation({ leaf = "fade",        enabled = false, speed = 3, bezier = "default"})
hl.animation({ leaf = "border",      enabled = false, speed = 3, bezier = "default"})
hl.animation({ leaf = "borderangle", enabled = false, speed = 1, bezier = "default"})

hl.config({
    master = {
        -- new_status = "master",
        new_on_top = true
    },
    monocle = {},
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "flat",

    },
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

function bind_exec( bind, exec )
  hl.bind(mainMod .. " + " .. bind, hl.dsp.exec_cmd(exec))
end

-- spawn
bind_exec("SHIFT + RETURN", terminal)
bind_exec("slash", "signal-desktop")
bind_exec("e", "emacsclient -c")
bind_exec("SHIFT + e", "thunar")
bind_exec("p", menu)
bind_exec("SHIFT + p", screenShot)

-- hl.bind(mainMod .. " + b", function ()
--     hl.exec_cmd("eww open --toggle hypr_bar")
-- end)

-- layouts

hl.bind(mainMod ..
" + m", function ()
  hl.config({general = {layout = "monocle"}})
  hl.dispatch(hl.dsp.event('layout,monocle'))
end)

hl.bind(mainMod ..
" + t", function ()
  hl.config({general = {layout = "master"}})
  hl.dispatch(hl.dsp.event('layout,master'))
end)

hl.bind( mainMod ..
" + Q", hl.dsp.window
.close())

hl.bind( mainMod ..
" + SHIFT + Q", hl.dsp
.exit())

hl.bind(mainMod ..
" + h", hl.dsp.window
.resize( { x=-50, y = 0, relative=true, window="activewindow"}))

hl.bind(mainMod ..
" + l", hl.dsp.window
.resize({ x=50, y = 0, relative=true, window="activewindow"}))

hl.bind(mainMod ..
" + f", hl.dsp.window
.fullscreen({ mode = "fullscreen", action="toggle", window="activewindow"}))

hl.bind(mainMod ..
" +  o", hl.dsp.window
.pin("activewindow"))

hl.bind(mainMod ..
" + space", hl.dsp.window
.float({ action = "toggle" }))

hl.bind(mainMod .. " + k",       hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. " + j",       hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + i",       hl.dsp.layout("addmaster"))
hl.bind(mainMod .. " + d",       hl.dsp.layout("removemaster"))
hl.bind(mainMod .. " +  RETURN", hl.dsp.layout("swapwithmaster"))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + "         .. key, hl.dsp
    .focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window
    .move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + tab",         hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + tab", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "float volatile windows",
    match = {
        class      = "zenity|thunar",
    },

    float = true,
})
