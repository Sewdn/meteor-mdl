#!/bin/bash

################################################################################
# This script publishes the edge version.
################################################################################

RLSVER=1.3.5
EDGE_VERSION=1.1.3_8

SCRIPTDIR="$(dirname "$0")"
ROOTDIR="${SCRIPTDIR}/../"

cd $ROOTDIR/meteor-package

##! Todo: Edit or check `package.js` to ensure the package name is "mdl-edge".

# Install npm dependencies
npm install

# Export the edge version so the package will use a different name.
export EDGE_VERSION
# Publish meteor package under the specified release.
meteor publish --release $RLSVER

# Hide the package.
meteor admin set-unmigrated zodiase:mdl-edge
