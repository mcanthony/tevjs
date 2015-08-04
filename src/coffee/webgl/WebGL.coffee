class WebGL
	constructor: (@canvasId) ->
		@canvasElement = document.getElementById @canvasId
		@gl = @canvasElement.getContext "experimental-webgl"

		@initGeometry()

		@resize()
		window.addEventListener 'resize', @resize, false

		requestAnimationFrame @draw

	initGeometry: () =>
		# Nothing, leave to child classes

	draw: () =>
		requestAnimationFrame @draw
		@gl.clearColor 0, 0, 0, 1
		@gl.clear @gl.COLOR_BUFFER_BIT

	resize: () =>
		@canvasElement.width = @canvasElement.clientWidth
		@canvasElement.height = @canvasElement.clientHeight
		@gl.viewport 0, 0, @canvasElement.clientWidth, @canvasElement.clientHeight

module.exports = WebGL