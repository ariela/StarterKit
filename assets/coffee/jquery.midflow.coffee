# jQueryを利用する
$ = jQuery

# 指定した要素の文字情報を表示出来るようにする。

###*
* 指定した要素をスクロールに応じて途中から追従を行わせる。class指定でposition: fixedにする。
*
* options
*   fixed_class: {String} 追従モード時のクラス
*   fixed_top_pos: {Integer} 追従モードに入る要素の位置の修正値（負数の場合は減算される）
*
* @param {Object} options オプション情報
###
$.fn.midflow = (options) ->

  # 設定値とデフォルト設定値を結合
  options = $.extend(
    'fixed_class': 'nav_fixed'
    'fixed_top_pos': 0
  , options)

  # 各要素に処理を行う
  @each () ->
    _win  = $(window)
    _this = $(this)
    isFixed = false

    navTop = _this.length && _this.offset().top + options.fixed_top_pos

    handlerScroll = () ->
      scrollTop = _win.scrollTop()

      if isFixed == false && scrollTop > navTop
        isFixed = true
        _this.addClass options.fixed_class
      else if isFixed == true && scrollTop <= navTop
        isFixed = false
        _this.removeClass options.fixed_class

      return

    handlerScroll()
    _win.on('scroll', handlerScroll)

    return