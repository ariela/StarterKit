# jQueryを利用する
$ = jQuery

# 指定した要素の文字情報を表示出来るようにする。

###*
* 指定した要素の文字情報「data-icon属性」の文字を表示出来るように子要素として追加する。
*
* options
*   定義無し
*
* @param {Object} options オプション情報
###
$.fn.fonticon = (options) ->

  # 設定値とデフォルト設定値を結合
  options = $.extend({}, options)

  # 各要素に処理を行う
  @each () ->
    _this = $(this)
    icon = _this.attr 'data-icon'
    if icon?
      _this
        .append('<span aria-hidden="true">' + icon + '</span>')
        .css
          'display': 'inline-block'
          'vertical-align': 'middle'
    return