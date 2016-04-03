# Michael Rambeau's personal web site

[![Build Status](https://travis-ci.org/michaelrambeau/website.svg?branch=master)](https://travis-ci.org/michaelrambeau/website)

This is the personal web site of Michael Rambeau, a French IT web engineer working in Osaka, Japan, since 2010.

The web site is powered by [docpad](http://docpad.org), a tool built on top of node.js that can be used to generate static web sites.

I took advantage of the flexibility of docpad to create pages using different templating languages:

* [CoffeeKup](http://coffeekup.org/) (CoffeeCup used as a templating language)
* [Jade](http://jade-lang.com/)
* [Markdown](https://daringfireball.net/projects/markdown/basics)

I used [Stylus](https://github.com/learnboost/stylus) CSS preprocessor and [Purecss](http://purecss.io) CSS components to make the web site mobile-friendly.

Command to start the web server and watch for changes on source files:

```
npm start
```

Then go to http://localhost:9778/ to check the web site in local.

Command line to deploy to Github pages:

```
npm run deploy
```
