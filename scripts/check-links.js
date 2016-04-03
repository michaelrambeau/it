// script to be called from the command line
// `node scripts/check-links <url>`
// almost equivalent to the command `"blc http://michaelrambeau.com -ro --exclude *linkedin.com* --exclude *university.mongodb.com*"`

const blc = require('broken-link-checker');

const siteUrl = 'http://michaelrambeau.com';

console.log('Start', siteUrl);
const broken = [];
const options = {
  excludedKeywords: [
     '*university.mongodb.com*', // to avoid http errors 405
     '*linkedin.com*' // LinkedIn does not allow web scraping => http error 999!
  ]
};

const siteChecker = new blc.SiteChecker(options, {
  robots: function(robots, customData){},
  html: function(tree, robots, response, pageUrl, customData){},
  junk: function(result, customData){},
  link: function(result, customData){
    console.log(result.broken ? 'BROKEN!' : 'OK', result.url.resolved);
    if (result.broken) broken.push(result);
  },
  page: function(error, pageUrl, customData){
    console.log('> PAGE', pageUrl, customData);
  },
  site: function(error, siteUrl, customData){console.log(error, siteUrl, customData)},
  end: function(x, y){
    console.log('THE END!', broken.length);
    const exitCode = broken.length;
    process.exit(exitCode); // process with error code 0 if there is no broken link.
  }
});

siteChecker.enqueue(siteUrl);
