const fs = require('fs');
const path = require('path');

const projectRoot = path.resolve(__dirname, '..');
const pnpmRoot = path.join(projectRoot, 'node_modules', '.pnpm');

function pnpmPackageDirs(prefix) {
  if (!fs.existsSync(pnpmRoot)) {
    return [];
  }

  return fs
    .readdirSync(pnpmRoot, {withFileTypes: true})
    .filter(entry => entry.isDirectory() && entry.name.startsWith(prefix))
    .map(entry => path.join(pnpmRoot, entry.name));
}

function patchFile(filePath, replacements) {
  if (!fs.existsSync(filePath)) {
    return;
  }

  const original = fs.readFileSync(filePath, 'utf8');
  let updated = original;

  for (const [search, replace] of replacements) {
    updated = updated.replace(search, replace);
  }

  if (updated !== original) {
    fs.writeFileSync(filePath, updated);
    console.log(`patched ${path.relative(projectRoot, filePath)}`);
  }
}

for (const packageDir of pnpmPackageDirs('react-native-image-colors@')) {
  const podspec = path.join(
    packageDir,
    'node_modules',
    'react-native-image-colors',
    'ios',
    'ImageColors.podspec',
  );

  patchFile(podspec, [
    [/s\.dependency 'SwiftDraw', '~> 0\.27\.0'/g, "s.dependency 'SwiftDraw', '~> 0.21.0'"],
    [/s\.dependency 'SwiftDraw', '~> 0\.27'/g, "s.dependency 'SwiftDraw', '~> 0.21.0'"],
    [/s\.platform\s*=\s*:ios, '13\.0'/g, "s.platform       = :ios, '13.4'"],
  ]);
}

for (const packageDir of pnpmPackageDirs('react-native@0.72.10')) {
  const podspec = path.join(
    packageDir,
    'node_modules',
    'react-native',
    'third-party-podspecs',
    'boost.podspec',
  );

  patchFile(podspec, [
    [/spec\.source = \{ :http => 'https:\/\/boostorg\.jfrog\.io\/artifactory\/main\/release\/1\.76\.0\/source\/boost_1_76_0\.tar\.bz2',[\s\S]*?\}/m, "spec.source = { :http => 'https://archives.boost.io/release/1.76.0/source/boost_1_76_0.tar.bz2',\n                  :sha256 => 'f0397ba6e949f5ee29b273029af7de8f9dcb1c34c420d50f9b62f7dbaec6cc02' }"],
  ]);
}
