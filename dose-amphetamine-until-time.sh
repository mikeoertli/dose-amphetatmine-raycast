#!/usr/bin/env bash

# Install Amphetamine via Mac App Store: https://apps.apple.com/us/app/amphetamine/id937984704

# @raycast.title Dose Until Time (Amphetamine)
# @raycast.author Mike Oertli
# @raycast.authorURL https://github.com/mikeoertli
# @raycast.description Start Amphetamine session until a user-provided end time (must be < 24h). Supports format like: "5pm", "1700", or "17:00".

# @raycast.icon images/amphetamine.png
# @raycast.mode silent
# @raycast.packageName Amphetamine
# @raycast.schemaVersion 1
# @raycast.icon 💊
# @raycast.argument1 { "type": "text", "placeholder": "5pm", "percentEncoded": false }

# Useful resource: https://www.faqcode4u.com/faq/195356/bash-script-difference-in-minutes-between-two-times

now=$(date +%H:%M)
end="$1"

# populate variables by using read and split on the colon with IFS
IFS=: read now_hour now_min <<< "$now"

if [[ $end == *"p"* ]] || [[ $end == *"a"* ]] ; then
    ([[ $end == *"a" ]] || [[ $end == *"p" ]]) && end="${end}m"
    
    end_time_only=$(sed 's/[a-zA-Z]*//g' <<< $end)
    length=${#end_time_only}

    # 1 or 2 indicates we got a simple time like "5pm" - i.e. no minutes
    if [[ $length -le 2 ]]; then
        end_hour=$( date -jf "%H%p" $end +'%H')
        end_min=0
    else
        if [[ $length -eq 1 ]] || [[ $length -eq 3 ]]; then
            end="0${end}"
        fi

        if [[ $end == *":"* ]]; then
            end=$( date -jf "%H:%M%p" $end +'%H:%M')

            IFS=: read end_hour end_min <<< "$end"
        else
            end=$( date -jf "%H%M%p" $end +'%H:%M')

            IFS=: read end_hour end_min <<< "$end"
        fi
    fi
    
else
    length=${#end}
    if [[ $length -eq 1 ]] || [[ $length -eq 3 ]]; then
        end="0${end}"
    fi
    if [[ $end == *":"* ]]; then
        end=$( date -jf "%H:%M" $end +'%H:%M')
    else
        end=$( date -jf "%H%M" $end +'%H:%M')
    fi
    IFS=: read end_hour end_min <<< "$end"
fi

# convert hours to minutes, ensuring use of base 10 (particularly given possibility of leading 0s)
total_now_minutes=$((10#$now_hour*60 + 10#$now_min))
total_end_minutes=$((10#$end_hour*60 + 10#$end_min))

delta_min=$(echo "$((total_end_minutes - total_now_minutes))")

if [[ $delta_min -le 0 ]]; then
    delta_min=$(($delta_min + 1440))
fi

# Debug
# echo "end: ${end}"
# echo "end_hour: ${end_hour}"
# echo "end_min: ${end_min}"
# echo "total_now_minutes: ${total_now_minutes}"
# echo "total_end_minutes: ${total_end_minutes}"
# echo "delta_min: ${delta_min}"

# Opted for the simpler solution that is subject to injection attack.... but since we control the variables here, it seemed safe.
# Useful resource for getting variable working in oascript call: https://stackoverflow.com/questions/23923017/osascript-using-bash-variable-with-a-space
$(osascript -e 'tell application "Amphetamine" to start new session with options {duration:"'"$delta_min"'", interval:minutes, displaySleepAllowed:false}') && echo "Started Amphetamine until $1" || echo "❌ Error starting Amphetamine 💊"