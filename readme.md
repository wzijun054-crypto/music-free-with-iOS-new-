# MusicFree iOS

## 中文

本仓库是在老 iOS 版本 `zhuguibiao/MusicFree-ios` 的基础上更新维护，并参考当前 Android/主仓 `maotoumao/MusicFree` 的代码与依赖进行适配。

### 致谢

- 老 iOS 版本原作者：`zhuguibiao`
- Android/主仓 MusicFree 原作者：`maotoumao`

### 当前状态

- 已适配 Xcode 14.2 的 iOS 归档流程。
- 已刷新 React Native 和 Expo 相关依赖。
- 已加入本地 podspec 补丁，用于兼容旧 iOS 工程依赖。
- 已包含未签名 IPA：`build/MusicFree-unsigned.ipa`。
- 未签名 IPA 主要用于开发和测试打包验证，通常不能直接安装到 iPhone。

### 构建

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

从归档产物生成未签名 IPA：

```sh
rm -rf build/Payload build/MusicFree-unsigned.ipa
mkdir -p build/Payload
cp -R build/MusicFree.xcarchive/Products/Applications/MusicFree.app build/Payload/
cd build
zip -qry MusicFree-unsigned.ipa Payload
```

### 说明

未签名 IPA 通常无法直接安装到 iPhone，需要有效签名、描述文件，或兼容的侧载流程。

## English

This repository updates and maintains the old iOS package from `zhuguibiao/MusicFree-ios`, with code and dependency alignment from the current Android/main MusicFree project `maotoumao/MusicFree`.

### Credits

- Original old iOS version author: `zhuguibiao`
- Original Android/main MusicFree author: `maotoumao`

### Status

- Updated for the Xcode 14.2 iOS archive flow.
- React Native and Expo dependencies were refreshed.
- Local podspec patches are included for older iOS dependency compatibility.
- Unsigned IPA included at `build/MusicFree-unsigned.ipa`.
- The unsigned IPA is intended for development and packaging verification only, and normally cannot be installed directly on an iPhone.

### Build

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

### Note

Unsigned IPA files normally cannot be installed directly on an iPhone without proper signing, provisioning, or a compatible sideloading workflow.
