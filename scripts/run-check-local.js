// Script used to run the local web site (starting the Docpaf server)
// and check all the links
// To be run before deploying the site to production

const docpad = require('docpad');
const check = require('./include/check-broken-links');

// On CI servers and cloud IDEs, use the environment variable `PORT`
const port = process.env.PORT || 9779;

var docpadInstanceConfiguration = {
  port: port
};

docpad.createInstance(docpadInstanceConfiguration, function(err, docpadInstance){
  if (err) return console.log(err.stack);
  docpadInstance.action('generate server', function(err, result){
    if (err) return console.log(err.stack);
    console.log('Docpad server is OK, check all links...');
    const url = 'http://127.0.0.1:' + port;
    check(url, function (err, broken) {
      if (err) return process.exit(1);
      const exitCode = broken.length;
      process.exit(exitCode); // exit with error code 0 if there is no broken link.
    });
  });
});
