// Archive
//
// Generate archives from posts.


// Plugins
var gulp = require('gulp'),
    plumber = require('gulp-plumber'),

    data = require('gulp-data'),
    fm = require('front-matter'),
    fs = require('fs'),
    onError = require('../utils/onError');;


// Configuration
var paths = require('./../config');


// Task for creating archive pages
gulp.task('archive', function() {
  // Reset the articles.json file
  fs.openSync(paths.articles_json, 'w');
  fs.appendFile(paths.articles_json, '[', function (err) {});

  return gulp.src(paths.articles_src)
    .pipe(plumber({errorHandler: onError}))

    // use YAML Front Matter
    .pipe(data(function(file) {
      var content = fm(String(file.contents));
      file.contents = new Buffer(content.body);
      fs.appendFile(paths.articles_json, JSON.stringify(content.attributes) + ',', function (err) {});
      return content.attributes;
    }))

  fs.appendFile(paths.articles_json, ']', function (err) {});
});
