const {getDefaultConfig} = require('expo/metro-config');
const path = require('path');

/**
 * Reference: https://github.com/software-mansion/react-native-svg/blob/main/USAGE.md
 */
const config = getDefaultConfig(__dirname);
const {assetExts, sourceExts} = config.resolver;
const nodeModulesPath = path.resolve(__dirname, 'node_modules');

config.transformer.babelTransformerPath = require.resolve('react-native-svg-transformer');
config.resolver.assetExts = assetExts.filter(ext => ext !== 'svg');
config.resolver.sourceExts = [...sourceExts, 'svg'];
config.resolver.nodeModulesPaths = [nodeModulesPath];
config.resolver.unstable_enableSymlinks = true;

module.exports = config;
