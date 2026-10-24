#!/usr/bin/env bash
# Builds libtdjson.so for Android from the TDLib commit in
# data/TDLIB_COMMIT, with TDLib's own example/android scripts, and copies
# the libraries into android/src/main/jniLibs. Run it on Linux (or WSL):
#
#   bash build-tdlib-android.sh [work dir]
#
# Needs: git, g++, make, perl, php, gperf, java (JDK), unzip, zip, wget or
# curl. The first run downloads an Android SDK/NDK into the work dir and
# accepts its licences; later runs reuse it.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
WORK="${1:-$HOME/tdbuild}"
COMMIT="$(tr -d '[:space:]' < "$HERE/data/TDLIB_COMMIT")"
NDK=23.2.8568313
API=24
ABIS="arm64-v8a armeabi-v7a x86_64"
# A few TDLib sources need several GB each to compile.
export CMAKE_BUILD_PARALLEL_LEVEL="${JOBS:-3}"

mkdir -p "$WORK"
cd "$WORK"
[ -d td ] || git clone https://github.com/tdlib/td.git
cd td
git fetch -q origin
git checkout -q "$COMMIT"
echo "TDLib $(grep -m1 'project(TDLib VERSION' CMakeLists.txt) at $COMMIT"

cd example/android
# A download cut short (a full disk, say) leaves an SDK folder without the
# NDK's compiler; start that over instead of trusting the folder.
if [ ! -x "SDK/ndk/$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/clang" ]; then
  rm -rf SDK third-party/openssl
  ./fetch-sdk.sh SDK "$NDK" || { echo "fetch-sdk failed"; exit 1; }
fi
if [ ! -f third-party/openssl/arm64-v8a/lib/libssl.a ]; then
  rm -rf third-party/openssl
  ./build-openssl.sh SDK "$NDK" third-party/openssl || { echo "build-openssl failed"; exit 1; }
fi
./build-tdlib.sh SDK "$NDK" third-party/openssl c++_static JSON "$API" "$ABIS" || { echo "build-tdlib failed"; exit 1; }

for abi in $ABIS; do
  mkdir -p "$HERE/android/src/main/jniLibs/$abi"
  cp -f "tdlib/libs/$abi/libtdjson.so" "$HERE/android/src/main/jniLibs/$abi/libtdjson.so"
  # OpenSSL is linked in statically now; older builds shipped these beside it.
  rm -f "$HERE/android/src/main/jniLibs/$abi/libcrypto.so" "$HERE/android/src/main/jniLibs/$abi/libssl.so"
done
rm -rf "$HERE/android/src/main/jniLibs/x86"
echo "Done: libtdjson.so for $ABIS"
