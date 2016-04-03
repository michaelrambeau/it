# Michael Rambeau's professional web site

[![Build Status](https://travis-ci.org/michaelrambeau/website.svg?branch=master)](https://travis-ci.org/michaelrambeau/website)

This is the web site of Michael Rambeau, a French IT web engineer working in Osaka, Japan, since 2010.

## Goals

I created this web site to promote my skills, my experience and my passion about web development

I wanted this site to be:

* mobile-friendly: it should be a requirement for any web site
* fast: because performance matters! Check [Google speed test](https://developers.google.com/speed/pagespeed/insights/?url=http%3A%2F%2Fmichaelrambeau.com%2F&tab=mobile)
* simple: it should be easy to deploy a web site to any host


## Technologies

The web site is powered by [docpad](http://docpad.org), a tool built on top of node.js that can be used to generate static web sites.

I took advantage of the flexibility of docpad to create pages using different templating languages:

* [CoffeeKup](http://coffeekup.org/) (CoffeeCup used as a templating language)
* [Jade](http://jade-lang.com/)
* [Markdown](https://daringfireball.net/projects/markdown/basics)

I used [Stylus](https://github.com/learnboost/stylus) CSS preprocessor and [Purecss](http://purecss.io) CSS components to make the web site mobile-friendly.

## Development workflow

Command to start the web server and watch for changes on source files:

```
npm start
```

Then go to http://localhost:9778/ to check the web site in local.

Command line to deploy to Github pages:

```
npm run deploy
```

## Testing

I use [broken-link-checker](https://github.com/stevenvachon/broken-link-checker) to check all links on all pages (URLs, images...).

Command to build the site in local and check all links:

```
npm test
```

Check all links in production (http://michaelrambeau.com)

```
npm run check-links-production
```
