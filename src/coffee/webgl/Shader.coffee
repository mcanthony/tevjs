class Shader
	constructor: (@gl) ->
		@program = @gl.createProgram()
		@vertexSet = false
		@fragmentSet = false

	setVertex: (vertexSrc) =>
		if @vertexSet
			@gl.detachShader @program, @vertexShader

		@vertexShader = @gl.createShader @gl.VERTEX_SHADER
		@gl.shaderSource @vertexShader, vertexSrc

		@gl.compileShader @vertexShader

		unless @gl.getShaderParameter @vertexShader, @gl.COMPILE_STATUS
			console.error "Vertex shader compilation error: #{@gl.getShaderInfoLog(@vertexShader)}"
			return false

		@gl.attachShader @program, @vertexShader
		@vertexSet = true
		return true

	setFragment: (fragmentSrc) =>
		if @fragmentSet
			@gl.detachShader @program, @fragmentShader

		@fragmentShader = @gl.createShader @gl.FRAGMENT_SHADER
		@gl.shaderSource @fragmentShader, fragmentSrc

		@gl.compileShader @fragmentShader

		unless @gl.getShaderParameter @fragmentShader, @gl.COMPILE_STATUS
			console.error "Fragment shader compilation error: #{@gl.getShaderInfoLog(@fragmentShader)}"
			return false

		@gl.attachShader @program, @fragmentShader
		@fragmentSet = true
		return true

	compile: () =>
		unless @vertexSet and @fragmentSet
			console.error "Can't link the program because of missing shaders."
			return false

		@gl.linkProgram @program
		return true

	use: () =>
		unless @vertexSet and @fragmentSet
			console.error "Can't use the program because it is not linked."
			return false

		@gl.useProgram @program

		positionLocation = @gl.getAttribLocation @program, "a_position"
		@gl.enableVertexAttribArray positionLocation
		@gl.vertexAttribPointer positionLocation, 2, @gl.FLOAT, false, 0, 0
		return true

	defaultVertex: "attribute vec2 a_position; void main() { gl_Position = vec4(a_position, 0, 1); }"

module.exports = Shader