#### Writings

Short essays since 2006.

##### Conventions
* Each article is a new page in `site/components/pages`
* Article metadata goes into a separate `.json` file
* Mandatory fields are `title`, `url` and `date`
* Each time metadata changes the `articles` object must be recreated with the `gulp archive` task

##### Usage
* `gulp archive` creates a JSON file `site/articles.json` with all articles sorted by date
* this information is made available compile time via the `articles` array

#### License
(c) Copyright Bartus Csongor. All rights reserved.
