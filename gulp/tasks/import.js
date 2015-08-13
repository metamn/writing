// Import
//
// Import Jekyll posts into Gulp


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



// Convert Jekyll image url to Gulp
// '/assets/jorge-luis-borges.jpg' -> 'jorge-luis-borges'
var convertImageUrl = function(url) {
  url = url.replace('/assets/', '');
  url = url.replace('.jpg', '');

  return url;
}



// Convert Jekyll YAML data to Gulp format
var convertYAML = function(yaml) {
  // Remove layout
  delete yaml.layout;

  // People -> Figure
  if (yaml.people) {
    for (var i = 0; i < yaml.people.length; i++ ) {
      person = yaml.people[i];

      person.title = person.name;
      person.figcaption = person.bio;
      person.name = convertImageUrl(person.img);
      person.class = 'person';

      delete person.img;
      delete person.bio;
    }
  }

  return yaml;
}


// The import tasks
gulp.task('import', function() {
  return gulp.src(paths.import_src)
    .pipe(plumber({errorHandler: onError}))

    // use YAML Front Matter
    .pipe(data(function(file) {
      var content = fm(String(file.contents));

      // Skip unpublished posts
      var status = content.attributes.published;
      if (status != false) {

        // Convert Jekyll YAML data to Gulp format
        yaml = convertYAML(content.attributes);
        console.log(yaml);
      }
    }))
});
