module.exports = {
    presets: ['babel-preset-expo'],
    plugins: [
        [
            'module-resolver',
            {
                root: ['./'],
                alias: {
                    '^@/(.+)': './src/\\1',
                    'webdav': "webdav/dist/react-native"
                },
            },
        ],
        '@babel/plugin-transform-class-properties',
        '@babel/plugin-transform-private-methods',
        '@babel/plugin-transform-private-property-in-object',
        'react-native-reanimated/plugin',
    ],
    env: {
        production: {
            plugins: ['transform-remove-console'],
        },
    },
};
