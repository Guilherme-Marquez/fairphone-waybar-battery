#!/bin/bash
IIO_DIR="/sys/bus/iio/devices/iio:device1"
if [ ! -d "$IIO_DIR" ]; then
    echo "Error: iio:device1 not found" >&2
    exit 1
fi
DEVICE_OUTPUT=$(cat "$IIO_DIR"/* 2>/dev/null)
VBAT_RAW=$(echo "$DEVICE_OUTPUT" | grep -E 'vbat_sns' -B1 | head -n1)
TEMP_RAW=$(echo "$DEVICE_OUTPUT" | grep -E 'chg_temp' -B1 | head -n1)
USB_I=$(echo "$DEVICE_OUTPUT" | grep -E 'usb_in_i_uv' -B1 | head -n1)
VBAT_RAW=${VBAT_RAW:-0}
TEMP_RAW=${TEMP_RAW:-0}
USB_I=${USB_I:-0}
VOLT_mV=$(echo "$VBAT_RAW/1000" | bc)
TEMP_C=$(echo "$TEMP_RAW/1000" | bc)
CHG_STATUS="Unknown"
if [ "$USB_I" -gt 100000 ]; then
    CHG_STATUS="Charging"
else
    CHG_STATUS="Not Charging"
fi
if [ "$VOLT_mV" -ge 4200 ]; then
    SOC=100
elif [ "$VOLT_mV" -le 3000 ]; then
    SOC=0
else
    SOC=$(echo "scale=0; 100*($VOLT_mV - 3000)/1200" | bc)
fi
echo "Voltage: ${VOLT_mV} mV"
echo "Temperature: ${TEMP_C} °C"
echo "Status: ${CHG_STATUS}"
echo "Estimated SOC: ${SOC}%"
