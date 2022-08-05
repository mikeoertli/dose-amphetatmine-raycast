#!/usr/bin/env bash

# Install Amphetamine via Mac App Store: https://apps.apple.com/us/app/amphetamine/id937984704

# @raycast.title Dose Until 5PM (Amphetamine)
# @raycast.author Mike Oertli
# @raycast.authorURL https://github.com/mikeoertli
# @raycast.description Start Amphetamine session until 5PM

# @raycast.icon images/amphetamine.png
# @raycast.mode silent
# @raycast.packageName Amphetamine
# @raycast.schemaVersion 1
# @raycast.icon 💊

# Useful resource: https://www.faqcode4u.com/faq/195356/bash-script-difference-in-minutes-between-two-times

now=$(date +%H:%M)
end="17:00"
# feeding variables by using read and splitting with IFS
IFS=: read now_hour now_min <<< "$now"
IFS=: read end_hour end_min <<< "$end"

# convert hours to minutes, ensuring use of base 10 (particularly given possibility of leading 0s)
total_now_minutes=$((10#$now_hour*60 + 10#$now_min))
total_end_minutes=$((10#$end_hour*60 + 10#$end_min))

delta_min=$(echo "$((total_end_minutes - total_now_minutes))")

# Opted for the simpler solution that is subject to injection attack.... but since we control the variables here, it seemed safe.
# Useful resource for getting variable working in oascript call: https://stackoverflow.com/questions/23923017/osascript-using-bash-variable-with-a-space
$(osascript -e 'tell application "Amphetamine" to start new session with options {duration:"'"$delta_min"'", interval:minutes, displaySleepAllowed:false}') && echo "Started Amphetamine until 5PM" || echo "❌ Error starting Amphetamine 💊"