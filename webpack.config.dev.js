var config = require("./webpack.config.js");

console.log("[Development config] Adding hot-reload entrypoints");

config.entry = [
	"webpack-dev-server/client?http://localhost:3000",
	"webpack/hot/only-dev-server",
	"./src/coffee/app.coffee"
];

//config.plugins.push(new webpack.HotModuleReplacementPlugin());

module.exports = config;

