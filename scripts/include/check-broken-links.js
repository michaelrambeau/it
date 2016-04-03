const blc = require('broken-link-checker');

// check() function used by both scripts
// * check-website
// * run-check-local
// Return an object with all broken links
function check(siteUrl, cb) {
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
      console.log('> PAGE', pageUrl);
    },
    site: function(error, siteUrl, customData){},
    end: function(x, y){
      console.log('THE END! Exit with code', broken.length);
      cb(null, broken);
    }
  });
  
  siteChecker.enqueue(siteUrl);
}

module.exports = check;