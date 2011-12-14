#!/bin/sh

################################################################################
#
# iGap.sh
#
# author: Brett Rudd <brett.rudd@nitobi.com>
# date: Oct 27, 2010
# version: 1.0
#
# Produces a phonegap compatible project from the official phonegap xcode template
#
# usage:
#
#   iGap.sh <OldProjectPath> <NewProjectPath> <Author> <Bundle> <Version> <PhoneGapLibPath>
#
# examples:
#
#   ./iGap.sh ./PhoneGapApp "/Documents/Projects/Tip Calculator Pro" "Fred Blogs" "com.fredblogs" "1" "./PhoneGapLib"
#
################################################################################

TEMPLATEPATH=$1
APPNAME=$2
AUTHOR=$3
FULLBUNDLE=$4
VERSION=$5
PHONEGAPPATH=$6

# remove bad characters
TMPFILE=/tmp/xcodeRename.$$

if [ "$TEMPLATEPATH" = "" -o "$APPNAME" = "" -o "$AUTHOR" = ""-o "$FULLBUNDLE" = "" -o "$VERSION" = "" -o "$PHONEGAPPATH" = "" ]; then
  echo "usage: $0 <TemplatePath> <AppName> <Author> <FullBundle> <Version> <PhoneGapPath>"
  exit
fi

if [ ! -d "${TEMPLATEPATH}" ]; then
  echo "ERROR: \"${TEMPLATEPATH}\" must be a directory"
  exit
fi

FULLBUNDLE=`echo $FULLBUNDLE | tr '[A-Z]' '[a-z]'`

# set new project directory
if [ -d "${FULLBUNDLE}" ]; then
  echo "ERROR: project directory \"${FULLBUNDLE}\" exists. Terminating."
  exit
fi

# create project name as valid C identifier format
TMP=$(echo $FULLBUNDLE | tr ".", "\n")
for x in $TMP
do
    APPIDENTIFIER="$x"
done

# copy project directory
echo copying project directory from "${TEMPLATEPATH}" to "${FULLBUNDLE}"
cp -r "${TEMPLATEPATH}" "${FULLBUNDLE}"

chmod -R 777 "${FULLBUNDLE}"

# function to replace tokens in all files and filenames
function replaceToken {

	# replace content in files
	find "$FULLBUNDLE" -type f -exec sed -i '' -e "s:$1:$2:g" {} \;
	
	# rename filenames
	find "$FULLBUNDLE" -name "*$1*" | while read file ; do
		mv "$file" "`echo "$file" | sed -e "s:$1:$2:g"`"
	done
	
}
echo `pwd`
replaceToken "___PROJECTNAMEASIDENTIFIER___" "$APPIDENTIFIER"
replaceToken "___PROJECTNAME___" "$APPNAME"
replaceToken "___FULLUSERNAME___" "$AUTHOR"
replaceToken "___DATE___" "`date "+%d %B, %Y"`"
replaceToken "___ORGANIZATIONNAME___" "MyCompany"
replaceToken "___YEAR___" "`date +%Y`"
replaceToken "\$(PHONEGAPLIBPATH)" "$PHONEGAPPATH"
replaceToken "___FULLBUNDLENAME___" "$FULLBUNDLE"
cd "$APPIDENTIFIER"
replaceToken "___PROJECTNAMEASIDENTIFIER___" "$APPIDENTIFIER"
replaceToken "___PROJECTNAME___" "$APPNAME"
replaceToken "___FULLUSERNAME___" "$AUTHOR"
replaceToken "___DATE___" "`date "+%d %B, %Y"`"
replaceToken "___ORGANIZATIONNAME___" "MyCompany"
replaceToken "___YEAR___" "`date +%Y`"
replaceToken "\$(PHONEGAPLIBPATH)" "$PHONEGAPPATH"
replaceToken "___FULLBUNDLENAME___" "$FULLBUNDLE"
defaults write "`pwd`/$FULLBUNDLE/$APPIDENTIFIER-Info" "CFBundleVersion" $VERSION
cd ..

echo finished.