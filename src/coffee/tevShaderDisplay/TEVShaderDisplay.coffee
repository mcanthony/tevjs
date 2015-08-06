THREE = require "../../../vendor/threejs/three.js"
THREE.OrbitControls = require "../../../vendor/threejs/OrbitControls.js"

defaultVertex = """
void main() {
	gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
"""

testShader = """
void main() {
	gl_FragColor = vec4(gl_FragCoord.x / 640.0, gl_FragCoord.y / 480.0, 0.0, 1.0);
}
"""

class TEVShaderDisplay
	constructor: (@canvasId) ->
		# Get canvas
		@canvas = document.getElementById @canvasId
		@container = @canvas.parentElement

		@canvas.width = @container.clientWidth
		@canvas.height = @container.clientHeight

		# Init THREE.js stuff
		@scene = new THREE.Scene()
		@camera = new THREE.PerspectiveCamera 75, @canvas.width / @canvas.height, 0.1, 1000
		@renderer = new THREE.WebGLRenderer { canvas: @canvas }

		# Init basic geometry (todo: support user models via OBJloader)
		geometry = new THREE.BoxGeometry 1, 1, 1
		@shader = new THREE.ShaderMaterial {
			vertexShader: defaultVertex
			fragmentShader: testShader
		}

		@cube = new THREE.Mesh geometry, @shader

		@scene.add @cube
		@camera.position.z = 2

		@controls = new THREE.OrbitControls @camera, @container

		# Handle resizing
		@resize()
		window.addEventListener 'resize', @resize, false

		# Start rendering
		@draw()
		return

	draw: () =>
		requestAnimationFrame @draw
		@renderer.render @scene, @camera
		@controls.update()
		return

	resize: () =>
		@camera.aspect = @container.clientWidth / @container.clientHeight
		@camera.updateProjectionMatrix()
		@renderer.setSize @container.clientWidth, @container.clientHeight
		return

module.exports = TEVShaderDisplay