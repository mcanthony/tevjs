#
# Stylesheet
#

# Skeleton CSS
require "../../vendor/skeleton/normalize.css"
require "../../vendor/skeleton/skeleton.css"

# Our stylesheet
require "../scss/screen.scss"

#
# Canvas rendering
#

Canvas = require "./canvas/Canvas.coffee"

canvas = new Canvas "tevPreview"