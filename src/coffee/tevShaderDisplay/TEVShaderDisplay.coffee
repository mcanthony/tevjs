WebGL = require "../webgl/WebGL.coffee"
Shader = require "../webgl/Shader.coffee"

class TEVShaderDisplay extends WebGL
	@initGeometry: () =>
		buffer = @gl.createBuffer()
		tris = new Float32Array [-1, -1, 1, -1, -1, 1, -1, 1, 1, -1, 1, 1]
		@gl.bindBuffer @gl.ARRAY_BUFFER, buffer
		@gl.bufferData @gl.ARRAY_BUFFER, tris, @gl.STATIC_DRAW

	@draw: () =>
		super
		@gl.drawArrays @gl.TRIANGLES, 0, 6

module.exports = TEVShaderDisplay