-- Custom tool binds (voxtype, screenshots via grim + slurp + wl-copy).

return function(mainMod)
    -- Voxtype push-to-talk voice-to-text toggle
    hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("voxtype record toggle"))

    -- Screenshot to clipboard (grim + slurp + wl-copy)
    hl.bind("Print", hl.dsp.exec_cmd("sh -c 'geom=$(slurp -d) || exit; grim -g \"$geom\" - | wl-copy'"))
    hl.bind(
        "CTRL + Print",
        hl.dsp.exec_cmd(
            "sh -c 'geom=$(slurp -d) || exit; mkdir -p \"$HOME/Images/Screenshots\"; grim -g \"$geom\" \"$HOME/Images/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png\"'"
        )
    )
end
