(function() {
  var $;

  $ = jQuery;

  /**
  * 指定した要素の文字情報「data-icon属性」の文字を表示出来るように子要素として追加する。
  *
  * options
  *   定義無し
  *
  * @param {Object} options オプション情報
  */

  $.fn.fonticon = function(options) {
    options = $.extend({}, options);
    return this.each(function() {
      var icon, _this;
      _this = $(this);
      icon = _this.attr('data-icon');
      if (icon != null) {
        _this.append('<span aria-hidden="true">' + icon + '</span>').css({
          'display': 'inline-block',
          'vertical-align': 'middle'
        });
      }
    });
  };

}).call(this);
