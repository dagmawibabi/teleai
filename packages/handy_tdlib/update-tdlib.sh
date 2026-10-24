#!/bin/bash
# Updater for TDLib built with https://github.com/HandyGram/tdlib-example

if [ $# != 1 ]; then
    echo "Usage: $0 \"tdlib.zip\""
    echo "Archive structure:"
    echo "- tdlib/scheme/td_api.tl - TDLib scheme"
    echo "- tdlib/libs/[ABI]/libtdjson.so - TDJSON libs"
    echo "- tdlib/README.md - TDLib build info"
    exit 1
fi

TEMP_DIR="$(mktemp -d)"
PACKAGE_DIR="$(dirname $(realpath $0 2>/dev/null || readlink -f $0 2>/dev/null))"
ZIP="$(realpath $1 2>/dev/null || readlink -f $1 2>/dev/null)"

# Update TDLib files
mkdir -p "$TEMP_DIR"
(cd "$TEMP_DIR" && unzip "$ZIP") || exit 1
cp -rf $TEMP_DIR/tdlib/libs/* "$PACKAGE_DIR/android/src/main/jniLibs" || exit 1
cp -f "$TEMP_DIR/tdlib/scheme/td_api.tl" "$PACKAGE_DIR/data/td_api.tl" || exit 1
cp -f "$TEMP_DIR/tdlib/README.md" "$PACKAGE_DIR/data/README.md" || exit 1

# Update version
TDLIB_VERSION="$(grep Version "$PACKAGE_DIR/data/README.md" | cut -d '|' -f 3 | xargs)"
TDLIB_COMMIT="$(grep Commit "$PACKAGE_DIR/data/README.md" | cut -d '|' -f 3 | xargs)"
OLD_VERSION="$(grep version "$PACKAGE_DIR/pubspec.yaml" | cut -d ' ' -f 2)"
OLD_PATCH_LEVEL=$(cut -d '.' -f 3 <<< $OLD_VERSION)
NEW_PATCH_LEVEL=$((OLD_PATCH_LEVEL+1))
# YES I'VE TIRED OF TRYING TO LEARN SED REGEXES
NEW_VERSION="$(cut -d '.' -f 1 <<< $OLD_VERSION).$(cut -d '.' -f 2 <<< $OLD_VERSION).$NEW_PATCH_LEVEL"
# not sed -i cuz for compatibility between darwin and linux sed
sed 's/version: '$(sed 's/\./\\\./g' <<< "$OLD_VERSION")'/version: '$(sed 's/\./\\\./g' <<< "$NEW_VERSION")'/' "$PACKAGE_DIR/pubspec.yaml" > "$PACKAGE_DIR/pubspec.yaml.tmp" || exit 1
sed -r 's/v[0-9]+.[0-9]+.[0-9]+/v'$TDLIB_VERSION'/' "$PACKAGE_DIR/README.md" > "$PACKAGE_DIR/README.md.tmp" || exit 1
cat - "$PACKAGE_DIR/CHANGELOG.md" <<< "## $NEW_VERSION
* Updated to TDLib $TDLIB_VERSION ($TDLIB_COMMIT)
" > "$PACKAGE_DIR/CHANGELOG.md.tmp" || exit 1
mv "$PACKAGE_DIR/pubspec.yaml.tmp" "$PACKAGE_DIR/pubspec.yaml"
mv "$PACKAGE_DIR/CHANGELOG.md.tmp" "$PACKAGE_DIR/CHANGELOG.md"
mv "$PACKAGE_DIR/README.md.tmp" "$PACKAGE_DIR/README.md"

cd "$PACKAGE_DIR"
rm -rf "$TEMP_DIR"
dart run generator/generate.dart || exit 1

git add \
    pubspec.yaml \
    CHANGELOG.md \
    README.md \
    lib/src/tdapi \
    data \
    android/src/main/jniLibs
git commit -m "Update to TDLib $TDLIB_VERSION ($TDLIB_COMMIT)"

echo "Done."
