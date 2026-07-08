local terminal = "kitty"
local menu = "rofi -show drun"

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("mako")
	hl.exec_cmd("cliphist store")
	hl.exec_cmd("udiskie")
	hl.exec_cmd("/usr/lib/xdg-desktop-portal")
	hl.exec_cmd("swaybg -i ~/Dotfiles/defaults/nature.png -m fill")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f 1)")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

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

local active_border_color = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 }
local inactive_border_color = "rgba(595959aa)"

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 6,
		border_size = 2,

		col = {
			active_border = active_border_color,
			inactive_border = inactive_border_color,
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 0,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 2,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 2,
			passes = 2,
			special = true,
			brightness = 0.60,
			contrast = 0.75,
		},
	},

	group = {
		col = {
			border_active = active_border_color,
			border_inactive = inactive_border_color,
		},

		groupbar = {
			font_size = 12,
			font_family = "monospace",
			font_weight_active = "ultraheavy",
			font_weight_inactive = "normal",
			indicator_height = 0,
			indicator_gap = 5,
			height = 22,
			gaps_in = 5,
			gaps_out = 0,
			text_color = "rgb(ffffff)",
			text_color_inactive = "rgba(ffffff90)",
			col = {
				active = "rgba(00000040)",
				inactive = "rgba(00000020)",
			},
			gradients = true,
			gradient_rounding = 0,
			gradient_round_only_edges = false,
		},
	},

	animations = {
		enabled = true,
	},
})

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},

	ecosystem = {
		no_update_news = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

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

hl.config({
	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	scrolling = {
		column_width = 0.49,
	},

	master = {
		new_status = "slave",
    mfact = 0.5
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		disable_scale_notification = true,
		focus_on_activate = true,
		anr_missed_pings = 3,
		on_focus_under_fullscreen = 1,
	},

	cursor = {
		hide_on_key_press = true,
		warp_on_change_workspace = 1,
	},

	binds = {
		hide_special_on_workspace_change = true,
	},
})

hl.config({
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

local mainMod = "SUPER"
local secondMod = "SUPER + SHIFT"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + X", hl.dsp.window.close())

hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(secondMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- hl.bind(mainMod .. " + B", hl.dsp.layout("togglesplit"))
-- hl.bind(mainMod .. " + S", hl.dsp.layout("scrolling"))
-- hl.bind(mainMod .. " + W", hl.dsp.layout("master"))
-- hl.bind(mainMod .. " + E", hl.dsp.layout("dwindle"))

hl.bind(mainMod .. " + D", hl.dsp.window.pseudo())

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

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "firefox-full-width",
	match = {
		class = "firefox",
	},
	maximize = true,
	no_blur = true,
	workspace = "1",
})

hl.bind(mainMod .. " + G", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + Y", hl.dsp.layout("swapcol l"))

hl.workspace_rule({ workspace = "1", layout = "scrolling" })
hl.workspace_rule({ workspace = "2", layout = "master" })

hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
