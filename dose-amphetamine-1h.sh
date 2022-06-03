#!/usr/bin/env bash

# Install Amphetamine via Mac App Store: https://apps.apple.com/us/app/amphetamine/id937984704

# @raycast.title Dose 1h (Amphetamine)
# @raycast.author Mike Oertli
# @raycast.authorURL https://github.com/mikeoertli
# @raycast.description Start Amphetamine session for 1 hour

# @raycast.icon images/amphetamine.png
# @raycast.mode silent
# @raycast.packageName Amphetamine
# @raycast.schemaVersion 1
# @raycast.icon 💊

$(osascript -e 'tell application "Amphetamine" to start new session with options {duration:1, interval:hours, displaySleepAllowed:false}') && echo "Started Amphetamine for 1 hour" || echo "❌ Error starting Amphetamine 💊"