-- =====================================================
--  AwesomeWM rc.lua – Komplett­version (April 2025)
--  Optimiert von Arisa – inkl. Komfort‑Tweaks
-- =====================================================

-- ░░ Grund­module laden ░░
pcall(require, "luarocks.loader")

local gears           = require("gears")
local awful           = require("awful")
require("awful.autofocus")
local wibox           = require("wibox")
local beautiful       = require("beautiful")
local naughty         = require("naughty")
local menubar         = require("menubar")
local hotkeys_popup   = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
local dpi             = require("beautiful.xresources").apply_dpi

-- ░░ Benutzer & Theme ░░
local user = os.getenv("USER")
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Luft & Rahmen
beautiful.useless_gap  = dpi(6)
beautiful.border_width = dpi(2)

-- ░░ System‑Benachrichtigungen ░░
naughty.config.defaults.timeout = 5

-- ░░ Fehlerbehandlung ░░
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title  = "Fehler beim Start!",
                     text   = awesome.startup_errors })
end
local in_error = false
awesome.connect_signal("debug::error", function(err)
    if in_error then return end
    in_error = true
    naughty.notify({ preset = naughty.config.presets.critical,
                     title  = "Laufzeit‑Fehler!",
                     text   = tostring(err) })
    in_error = false
end)

-- ░░ Grundeinstellungen ░░
local terminal   = "tilix"
local editor     = os.getenv("EDITOR") or "vim"
local editor_cmd = terminal .. " -e " .. editor
local modkey     = "Mod4"

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}

-- ░░ Logo‑Widget ░░
local logo = wibox.widget {
    {
        image  = "/home/" .. user .. "/.config/awesome/ochilogo.png",
        resize = true,
        widget = wibox.widget.imagebox,
    },
    widget              = wibox.container.background,
    shape               = gears.shape.circle,
    shape_clip          = true,
    shape_border_width  = 2,
    shape_border_color  = beautiful.bg_normal,
}

-- ░░ Separators ░░
local separator1 = wibox.widget.textbox(" | ")
local separator2 = wibox.widget.textbox(" ")
local separator3 = wibox.widget.textbox("   ")

-- ░░ Widgets (ohne CPU & Net, wie gewünscht) ░░
local volume_widget     = require("awesome-wm-widgets.volume-widget.volume")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")

-- ░░ Menü ░░
local myawesomemenu = {
    { "Hotkeys",   function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "Manual",    terminal .. " -e man awesome" },
    { "edit rc",   editor_cmd .. " " .. awesome.conffile },
    { "restart",   awesome.restart },
    { "quit",      function() awesome.quit() end },
}
local has_fdo, freedesktop = pcall(require, "freedesktop")
local debian               = require("debian.menu")
local menu_awesome  = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "Terminal", terminal }
local mymainmenu = has_fdo and freedesktop.menu.build{
    before = { menu_awesome },
    after  = { menu_terminal }
} or awful.menu{
    items = { menu_awesome, { "Debian", debian.menu.Debian_menu.Debian }, menu_terminal }
}
local mylauncher = awful.widget.launcher{ image = beautiful.awesome_icon, menu = mymainmenu }
menubar.utils.terminal = terminal

-- ░░ Uhr ░░
local mytextclock = wibox.widget.textclock()

-- ░░ Maus­Bindings ░░
root.buttons(gears.table.join(
    awful.button({}, 3, function() mymainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
))

-- ░░ Globale Tastenkürzel ░░
local globalkeys = gears.table.join(
    -- Programme
    awful.key({ modkey }, "Return", function() awful.spawn(terminal) end,
        {description = "Terminal", group = "launcher"}),
    awful.key({ modkey }, "b",      function() awful.spawn("brave") end,
        {description = "Browser", group = "launcher"}),
    awful.key({ modkey }, "q",      function() awful.spawn("qutebrowser") end,
        {description = "Qutebrowser", group = "launcher"}),
    awful.key({ modkey }, "t",      function() awful.spawn("thunar") end,
        {description = "Dateimanager", group = "launcher"}),
    awful.key({ modkey }, "g",      function() awful.spawn("gimp") end,
        {description = "GIMP", group = "launcher"}),
    awful.key({ modkey }, "p",      function() awful.spawn("dmenu_run") end,
        {description = "dmenu", group = "launcher"}),
    -- Lautstärke
    awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn("amixer -D pulse sset Master 10%+", false) end,
        {description = "Lauter", group = "media"}),
    awful.key({}, "XF86AudioLowerVolume", function() awful.spawn("amixer -D pulse sset Master 10%-", false) end,
        {description = "Leiser", group = "media"}),
    awful.key({}, "XF86AudioMute",        function() awful.spawn("amixer -D pulse sset Master toggle", false) end,
        {description = "Mute", group = "media"}),
    -- Hotkeys‑Popup
    awful.key({ modkey }, "s", hotkeys_popup.show_help,
        {description = "Tasten­hilfe", group = "awesome"}),
    -- Run‑Prompt
    awful.key({ modkey }, "r", function() awful.screen.focused().mypromptbox:run() end,
        {description = "Run‑Prompt", group = "launcher"}),
    -- Tag‑Navigation
    -- Layout‑Wechsel (Tile ↔ Floating)
    awful.key({ modkey }, "space",  function() awful.layout.inc( 1) end,
        {description = "nächstes Layout", group = "layout"}),
    awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
        {description = "vorheriges Layout", group = "layout"}),

    -- Tag‑Navigation
    awful.key({ modkey }, "Left",  awful.tag.viewprev, {description = "vorheriger Tag", group = "tag"}),
    awful.key({ modkey }, "Right", awful.tag.viewnext, {description = "nächster Tag", group = "tag"}),
    -- Awesome neu laden / Quit
    awful.key({ modkey, "Control" }, "r", awesome.restart,
        {description = "Awesome neu laden", group = "awesome"}),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
        {description = "Awesome beenden", group = "awesome"})
)

