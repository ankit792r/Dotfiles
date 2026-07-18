---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "kitty"
local menu = "rofi -show drun"
local browser = "firefox"

---------------------
--- Monitors --------
--- -----------------
hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "1",
})


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("mako")
  hl.exec_cmd("cliphist store")
  hl.exec_cmd("udiskie")
  hl.exec_cmd("/usr/lib/xdg-desktop-portal")
  hl.exec_cmd("swaybg -i ~/Dotfiles/defaults/dark-forest.jpg -m fill")
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
  hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f 1)")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Allow better support for screen sharing (Google Meet, Discord, etc).
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")


-----------------------
---- LOOK AND FEEL ----
-----------------------
local active_border_color = "rgba(4c566aaa)" -- { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 }
local inactive_border_color = "rgba(191724aa)"
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
  general = {
    gaps_in          = 4,
    gaps_out         = 8,

    border_size      = 2,

    col              = {
      active_border   = active_border_color,
      inactive_border = inactive_border_color,
    },

    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = false,

    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing    = false,

    layout           = "master",
  },

  decoration = {
    rounding_power = 0,

    -- active_opacity   = 1.0,
    -- inactive_opacity = 1.0,

    shadow         = {
      enabled      = false,
      range        = 4,
      render_power = 3,
      color        = 0xee1a1a1a,
    },

    blur           = {
      enabled  = true,
      size     = 3,
      passes   = 1,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },


  xwayland = {
    force_zero_scaling = true,
  },

  ecosystem = {
    no_update_news = true,
  },


  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",
    repeat_rate = 40,
    repeat_delay = 200,

    follow_mouse = 1,
    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = true,
    },
  },
})


------------------
--- Layout -------
------------------
hl.config({
  dwindle = {
    preserve_split = true, -- You probably want this
  },

  master = {
    new_status = "slave",
    mfact = 0.5
  },


  scrolling = {
    column_width = 0.49,
    fullscreen_on_one_column = true,
  },

  -- master = {
  -- 	new_status = "slave",
  --    mfact = 0.5
  -- },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })


----------------
----  MISC  ----
----------------
hl.config({
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    disable_scale_notification = true,
    focus_on_activate = true,
    anr_missed_pings = 3,
    on_focus_under_fullscreen = 1,
  },
})


---------------
---- INPUT ----
---------------
hl.config({
  input = {
    kb_layout    = "us",
    kb_variant   = "",
    kb_model     = "",
    kb_options   = "",
    kb_rules     = "",

    follow_mouse = 1,

    sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad     = {
      natural_scroll = true,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
  name        = "epic-mouse-v1",
  sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"
local secondMod = "SUPER + SHIFT"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + X", hl.dsp.window.close())

hl.bind(
  mainMod .. " + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(secondMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Example: Direct Resize binds (Super+Shift+Arrow)
hl.bind(mainMod .. " + BracketRight", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + BracketLeft", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })

hl.bind(secondMod .. " + BracketRight", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
hl.bind(secondMod .. " + BracketLeft", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })


-- Example: Submap for resizing with Arrow Keys
hl.bind("SUPER + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  -- Set repeating binds for directions
  hl.bind("L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
  hl.bind("H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })

  hl.bind("J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })

  -- Add up/down here...
  hl.bind("escape", hl.dsp.submap("reset"))
  hl.bind("q", hl.dsp.submap("reset"))
end)


-- hl.bind(mainMod .. " + B", hl.dsp.layout("togglesplit"))
-- hl.bind(mainMod .. " + S", hl.dsp.layout("scrolling"))
-- hl.bind(mainMod .. " + W", hl.dsp.layout("master"))
-- hl.bind(mainMod .. " + E", hl.dsp.layout("dwindle"))

-- hl.bind(mainMod .. " + D", hl.dsp.window.pseudo())

hl.bind(mainMod .. " + Backspace", hl.dsp.exec_cmd("power-menu"))
hl.bind(mainMod .. " + Backslash", hl.dsp.exec_cmd("system-menu"))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("pkill hyprlock || hyprlock"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move focus with mainMod + HJKL keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move focused window
hl.bind(secondMod .. " + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(secondMod .. " + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(secondMod .. " + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(secondMod .. " + L", hl.dsp.window.move({ direction = "r" }))

-- Arrow key variants
hl.bind(secondMod .. " + LEFT", hl.dsp.window.move({ direction = "l" }))
hl.bind(secondMod .. " + DOWN", hl.dsp.window.move({ direction = "d" }))
hl.bind(secondMod .. " + UP", hl.dsp.window.move({ direction = "u" }))
hl.bind(secondMod .. " + RIGHT", hl.dsp.window.move({ direction = "r" }))

-- Switch to workspaces
hl.bind(mainMod .. " + U", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + I", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + O", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + P", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 8 }))

-- Move focused window to workspace
hl.bind(secondMod .. " + U", hl.dsp.window.move({ workspace = 1 }))
hl.bind(secondMod .. " + I", hl.dsp.window.move({ workspace = 2 }))
hl.bind(secondMod .. " + O", hl.dsp.window.move({ workspace = 3 }))
hl.bind(secondMod .. " + P", hl.dsp.window.move({ workspace = 4 }))
hl.bind(secondMod .. " + 7", hl.dsp.window.move({ workspace = 5 }))
hl.bind(secondMod .. " + 8", hl.dsp.window.move({ workspace = 6 }))
hl.bind(secondMod .. " + 9", hl.dsp.window.move({ workspace = 7 }))
hl.bind(secondMod .. " + 0", hl.dsp.window.move({ workspace = 8 }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + minus", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + equal", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

hl.bind(secondMod .. " + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind(secondMod .. " + L", hl.dsp.window.swap({ direction = "r" }))
hl.bind(secondMod .. " + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind(secondMod .. " + J", hl.dsp.window.swap({ direction = "d" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "e+1" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })



-- Save full screen to Pictures folder and copy to clipboard
hl.bind(mainMod .. " + S",
  hl.dsp.exec_cmd(
    "grim ~/Pictures/$(date +'%Y-%m-%d_%H-%m-%S').png && wl-copy < ~/Pictures/$(date +'%Y-%m-%d_%H-%m-%S').png"))

-- Select a region to save and copy to clipboard (most popular)
hl.bind(secondMod .. " + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/$(date +'%Y-%m-%d_%H-%m-%S').png"))

-- Quick capture region straight to clipboard only (no file saved)
hl.bind("Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name           = "suppress-maximize-events",
  match          = { class = ".*" },

  suppress_event = "maximize",
})

hl.window_rule({
  name     = "fix-xwayland-drags",
  match    = {
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
  name = "firefox-full-width",
  match = {
    class = "firefox",
  },
  -- maximize = true,
  no_blur = true,
  workspace = "1",
})


hl.window_rule({
  name = "sysmenu-floating",
  match = {
    title = "^sysmenu-.*",
  },
  float = true,
  center = 1,
  size = { 1080, 720 },
  opacity = 1.0,
  no_blur = true,
})

hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },
  move  = "20 monitor_h-120",
  float = true,
})


hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "^sysmenu-*" },
  move  = "20 monitor_h-120",
  float = true,
})

hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
