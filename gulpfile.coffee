gulp        = require 'gulp'
browserSync = require('browser-sync').create()
browserify  = require 'browserify'
coffeeify   = require 'coffeeify'
streamify   = require 'gulp-streamify'
uglify      = require 'gulp-uglify'
source      = require 'vinyl-source-stream'

gulp.task 'browserSync', ->
  browserSync.init
    server:
      baseDir: './'

gulp.task 'browserify', ->
  browserify
    entries: ['app/coffee/app.coffee']
    extensions: ['.coffee']
  .transform coffeeify
  .bundle()
  .pipe source 'bundle.js'
  .pipe streamify uglify()
  .pipe gulp.dest './'

gulp.task 'sass', ->
  return

gulp.task 'html', ->
  browserSync.reload()

gulp.task 'css', ['sass'], ->
  browserSync.reload()

gulp.task 'js', ['browserify'], ->
  browserSync.reload()

gulp.task 'build', [
  'browserify'
  'sass'
]

gulp.task 'watch', ['build'] ->
  gulp.watch 'index.html', ['html']
  gulp.watch 'app/**/*.scss', ['css']
  gulp.watch 'app/**/*.coffee', ['js']

gulp.task 'default', [
  'browserSync'
  'watch'
]
