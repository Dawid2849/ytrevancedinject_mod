# Checking for installation environment
# Abort TWRP installation with error message when user tries to install this module in TWRP

if [ $BOOTMODE = false ]; then
	ui_print "- Installing through TWRP Not supported"
	ui_print "- Intsall this module via your KSU/Magisk Manager"
	abort "- Aborting installation !!"
fi
api_level_arch_detect

PKGNAME="$(grep_prop package "$MODPATH/module.prop")"
APPNAME="YouTube"
STOCKAPPVER=$(dumpsys package $PKGNAME | grep versionName | cut -d= -f 2 | sed -n '1p')
RVAPPVER="$(grep_prop version "$MODPATH/module.prop")"
URL="https://www.apkmirror.com/apk/google-inc/youtube/youtube-$(echo -n "$RVAPPVER" | tr "." "-")-release/"


if [ ! -d "/proc/1/root/data/data/$PKGNAME" ]
then
	ui_print "- $APPNAME app is not installed"
	am start -a android.intent.action.VIEW -d "$URL" &>/dev/null
	abort "- Aborting installation !!"
fi

[ ! -d "/data/adb/modules/magisk_proc_monitor" ] && {
    MURL=http://github.com/HuskyDG/magisk_proc_monitor
    ui_print "- Process monitor tool is not installed"
    ui_print "  Please install it from $MURL"
    am start -a android.intent.action.VIEW -d "$MURL" &>/dev/null
}


if [ "$STOCKAPPVER" != "$RVAPPVER" ]
then
	ui_print "- Installed $APPNAME version = $STOCKAPPVER"
	ui_print "- $APPNAME Revanced version = $RVAPPVER"
	ui_print "- App Version Mismatch !!"
  am start -a android.intent.action.VIEW -d "$URL" &>/dev/null
	abort "- Aborting installation !!"
fi

# Disable battery optimization for YouTube ReVanced
sleep 1
ui_print "- Disable Battery Optimization for YouTube ReVanced"
dumpsys deviceidle whitelist +$PKGNAME > /dev/null 2>&1


ui_print "- Install Successful !!"
