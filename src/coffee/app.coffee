#
# Stylesheet
#

# Skeleton CSS
require "../../vendor/skeleton/normalize.css"
require "../../vendor/skeleton/skeleton.css"

# Our stylesheet
require "../scss/screen.scss"

#
# TEV stage display (upper canvas)
#

TEVStageDisplay = require "./tevStageDisplay/TEVStageDisplay.coffee"

tevStageDisplay = new TEVStageDisplay "tevPreview"