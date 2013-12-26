---
---
### Why use a Javascript framework ?

jQuery is a great library that makes DOM manipulation so easy.
For many of us, we cannot imagine coding Javscript without jQuery.

But when you need to build a complex application (following the MVC pattern), you might need a more strctured approach.

> When working on a web application that involves a lot of JavaScript, one of the first things you learn is to stop tying your data to the DOM. It's all too easy to create JavaScript applications that end up as tangled piles of jQuery selectors and callbacks, all trying frantically to keep data in sync between the HTML UI, your JavaScript logic, and the database on your server. For rich client-side applications, a more structured approach is often helpful.
<small>From [backbonejs.org](http://backbonejs.org/) introduction</small>

### Why Angular ?

Several Javascript frameworks, such as Backbone and Angular, became popular recently.
Check this web site to see the main "contenders" in action: [www.todomvc.com](http://www.todomvc.com/)

All these frameworks have the hability to connect dynamically the page DOM elements with data.

Angular is different because it relies on a **specific HTML markup**.

By using Angular specific attributes (such as "ng-model", "ng-controller, "ng-repeat") the HTML page becomes dynamic.
You can also bind events directly adding "ng-click" to a button or "ng-change" to a combox.
It can look like "old-fashioned" but it is very different from inline code such as onclick="myFunction()" because a "scope" has been provided.

With Angular, you don't need to include any templating system (like [Handlebars](http://handlebarsjs.com/)), the templating system is already "in the box".

As a result, using Angular is for me the fastest way to create a "dynamic" page: a page that reacts (showing/hiding blocks, updating styles...) with user's interaction.
Of course, there is a learning curve if you want to create more sophisticad applications, you have to enter a "new world" and forget old practices.
But it is worth the try! 