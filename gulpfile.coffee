source      = require('vinyl-source-stream')
gulp        = require('gulp')
uglify      = require('gulp-uglify')
browserify  = require('browserify')
streamify   = require('gulp-streamify')
jade        = require('gulp-jade')
stylus      = require('gulp-stylus')
browserSync = require('browser-sync')

gulp.task 'serve', ->
  browserSync(
    server:
      baseDir: 'dist'
  )
  
gulp.task 'coffee', ->
  browserify('./src/coffee/app.coffee')
    .transform('coffeeify')
    .bundle()
    .pipe(source('app.js'))
    .pipe(streamify(uglify()))
    .pipe(gulp.dest('dist/js'))
    
gulp.task 'jade', ->
  gulp.src('src/jade/**/*.jade')
      .pipe(jade())
      .pipe(gulp.dest('dist'))

gulp.task 'stylus', ->
  gulp.src('src/styl/app.styl')
      .pipe(stylus(use: require('nib')()))
      .pipe(gulp.dest('dist/css'))

gulp.task 'img', ->
  gulp.src('src/img/**/*')
      .pipe(gulp.dest('dist/img'))

gulp.task 'watch', ->
  gulp.watch('src/coffee/**/*.coffee', ['coffee'])
  gulp.watch('src/jade/**/*.jade', ['jade'])
  gulp.watch('src/styl/**/*.styl', ['stylus'])
  gulp.watch('src/img/**/*', ['img'])

gulp.task('build', ['coffee', 'jade', 'stylus', 'img'])
gulp.task('default', ['build', 'watch', 'serve'])
