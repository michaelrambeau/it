Web CMS such as Wordpress are great to create a web site.
But you need a web server with PHP and a database, that you have to configure.
Deployments from local environment to production can be painful.
So if you need a simple web site to be runned quickly, it is not the best solution maybe.

In the other hand, you can create static HTML pages but you will have to copy-paste common parts such as headers, menus and so on.

Since I do not really need "dynamic" pages, a good compromise could be a site generator:  a tool that creates static html pages each time the content is updated.
First I heard about [Jekyll](http://jekyllrb.com/), used by Bootstrap team for their documentation and for their blog.
It looks really nice but it is powered by Ruby on rails.
Then I found docpad, based on node.js, that was already on my computer.

docpad can generate HTML pages from data saved as simple text files, no database is needed.

Docpad is a very flexible system: you create content using html, markdown, coffeescript or any other language and docpage generates the HTML pages.