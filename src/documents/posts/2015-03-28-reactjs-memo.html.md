--- cson
layout: 'post'
title: 'ReactJS memo'
description: 'ReactJS Cheatsheet. JSX Tips and tricks'
image: '2015-03-reactjs-memo.jpg'
hasPicture: false
date: '2015-03-28'
active: true
comments: true
homepage: true
syntaxHighlighter: true
homepage: true
---

[React](http://facebook.github.io/react/) is a JavaScript library designed to create dynamic UI components.  
It has become very popular recently, a real eco-system, built around React is growing very fast.  
Here are some tips and tricks to remember when working with React.

## Concepts

### state VS. props

* State and Props are component data.
* A component can only change its own **state**, using `this.setState()` method, not its props.
* If the state changes, the component and all children are automatically updated by React that runs the render() function.

### Component example

A simple component with one property (title) and one state (counter). The button updates the counter state using `setState` method.

```
var MyComponent = React.createClass({

  getDefaultProps: function() {
    return {
      title: 'My defaut title'
    };
  },

  getInitialState: function() {
    return {
      counter: 0
    };
  },

  onClick: function () {
    this.setState({
      counter: this.state.counter + 1
    });
  },

  render: function() {
    return (
      <div>
        { this.props.title }
        { this.state.counter }
        <button onClick={ this.onClick }>INCREMENT</button>
      </div>
    );
  }

});
```

### Add a component to the HTML page

The following JavaScript code includes a component inside a DOM element, passing initial properties using the options variable.

```
var options = {
  title: 'My component'
};
React.render(
  React.createElement(MyComponent, options),
  document.getElementById('app')
);
```

### Nested components

Inside a component, sub-components can be used.
Any type of data can be passed to a component: arrays, objects, functions... don't forget the curly brackets `{ }` to pass data.

```
<MySubComponent items={ ['A', 'B'] } onSave={ saveFunction } />
```

## JSX: tips and tricks

JSX syntax is a mix of JavaScript and HTML. The [JSX online compiler](https://facebook.github.io/react/jsx-compiler.html) can be used to find compilation issues.

### Attributes

HTML attributes use JS syntax (camelCase).
For example: use **className**=... instead of class=...

```
<button className="btn btn-default">
```

### IF

```
{ term == 'yearly' && (
  <p>10%値引き<p>
) }
```

### IF ELSE


```
{ term == 'monthly' ? (
  <span>1ヶ月</span>
) : (
  <span>12ヶ月</span>
)}
```

Compact version

```
<span>{ term == 'monthly' ? '1ヶ月' : '12ヶ月' }</span>
```

### Loops

Loop through items of an array using the Array.map() function and a callback function

```
render: function() {
  var menuItem = function(i) {
    return(
      <li>
        <span>{'STEP' + i }</span>
      </li>
    );
  };

  return(
　  <ul>
  　  { [1, 2, 3].map(menuItem) }
　  </ul>
  );
}
```

### Inline style

Style property uses JSON syntax.

```
style={{ float: 'right', padding: 10 }}
```

### Working with jQuery plugins.
Use the componentDidMount event to initialise jQuery plugins.

```
componentDidMount: function () {
  var el = this.getDOMNode();
  var $el = $(el);
  var $form = $el.find('form');
  $form.mySuperPlugin();
}
```

### White spaces

White spaces are stripped. Use `{' '}`to restore white spaces between tags like (between 2 buttons for example).

```
<button>Cancel</button>
{' '}
<button>OK</button>
```

### Tag syntax /JSX errors

```
<body>
  <br>
  <MyApp>
</body>

=> Error "Expected corresponding XJS closing tag for MyApp"
```

Don't forget to close all tags! (components and html tags, xhtml syntax)

```
<body>
  <br />
  <MyApp />
</body>

=> OK!
```

### Event handlers

#### 1. Normal pattern

```
  onDeleteAll: function (event) {

  },
  render: function() {
    return (
     <button onClick={ this.onDeleteAll }>Delete All</button>
    );
  }
```

#### 2. How to pass extra data

In event handlers (onClick=...),  use .bind(null, myData) to pass data to the event handler.

```
  onEmailAction: function (email, actionCode, event) {

  },
  render: function() {
    return (
      <button
        onClick={ this.onEmailAction.bind(null, email, 'MARK_AS_READ') }>
        Mark as read
      </button>
    );
  }
```



### [Mixins](http://facebook.github.io/react/docs/reusable-components.html#mixins)

Code can be shared between components using mixins.

```
var EmailFilterList = React.createClass({
  mixins: [FilterListEventMixin],
  render: function() {
  ...

```

Note about: in the JavsScript compiled file, mixins have to be loaded **before** the components that use the mixins.

### [Namespaced components](http://facebook.github.io/react/docs/jsx-in-depth.html#namespaced-components)

Sub-components can be attributes of a main component.
For example, a section used to create an accordion has 2 sub-components: title and body:

```
var MySection = React.createClass({...});
MySection.Title = React.createClass({...});
MySection.Body = React.createClass({...});

```

```
<MySection>
  <MySection.Title>My title</MySection.Title>
  <MySection.Body>
    ...
  </MySection.Body>
</MySection>
```

### [Property validation](http://facebook.github.io/react/docs/reusable-components.html#prop-validation)

Use `propTypes` to specify property types: array, function, string...

```
React.createClass({
  propTypes: {
    myOptionalArray: React.PropTypes.array
  }
  ...
```

Add `.isRequired` to make the property required.

```
  myRequiredArray: React.PropTypes.array.isRequired
```

Available types:

* React.PropTypes.array
* React.PropTypes.bool
* React.PropTypes.func
* React.PropTypes.object
* React.PropTypes.number,
* React.PropTypes.string
* React.PropTypes.element (React component)
* React.PropTypes.instanceOf(MyClass) (an instance of a class)
* ...


## Tools

###Chrome React Extension

The React Extension for Chrome browser enables to see all React componens in a web page.

You can check the state and the props, edit them live and see how the components "react" to the changes. That is really convenient for debugging !

### Atom JSX package

The [Atom JSX Package](https://github.com/orktes/atom-react) for Atom IDE offers nice features:

* JSX linter
* shortcuts
* HTML to JSX converter

## Best practices

* Use state only in the top level and pass data to from parent to children using props.
* Keep business logic outside the component, using "model" (see [TodoMCV example on Github](https://github.com/tastejs/todomvc/tree/gh-pages/examples/react))
* Document component properties using propTypes.

