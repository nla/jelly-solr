Example jettyctl config:

###Latest Jelly Solr version : 1.4.0

```sh
PORT=10340
REPO=git@github.com:nla/jelly-solr.git
JAVA_OPTS=(-Dsolr.solr.home=/apps/$NODE/ROOT/WEB-INF/solr -Dsolr.data.dir=/ssd/somewhere)
```
Note: Jelly Solr pulls in a custom nla package build for specific versions of SOLR (see nla-deploy.sh to see what the current package and SOLR versions are). Upgrading Jelly Solr to a later version of SOLR (eg: SOLR 5.x) will require replacing the nla package with one built for that later SOLR version. Releases for later versions are available on the NLA's nexus maven repository.
