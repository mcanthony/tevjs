module.exports =
	# Get CSS-like RGBA colors from clamped [0,1] values
	rgba: (r, g, b, a) ->
		a = 1 unless a?
		"rgba(" + [r, g, b].map((i) -> Math.floor(i * 256)).join(",") + ",#{a})"