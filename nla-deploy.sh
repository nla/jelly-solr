#!/bin/bash

SOLR_VERSION=6.6.1

if [ -f /bss/unix/src/solr-$SOLR_VERSION.tgz ]; then
  TAR=/bss/unix/src/solr-$SOLR_VERSION.tgz
else
  wget http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz
  TAR=solr-$SOLR_VERSION.tgz
fi

tar -xf $TAR solr-$SOLR_VERSION/dist \
             solr-$SOLR_VERSION/contrib \
             solr-$SOLR_VERSION/server/solr-webapp \
             solr-$SOLR_VERSION/server/lib/metrics* \
             solr-$SOLR_VERSION/server/lib/ext \
             solr-$SOLR_VERSION/server/resources/log4j.properties

mkdir -p $1/ROOT/WEB-INF/lib

# throw all the jars required in the lib dir
cp solr-$SOLR_VERSION/contrib/extraction/lib/*.jar $1/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/contrib/clustering/lib/*.jar $1/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/contrib/langid/lib/*.jar $1/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/contrib/velocity/lib/*.jar $1/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/contrib/analysis-extras/lucene-libs/lucene-analyzers-icu-*.jar $1/ROOT/WEB-INF/lib

cp solr-$SOLR_VERSION/dist/solr-cell-*.jar $1/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/dist/solr-clustering-*.jar $1/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/dist/solr-langid-*.jar $1/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/dist/solr-velocity-*.jar $1/ROOT/WEB-INF/lib

cp solr-$SOLR_VERSION/server/lib/*.jar $1/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/server/lib/ext/*.jar $1/ROOT/WEB-INF/lib

# bring in the solr web app
cp -R solr-$SOLR_VERSION/server/solr-webapp/webapp/* $1/ROOT


# pull in the log configuration
mkdir $1/ROOT/WEB-INF/classes
cp log4j.properties $1/ROOT/WEB-INF/classes

# finally, our index configurations
mkdir $1/ROOT/WEB-INF/solr
cp -a solr.xml jelly banjo banjo-jobs $1/ROOT/WEB-INF/solr
