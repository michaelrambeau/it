---
layout: 'lilly'
title: 'イーライリリー - Michael Rambeau' 
css: 'lilly.css'
---
swipejs = true
sequencejs = false
content = [
  () ->
    img '.right', src: imgRoot + '/photos/identite.jpg'
    h2 'ミカエル　ランボー'
    text 'ウエブ開発エンジニア 36歳'
    div 'michael.rambeau@gmail.com'
    ul '.languages', ->
      li ->
        img '.flag', src: imgRoot + '/flags/jp.png'      
        text '日本語　日常会話レベル JLPT N3'
      li ->
        img '.flag', src: imgRoot + '/flags/en.png'         
        text '英語　ビジネスレベル TOEIC 960 pts'
      li ->
        img '.flag', src: imgRoot + '/flags/fr.png'
        text 'フランス語　ネイティブ'   
,
  () -> 
    h2 '資格'
    ul ->
      li 'HTML5, CSS3, LESS, Stylus'
      li 'Javascript, jQuery, AngularJS'
      li 'レスポンシブWebデザイン, Bootstrap'
      li 'Docpad, CoffeeScript, CoffeeKup'
      li 'PHP, CakePHP, node.js, XML, XSL'
    div '.logos', ->
      img 'src': imgRoot + '/logos/html5.png'
      img 'src': imgRoot + '/logos/nodejs.png'
      img 'src': imgRoot + '/logos/angularjs.png', 'width': 60
      img 'src': imgRoot + '/logos/coffeescript.png' 
,
  () ->
    h2 'プロフィールの長所'
    ul ->
      li '実用的なサイトのプログラミング。'
      li 'プロトタイプを作成し、素早く要望に応えます。'
      li 'レスポンシブWebデザイン　GitHub など　web開発の最新の動向に敏感です。'

    img '.img-responsive', src: imgRoot + '/responsive-design.png?v=1'  
,
  () ->
    h2 '経歴 - 2013年'
    img '.left',src: imgRoot + '/screenshots/imt2/brastelremit2-home.png', width: '120'
    div '.project', ->
      a 'href':'http://michaelrambeau.com/apps/brastelremit/','Brastel Remit レスポンシブWebデザイン'
      div '.techno', '開発環境'
      ul ->
        li 'Bootstrap'
        li 'Docpad'
        li 'CoffeeScript / CoffeeKup'   
,
  () ->
    h2 '経歴 - 2012年'    
    img '.left',src: imgRoot + '/screenshots/imt1/brastelremit1-home-big.jpg', width: '200'
    div '.project', ->
      a 'href':'http://brastelremit.jp/','Brastel Remit web サイト'
      div '.techno', '開発環境'
      ul ->
        li 'XML - XSL'
        li 'jQuery'    
,
  () ->
    h2 '職歴'
    ul ->
      li '''
        2011年～現在 大阪 <br/>
        BrastelRemit webサイト担当者 海外送金サービス
      '''
      li '''
        2010年～2011年 大阪 <br/>
        フリーランス web開発
      '''
      li '''
        2004年～2010年 フランス・トゥールーズ <br/>
        Lotus Notes - Domino イントラネット開発
      '''
      li '''
        2001年～2004年 フランス・パリ <br/>
        Lotus Notes開発
      '''
]    

imgRoot = 'http://michaelrambeau.com/it/img'

#required for sticky footer
div '#wrapper', ->
  div '#header', ->
    div '.content', ->
      h1 'Michael Rambeau'    
        
  div '.container.main', ->
  
    div '.picture',  ->
    
      a '.english-version',href:'http://michaelrambeau.com/it', 'English version'
      div '.slider-container', ->

        if swipejs is true
          div '#slider1.swipe', ->
            div '.swipe-wrap', -> 
              for block in content
                div '', ->
                  div '.slide', ->
                    div '.arrow.previous', '&laquo;'
                    div '.arrow.next', '&raquo;'
                    block()

        if sequencejs is true
          div '#sequence', ->
            ul '.sequence-canvas', ->
              for block in content
                li  ->
                  div '.slide', ->
                    block()



      div '.nav', ->
        div '.previous.arrow-left.arrow', ->
          a href: '#', ''
        ul ->
          li ->
            a '.current', href: '#0', 'ホーム'
          li ->
            a href: '#1', '資格'
          li ->
            a href: '#2', 'プロフィールの長所'
          li ->
            a href: '#3', '経歴 - 2013年'
          li ->
            a href: '#4', '経歴 - 2012年'
          li ->
            a href: '#5', '職歴'
        div '.next.arrow-right.arrow', ->
          a href: '#', '' 
 
#br()
div '#footer', ->
  div '.container', ->
    a href: 'http://michaelrambeau.com', 'michaelrambeau.com'
    text ' 2013年10月'

if swipejs is true
  script src: '//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'
  script src: 'http://bradbirdsall.github.com/Swipe/swipe.js'
  coffeescript ->
  
    callback = (index, element) ->
      console.log(index, element)
      $('.nav ul a.current').removeClass('current')
      $('.nav ul a[href=#' + index + ']').addClass('current')  
  
    window.slider = Swipe(document.getElementById('slider1'), {
      startSlide: 0,
      speed: 400,
      auto: false,
      continuous: true,
      disableScroll: false,
      stopPropagation: false
      transitionEnd: callback
    });
    #document.getElementById('next').onclick = ( -> slider.next())
    $('.previous').click(( -> slider.prev()))
    $('.next').click(( -> slider.next()))
    #document.getElementById('previous').onclick = ( -> slider.prev())
    

    
    $(document).ready((->
      $('.nav ul a').click(((event) ->
        href = $(this).attr('href');
        id = href.substr(1)
        console.log(id)
        slider.slide(id)
        event.preventDefault()
      ))
      
    ))
    
if sequencejs is true
  script src: '//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'
  script src: 'http://www.sequencejs.com/wp-content/themes/sequence/scripts/jquery.sequence-min.js'
  coffeescript ->
    options =
      autoPlay: true
      autoPlayDelay: 1000
    $(document).ready((-> sequence = $("#sequence").sequence(options).data("sequence")))