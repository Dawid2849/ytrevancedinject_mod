MODDIR="${0%/*}"
MODNAME="${MODDIR##*/}"

PROPFILE="/data/adb/modules/$MODNAME/module.prop"
TMPFILE="/data/adb/modules/revanced.prop"
cp -af "$MODDIR/module.prop" "$TMPFILE"

sed -Ei 's/^description=(\[.*][[:space:]]*)?/description=[ ⛔ Module is not working. ] /g' "$TMPFILE"
flock "$MODDIR/module.prop"

mount --bind "$TMPFILE" "$PROPFILE"

rm -rf "$MODDIR/loaded"
exit 0