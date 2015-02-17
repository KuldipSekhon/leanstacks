gulp = require 'gulp'
coffee = require 'gulp-coffee'
rename = require 'gulp-rename'
minifycss = require 'gulp-minify-css'
server = require 'gulp-webserver'
del = require 'del'

config =
  version: '2.0.0'

gulp.task 'clean', (cb) ->
  del ['dist'], cb

gulp.task 'lib', ->
  gulp.src('lib/**')
    .pipe(gulp.dest('dist/assets/lib'))

gulp.task 'html', ->
  gulp.src(['src/main/app/html/*.html','src/main/app/favicon.ico'])
    .pipe(gulp.dest('dist'))

gulp.task 'css', ->
  gulp.src('src/main/app/css/**/*.css')
    .pipe(gulp.dest('dist/assets/app/css'))
    .pipe(rename({ suffix: '.min' }))
    .pipe(minifycss())
    .pipe(gulp.dest('dist/assets/app/css'))

gulp.task 'images', ->
  gulp.src('src/main/app/img/**/*')
    .pipe(gulp.dest('dist/assets/app/img'))

gulp.task 'default', ['clean'], ->
  gulp.start 'lib', 'html', 'css', 'images'

gulp.task 'run', ['lib', 'html', 'css', 'images'], ->
  gulp.watch 'src/main/app/html/*.html', ['html']
  gulp.watch 'src/main/app/css/**/*.css', ['css']
  gulp.watch 'src/main/app/img/**/*', ['images']
  gulp.watch 'lib/**', ['lib']

  gulp.src('dist')
    .pipe(server(
      port: 9000
      livereload: true
    ))