-- Tag‑Nummern (Mod+1‑9)
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then tag:view_only() end
        end, {description = "Tag " .. i, group = "tag"}),
        awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then client.focus:move_to_tag(tag) end
            end
        end, {description = "Fenster → Tag " .. i, group = "tag"})
    )
end
root.keys(globalkeys)

-- ░░ Bildschirm / Wibar ░░
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper (scaled, keep aspect)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then wallpaper = wallpaper(s) end
        gears.wallpaper.maximized(wallpaper, s, true)
    end

    -- Tags
    awful.tag({ "term", "web", "files", "media" }, s, awful.layout.layouts[1])

    -- Widgets
    s.mypromptbox = awful.widget.prompt()
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end)
    ))

    local taglist_buttons = gears.table.join(
        awful.button({}, 1, function(t) t:view_only() end)
    )
    s.mytaglist = awful.widget.taglist{ screen = s, filter = awful.widget.taglist.filter.all, buttons = taglist_buttons }

    s.mywibox = awful.wibar{ position = "top", screen = s }
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { layout = wibox.layout.fixed.horizontal, s.mytaglist, s.mypromptbox },
        nil,
        { layout = wibox.layout.fixed.horizontal,
          separator1, mytextclock, separator1, separator2,
          brightness_widget(), separator2,
          volume_widget{ widget_type = "arc" }, separator3, logo },
    }
end)

-- ░░ Client‑Keybindings ░░
local clientkeys = gears.table.join(
    awful.key({ modkey }, "f", function(c) c.fullscreen = not c.fullscreen; c:raise() end,
        {description = "Fullscreen‑Toggle", group = "client"}),
    awful.key({ modkey, "Shift" }, "c", function(c) c:kill() end,
        {description = "Fenster schließen", group = "client"}),
    awful.key({ modkey }, "m", function(c) c.maximized = not c.maximized; c:raise() end,
        {description = "Maximieren", group = "client"})
)

-- ░░ Fensterregeln ░░
-- ░░ Fensterregeln ░░
local clientbuttons = gears.table.join(
    awful.button({}, 1, function(c) c:emit_signal("request::activate", "mouse_click", {raise=true}) end),
    awful.button({ modkey }, 1, function(c) c:emit_signal("request::activate", "mouse_click", {raise=true}); awful.mouse.client.move(c) end),
    awful.button({ modkey }, 3, function(c) c:emit_signal("request::activate", "mouse_click", {raise=true}); awful.mouse.client.resize(c) end)
)

awful.rules.rules = {
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus        = awful.client.focus.filter,
            raise        = true,
            keys         = clientkeys,
            buttons      = clientbuttons,
            screen       = awful.screen.preferred,
            placement    = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    },
    { rule = { class = "Tilix" }, properties = { tag = "term", switchtotag = true } },
    { rule = { class = "Brave"  }, properties = { tag = "web",   switchtotag = true } },
    { rule = { class = "Thunar" }, properties = { tag = "files", switchtotag = true, floating = false } },
    { rule = { class = "Gimp"   }, properties = { tag = "media", switchtotag = true } },
}

-- ░░ Helper: run_once ░░
local function run_once(cmd)
    awful.spawn.easy_async_with_shell(string.format("pgrep -u $USER -x %q || (%s)", cmd, cmd))
end

-- ░░ Autostart ░░
run_once("picom --experimental-backends")
run_once("caffeine")
run_once("xset s off && xset -dpms")
run_once("numlockx on")

-- ░░ Fenster‑Shape und Fokus ░░
client.connect_signal("manage", function(c)
    c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 10) end
    -- Neue Floating-Fenster zentrieren
    if not awesome.startup and c.floating then
        awful.placement.centered(c, {honor_workarea=true, honor_padding=true})
    end
end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus",   function(c) c.border_color = beautiful.border_focus  end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

