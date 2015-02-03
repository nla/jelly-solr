Example jettyctl config:

###Latest Jelly Solr version : 1.3.1

```sh
PORT=10340
REPO=git@github.com:nla/jelly-solr.git
JAVA_OPTS=(-Dsolr.solr.home=/apps/$NODE/ROOT/WEB-INF/solr -Dsolr.data.dir=/ssd/somewhere)
```
