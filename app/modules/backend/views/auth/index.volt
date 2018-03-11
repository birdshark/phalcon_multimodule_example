<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台 - 登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="/backend/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/backend/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="/backend/assets/css/animate.min.css" rel="stylesheet">
    <link href="/backend/assets/css/style.min.css" rel="stylesheet">
    <style>
        .loginscreen.middle-box{
            width: auto;
        }
    </style>
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>
</head>

<body class="gray-bg">
<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">Bird</h1>
        </div>
        <h3>欢迎使用后台</h3>

        <form class="m-t" role="form" action="{{ url('/backend/auth/start') }}" method="post">
            <div class="form-group">
                <input type="email" name="email" class="form-control" placeholder="用户名" required="">
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="密码" required="">
            </div>
            <input type="hidden" name="remember">
            <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
            <p class="text-muted text-center"> <a href="{{ url('forgot') }}"><small>忘记密码了？</small></a> | <a href="{{ url('register') }}">注册一个新账号</a>
            </p>
        </form>
    </div>
</div>
<script src="/backend/assets/js/jquery.min.js"></script>
<script src="/backend/assets/js/bootstrap.min.js"></script>
</body>
</html>