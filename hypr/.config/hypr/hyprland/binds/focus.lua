-- Focus / move binds (wiki: Configuring > Core > Dispatchers: focus, move).

return function(mainMod)
    -- Move focus with mainMod + arrow keys
    hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
    hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
    hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
    hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

    -- Move window with mainMod + SHIFT + arrow keys (i3: same)
    hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
    hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
    hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
    hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
end
