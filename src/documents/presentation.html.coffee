---
layout: 'blank'
title: 'Presentation' 
---

h1 'Presentation'

div '#impress', ->
  div '#slide1.step.slide', 'data-x':"-1000", 'data-y': "-1500", ->
    text 'slide 1'
  div '#slide2.step.slide', 'data-x':"0", 'data-y': "-1500", ->
    text 'slide 2'
  div '#slide3.step.slide', 'data-x':"1000", 'data-y': "-1500", ->
    text 'slide 3'
  div '#slide4.step.slide', 'data-x':"0", 'data-y': "0", 'data-scale': "2", ->
    text 'slide 4'
  div '#slide5.step.slide', 'data-x':"850", 'data-y': "3000", 'data-rotate': "90", ->
    text 'slide 5'
