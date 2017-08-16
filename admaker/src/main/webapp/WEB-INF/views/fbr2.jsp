<html lang="en"><head>
    <meta charset="utf-8">

    <title>IText tests | Fabric.js Demos</title>

    <link rel="stylesheet" href="../../css/master.css">

    <script id="twitter-wjs" src="//platform.twitter.com/widgets.js"></script><script async="" src="http://api.flattr.com/js/0.6/load.js?mode=auto"></script><script type="text/javascript" async="" src="http://www.google-analytics.com/ga.js"></script><script src="../../lib/fabric.js" data-cover=""></script>
    <!--[if lt IE 9]>
      <script src="../../lib/excanvas.js"></script>
    <![endif]-->
    <script src="../../js/master.js"></script>

  <script type="text/javascript" charset="utf-8" async="" src="https://platform.twitter.com/js/button.b731e6c82269f70f6fc53634e044a4c6.js"></script></head>
  <body class="demo">
    

<script>
(function() {

  if (document.location.hostname === 'localhost') {
    var links = document.getElementById('header').getElementsByTagName('a');
    for (var i = 0, len = links.length; i < len; i++) {
      // very retarted fix but fuck it
      links[i].href = links[i].href.replace('fabricjs.com', 'localhost:4000');
    }
  }
  else {
    var s = document.createElement('script'), t = document.getElementsByTagName('script')[0];
    s.async = true;
    s.src = 'http://api.flattr.com/js/0.6/load.js?mode=auto';
    t.parentNode.insertBefore(s, t);

    !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
  }
})();
</script>


    <div id="bd-wrapper">
      

      <style>
  @font-face {
    font-family: 'Lobster';
    font-style: normal;
    font-weight: 400;
    src: local('Lobster'), url(http://themes.googleusercontent.com/static/fonts/lobster/v5/NIaFDq6p6eLpSvtV2DTNDQLUuEpTyoUstqEm5AMlJo4.woff) format('woff');
  }
  .example {
    margin-bottom: 10px;
    margin-right: 10px;
    display: inline-block;
    vertical-align: top;
  }
  h3 {
    font-family: Helvetica, sans-serif;
    font-weight: normal;
    text-align: center;
    background-color: #444;
    color: #fff;
    margin-top: 0;
    margin-bottom: 0;
    padding: 3px 0;
  }
  select { font-size: 16px; }
</style>

<p>
  <button id="bold">Bold</button>
  <button id="italic">Italic</button>
  <button id="underline">Underline</button>
  <button id="line-through">Line-through</button>
  <input type="color" id="color">
  <input type="color" id="bg-color">
  <input type="range" min="5" max="150" value="40" id="size">
</p>


<div class="example">
  <h3>Styled &amp; with bg color</h3>
  <div class="canvas-container" style="width: 250px; height: 300px; position: relative; user-select: none;"><canvas id="c3" width="312.5" height="375" style="border: 1px solid rgb(204, 204, 204); position: absolute; width: 250px; height: 300px; left: 0px; top: 0px; touch-action: none; user-select: none;" class="lower-canvas"></canvas><canvas class="upper-canvas " width="250" height="300" style="border: 1px solid rgb(204, 204, 204); position: absolute; width: 250px; height: 300px; left: 0px; top: 0px; touch-action: none; user-select: none; cursor: text;"></canvas></div>
<a href="#"><code style="display: block">toSVG()</code></a></div>


















<script src="/js/itext.js" charset="utf-8"></script>
<script>
  (function() {
    var canvases = document.getElementsByClassName('canvas-container');
    for (var i = 0, len = canvases.length; i < len; i++) {

      var linkEl = document.createElement('a');
      linkEl.href = '#';
      linkEl.innerHTML = '<code style="display: block">toSVG()</code>';
      canvases[i].parentNode.appendChild(linkEl);

      linkEl.onclick = (function(container) {
        return function() {
          window.open('data:image/svg+xml;charset=utf-8,' +
            encodeURIComponent(container.canvas.toSVG()));

          return false;
        };
      })(canvases[i]);
    }
  })();
</script>

    </div>

    <script>
(function() {
  fabric.util.addListener(fabric.window, 'load', function() {
    var canvas = this.__canvas || this.canvas,
        canvases = this.__canvases || this.canvases;

    canvas && canvas.calcOffset && canvas.calcOffset();

    if (canvases && canvases.length) {
      for (var i = 0, len = canvases.length; i < len; i++) {
        canvases[i].calcOffset();
      }
    }
  });
})();
</script>

  

<iframe id="rufous-sandbox" scrolling="no" frameborder="0" allowtransparency="true" allowfullscreen="true" style="position: absolute; visibility: hidden; display: none; width: 0px; height: 0px; padding: 0px; border: none;" title="Twitter analytics iframe"></iframe><textarea autocapitalize="off" style="white-space: nowrap; position: absolute; top: 1637.02px; left: 1579.26px; opacity: 0; width: 1px; height: 1px; z-index: -999;"></textarea><textarea autocapitalize="off" style="white-space: nowrap; position: absolute; top: 341.762px; left: 134px; opacity: 0; width: 1px; height: 1px; z-index: -999;"></textarea></body></html>