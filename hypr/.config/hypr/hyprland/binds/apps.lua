return function(mainMod)
    hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("foot"))
    hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
    hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
    hl.bind(mainMod .. " + SHIFT + space", hl.dsp.window.float({ action = "toggle" }))
    hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("wofi --show drun"))
    hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
    hl.bind(mainMod .. " + E", hl.dsp.layout("togglesplit")) -- dwindle only
end
