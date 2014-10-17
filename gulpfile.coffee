gulp   = require('gulp')
uglify = require('gulp-uglify')
coffee = require('gulp-coffee')
jade   = require('gulp-jade')
stylus = require('gulp-stylus')

paths =
  coffee: 'src/coffee/**/*.coffee'
  jade: 'src/jade/**/*.jade'
  stylus: 'src/styl/**/*.styl'
  img: 'src/img/**/*'

gulp.task 'coffee', ->
  gulp.src(paths.coffee)
      .pipe(coffee())
      .pipe(uglify())
      .pipe(gulp.dest('dist/js'))

gulp.task 'jade', ->
  gulp.src(paths.jade)
      .pipe(jade())
      .pipe(gulp.dest('dist'))

gulp.task 'stylus', ->
  gulp.src(paths.stylus)
      .pipe(stylus(use: require('nib')()))
      .pipe(gulp.dest('dist/css'))

gulp.task 'img', ->
  gulp.src(paths.img)
      .pipe(gulp.dest('dist/img'))

gulp.task 'watch', ->
  gulp.watch(paths.coffee, ['coffee'])
  gulp.watch(paths.jade, ['jade'])
  gulp.watch(paths.stylus, ['stylus'])
  gulp.watch(paths.img, ['img'])

gulp.task('build', ['coffee', 'jade', 'stylus', 'img'])
gulp.task('default', ['build', 'watch'])
