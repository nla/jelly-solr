#!/bin/bash

SOLR_VERSION=6.6.2

curl -O http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz
TAR=solr-$SOLR_VERSION.tgz

tar -xf $TAR solr-$SOLR_VERSION/dist \
             solr-$SOLR_VERSION/contrib \
             solr-$SOLR_VERSION/server/solr-webapp \
             solr-$SOLR_VERSION/server/lib/ \
             solr-$SOLR_VERSION/server/resources/log4j.properties

mkdir -p solr-webapp/ROOT/WEB-INF/lib

# throw all the jars required in the lib dir
cp solr-$SOLR_VERSION/contrib/extraction/lib/*.jar solr-webapp/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/contrib/clustering/lib/*.jar solr-webapp/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/contrib/langid/lib/*.jar solr-webapp/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/contrib/velocity/lib/*.jar solr-webapp/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/contrib/analysis-extras/lucene-libs/lucene-analyzers-icu-*.jar solr-webapp/ROOT/WEB-INF/lib

cp solr-$SOLR_VERSION/dist/solr-cell-*.jar solr-webapp/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/dist/solr-clustering-*.jar solr-webapp/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/dist/solr-langid-*.jar solr-webapp/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/dist/solr-velocity-*.jar solr-webapp/ROOT/WEB-INF/lib

cp solr-$SOLR_VERSION/server/lib/*.jar solr-webapp/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/server/lib/ext/*.jar solr-webapp/ROOT/WEB-INF/lib

# bring in the solr web app
cp -R solr-$SOLR_VERSION/server/solr-webapp/webapp/* solr-webapp/ROOT


# pull in the log configuration
mkdir solr-webapp/ROOT/WEB-INF/classes
cp solr-$SOLR_VERSION/server/resources/log4j.properties solr-webapp/ROOT/WEB-INF/classes

cp resources/web.xml solr-webapp/ROOT/WEB-INF

# finally, our index configurations
mkdir solr-webapp/ROOT/WEB-INF/solr
cp -a resources/solr.xml jelly banjo banjo-jobs solr-webapp/ROOT/WEB-INF/solr
rm -Rf solr-$SOLR_VERSION
rm $TAR
