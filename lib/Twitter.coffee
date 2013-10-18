# Opifex.RSS.coffee
#
#	© 2013 Dave Goehrig <dave@dloh.org>
#

twitter = require 'twitter'
http = require('http')
https = require('https')
config = require "#{process.env.HOME}/.twitter.coffee"

Twitter = () ->
	# A bucket to contain the IDs of all the feed's we're parsing
	self = this
	self.connect = (Url) ->
		twit = new twitter config
		twit.stream Url, (stream) ->
			stream.on 'data', (data) ->
				self.send [ "twitter", data ]
	# Does not understand message
	self["*"] = (message...) ->
		console.log "Unknown message #{ JSON.stringify(message) }"

module.exports = Twitter
