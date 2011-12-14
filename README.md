Dreamweaver DWPhoneGap redo
===========================

This is based on phonegap 1.2.0 and XCode 4.2.

This is an attempt at restoring the Mobile Applications/Build feature in Dreamweaver 5.5.

The iphone folder in this project should be copied over the iphone folder in 
 `/Applications/Adobe Dreamweaver CS5.5/Configuration/NativeAppFramework/DWPhoneGap/`.

This is based on 1.2.0 so you may have to delete your old target/xxx_iOS folder.

Haven't got the Android version working yet.

**Note:** There are two main.m files. The one in the root of the PhoneGapApp folder is a dummy file that Dreamweaver looks for to see if it needs to rebuild the directory.