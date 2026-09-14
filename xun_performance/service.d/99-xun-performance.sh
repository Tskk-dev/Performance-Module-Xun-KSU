#!/system/bin/sh

until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 2
done

sleep 5

# CPU
for policy in /sys/devices/system/cpu/cpufreq/policy*; do
    if [ ! -d "$policy" ]; then
        continue
    fi

    max_freq=$(cat "$policy/cpuinfo_max_freq" 2>/dev/null)

    if [ -n "$max_freq" ]; then
        echo "$max_freq" > "$policy/scaling_max_freq" 2>/dev/null
        echo performance > "$policy/scaling_governor" 2>/dev/null
    fi
done

# GPU
gpu="/sys/class/kgsl/kgsl-3d0"

if [ -d "$gpu" ]; then
    echo 1114800000 > "$gpu/devfreq/max_freq" 2>/dev/null
    echo 1114800000 > "$gpu/devfreq/min_freq" 2>/dev/null

    echo 0 > "$gpu/min_pwrlevel" 2>/dev/null
    echo 0 > "$gpu/max_pwrlevel" 2>/dev/null
fi

# Display refresh rate
settings put system min_refresh_rate 90.0
settings put system peak_refresh_rate 90.0

cmd display set-user-preferred-display-mode 1200 1920 90

exit 0
