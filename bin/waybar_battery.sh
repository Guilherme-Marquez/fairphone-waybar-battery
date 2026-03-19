#!/bin/sh
# Run the battery script WITHOUT sudo
OUTPUT=$(/home/user/battery_fp4.sh | grep "Estimated SOC")
# Extract the number only
PERCENT=$(echo "$OUTPUT" | awk '{print $3}')
echo "🔋 $PERCENT   "
