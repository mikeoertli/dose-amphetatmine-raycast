#!/usr/bin/env bash

# Install Amphetamine via Mac App Store: https://apps.apple.com/us/app/amphetamine/id937984704

# @raycast.title Dose 2h (Amphetamine)
# @raycast.author Mike Oertli
# @raycast.authorURL https://github.com/mikeoertli
# @raycast.description Start Amphetamine session for 2 hours

# @raycast.icon images/amphetamine.png
# @raycast.mode silent
# @raycast.packageName Amphetamine
# @raycast.schemaVersion 1
# @raycast.icon 💊

$(osascript -e 'tell application "Amphetamine" to start new session with options {duration:2, interval:hours, displaySleepAllowed:false}') && echo "Started Amphetamine for 2 hours" || echo "❌ Error starting Amphetamine 💊"