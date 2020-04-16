#! /bin/bash

# Usage: Checkout the commit that you wish to tag. Pass the names of the stackpacks you wish to tag to this script:
# Usage: $ ./tagSome.sh azure aws stackstate-agent-v2

# NOTE Assumes that the version in version.sbt has already been bumped to the correct number.

for SP in $*
do
    export VERSION=`cat $SP/version.sbt | sed -E 's/lastReleasedStackPackVersion ?:= ?"(.*)"/\1/'`
    git tag -a "$SP-$VERSION" -m "$SP version $VERSION"
done
