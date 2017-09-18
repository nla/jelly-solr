Example jettyctl config:

Latest Jelly Solr version : 1.18.0

```sh
PORT=10430
REPO=git@github.com:nla/jelly-solr.git
ROOT_URL_PREFIX=/solr

JAVA_OPTS=-server -Xms512m -Xmx512m -XX:NewRatio=3 -XX:SurvivorRatio=4 \
    -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=8 -XX:+UseConcMarkSweepGC \
    -XX:+UseParNewGC -XX:ConcGCThreads=4 -XX:ParallelGCThreads=4 \
    -XX:+CMSScavengeBeforeRemark -XX:PretenureSizeThreshold=64m \
    -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=50 \
    -XX:CMSMaxAbortablePrecleanTime=6000 -XX:+CMSParallelRemarkEnabled \
    -XX:+ParallelRefProcEnabled -Dsolr.solr.home=/jetty-app-deploy-location/WEB-INF/solr 
    -Dsolr.data.dir=/somplace/somewhere -Djetty.port=10340 
    -Dsolr.install.dir=/jetty-app-deploy-location
```
Note: Requires java 8 
