module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {},
      features: {
        'custom-media-queries': true,
        'nesting-rules': true
      }
    })
  ]
}
