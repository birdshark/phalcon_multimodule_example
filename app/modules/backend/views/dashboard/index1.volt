<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--360浏览器优先以webkit内核解析-->
    <title>欢迎页面</title>
    {% include "public/style.volt" %}
</head>

<body class="gray-bg">

    <div class="row  border-bottom white-bg dashboard-header">
        <div class="col-sm-12">
            <blockquote class="text-warning" style="font-size:14px">
                欢迎来到这里
            </blockquote>

            <hr>
        </div>
        <div class="col-sm-5">
            <h2>
                使用须知
            </h2>
            <p>H+是一个完全响应式，基于Bootstrap3.3.5最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术，她提供了诸多的强大的可以重新组合的UI组件，并集成了最新的jQuery版本(v2.1.4)，当然，也集成了很多功能强大，用途广泛的jQuery插件，她可以用于所有的Web应用程序，如<b>网站管理后台</b>，<b>网站会员中心</b>，<b>CMS</b>，<b>CRM</b>，<b>OA</b>等等，当然，您也可以对她进行深度定制，以做出更强系统。</p>
            <p>
                <b>当前版本：</b>v4.0.0
            </p>
            <br>
        </div>
        <div class="col-sm-4">
            <h4>H+具有以下特点：</h4>
            <ol>
                <li>完全响应式布局（支持电脑、平板、手机等所有主流设备）</li>
                <li>基于最新版本的Bootstrap 3.3.4</li>
                <li>提供3套不同风格的皮肤</li>
                <li>支持多种布局方式</li>
                <li>使用最流行的的扁平化设计</li>
                <li>提供了诸多的UI组件</li>
                <li>集成多款国内优秀插件，诚意奉献</li>
                <li>提供盒型、全宽、响应式视图模式</li>
                <li>采用HTML5 & CSS3</li>
                <li>拥有良好的代码结构</li>
                <li>更多……</li>
            </ol>
        </div>

    </div>

    <div class="wrapper wrapper-content">
        <div class="row">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>联系信息</h5>

                    </div>
                    <div class="ibox-content">
                        <p><i class="fa fa-send-o"></i> 博客：<a href="http://birdshark.github.io" target="_blank">http://birdshark.github.io</a>
                        </p>
                        <p><i class="fa fa-qq"></i> QQ：<a href="http://wpa.qq.com/msgrd?v=3&uin=917680415&site=qq&menu=yes" target="_blank">917680415</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {% include "public/script.volt" %}
    <script src="/backend/assets/js/plugins/layer/layer.min.js"></script>
    <script src="/backend/assets/js/content.min.js"></script>
</body>

</html>