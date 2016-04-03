// script to be called from the command line, used to check the web site in production
// `node scripts/check-links <url>`
// almost equivalent to the command `"blc http://michaelrambeau.com -ro --exclude *linkedin.com* --exclude *university.mongodb.com*"`

const check = require('./include/check-broken-links');
const argv = require('minimist')(process.argv.slice(2));
const siteUrl = argv._[0]; // access CLI "positional parameters"
if (!siteUrl) throw new Error('Site URL should be specified as the 1st argument!')

check(siteUrl, function (err, broken) {
  if (err) return process.exit(1);
  const exitCode = broken.length;
  process.exit(exitCode); // process with error code 0 if there is no broken link.
});
