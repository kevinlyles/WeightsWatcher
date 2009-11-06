#!/bin/bash

VERSION="`grep '^## Version: ' WeightsWatcher.toc | sed -e 's/.* //'`"

## Debug code
# echo "'$VERSION'"
# exit

cd .. && 7z a -tzip -xr!'.git*' -xr!'Todo*' -xr!'*~' -xr-!'WeightsWatcher/goals' -xr-!'WeightsWatcher/future-features' -xr-!'WeightsWatcher/wowhead values' -xr-!'WeightsWatcher/make-zip.sh' -mx=9 WeightsWatcher-$VERSION.zip WeightsWatcher/
