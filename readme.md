# MusicFree iOS

This repository updates the old iOS package from `zhuguibiao/MusicFree-ios` with code and dependency alignment from the current Android/main MusicFree project `maotoumao/MusicFree`.

## Status

- iOS project updated for Xcode 14.2.
- React Native and Expo dependencies were refreshed for the iOS archive flow.
- Local podspec patches are included for older iOS dependency compatibility.
- The generated IPA is unsigned and is intended for development/testing packaging only.

## Build

```sh
pnpm install
cd ios
pod install
cd ..
xcodebuild -workspace ios/MusicFree.xcworkspace \
  -scheme MusicFree \
  -configuration Release \
  -sdk iphoneos \
  -archivePath build/MusicFree.xcarchive \
  -derivedDataPath build/DerivedData \
  CODE_SIGNING_ALLOWED=NO \
  archive
```

Create an unsigned IPA from the archive:

```sh
rm -rf build/Payload build/MusicFree-unsigned.ipa
mkdir -p build/Payload
cp -R build/MusicFree.xcarchive/Products/Applications/MusicFree.app build/Payload/
cd build
zip -qry MusicFree-unsigned.ipa Payload
```

## Note

Unsigned IPA files normally cannot be installed directly on an iPhone without proper signing, provisioning, or a compatible sideloading workflow.
