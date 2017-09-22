## Latest Jelly Solr version : 1.18.0

Example jettyctl config:

```sh
PORT=10430
REPO=git@github.com:nla/jelly-solr.git
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
ROOT_URL_PREFIX=/solr6

JAVA_OPTS=-server -Xms512m -Xmx512m -XX:NewRatio=3 -XX:SurvivorRatio=4 \
    -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=8 -XX:+UseConcMarkSweepGC \
    -XX:+UseParNewGC -XX:ConcGCThreads=4 -XX:ParallelGCThreads=4 \
    -XX:+CMSScavengeBeforeRemark -XX:PretenureSizeThreshold=64m \
    -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=50 \
    -XX:CMSMaxAbortablePrecleanTime=6000 -XX:+CMSParallelRemarkEnabled \
    -XX:+ParallelRefProcEnabled -Dsolr.solr.home=/apps/${NODE}/ROOT/WEB-INF/solr 
    -Dsolr.data.dir=/somplace/somewherexport/solr/${NODE} -Djetty.port=10340 
    -Dsolr.install.dir=/apps/${NODE}/ROOT
```


#### Local deployment
1. Run the shell script `local-deploy.sh` one time, to prepare for running these indexes locally on a Mac.

2. To run: `mvn jetty:run-forked -Dhost=.nla.gov.au -Djetty.port=9999`
