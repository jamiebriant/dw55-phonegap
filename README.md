Dreamweaver DWPhoneGap redo
===========================

This is based on phonegap 1.2.0 and XCode 4.2.

This is an attempt at restoring the Mobile Applications/Build feature in Dreamweaver 5.5.

**NOTE: This patch involves deleting and replacing files in the Dreamweaver folder. I make no warranty that this will work. This may make Dreamweaver unusable for you.
Use at your own risk.**

The iphone folder in this project should be copied over the iphone folder in
 
 `/Applications/Adobe Dreamweaver CS5.5/Configuration/NativeAppFramework/DWPhoneGap/`.

This is based on 1.2.0 so you may have to delete your old target/xxx_iOS folder.

Haven't got the Android version working yet.

**Note:** There are two main.m files. The one in the root of the PhoneGapApp folder is a dummy file that Dreamweaver looks for to see if it needs to rebuild the directory.

Prerequisites
-------------

* OSX
* Adobe Dreamweaver 5.5
* iOS Developer tools
* PhoneGap 1.2.0

Essentially you need to do the first **two** steps of http://phonegap.com/start

Later, when you release the app, you will most definitely want to make your own, clean, project by following all those instructions. I cannot vouch that hacking the
XCode project file didn't introduce any problems.

THIS SOFTWARE IS PROVIDED WITHOUT ANY WARRANTY. USE IT AT YOUR OWN RISK. 

It is a repackage of phonegap's source code, available here: https://github.com/callback/callback-ios

