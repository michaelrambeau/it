---
layout: 'presentation-with-impress'
title: 'Rakuten - Michael Rambeau' 
css: 'rakuten.css'
---
angle = 0
y0 = -900
imgRoot = 'http://michaelrambeau.com/it/img'

header ->
  div '.right', ->
    a href: 'http://michaelrambeau.com', 'michaelrambeau.com'
    text ' 2014年1月'
  a '.start',href:'#/overview', 'スタートに戻る'    
  h1 ->
    text 'Michael' 
    span '.initiale', 'R'
    span '.normal', 'ambeau'
    span 'プレゼンテーション'
    
  
    

div '#impress', ->

  div '#overview.step','data-x':"0", 'data-y': "-500", 'data-scale': '2.5'
  
  div '#slide1.step.slide', 'data-x':"-1000", 'data-y': y0, 'data-rotate-y': angle, ->
    img '.right', src: imgRoot + '/photos/identite.jpg'
    h2 'ミカエル　ランボー'
    text 'ウエブ開発エンジニア 36歳'
    div 'michael.rambeau@gmail.com'
    
    h3 '言語'
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
        
  div '#slide2.step.slide', 'data-x':"0", 'data-y': y0,'data-z':"0",'data-rotate-y': angle, 'data-rotate': 0, ->
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

  div '#slide3.step.slide', 'data-x':"1000", 'data-y': y0, 'data-rotate-y':angle, ->
    h2 'プロフィールの長所'
    ul ->
      li '実用的なサイトのプログラミング。'
      li 'プロトタイプを作成し、素早く要望に応えます。'
      li 'レスポンシブWebデザイン　GitHub など　web開発の最新の動向に敏感です。'
    
    img src: imgRoot + '/responsive-design.png?v=1', width: '95%'
     
  div '#slide4.step.slide', 'data-x': "-1000", 'data-y': "-100", 'data-rotate-y':angle, ->
    h2 '経歴 - 2013年'
    img '.left',src: imgRoot + '/screenshots/imt2/brastelremit2-home.png', width: '300'
    div '.project', ->
      a 'href','http://michaelrambeau.com/apps/brastelremit/','Brastel Remit レスポンシブWebデザイン'
      div '.techno', '開発環境'
      ul ->
        li 'Bootstrap'
        li 'Docpad'
        li 'CoffeeScript / CoffeeKup'
    
  div '#slide5.step.slide', 'data-x':"0", 'data-y': "-100", 'data-scale': "1",'data-rotate-y':angle, ->
    h2 '経歴 - 2012年'    
    img '.left',src: imgRoot + '/screenshots/imt1/brastelremit1-home-big.jpg', width: '300'
    div '.project', ->
      a 'href','http://brastelremit.jp/','Brastel Remit web サイト'
      div '.techno', '開発環境'
      ul ->
        li 'XML - XSL'
        li 'jQuery'
 
  
  div '#slide6.step.slide', 'data-x':"1000", 'data-y': "-100", 'data-rotate': "0",'data-rotate-y':angle, ->
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
div '.hint', 'Use a spacebar or arrow keys to navigate'
