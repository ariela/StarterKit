# jQueryを利用する
$ = jQuery

###*
* ブラウザのバージョンを検知し、htmlタグのクラスに設定する
*
* options
*   screens: {Array} 検出する画面サイズの一覧
*
* @param {Object} options オプション情報
###
$.browserdetect = (options) ->

  # 設定値とデフォルト設定値を結合
  options = $.extend(
    'screens': [320, 480, 640, 768, 960, 1024, 1280, 1440, 1680, 1920]
  , options)

  _win = $(window)
  _html = $('html')

  ###
  * 画面の方向をhtmlタグのクラスに設定する
  ###
  setTilt = () ->
    orientation = window.orientation
    if orientation == 0
      _html.addClass 'portrait'
      _html.removeClass 'landscape'
    else
      _html.addClass 'landscape'
      _html.removeClass 'portrait'

    return

  ###
  * スクリーンサイズをhtmlタグのクラスに設定する
  ###
  setScreenSize = () ->
    w = window.outerWidth || html.clientWidth
    target = 0

    for size in options.screens
      _html.removeClass 'w-' + size
      _html.addClass 'w-' + size if w > size

    return

  # UA検出
  ua = navigator.userAgent.toLowerCase()
  ua = /(iphone|ipad).+os ([\d+])/.exec(ua) ||
       /(android) (\d+(\.\d+)?)/.exec(ua) ||
       /(webkit)[ \/]([\w.]+)/.exec(ua) ||
       /(opera)(?:.*version)?[ \/]([\w.]+)/.exec(ua) ||
       /(msie) ([\w.]+)/.exec(ua) ||
       !/compatible/.test( ua ) && /(mozilla)(?:.*? rv:([\w.]+))?/.exec( ua ) ||
       [];
  _html.addClass ua[1]

  # 画面サイズ検出
  setScreenSize()
  _win.resize setScreenSize
  
  # ブラウザ情報検出
  if ua[1] == 'iphone' || ua[1] == 'ipad'
    _html.addClass 'smartphone'
    _html.addClass 'ios'
    setTilt()
    _win.on('orientationchange', setTilt)

  else if ua[1] == 'android'
    _html.addClass 'smartphone'
    _html.addClass 'android'
    setTilt();
    _win.resize setTilt
  else if ua[1] == 'msie'
    ua[1] = 'ie'
    ua[2] = document.documentMode || ua[2]

    _html.addClass 'ie' + parseFloat(ua[2])

    target = (num for num in [4..11])

    for version in target
      _html.addClass 'lt-ie' + version if parseFloat(ua[2]) < version

  else
      _html.addClass ua[1]

  return

