<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>后台 - 注册</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="/backend/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/backend/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="/backend/assets/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/backend/assets/css/animate.min.css" rel="stylesheet">
    <link href="/backend/assets/css/style.min.css" rel="stylesheet">
    <style>
        .loginscreen.middle-box{
            width: auto;
        }
    </style>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">Bird</h1>
        </div>
        <h3>欢迎注册</h3>
        <p>创建一个新账户</p>
        <form class="m-t" role="form" action="login">
            <div class="form-group">
                <input type="email" class="form-control" name="email" placeholder="请输入用户名" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" placeholder="请输入密码" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="confirm_password" placeholder="请再次输入密码" required="">
            </div>
            <div class="form-group text-left">
                <div class="checkbox i-checks">
                    <label class="no-padding"><input type="checkbox"><i></i>我同意注册协议</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">注 册</button>

            <p class="text-muted text-center">
                <small>已经有账户了？</small>
                <a href="{{ url('index') }}">点此登录</a>
            </p>

        </form>
    </div>
</div>
<script src="/backend/assets/js/jquery.min.js"></script>
<script src="/backend/assets/js/bootstrap.min.js"></script>
<script src="/backend/assets/js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function () {
        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
    });
</script>
</body>

</html>