#Import plugins
gulp        = require 'gulp'
browserSync = require('browser-sync').create()
browserify  = require 'browserify'
coffeeify   = require 'coffeeify'
sass        = require 'gulp-sass'
streamify   = require 'gulp-streamify'
uglify      = require 'gulp-uglify'
source      = require 'vinyl-source-stream'

#Run web server
gulp.task 'browserSync', ->
  browserSync.init
    server:
      baseDir: './'

#Compile JavaScript files
gulp.task 'browserify', ->
  browserify
    entries: ['app/coffee/app.coffee']
    extensions: ['.coffee']
  .transform coffeeify
  .bundle()
  .pipe source 'bundle.js'
  .pipe streamify uglify()
  .pipe gulp.dest './'

#Copy Bootstrap files
gulp.task 'bootstrap', ->
  gulp.src ['node_modules/bootstrap-sass/assets/**/*']
  .pipe gulp.dest 'assets/bootstrap'

#Compile scss files
gulp.task 'sass', ->
  gulp.src 'app/scss/main.scss'
  .pipe sass
    outputStyle: 'compressed'
    includePaths: [
      'app/scss'
      'node_modules/bootstrap-sass/assets/stylesheets'
    ]
  .pipe gulp.dest './'

gulp.task 'html', ->
  browserSync.reload()

gulp.task 'css', ['sass'], ->
  browserSync.reload()

gulp.task 'js', ['browserify'], ->
  browserSync.reload()

#Watch your source files
gulp.task 'watch', ['build'], ->
  gulp.watch 'index.html', ['html']
  gulp.watch 'app/scss/**/*.scss', ['css']
  gulp.watch 'app/coffee/**/*.coffee', ['js']

gulp.task 'build', [
  'browserify'
  'sass'
]

gulp.task 'default', [
  'bootstrap'
  'browserSync'
  'watch'
]
