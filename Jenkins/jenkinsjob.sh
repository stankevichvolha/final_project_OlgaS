#!/bin/bash
set -eo pipefail
cd ..

DESTINATION='platform:iOS Simulator, id:3BAA4058-59EC-4A0D-A85A-1356CB053A36, OS:13.2.2, name:iPhone 8'
WORKSPACE="Smack(10).xcworkspace"
SDK="iphonesimulator"
SCHEME="Smack(10)";
XCTESTRUN_PATH=Jenkins/build/Build/Products/${SCHEME}_iphonesimulator*x86_64.xctestrun

build() {
    rm -rf Jenkins/build
    rm -rf Jenkins/reports
    mkdir -p Jenkins/build
    echo "Jenkins.sh: Building binaries"
    xcodebuild \
    -workspace "${WORKSPACE}" \
    -scheme "${SCHEME}" \
    -sdk "${SDK}" \
    -destination "${DESTINATION}" \
    -derivedDataPath ./Jenkins/build clean build-for-testing
}

run() {
    echo "Jenkins.sh: Start xctestrun"

    rm -rf Jenkins/build/reports

    xcodebuild test-without-building  \
    -xctestrun ${XCTESTRUN_PATH} \
    -destination "${DESTINATION}" | tee xcodebuild.log | xcpretty -r junit -r html
}

build
run
