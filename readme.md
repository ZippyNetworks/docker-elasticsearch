![image](https://user-images.githubusercontent.com/308489/57512890-9acacc00-7315-11e9-854f-ad77da4d2742.png)

# Elasticsearch Mapping

Elasticsearch Mapping for open BoxMLS environment

![image](https://user-images.githubusercontent.com/12067297/57533408-60c5ee00-7346-11e9-8649-7ec652e360a7.png)

## Requirements

* Elasticsearch v2.4 cluster
 
## Installation

Clone the repository and run the following command from your local environment:

```
ES_ADDRESS={ELASTICSEARCH_HOST} bash bin/install.sh
```

# Support

Do you have any questions. Please, visit [Support](https://boxmls.github.io/support) page for consulting and help.


```
docker build . --tag=boxmls/elasticsearch:2.4.6
```

```
docker run -it --rm boxmls/elasticsearch:2.4.6 bash
```