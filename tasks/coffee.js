'use strict';

var gulp = require('gulp');
var coffee = require('gulp-coffee');

gulp.task('coffee', function () {
  return gulp.src('app/scripts/**/*.coffee')
    .pipe(coffee({bare: false}))
    .on('error', console.error.bind(console))
    .pipe(gulp.dest('.tmp/scripts'))
});
