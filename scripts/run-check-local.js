// Script used to run the local web site (starting the Docpaf server)
// and check all the links
// To be run before deploying the site to production

const check = require('./include/check-broken-links');

var docpadInstanceConfiguration = {
  port: process.env.PORT
};
require('docpad').createInstance(docpadInstanceConfiguration, function(err, docpadInstance){
  if (err) return console.log(err.stack);
  docpadInstance.action('generate server', function(err, result){
    if (err) return console.log(err.stack);
    console.log('Docpad server is OK');
    const url = 'http://127.0.0.1:' + process.env.PORT;
    check(url, function (err, broken) {
      if (err) return process.exit(1);
      const exitCode = broken.length;
      process.exit(exitCode); // process with error code 0 if there is no broken link.
    });
  });
});
