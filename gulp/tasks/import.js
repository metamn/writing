// Import
//
// Import Jekyll posts into Gulp


// Plugins
var gulp = require('gulp'),
    plumber = require('gulp-plumber'),

    data = require('gulp-data'),
    fm = require('front-matter'),
    fs = require('fs'),
    path = require('path'),
    mkdirp = require('mkdirp'),
    YAML = require('json2yaml'),
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


// Convert jekyll Person to gulp figure
var convertPerson = function(yaml) {
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
}

// Convert filename to YAML url
var createURL = function(file) {
  splits = file.split('.');
  filename = splits[0];
  date = filename.match(/\d{4}\-\d{2}\-\d{2}\-/);

  return filename.replace(date[0], '');
}


// Convert filename to YAML date
var createDate = function(file) {
  splits = file.split('.');
  filename = splits[0];
  date = filename.match(/\d{4}\-\d{2}\-\d{2}\-/);

  return date[0].slice(0, -1);
}


// Create title if missing
var createTitle = function(yaml) {
  if (!yaml.title) {
    var words = yaml.url.split('-');
    var array = [];
    for (var i = 0; i < words.length; ++i) {
      array.push(words[i].charAt(0).toUpperCase() + words[i].toLowerCase().slice(1));
    }

    yaml.title = array.join(' ');
  }
}



// Convert Jekyll YAML data to Gulp format
var convertYAML = function(yaml, file) {
  // Remove layout
  delete yaml.layout;

  // Create url & date
  yaml.url = createURL(file);
  yaml.date = createDate(file);

  // Create title if missing;
  createTitle(yaml);

  // People -> Figure
  convertPerson(yaml);

  return yaml;
}


// Convert Liquid tags to Swig
var convertLiquid = function(body) {
  body = body.replace(/{% assign/g, "{% set");
  body = body.replace(/people.html/g, "'../../framework/structure/figure/figure.html.swig'");
  body = body.replace(/{% assign status = 'opened' %}/g, '');

  return body;
}



// Convert Jekyll content to Gulp
var convertContent = function(content, file) {
  // Convert Jekyll YAML data to Gulp format
  content.attributes = convertYAML(content.attributes, file);

  // Convert Liquid tags to Swig tags
  content.body = convertLiquid(content.body);

  // Append article body with a swig template;
  content.body = "{% extends '../../project/templates/default/default.html.swig' %}{% block content %}" + content.body;
  content.body += "{% endblock %}";

  //console.log(content);
}


// Create a Gulp article
var createArticle = function(content, file) {
  // names
  folderName = createURL(file);
  folder = 'site/components/pages/' + folderName;
  fileName = folder + '/' + folderName + '.html';

  //console.log(fullContent);

  // create folder
  mkdirp(folder, function (err) {
    if (err) throw err;
    console.log(folder + ' created.');
  });

  // create file
  fs.writeFile(fileName + '.swig', content.body);
  fs.writeFile(fileName + '.json', JSON.stringify(content.attributes, null, 2));
}



// The import task
gulp.task('import', function() {
  return gulp.src(paths.import_src)
    .pipe(plumber({errorHandler: onError}))

    // use YAML Front Matter
    .pipe(data(function(file) {
      var content = fm(String(file.contents));

      // Skip unpublished posts
      var status = content.attributes.published;
      if (status != false) {

        // Get filename
        fileName = path.basename(file.path);

        // Convert content
        convertContent(content, fileName);

        // Create Gulp article
        createArticle(content, fileName);
      }
    }))
});
