doctype 5
html lang: 'en', ->
  head ->
    meta charset: 'utf-8'
    title @document.title
    meta name:"viewport", content:"width=device-width, initial-scale=1.0"
    link rel: 'stylesheet', href: @document.css
    
    link href: 'http://fonts.googleapis.com/css?family=Pinyon+Script', rel: 'stylesheet', type:'text/css'
    #link href: 'http://kevinbatdorf.github.io/liquidslider/css/liquid-slider.css', rel: 'stylesheet', type:'text/css'
    
    if false
      style '''
      #sequence {
          border: black solid 3px;
          /*height: 500px;
          margin: 10px auto;*/
          position: relative; /* required */
          width: 600px;
      }
      #sequence > .sequence-canvas > li > * {  /* required */
          position: absolute;
      }
      #sequence > .sequence-canvas { /* required */
       height: 100%; 
        width: 100%;
      }
      #sequence > .sequence-canvas > li { /* required */
          position: absolute;
          width: 100%;
          height: 100%;
          z-index: 1;
          list-style: none; 
          /*background-color: #DDDDDD;*/
      }    
      '''
    
    
  body ->

    text @content
    
    if false
      script src: "http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"
      script src: "http://kevinbatdorf.github.io/liquidslider/js/jquery.easing.1.3.js"
      script src: "http://kevinbatdorf.github.io/liquidslider/js/jquery.touchSwipe.min.js"
      script src: "http://kevinbatdorf.github.io/liquidslider/js/jquery.liquid-slider.js"
      coffeescript ->
        $('.liquid-slider').liquidSlider();