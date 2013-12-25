header '.navbar.navbar-default.navbar-fixed-top.navbar-inverse', ->
  div '.container', ->
    nav role:'navigation', ->
      div '.navbar-header', ->
        button '.navbar-toggle', 'data-toggle':'collapse','data-target':'#my-menu', ->
          span '.icon-bar',''
          span '.icon-bar',''
          span '.icon-bar',''
        a '.navbar-brand.logo-mike', href:'/', 'michaelrambeau.com', ->
          img src: '/img/mr.png', width:"200"
      div '#my-menu.collapse.navbar-collapse', ->
        ul '.nav.navbar-nav', ->
          li class: (if @document.menuId == 'HOME' then 'active' else ''), ->
            a href: '/', 'home'
          li class: (if @document.menuId == 'POSTS' then 'active' else ''),->
            a href: '/posts', 'posts'
          li class: (if @document.menuId == 'APPS' then 'active' else ''),->
            a href: '/apps', 'apps'
          li class: (if @document.menuId == 'EXPERIENCE' then 'active' else ''),->
            a href: '/experience', 'experience'
          li class: (if @document.menuId == 'ABOUT' then 'active' else ''),->
            a href: '/about', 'about'
    