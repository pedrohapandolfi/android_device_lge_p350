#!/system/bin/sh
# Copyright (c) 2009, Code Aurora Forum. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Code Aurora nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.product.device`

# Pecan/Hazel porting by bongkyu.kim@lge.com 
case "$target" in 
	"pecan" | "hazel")
		target='msm7627_surf'
		;;
esac

case "$target" in
    "msm7201a_ffa" | "msm7201a_surf" | "msm7627_ffa" | "msm7627_surf" | "qsd8250_surf" | "qsd8250_ffa" | "msm7630_surf" | "qsd8650a_st1x")
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo 90 > /sys/devices/system/cpu/cpu0/cpufreq/ondemand/up_threshold
        ;;
esac

case "$target" in
    "msm7201a_ffa" | "msm7201a_surf" | "msm7630_surf" |"msm7630_fusion" | "qsd8650a_st1x")
        echo 500000 > /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
     "msm7201a_ffa" | "msm7201a_surf" | "msm7627_ffa" | "msm7627_surf" | "msm7627_7x_ffa" | "msm7627_7x_surf")
        echo 245760 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        ;;
esac

case "$target" in
    "msm8660_surf")
#        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#        echo 90 > /sys/devices/system/cpu/cpu0/cpufreq/ondemand/up_threshold
#        echo 500000 > /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
#        echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
#        echo 90 > /sys/devices/system/cpu/cpu1/cpufreq/ondemand/up_threshold
#        echo 500000 > /sys/devices/system/cpu/cpu1/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "msm7627_ffa" | "msm7627_surf" | "msm7627_7x_ffa" | "msm7627_7x_surf" )
        echo 25000 > /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "qsd8250_surf" | "qsd8250_ffa" )
        echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "qsd8650a_st1x")
        mount -t debugfs none /sys/kernel/debug
    ;;
esac
