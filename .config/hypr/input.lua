-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
  input = {
    -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt.
    -- kb_layout = "us,dk,eu",
    kb_layout = "us,jp",

    -- Caps Lock remains normal.
    -- No Caps Lock remapping is configured here.

    -- Switch keyboard layouts with Left Alt + Right Alt.
    -- kb_options = "compose:caps,shift:both_capslock_cancel,grp:alts_toggle",
    kb_options = "grp:lalt_ralt_toggle",

    -- Use a specific keyboard variant if needed (e.g. intl for international keyboards).
    -- kb_variant = "intl",

    -- Change speed of keyboard repeat.
    -- repeat_rate = 40,
    -- repeat_delay = 250,
    repeat_rate = 25,
    repeat_delay = 300,

    -- Start with numlock on by default.
    -- numlock_by_default = true,
    numlock_by_default = true,

    -- Increase sensitivity for mouse/trackpad (default: 0).
    -- sensitivity = 0.35,

    -- Turn off mouse acceleration (default: adaptive).
    -- accel_profile = "flat",

    touchpad = {
      -- Use natural (inverse) scrolling.
      -- natural_scroll = true,
      natural_scroll = true,

      -- Use two-finger clicks for right-click instead of lower-right corner.
      -- clickfinger_behavior = true,
      clickfinger_behavior = true,

      -- Control the speed of your scrolling.
      -- scroll_factor = 0.4,
      scroll_factor = 0.4,

      -- Enable the touchpad while typing.
      -- disable_while_typing = false,

      -- Left-click-and-drag with three fingers.
      -- drag_3fg = 1,
    },
  },
})

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })

-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })
o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })

 -- 4-finger gestures for volume and display brightness.
  hl.gesture({
    fingers = 4,
    direction = "up",
    action = function()
      hl.exec_cmd("omarchy-audio-output-volume +10")
    end,
  })

  hl.gesture({
    fingers = 4,
    direction = "down",
    action = function()
      hl.exec_cmd("omarchy-audio-output-volume -10")
    end,
  })

  hl.gesture({
    fingers = 4,
    direction = "right",
    action = function()
      hl.exec_cmd("omarchy-brightness-display +10%")
    end,
  })

  hl.gesture({
    fingers = 4,
    direction = "left",
    action = function()
      hl.exec_cmd("omarchy-brightness-display 10%-")
    end,
  })
