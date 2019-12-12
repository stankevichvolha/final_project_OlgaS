#!/bin/bash
set -eo pipefail
cd ..

DESTINATION='platform=iOS Simulator,id:DED6395C-EF90-40A5-B65D-5BE381E64DA6,OS=13.2.2'
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
