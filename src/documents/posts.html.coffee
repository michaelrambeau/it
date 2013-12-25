---
layout: "default"
title: "Posts"
description: "A blog to share Michael Rambeau's experience as an IT engineer in Japan"
menuId: "POSTS"
className: 'posts'
---

#require('underscore')

docs = @getCollection('documents').findAllLive({relativeOutDirPath:'posts',active:true},[date:-1]).toJSON()
posts = []
#for document in @getCollection('documents').toJSON()

#text nodedump(docs[0])

for document in docs
	posts.push(document)
    
p 'Some posts to share my experience as an IT engineer in Japan'

div '.list-group', ->
  for doc in docs
    a '.list-group-item', href: @getPath(doc.url), ->
      div '.row', ->
        div '.col-md-7', ->
          div '.post-date.pull-left', ->
            div '.month', @getMonth doc.date
            div '.day', @getDate doc.date
          h4 '.list-group-item-heading', doc.title
          p '.list-group-item-text', ->
            p '.post-introduction', doc.description
            if doc.introduction
              p -> doc.introduction
            #postContent = doc.contentRenderedWithoutLayouts
        
        div '.col-md-5', ->
          if doc.image
            img '.img-responsive.img-thumbnail2', src: @getPath('img/blog/'+doc.image)
          div '.clearfix', ''

getIntroduction = (doc) =>
 doc.title