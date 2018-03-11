<!DOCTYPE html>
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    {% include "public/seo.volt" %}
    {% include "public/style.volt" %}
    <style type="text/css">
        #side-menu .mode {
            display: block;
        }
        #side-menu .system {
            display: none;
        }
    </style>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    {% include "index/navbar.volt" %}
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        {% include "index/right/top.volt" %}
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="/backend/dashboard/index1" data-id="index_v1.html" frameborder="0" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">BIRD的后台</div>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">
            <ul class="nav nav-tabs navs-3">
                <li class="active">
                    <a data-toggle="tab" href="#tab-1"><i class="fa fa-gear"></i> 主题</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="sidebar-title">
                        <h3><i class="fa fa-comments-o"></i> 主题设置</h3>
                        <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                    </div>
                    <div class="skin-setttings">
                        <div class="title">主题设置</div>
                        <div class="setings-item">
                            <span>收起左侧菜单</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox"
                                           id="collapsemenu">
                                    <label class="onoffswitch-label" for="collapsemenu">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定顶部</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox"
                                           id="fixednavbar">
                                    <label class="onoffswitch-label" for="fixednavbar">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item"><span>固定宽度</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox"
                                           id="boxedlayout">
                                    <label class="onoffswitch-label" for="boxedlayout">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="title">皮肤选择</div>
                        <div class="setings-item default-skin nb">
                            <span class="skin-name ">
                                <a href="#" class="s-skin-0">默认皮肤</a>
                            </span>
                        </div>
                        <div class="setings-item blue-skin nb">
                            <span class="skin-name ">
                                <a href="#" class="s-skin-1">蓝色主题</a>
                            </span>
                        </div>
                        <div class="setings-item yellow-skin nb">
                            <span class="skin-name ">
                                <a href="#" class="s-skin-3">黄色/紫色主题</a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!--右侧边栏结束-->
    <!--mini聊天窗口开始-->
    <div class="small-chat-box fadeInRight animated">
        <div class="chat-message active">
            1.所有源码(未压缩、带注释版本)；
            <br> 2.说明文档；
            <br> 3.终身免费升级服务；
            <br> 4.必要的技术支持；
            <br> 5.付费二次开发服务；
            <br> 6.授权许可；
            <br> ……
            <br>
        </div>
    </div>
</div>
</div>
{% include "public/script.volt" %}
<script src="/backend/assets/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/backend/assets/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/backend/assets/js/plugins/layer/layer.min.js"></script>
<script src="/backend/assets/js/plugins/pace/pace.min.js"></script>
<script src="/backend/assets/js/hplus.min.js"></script>
<script src="/backend/assets/js/contabs.min.js"></script>
<script>
    $('.btn-bitbucket').click(function(){
        var _this = $(this);
        if(_this.find('i').hasClass('fa-group')){
            $('#side-menu').find('li.common').show();
            $('#side-menu').find('li.system').hide();
        }else if(_this.find('i').hasClass('fa-wrench')){
            $('#side-menu').find('li.common').hide();
            $('#side-menu').find('li.system').show();
        }
    })
</script>
</body>
</html>