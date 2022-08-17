#!/usr/bin/env bash

# Install Amphetamine via Mac App Store: https://apps.apple.com/us/app/amphetamine/id937984704

# @raycast.title Dose for Duration (Amphetamine)
# @raycast.author Mike Oertli
# @raycast.authorURL https://github.com/mikeoertli
# @raycast.description Start Amphetamine session for the provided duration (ex: 3h or 45m). Doesn't support decimals (3.5h) or mixed durations like "3h 45m".

# @raycast.icon images/amphetamine.png
# @raycast.mode silent
# @raycast.packageName Amphetamine
# @raycast.schemaVersion 1
# @raycast.icon 💊
# @raycast.argument1 { "type": "text", "placeholder": "5h", "percentEncoded": false }


duration=$1
duration_min=$(sed 's/[a-zA-Z]*//g' <<< $duration)
if [[ $duration == *m* ]]; then
    duration_min=$((10#$duration_min))
else
    # Assume units of hours
    duration_min=$((10#$duration_min*60))
fi

end_time=$(date -v +${duration_min}M +"%H:%M %p")

# Only for debugging
# echo "Duration: ${duration_min} min  -- end time ${end_time}"

# Opted for the simpler solution that is theoretically subject to injection attack....
# Useful resource for getting variable working in oascript call: https://stackoverflow.com/questions/23923017/osascript-using-bash-variable-with-a-space
$(osascript -e 'tell application "Amphetamine" to start new session with options {duration:"'"$duration_min"'", interval:minutes, displaySleepAllowed:false}') && echo "Started Amphetamine until $end_time" || echo "❌ Error starting Amphetamine 💊"