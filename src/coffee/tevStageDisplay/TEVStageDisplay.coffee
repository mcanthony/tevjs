Canvas = require "../canvas/Canvas.coffee"
canvas_utils = require "../canvas/canvas-utils.coffee"

drawCheckerBackground = (ctx, width, height, ox, oy, size) ->
	rowCount = Math.ceil (height / size)
	colCount = Math.ceil (width / size)

	ctx.fillStyle = canvas_utils.rgba 0.1, 0.1, 0.1, 1

	for i in [0...rowCount]
		for j in [0...colCount]
			skip = if i % 2 then 0 else size
			ctx.rect 2 * j * size + skip, i * size, size, size

	ctx.fill()

class TEVStageDisplay extends Canvas
	constructor: (@canvasId) ->
		super @canvasId

	draw: () =>
		super
		drawCheckerBackground @context, @canvasElement.width, @canvasElement.height, @offsetX, @offsetY, 64

module.exports = TEVStageDisplay