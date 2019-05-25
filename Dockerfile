#################################################################
## Elasticsearch
##
#################################################################


FROM          elasticsearch:2.4.6-alpine

ENV           ES_HEAP_SIZE 4G

RUN           /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head

ADD           bin/entrypoint.sh /home/elasticsearch/entrypoint.sh
ADD           bin/install.sh /home/elasticsearch/install.sh

ADD           static/mappings /usr/share/elasticsearch/mappings
ADD           static/config /usr/share/elasticsearch/config

USER          elasticsearch

ENTRYPOINT    ["bash", "/home/elasticsearch/entrypoint.sh"]


CMD           ["tail", "-f", "/usr/share/elasticsearch/logs/log.txt"]