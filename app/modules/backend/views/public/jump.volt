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
    <h1><i class="fa fa-{{ flag }}"></i></h1>
    <h3 class="font-bold">{{ message }}</h3>
    <div>系统将在<span id="countDownSec">5</span>秒后自动跳转,如果不想等待,直接 <a id="href" href="{{ jumpUrl|default('') }}">点击这里</a></div>
</div>
{% include "public/script.volt" %}
<script>
    (function(){
        var wait = document.getElementById('countDownSec'),href = document.getElementById('href').href;
        var interval = setInterval(function(){
            var time = --wait.innerHTML;
            if(time <= 0) {
                location.href = href;
                clearInterval(interval);
            };
        }, 1000);
    })();
</script>
</body>

</html>