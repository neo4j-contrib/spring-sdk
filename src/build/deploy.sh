#!/bin/bash -e
# depends libxml-simple-perl

tcrepo=http://builder.neo4j.org/guestAuth/repository/download/bt167/lastSuccessful
rootpathdist=dist

function work {
    upload_packages neo4j-spring-community neo4j-spring-advanced neo4j-spring-enterprise
}

function run_command {
    thecommand=$1
    echo $thecommand
    $thecommand
    if [ $? -ne 0 ]
    then
        echo "Fatal command failure: $thecommand"
        exit 1
    fi
}

function fetch_artifact {
    artifact=$1
    filename=$2
    curlcommand="curl -f -O $tcrepo/$artifact/$filename"
    run_command "$curlcommand"
}

function upload_package {
    artifact=$1
    version=$2
    filenameWindows=$artifact-$version-windows.zip
    filenameUnix=$artifact-$version-unix.tar.gz
    fetch_artifact neo4j-spring-sdk $filenameWindows
    fetch_artifact neo4j-spring-sdk $filenameUnix
    upload_file $filenameWindows
    upload_file $filenameUnix
}

function upload_file {
    filename=$1
#    scpcommand="scp $filename dist-server:$rootpathdist/$filename"
    uploadcommand="s3cmd put --acl-public --guess-mime-type $filename s3://dist.neo4j.org/$filename"
    run_command "$uploadcommand"
}

# uses the global $artifact as input
function get_version {
    fetch_artifact $artifact pom.xml
    version=$( ./xmlgrep pom.xml )
    echo "**************************************************************"
    echo "artifact:$artifact  version:$version"
}

function upload_packages {
    artifact="neo4j-spring-sdk"
    get_version
    for artifact in $@  ; do
        upload_package $artifact $version
    done
}

## prepare working dir
[ -e target/upload ] && rm -rf target/upload
mkdir -p target/upload
cd target/upload


## create xml-version helper
cat<<EOF >xmlgrep
#!/usr/bin/perl -w
use XML::Simple;
print XML::Simple->new()->XMLin(shift)->{'version'};
EOF
chmod +x xmlgrep

###############
work
