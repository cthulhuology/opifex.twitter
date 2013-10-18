Opifex.Twitter
=============

Opifex.Twitter generates a stream of messages to AMQP from Twitter Streams.

Installation
------------

	npm install opifex
	npm install opifex.twitter

Usage
-----

First generate a config file of the name ~/.twitter.coffee of the form:

	module.exports =
		consumer_key: "XXXXXXXXXXXXXXXXXXX",
		consumer_secret: "XXXXXXXXXXXXXXXXXXX",
		access_token_key: "XXXXXXXXXXXXXXXXXXX",
		access_token_secret: "XXXXXXXXXXXXXXXXXXX"

This will be read in whenever you start up the client.  It looks in the home directory of
whatever user is running the process, so you can secure your Oauth credentials.

Then from the command line run:

	opifex 'amqp://guest:guest@localhost:5672//twitter-cmd/#/twit/twitter-out/tweet' twitter

Once it is running as specified on the above command,  it will listen on a twitter-cmd exchange for any messages in the twit queue.  It
will then direct all of its output to an twitter-out exchange with a routing key of tweet.  Feel free to change any of the resource paths
as fits your application.

To start the connection to Twitter issue a message of the form:

	[ "connect", "statuses/sample" ]

or

	[ "connect", "statuses/firehose" ]

And opifex will start forwarding the tweets to you twitter-out exchange with a routing key or tweet.


