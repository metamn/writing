// Archive
//
// Generate a file with JSON metadata from posts.


// Plugins
var gulp = require('gulp'),
    plumber = require('gulp-plumber'),

    data = require('gulp-data'),
    fm = require('front-matter'),
    fs = require('fs'),
    runSequence = require('run-sequence'),
    onError = require('../utils/onError');


// Configuration
var paths = require('./../config');


// Generate the JSON archive file
gulp.task('archiveCreateFile', function() {
  // Reset the articles.json file
  fs.openSync(paths.articles_json, 'w');
  fs.appendFileSync(paths.articles_json, '[');

  return gulp.src(paths.articles_src)
    .pipe(plumber({errorHandler: onError}))

    // use YAML Front Matter
    .pipe(data(function(file) {
      var content = fm(String(file.contents));
      fs.appendFileSync(paths.articles_json, JSON.stringify(content.attributes) + ',');
    }))
});


// Close the JSON archive file
gulp.task('archiveCloseFile', function() {
  fs.appendFileSync(paths.articles_json, '{}]');
});


// Order the JSON archive file by date
gulp.task('archiveOrderArticles', function() {
  var articles = JSON.parse(fs.readFileSync(paths.articles_json, 'utf8'));

  articles.sort(function(a, b) {
    return new Date(a.date) - new Date(b.date);
  });

  fs.openSync(paths.articles_json, 'w');
  fs.appendFileSync(paths.articles_json, JSON.stringify(articles));
});


gulp.task('archive', function(cb) {
  runSequence(
    'archiveCreateFile',
    'archiveCloseFile',
    'archiveOrderArticles',
    cb
  );
});
