// Generate archives
//
// Generate an archives.json file and archive pages for all categories



// Plugins
var gulp = require('gulp'),
    plumber = require('gulp-plumber'),

    data = require('gulp-data'),
    fs = require('fs'),
    mkdirp = require('mkdirp'),
    runSequence = require('run-sequence'),

    onError = require('../utils/onError'),
    arrayUnique = require('../utils/arrayUnique');


// Configuration
var paths = require('./../config');


// Collect all categories in an array
// - this is needed to have a flattened list of all categories
var collectCategories = function(articles) {
  var categories = [];

  for (var i=0; i < articles.length; i++ ) {
    if (articles[i].categories) {
      for (var j=0; j < articles[i].categories.length; j++) {
        categories.push(articles[i].categories[j]);
      }
    }
  }

  return arrayUnique(categories);
}


// Create a JSON file with all categories and associated articles
// - from this the archive files will be generated
var collectArchives = function(categories, articles) {
  var archives = '[';

  for (var i=0; i < categories.length; i++ ) {
    archives += '{"category": "' + categories[i] + '"';
    archives += ', "articles": [';

    for (var j=0; j < articles.length; j++) {
      if (articles[j].categories) {
        if (articles[j].categories.indexOf(categories[i]) !== -1 ) {
          archives += '{"title": "' + articles[j].title + '",';
          archives += '"url": "' + articles[j].url + '",';
          archives += '"date": "' + articles[j].date + '"';
          archives += '},';
        }
      }
    }

    archives = archives.slice(0, -1);
    archives += "]";
    archives += "},";
  }

  archives = archives.slice(0, -1);
  archives += ']';

  return archives;
}


// Generate an archive file
// - the contents of a single archive file
var generateFile = function(archive) {
  var content = '';

  content += "{% set title='" + archive.category + "' %}"
  content += "{% extends '../../../project/templates/tag/tag.html.swig' %}{% block content %}";
  content += "<section class='tag'>";
  content += "<h3 class='tag__title'>" + archive.category + "</h3>";

  for (var i=0; i < archive.articles.length; i++) {
    content += "<article>";
    content += "<h3 class='article__title'>" + archive.articles[i].title + "</h3>";
    content += "<a class='link' href='{{ site.url }}" + archive.articles[i].url + "' title='" + archive.articles[i].title + "'>" + archive.articles[i].title + "</a>";
    content += "<date class='article__date'>{{ " + archive.articles[i].date + " | date('F Y') }}</date>";
    content += "</article>";
  }

  content += "</section>";
  content += "{% endblock %}";

  return content;
}


// Generate an archive folder
// - all archive folders
var generateFolder = function(archive) {
  var categoryName = archive.category.toLowerCase().replace(/\s/g, '-');
  var folder = 'site/components/pages/on/' + categoryName;
  var fileName = folder + '/' + categoryName + '.html.swig';

  mkdirp(folder, function (err) {
    if (err) throw err;
    console.log(folder + ' created.');
  });

  var content = generateFile(archive);
  fs.writeFile(fileName, content);
}



// Generate archives JSON file
// - the archives.json file
gulp.task('generateArchiveJSON', function() {
  var articles = JSON.parse(fs.readFileSync(paths.articles_json, 'utf8'));
  var categories = collectCategories(articles);
  var archives = collectArchives(categories, articles);

  fs.openSync(paths.archives_json, 'w');
  fs.appendFileSync(paths.archives_json, archives);
});


// Generate archive folders
gulp.task('generateArchiveFolders', function() {
  var archives = JSON.parse(fs.readFileSync(paths.archives_json, 'utf8'));

  for (var i=0; i < archives.length; i++) {
    generateFolder(archives[i]);
  }
});


gulp.task('archives', function(cb) {
  runSequence(
    'generateArchiveJSON',
    'generateArchiveFolders',
    cb
  );
});
