var gulp = require('gulp');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var sourcemaps = require('gulp-sourcemaps');

gulp.task('coffee', function () {
	gulp.src('./src/**/*.coffee')
		.pipe(sourcemaps.init())
		.pipe(coffee({ bare: true })).on('error', gutil.log)
		.pipe(sourcemaps.write('./maps'))
		.pipe(gulp.dest('./dist/js'));
});

gulp.task('default', function () {
});
