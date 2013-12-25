---
layout: 'blank'
---
doctype 5
html ->
  head ->
    meta 'charset': "utf-8">
    meta 'content':"width=device-width, initial-scale=1.0", 'name': "viewport"
    link rel:'stylesheet', href:"//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.css"  
  body ->
    h1 'blank document'
    
    span '.visible-xs','visible-xs'
    span '.visible-sm','visible-sm'
    span '.visible-md','visible-md'
    span '.visible-lg','visible-lg'
    
    p '.text-center', ->
      button '.btn.btn-primary.btn-lg', ->
        span '.glyphicon.glyphicon-envelope',''
        text 'Contact me'
