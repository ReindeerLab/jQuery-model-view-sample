gulp = require 'gulp'
browserSync = require 'browser-sync'
browserify = require 'browserify'
coffeeify = require 'coffeeify'
source = require 'vinyl-source-stream'

gulp.task 'browserify', ->
  browserify
    entries: ['app/coffee/app.coffee']
    extensions: ['.coffee']
  .transform coffeeify
  .bundle()
  .pipe source 'bundle.js'
  .pipe gulp.dest './'
