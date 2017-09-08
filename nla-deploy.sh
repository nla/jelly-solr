#!/bin/bash

SOLR_VERSION=6.6.1

if [ -f /bss/unix/src/solr-$SOLR_VERSION.tgz ]; then
  TAR=/bss/unix/src/solr-$SOLR_VERSION.tgz
else
  wget http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz
  TAR=solr-$SOLR_VERSION.tgz
fi

tar -xf $TAR solr-$SOLR_VERSION/dist solr-$SOLR_VERSION/server/solr-webapp solr-$SOLR_VERSION/server/lib/metrics* solr-$SOLR_VERSION/server/lib/ext solr-$SOLR_VERSION/server/resources/log4j.properties
mkdir -p $1/ROOT
cp -R solr-$SOLR_VERSION/server/solr-webapp/webapp/* $1/ROOT
cp solr-$SOLR_VERSION/server/lib/*.jar $1/ROOT/WEB-INF/lib
cp solr-$SOLR_VERSION/server/lib/ext/*.jar $1/ROOT/WEB-INF/lib
mkdir $1/ROOT/WEB-INF/classes
cp solr-$SOLR_VERSION/server/resources/log4j.properties $1/ROOT/WEB-INF/classes
cp -a solr.xml jelly banjo banjo-jobs $1/ROOT/WEB-INF/solr
