<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 富头像上传编辑器</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    {% include "public/style.volt" %}
    <style>
        .fancybox img{
            width: auto;
        }
    </style>
    <script>
        var HPLUS = {};
        HPLUS.setting  = {
            'fullAvatarEditor' : '/admin/assets/plugins/fullavatareditor/fullAvatarEditor.swf',
            'expressInstall' : '/admin/assets/plugins/fullavatareditor/expressInstall.swf'
        };
    </script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>富头像上传编辑器</h5>
                </div>
                <div class="ibox-content">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                    <input type="hidden" name="user_id" value="{{ Auth::guard('backend')->getUser()->id }}" />
                    <input type="hidden" name="source" value="{{ str_replace('avatar1','source',Auth::guard('backend')->getUser()->avatar) }}" />
                    <ul class="nav nav-tabs" id="avatar-tab">
                        <li class="active" id="upload"><a href="javascript:;">本地上传</a>
                        </li>
                        <li id="webcam"><a href="javascript:;">视频拍照</a>
                        </li>
                        <li id="albums"><a href="javascript:;">相册选取</a>
                        </li>
                    </ul>
                    <div class="m-t m-b">
                        <div id="flash1">
                            <p id="swf1">本组件需要安装Flash Player后才可使用，请从<a href="http://www.adobe.com/go/getflashplayer">这里</a>下载安装。</p>
                        </div>
                        <div id="editorPanelButtons" style="display:none">
                            <p class="m-t">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="src_upload">是否上传原图片？</label>
                            </p>
                            <p>
                                <a href="javascript:;" class="btn btn-w-m btn-primary button_upload"><i class="fa fa-upload"></i> 上传</a>
                                <a href="javascript:;" class="btn btn-w-m btn-white button_cancel">取消</a>
                            </p>
                        </div>
                        <p id="webcamPanelButton" style="display:none">
                            <a href="javascript:;" class="btn btn-w-m btn-info button_shutter"><i class="fa fa-camera"></i> 拍照</a>
                        </p>
                        <div id="userAlbums" style="display:none">
                            <a href="/admin/img/a1.jpg" class="fancybox" title="选取该照片">
                                <img src="/admin/img/a1.jpg" alt="示例图片1" />
                            </a>
                            <a href="/admin/img/a2.jpg" class="fancybox" title="选取该照片">
                                <img src="/admin/img/a2.jpg" alt="示例图片2" />
                            </a>
                            <a href="/admin/img/a3.jpg" class="fancybox" title="选取该照片">
                                <img src="/admin/img/a3.jpg" alt="示例图片2" />
                            </a>
                            <a href="/admin/img/a4.jpg" class="fancybox" title="选取该照片">
                                <img src="/admin/img/a4.jpg" alt="示例图片2" />
                            </a>
                            <a href="/admin/img/a5.jpg" class="fancybox" title="选取该照片">
                                <img src="/admin/img/a5.jpg" alt="示例图片2" />
                            </a>
                            <a href="/admin/img/a6.jpg" class="fancybox" title="选取该照片">
                                <img src="/admin/img/a6.jpg" alt="示例图片2" />
                            </a>
                            <a href="/admin/img/a7.jpg" class="fancybox" title="选取该照片">
                                <img src="/admin/img/a7.jpg" alt="示例图片2" />
                            </a>
                            <a href="/admin/img/a8.jpg" class="fancybox" title="选取该照片">
                                <img src="/admin/img/a8.jpg" alt="示例图片2" />
                            </a>
                            <a href="/admin/img/a9.jpg" class="fancybox" title="选取该照片">
                                <img src="/admin/img/a9.jpg" alt="示例图片2" />
                            </a>
                        </div>
                    </div>
                    <div class="alert alert-warning alert-dismissable m-t">
                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                        <br>- 测试 <b>视频拍照</b> 功能时，请注意允许<code>flash</code>和<code>浏览器</code>使用摄像头，否则可能会无法拍照。
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% include "public/script.volt" %}
<script src="/admin/assets/js/content.min.js"></script>
<script type="text/javascript" src="/admin/assets/plugins/fullavatareditor/scripts/swfobject.js"></script>
<script type="text/javascript" src="/admin/assets/plugins/fullavatareditor/scripts/fullAvatarEditor.js"></script>
<script type="text/javascript" src="/admin/assets/plugins/fullavatareditor/scripts/jQuery.Cookie.js"></script>
<script type="text/javascript" src="/admin/assets/plugins/fullavatareditor/scripts/test.js"></script>
</body>
</html>