function loadCSS(e,t,n){"use strict";var i=window.document.createElement("link");var o=t||window.document.getElementsByTagName("script")[0];i.rel="stylesheet";i.href=e;i.media="only x";o.parentNode.insertBefore(i,o);setTimeout(function(){i.media=n||"all"})}

loadCSS('http://fonts.googleapis.com/css?family=Lato');
loadCSS('https://cdnjs.cloudflare.com/ajax/libs/octicons/3.1.0/octicons.min.css');
