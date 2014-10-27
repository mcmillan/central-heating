gulp   = require('gulp')
uglify = require('gulp-uglify')
coffee = require('gulp-coffee')
jade   = require('gulp-jade')
stylus = require('gulp-stylus')

gulp.task 'coffee', ->
  gulp.src('src/coffee/app.coffee')
      .pipe(coffee())
      .pipe(uglify())
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
gulp.task('default', ['build', 'watch'])
