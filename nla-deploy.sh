#!/bin/bash

SOLR_VERSION=4.4.0

if [ -f /bss/unix/src/solr-$SOLR_VERSION.tgz ]; then
  TAR=/bss/unix/src/solr-$SOLR_VERSION.tgz
else
  wget http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz
  TAR=solr-$SOLR_VERSION.tgz
fi

tar -xf $TAR solr-$SOLR_VERSION/dist/solr-$SOLR_VERSION.war solr-$SOLR_VERSION/example/lib/ext
unzip -d $1/ROOT solr-$SOLR_VERSION/dist/solr-$SOLR_VERSION.war
mkdir $1/ROOT/WEB-INF/solr
cp -a solr.xml jelly $1/ROOT/WEB-INF/solr
cp solr-$SOLR_VERSION/example/lib/ext/* $1/ROOT/WEB-INF/lib
