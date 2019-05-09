#!/bin/bash

echo "removing Twitter Source Connectors"

curl -X "DELETE" "$DOCKER_HOST_IP:8083/connectors/twitter-source"

echo "creating Twitter Source Connector"

curl -X "POST" "$DOCKER_HOST_IP:8083/connectors" \
     -H "Content-Type: application/json" \
     --data '{
  "name": "twitter-source",
  "config": {
  	"connector.class": "com.github.jcustenborder.kafka.connect.twitter.TwitterSourceConnector",
  	"twitter.oauth.consumerKey": "XXXXX",
  	"twitter.oauth.consumerSecret": "XXXXX",
  	"twitter.oauth.accessToken": "XXXXX",
  	"twitter.oauth.accessTokenSecret": "XXXXX",
  	"process.deletes": "false",
  	"filter.keywords": "Keanu Reeves,Bruce Willis,Quentin Tarantino,Sandra Bullock",
  	"kafka.status.topic": "tweet-raw-v1",
  	"tasks.max": "1"
	}
  }'

