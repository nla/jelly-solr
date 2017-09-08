#!/bin/bash

SOLR_VERSION=6.6.1

if [ -f /bss/unix/src/solr-$SOLR_VERSION.tgz ]; then
  TAR=/bss/unix/src/solr-$SOLR_VERSION.tgz
else
  wget http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz
  TAR=solr-$SOLR_VERSION.tgz
fi

tar -xf $TAR solr-$SOLR_VERSION/dist solr-$SOLR_VERSION/server/solr-webapp
mkdir -p $1/ROOT/WEB-INF/solr
cp -R solr-$SOLR_VERSION/server/solr-webapp/webapp/* $1/ROOT
cp -a solr.xml jelly banjo banjo-jobs $1/ROOT/WEB-INF/solr
