class Canvas
	constructor: (@canvasId) ->
		@canvasElement = document.getElementById @canvasId
		@context = @canvasElement.getContext "2d"

module.exports = Canvas