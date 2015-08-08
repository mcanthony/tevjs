var path    = require("path");
var fs      = require("fs");
var webpack = require("webpack");

module.exports = {
	entry: [
		"./src/coffee/app.coffee"
	],
	cache: true,
	output: {
		path: path.join(__dirname, "build"),
		publicPath: "/",
		filename: "app.js"
	},
	resolve: [".coffee", ".scss"],
	module: {
		preLoaders: [{
			test: /\.tag$/,
			exclude: /node_modules/,
			loader: "riotjs-loader",
			query: { type: "none" }
		}],
		loaders: [{
			test: /\.coffee$/,
			loader: "coffee-loader",
			exclude: /node_modules/
		},
		{
			test: /\.scss$/,
			loader: "style!css!sass",
			exclude: /node_modules/
		},
		{
			test: /\.css$/,
			loader: "style!css",
			exclude: /node_modules/
		},
		{
			test: /fonts\//,
			loader: "file",
			exclude: /node_modules/
		}]
	},
	plugins: [
		new webpack.NoErrorsPlugin(),
		new webpack.ProvidePlugin({
			riot: "riot"
		})
	]
};
