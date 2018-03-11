<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    {% include "public/style.volt" %}
</head>

<body class="gray-bg">
<div class="middle-box text-center animated fadeInDown">
    <h1><i class="fa fa-{{ flag  }}"></i></h1>
    <h3 class="font-bold">{{ message  }}</h3>
    <div>系统将在<span id="countDownSec">{{ $second or 5 }}</span>秒后自动关闭,如果不想等待,直接 <a id="href" href="javascript:close{{tab}}Frame()">点击这里</a></div>
</div>
{% include "public/script.volt" %}
<script>
    (function(){
        var wait = document.getElementById('countDownSec');
        var interval = setInterval(function(){
            var time = --wait.innerHTML;
            if(time == 0) {
                close{{tab}}Frame();
                clearInterval(interval);
            };
        }, 1000);
    })();
    var closeWinFrame = function(){
        parent.$('iframe').each(function (index,el) {
            if($(el).css('display') == 'inline'){
                parent.frames[index].reloadTable();
            }
        });
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
    var closeCurFrame = function () {
        var iframe_source = '';
        parent.$('.J_menuTab').each(function(){
            if($(this).hasClass('active')){
                iframe_source = $(this).attr('data-id');
                $(this).remove();
            }
        });
        parent.$('.J_menuTab').first().addClass('active');
        parent.$('.J_iframe').first().show();
        parent.$('.J_iframe[data-id="' + iframe_source + '"]').remove();
    }
</script>
</body>

</html>