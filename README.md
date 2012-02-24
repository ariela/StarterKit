# StarterKit

[Bootstrap](http://twitter.github.com/bootstrap/ "Bootstrap, from Twitter")や[HTML KickStart](http://www.99lime.com/ "HTML KickStart - Ultra–Lean HTML Building Blocks for Rapid Website Production - KickStart your Website Production - 99Lime.com")ほどの機能が必要ない場合に使用するために作っているHTML作成キット。

## SCSS Modules

### webfont-web-icon-fonts
[Web Icon Fonts](http://webiconfonts.appspot.com/ "Web Icon Fonts | chibatch.jp")を使用する場合のモジュール

### webfont-icomoon

### webfont-icomoon-social

## jQuery Plugins

### fonticon
アイコンをWebFontで表示する場合に使用できるプラグイン。
data-icon要素に指定した文字を要素の子要素として追加する。
検索等にアイコン用文字を表示したくない場合に利用する。

#### 呼び出し
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.fonticon.js"></script>
	<script type="text/javascript">$(document).ready(function() {
        $('.icon').fonticon();
	});</script>

    <i class="icon" data-icon="i"></i>

### midflow
指定した要素が画面上部より上に行くとクラスを追加するプラグイン。

#### 呼び出し

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.midflow.js"></script>
	<script type="text/javascript">$(document).ready(function() {
        $('.nav').midflow({'fixed_class':'navfix'});
	});</script>

    <div class="nav">
        <ul>
            <li class="active"><a href="#">menu1</a></li>
            <li><a href="#">menu2</a></li>
            <li><a href="#">menu3</a></li>
            <li><a href="#">menu4</a></li>
            <li><a href="#">menu5</a></li>
        </ul>
    </div>