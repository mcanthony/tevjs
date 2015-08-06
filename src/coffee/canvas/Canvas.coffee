canvas_utils = require "./canvas-utils.coffee"

class Canvas
	constructor: (@canvasId) ->
		@canvasElement = document.getElementById @canvasId
		@context = @canvasElement.getContext "2d"
		@resize()
		window.addEventListener 'resize', @resize, false
		requestAnimationFrame @draw

	draw: () =>
		#requestAnimationFrame @draw
		@context.clearRect 0, 0, @canvasElement.width, @canvasElement.height

		# Clear screen with custom color if there is one
		if @clearColor?
			oldFill = @context.fillStyle
			@context.fillStyle = @clearColor
			@context.fillRect 0, 0, @canvasElement.width, @canvasElement.height
			@context.fillStyle = oldFill

	resize: () =>
		@canvasElement.width = @canvasElement.clientWidth
		@canvasElement.height = @canvasElement.clientHeight

module.exports = Canvas