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
cp -a solr.xml jelly banjo banjo-jobs $1/ROOT/WEB-INF/solr
cp solr-$SOLR_VERSION/example/lib/ext/* $1/ROOT/WEB-INF/lib
wget --directory-prefix=$1/ROOT/WEB-INF/lib http://dev.nla.gov.au/nexus/service/local/repositories/nla-snapshots/content/au/gov/nla/solr/nlasolr/4.7.2-SNAPSHOT/nlasolr-4.7.2-20150113.231853-33.jar
wget --directory-prefix=$1/ROOT/WEB-INF/lib http://dev.nla.gov.au/nexus/content/repositories/nla/org/apache/lucene/lucene-analyzers-icu/4.7.2.NLA.mm-patched/lucene-analyzers-icu-4.7.2.NLA.mm-patched.jar
wget --directory-prefix=$1/ROOT/WEB-INF/lib http://dev.nla.gov.au/nexus/content/repositories/nla/org/apache/lucene/lucene-analyzers-stempel/4.7.2.NLA.mm-patched/lucene-analyzers-stempel-4.7.2.NLA.mm-patched.jar
wget --directory-prefix=$1/ROOT/WEB-INF/lib http://repo1.maven.org/maven2/com/ibm/icu/icu4j/49.1/icu4j-49.1.jar
