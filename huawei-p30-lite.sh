#!/bin/bash

# Check if ADB is installed
if ! command -v adb &> /dev/null; then
	echo "ADB is not installed. Please install it first."
	exit 1
fi

# Run commands inside adb shell using a here-document
adb shell << 'EOF'
echo "Hello from android"

package_list="com.android.backupconfirm com.android.deskclock com.android.dreams.basic com.android.dreams.phototable com.android.htmlviewer com.android.pacprocessor com.android.providers.calendar com.android.providers.partnerbookmarks com.android.stk com.android.wallpaper.livepicker com.google.android.apps.books com.google.android.apps.mapps com.huawei.android.karaoke com.huawei.android.mirrorshare com.huawei.android.remotecontroller com.huawei.contactscamcard com.huawei.desktop.explorer com.huawei.gameassistant com.huawei.geofence com.huawei.himovie.overseas com.huawei.hwdetectrepair com.huawei.iaware com.huawei.livewallpaper.paradise com.huawei.parentcontrol com.huawei.phoneservice com.huawei.mirror com.huawei.vassistant com.huawei.wallet com.huawei.watch.sync com.iflytek.speechsuite com.amazon.aa com.amazon.aa.attribution com.booking com.ebay.mobile com.facebook.appmanager com.facebook.system com.facebook.orca com.facebook.katana com.facebook.services com.netflix.mediaclient com.netflix.partner.activation com.microsoft.translator com.swiftkey.swiftkeyconfigurator"

#Iterate over the list and uninstall each package
for package in $package_list; do
	echo "Uninstalling: $package"
	pm uninstall -k --user 0 "$package"
done
EOF
