#!/bin/sh
set -ex
SIMULATOR_ID=`xcrun simctl list -j devices available | jq -r '.devices | to_entries[] | select(.key | contains("com.apple.CoreSimulator.SimRuntime.iOS-'$IOS_VERSION'")) | select(.value != []) | .value[0].udid' | head -1`
export SIMULATOR_ID
echo "Using simulator ${SIMULATOR_ID}"

PROJECT_ROOT=$(cd $(dirname "$0")/..; pwd)
DOC_BUILD="${PROJECT_ROOT}/DocBuild"
rm -rf "${DOC_BUILD}/"
mkdir -p "${DOC_BUILD}/"

sourcekitten doc --module-name SudoVirtualCards -- \
  -workspace SudoVirtualCards.xcworkspace \
  -scheme SudoVirtualCards \
  -destination "platform=iOS Simulator,id=${SIMULATOR_ID}" \
  -derivedDataPath "${DOC_BUILD}" > "${DOC_BUILD}/SudoVirtualCards.json"

sourcekitten doc --module-name SudoVirtualCardsNotificationExtension -- \
  -workspace SudoVirtualCards.xcworkspace \
  -scheme SudoVirtualCardsNotificationExtension \
  -destination "platform=iOS Simulator,id=${SIMULATOR_ID}" \
  -derivedDataPath "${DOC_BUILD}" > "${DOC_BUILD}/SudoVirtualCardsNotificationExtension.json"

jazzy --config util/SudoVirtualCards.sourcekitten.jazzy.yaml --sourcekitten-sourcefile "${DOC_BUILD}/SudoVirtualCards.json,${DOC_BUILD}/SudoVirtualCardsNotificationExtension.json"
set +ex
