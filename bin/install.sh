#!/usr/bin/env bash

## Add Indexes and full mapping for specific ones
curl -XPUT "http://$ES_ADDRESS/listing-v2/"          --data-binary "@static/mappings/listing/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/rets-v2/"             --data-binary "@static/mappings/rets/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/.system/"
curl -XPUT "http://$ES_ADDRESS/.logs-v1/"            --data-binary "@static/mappings/logs/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/agent-v2/"            --data-binary "@static/mappings/agent/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/office-v1/"           --data-binary "@static/mappings/office/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/tour-v1/"             --data-binary "@static/mappings/tour/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/openhome-v1/"         --data-binary "@static/mappings/openhome/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/area-10m-v2/"         --data-binary "@static/mappings/area-10m/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/area-100m-v2/"        --data-binary "@static/mappings/area-100m/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/building/"            --data-binary "@static/mappings/building/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/history-listing-v1/"  --data-binary "@static/mappings/history/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/history-agent-v1/"    --data-binary "@static/mappings/history/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/history-office-v1/"   --data-binary "@static/mappings/history/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/billing-v1/"          --data-binary "@static/mappings/billing/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/school-v1/"           --data-binary "@static/mappings/school/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/schema-v1/"           --data-binary "@static/mappings/schema/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/event-v1-1/"          --data-binary "@static/mappings/event/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/brand-v1/"            --data-binary "@static/mappings/brand/full_mapping.json"
curl -XPUT "http://$ES_ADDRESS/mls-v2/"              --data-binary "@static/mappings/mls/full_mapping.json"

#curl -XPUT "http://$ES_ADDRESS/mls-v2/geocode"       --data-binary "@static/mappings/mls/geocode.json"

## Add mapping for specific types
curl -XPUT "http://$ES_ADDRESS/.system/_mapping/user"                --data-binary "@static/mappings/system/user.json"
curl -XPUT "http://$ES_ADDRESS/.system/_mapping/userSession"         --data-binary "@static/mappings/system/userSession.json"
curl -XPUT "http://$ES_ADDRESS/.system/_mapping/userMeta"            --data-binary "@static/mappings/system/userMeta.json"
curl -XPUT "http://$ES_ADDRESS/.system/_mapping/clientSubscription"  --data-binary "@static/mappings/system/clientSubscription.json"
curl -XPUT "http://$ES_ADDRESS/.system/_mapping/premiumAgentWebsite" --data-binary "@static/mappings/system/premiumAgentWebsite.json"
curl -XPUT "http://$ES_ADDRESS/.system/_mapping/dataApiToken"        --data-binary "@static/mappings/system/dataApiToken.json"
curl -XPUT "http://$ES_ADDRESS/.system/_mapping/appSession"       	 --data-binary "@static/mappings/system/appSession.json"

curl -XPUT "http://$ES_ADDRESS/.logs/_mapping/event"                 --data-binary "@static/mappings/logs/event.json"
curl -XPUT "http://$ES_ADDRESS/analytics/_mapping/event"             --data-binary "@static/mappings/analytics/event.json"

## Add Alias
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"listing-v2\", \"alias\" : \"production\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"listing-v2\", \"alias\" : \"production-updates\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"rets-v1\", \"alias\" : \"rets\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"area-v1\", \"alias\" : \"area\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"history-listing-v1\", \"alias\" : \"history-listing\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"history-agent-v1\", \"alias\" : \"history-agent\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"history-office-v1\", \"alias\" : \"history-office\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"billing-v1\", \"alias\" : \"billing\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"agent-v2\", \"alias\" : \"agent\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"office-v1\", \"alias\" : \"office\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"school-v1\", \"alias\" : \"school\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"schema-v1\", \"alias\" : \"schema\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"event-v1-1\", \"alias\" : \"event\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"brand-v1\", \"alias\" : \"brand\" } } ]}"
curl -XPOST "http://$ES_ADDRESS/_aliases" -d "{\"actions\" : [ { \"add\" : { \"index\" : \"mls-v1\", \"alias\" : \"mls\" } } ]}"

## Update Max Result Window so we can run queries like 30000-35000 for normalization
curl -XPUT "http://$ES_ADDRESS/rets/_settings" -d "{\"index\" : {\"max_result_window\" : 100000}}"
curl -XPUT "http://$ES_ADDRESS/production/_settings" -d "{\"index\" : {\"max_result_window\" : 100000}}"
curl -XPUT "http://$ES_ADDRESS/.logs/_settings" -d "{\"index\" : {\"max_result_window\" : 100000}}"

## Set Shards (3) and Replicas (1)
#curl -XPUT "http://$ES_ADDRESS/rets/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"
#curl -XPUT "http://$ES_ADDRESS/production/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"
#curl -XPUT "http://$ES_ADDRESS/office/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"
#curl -XPUT "http://$ES_ADDRESS/history-office/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"
#curl -XPUT "http://$ES_ADDRESS/history-listing/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"
#curl -XPUT "http://$ES_ADDRESS/history-agent/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"
#curl -XPUT "http://$ES_ADDRESS/building/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"
#curl -XPUT "http://$ES_ADDRESS/billing/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"
#curl -XPUT "http://$ES_ADDRESS/area/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"
#curl -XPUT "http://$ES_ADDRESS/agent/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"
#curl -XPUT "http://$ES_ADDRESS/.system/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"
#curl -XPUT "http://$ES_ADDRESS/.logs/_settings" -d "{\"number_of_shards\": 3, \"number_of_replicas\" : 1}"

