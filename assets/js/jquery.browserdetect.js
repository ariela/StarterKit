(function() {
  var $;

  $ = jQuery;

  /**
  * ブラウザのバージョンを検知し、htmlタグのクラスに設定する
  *
  * options
  *   screens: {Array} 検出する画面サイズの一覧
  *
  * @param {Object} options オプション情報
  */

  $.browserdetect = function(options) {
    var num, setScreenSize, setTilt, target, ua, version, _html, _i, _len, _win;
    options = $.extend({
      'screens': [320, 480, 640, 768, 960, 1024, 1280, 1440, 1680, 1920]
    }, options);
    _win = $(window);
    _html = $('html');
    /*
      * 画面の方向をhtmlタグのクラスに設定する
    */
    setTilt = function() {
      var orientation;
      orientation = window.orientation;
      if (orientation === 0) {
        _html.addClass('portrait');
        _html.removeClass('landscape');
      } else {
        _html.addClass('landscape');
        _html.removeClass('portrait');
      }
    };
    /*
      * スクリーンサイズをhtmlタグのクラスに設定する
    */
    setScreenSize = function() {
      var size, target, w, _i, _len, _ref;
      w = window.outerWidth || html.clientWidth;
      target = 0;
      _ref = options.screens;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        size = _ref[_i];
        _html.removeClass('w-' + size);
        if (w > size) _html.addClass('w-' + size);
      }
    };
    ua = navigator.userAgent.toLowerCase();
    ua = /(iphone|ipad).+os ([\d+])/.exec(ua) || /(android) (\d+(\.\d+)?)/.exec(ua) || /(webkit)[ \/]([\w.]+)/.exec(ua) || /(opera)(?:.*version)?[ \/]([\w.]+)/.exec(ua) || /(msie) ([\w.]+)/.exec(ua) || !/compatible/.test(ua) && /(mozilla)(?:.*? rv:([\w.]+))?/.exec(ua) || [];
    _html.addClass(ua[1]);
    setScreenSize();
    _win.resize(setScreenSize);
    if (ua[1] === 'iphone' || ua[1] === 'ipad') {
      _html.addClass('smartphone');
      _html.addClass('ios');
      setTilt();
      _win.on('orientationchange', setTilt);
    } else if (ua[1] === 'android') {
      _html.addClass('smartphone');
      _html.addClass('android');
      setTilt();
      _win.resize(setTilt);
    } else if (ua[1] === 'msie') {
      ua[1] = 'ie';
      ua[2] = document.documentMode || ua[2];
      _html.addClass('ie' + parseFloat(ua[2]));
      target = (function() {
        var _results;
        _results = [];
        for (num = 4; num <= 11; num++) {
          _results.push(num);
        }
        return _results;
      })();
      for (_i = 0, _len = target.length; _i < _len; _i++) {
        version = target[_i];
        if (parseFloat(ua[2]) < version) _html.addClass('lt-ie' + version);
      }
    } else {
      _html.addClass(ua[1]);
    }
  };

}).call(this);
