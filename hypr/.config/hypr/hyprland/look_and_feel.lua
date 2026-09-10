-- hl.config() merges, so each call only updates the values it passes.

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(98971aff)", "rgba(b8bb26ff)" }, angle = 45 },
            inactive_border = "rgba(3c3836ff)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    animations = {
        enabled = false,
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})
