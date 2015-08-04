#
# Stylesheet
#

# Skeleton CSS
require "../../vendor/skeleton/normalize.css"
require "../../vendor/skeleton/skeleton.css"

# Our stylesheet
require "../scss/screen.scss"

#
# TEV stage/shader display initiation (upper canvas)
#

TEVStageDisplay  = require "./tevStageDisplay/TEVStageDisplay.coffee"
TEVShaderDisplay = require "./tevShaderDisplay/TEVShaderDisplay.coffee"

tevStageDisplay  = new TEVStageDisplay "tevPreview"
tevShaderDisplay = new TEVShaderDisplay "glslPreview"