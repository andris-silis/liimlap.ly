var gulp = require('gulp');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var sourcemaps = require('gulp-sourcemaps');
// var watch = require('gulp-watch');
var plumber = require('gulp-plumber');
var concat = require('gulp-concat');


var js_vendor_src = [
    'bower_components/jquery/dist/jquery.js',
    'bower_components/jquery-ui/jquery-ui.js',
    'bower_components/lodash/dist/lodash.underscore.js',
    'bower_components/handlebars/handlebars.js',
    'bower_components/backbone/backbone.js',
    'bower_components/backbone.collectionsubset/backbone.collectionsubset.js',
    'bower_components/backbone.localStorage/backbone.localStorage.js',
    'bower_components/marionette/lib/backbone.marionette.js'
];


var coffee_src = [
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


gulp.task('vendor-concat', function () {
	gulp.src(js_vendor_src)
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


gulp.task('coffee-compile', function () {
	gulp.src(coffee_src)
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


gulp.task('watch', function () {
	gulp.watch(coffee_src, ['coffee-compile']);
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
