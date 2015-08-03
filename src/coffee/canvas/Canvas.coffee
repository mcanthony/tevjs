canvas_utils = require "./canvas-utils.coffee"

class Canvas
	constructor: (@canvasId) ->
		@canvasElement = document.getElementById @canvasId
		@context = @canvasElement.getContext "2d"
		@draw()
		@resize()
		window.addEventListener 'resize', @resize, false

	draw: () =>
		requestAnimationFrame @draw
		@context.clearRect 0, 0, @canvasElement.width, @canvasElement.height

	resize: () =>
		@canvasElement.width = @canvasElement.clientWidth;
		@canvasElement.height = @canvasElement.clientHeight;

module.exports = Canvas