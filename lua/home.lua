return function(_, opts)
  -- customize the dashboard header
  opts.section.header.val = {
    "        █  █  █        ",
    "        ▓  ▓  ▓        ",
    "     █  ▒▒▒▓▒▒▒  █     ",
    "     ▓     ▓     ▓     ",
    "     ▒▒▒▒▓▓▓▓▓▒▒▒▒     ",
    "           ▓           ",
    "       █▓▒▒▓▒▒▓█       ",
    "          ▓ ▓          ",
    "         ▓   ▓         ",
    "          ▓▓▓    ヴィム",
    "                       ",
    "--- PRAISE THE CODE ---",
    -- "--- ヴィム ---",
  }
  -- local button = require("astronvim.utils").alpha_button
  opts.config.layout[3].val = 1
  table.insert(
    opts.section.buttons.val,
    opts.button("LDR S w", require("astroui").get_icon("Session", 1, true) .. " Load workspace")
  )
  table.insert(opts.section.buttons.val, opts.button("LDR S u", "  Load user settings"))
  return opts
end
