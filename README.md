#### Writings

##### Conventions
* Each article is a new page in `site/components/pages`
* Article metadata goes into the article body in the YAML Front Matter section
* Mandatory fields are `title`, `url` and `date`

##### Usage
* `gulp archive` creates a JSON file `site/articles.json` with all articles sorted by date
* this information is made available compile time via the `articles` array

#### License
(c) 2006-2015 Bartus Csongor. Licensed under [GPL v2.0](http://choosealicense.com/licenses/gpl-2.0/).
