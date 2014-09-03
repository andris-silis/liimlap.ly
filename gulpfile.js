var gulp = require('gulp');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var sourcemaps = require('gulp-sourcemaps');
// var watch = require('gulp-watch');
var plumber = require('gulp-plumber');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var handlebars = require('gulp-handlebars');
var wrap = require('gulp-wrap');
var declare = require('gulp-declare');


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
        './src/coffee/models/DesktopModel.coffee',
        './src/coffee/models/NoteModel.coffee',

        './src/coffee/collections/DesktopsCollection.coffee',
        './src/coffee/collections/NotesCollection.coffee',

        './src/coffee/views/NoteView.coffee',
        './src/coffee/views/TextNoteView.coffee',
        './src/coffee/views/ImageNoteView.coffee',
        './src/coffee/views/DesktopView.coffee',

        './src/coffee/views/DesktopsMenuItemView.coffee',
        './src/coffee/views/DesktopsMenuView.coffee',
        './src/coffee/views/CreateNoteView.coffee',
        './src/coffee/views/CreateDesktopView.coffee',


        './src/coffee/controllers/DesktopsController.coffee',
        './src/coffee/controllers/NotesController.coffee',
        './src/coffee/views/ApplicationLayoutView.coffee',
        './src/coffee/DesktopsRouter.coffee',

        './src/coffee/boot.coffee'
];



var sassSrc = [
    'sass/**/*.scss'
];


var handlebarsSrc = [
    'src/handlebars-templates/**/*.hbs'
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


gulp.task('compile-handlebars', function(){
  gulp.src(handlebarsSrc)
    .pipe(handlebars())
    .pipe(wrap('Handlebars.template(<%= contents %>)'))
    .pipe(declare({
      namespace: 'App.templates',
      noRedeclare: true,
    }))
    .pipe(concat('templates.js'))
    .pipe(gulp.dest('dist/js'));
});


gulp.task('watch', function () {
    gulp.watch(coffeeSrc, ['compile-coffee']);
    gulp.watch(sassSrc, ['compile-sass']);
});


gulp.task(
    'build',
    [
        'compile-sass',
        'compile-coffee',
        'compile-handlebars',
        'concat-vendor-css',
        'concat-vendor-js'
    ],
    function () {

    }
);


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
