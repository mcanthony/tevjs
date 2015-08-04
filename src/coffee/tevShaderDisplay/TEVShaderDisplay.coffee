WebGL = require "../webgl/WebGL.coffee"
Shader = require "../webgl/Shader.coffee"

testShader = """
void main() {
	gl_FragColor = vec4(gl_FragCoord.x / 640.0, gl_FragCoord.y / 480.0, 0.0, 1.0);
}
"""

class TEVShaderDisplay extends WebGL
	constructor: (@canvasId) ->
		super @canvasId
		@shader = new Shader @gl
		@shader.setVertex Shader::defaultVertex
		@shader.setFragment testShader
		@shader.compile()
		@shader.use()

	initGeometry: () =>
		buffer = @gl.createBuffer()
		tris = new Float32Array [-1, -1, 1, -1, -1, 1, -1, 1, 1, -1, 1, 1]
		@gl.bindBuffer @gl.ARRAY_BUFFER, buffer
		@gl.bufferData @gl.ARRAY_BUFFER, tris, @gl.STATIC_DRAW

	draw: () =>
		super
		@gl.drawArrays @gl.TRIANGLES, 0, 6

module.exports = TEVShaderDisplay