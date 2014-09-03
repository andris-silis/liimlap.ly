var gulp = require('gulp');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var sourcemaps = require('gulp-sourcemaps');
// var watch = require('gulp-watch');
var plumber = require('gulp-plumber');
var concat = require('gulp-concat');
var sass = require('gulp-sass');


var jsVendorSrc = [
    'bower_components/jquery/dist/jquery.js',
    'bower_components/jquery-ui/jquery-ui.js',
    'bower_components/lodash/dist/lodash.underscore.js',
    'bower_components/handlebars/handlebars.js',
    'bower_components/backbone/backbone.js',
    'bower_components/backbone.collectionsubset/backbone.collectionsubset.js',
    'bower_components/backbone.localStorage/backbone.localStorage.js',
    'bower_components/marionette/lib/backbone.marionette.js'
];


var cssVendorSrc = [
    'bower_components/normalize.css/normalize.css',
    'bower_components/gridism/gridism.css',
];


var coffeeSrc = [
	// './src/**/*.coffee'
        './src/models/DesktopModel.coffee',
        './src/models/NoteModel.coffee',

        './src/collections/DesktopsCollection.coffee',
        './src/collections/NotesCollection.coffee',

        './src/views/NoteView.coffee',
        './src/views/TextNoteView.coffee',
        './src/views/ImageNoteView.coffee',
        './src/views/DesktopView.coffee',

        './src/views/DesktopsMenuItemView.coffee',
        './src/views/DesktopsMenuView.coffee',
        './src/views/CreateNoteView.coffee',
        './src/views/CreateDesktopView.coffee',


        './src/controllers/DesktopsController.coffee',
        './src/controllers/NotesController.coffee',
        './src/views/ApplicationLayoutView.coffee',
        './src/DesktopsRouter.coffee',

        './src/boot.coffee'
];



var sassSrc = [
    'sass/**/*.scss'
];


gulp.task('concat-vendor-js', function () {
    gulp.src(jsVendorSrc)
        .pipe(sourcemaps.init())
        .on('error', gutil.log)
        .pipe(concat('vendors.js'))
        .pipe(sourcemaps.write(
                './maps',
                { sourceRoot: '../../bower_components' }
            )
        )
        .pipe(gulp.dest('./dist/js'));
});


gulp.task('concat-vendor-css', function () {
	gulp.src(cssVendorSrc)
		.on('error', gutil.log)
		.pipe(concat('vendors.css'))
		.pipe(gulp.dest('./dist/css'));
});


gulp.task('compile-coffee', function () {
	gulp.src(coffeeSrc)
		.pipe(sourcemaps.init())
		.pipe(coffee({ bare: true }))
		.on('error', gutil.log)
		.pipe(concat('app.js'))
		.pipe(sourcemaps.write(
				'./maps',
				{ sourceRoot: '../../src' }
			)
		)
		.pipe(gulp.dest('./dist/js'));
});


gulp.task('compile-sass', function () {
    gulp.src(sassSrc)
        .pipe(sass())
        .pipe(concat('app.css'))
        .pipe(gulp.dest('./dist/css'));
});


gulp.task('watch', function () {
    gulp.watch(coffeeSrc, ['compile-coffee']);
    gulp.watch(sassSrc, ['compile-sass']);
});


gulp.task('build', ['compile-sass', 'compile-coffee', 'concat-vendor-css', 'concat-vendor-js'], function () {

});


// gulp.task('watch', function () {
// 	gulp.src(coffee_src, { read: false })
// 		.pipe(watch())
// 		.pipe(plumber())
// 		.pipe(sourcemaps.init())
// 		.pipe(coffee({ bare: true }))
// 		.on('error', gutil.log)
// 		.pipe(sourcemaps.write('./maps'))
// 		.pipe(gulp.dest('./dist/js'))
// });


gulp.task('default', function () {
});
