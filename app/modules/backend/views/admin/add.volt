{% extends "_layouts/add.volt" %}
{% block style %}
    <link href="/backend/assets/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/backend/assets/css/plugins/bootstrap-fileinput/fileinput.min.css" rel="stylesheet">
    <link href="/backend/assets/css/plugins/jcrop/jquery.Jcrop.min.css" rel="stylesheet">
    <style>
        .kv-avatar .krajee-default.file-preview-frame,.kv-avatar .krajee-default.file-preview-frame:hover {
            margin: 0;
            padding: 0;
            border: none;
            box-shadow: none;
            text-align: center;
        }
        .kv-avatar {
            display: inline-block;
        }
        .kv-avatar .file-input {
            display: table-cell;
        }
        .kv-reqd {
            color: red;
            font-family: monospace;
            font-weight: normal;
        }
        .krajee-default.file-preview-frame .kv-file-content {
            width: auto;
            height: auto;
        }
        .file-zoom-content {
            height:auto;
        }
    </style>
{% endblock %}
{% block form %}
    <form class="form-horizontal m-t" id="aeForm" method="post">
        <div class="form-group">
            <label class="col-sm-3 control-label">姓名：</label>
            <div class="col-sm-8">
                <input id="name" name="name" class="form-control" type="text" aria-required="true" aria-invalid="true" class="valid" value="{{ info.name }}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">昵称：</label>
            <div class="col-sm-8">
                <input id="nick" name="nick" class="form-control" type="text" aria-required="true" aria-invalid="true" class="valid" value="{{ info.nick }}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">邮箱：</label>
            <div class="col-sm-8">
                <input id="email" name="email" class="form-control" type="email" aria-required="true" aria-invalid="true" class="valid" value="{{ info.email }}">
            </div>
        </div>
        {#<div class="form-group">#}
        {#<label class="col-sm-3 control-label">性别：</label>#}
        {#<div class="col-sm-8">#}
        {#<div class="radio i-checks">#}
        {#<label><input type="radio" id="sex_1" value="1" name="sex" {% if info.sex == 1 %}checked=""{% endif %}><i></i>男</label>#}
        {#<label><input type="radio" id="sex_2" value="2" name="sex" {% if info.sex == 2 %}checked=""{% endif %}><i></i> 女 </label>#}
        {#</div>#}
        {#</div>#}
        {#</div>#}
        <div class="form-group">
            <label class="col-sm-3 control-label">头像：</label>
            <div class="col-sm-8">
                <div class="kv-avatar">
                    <div class="file-loading">
                        <input id="avatar" type="file">
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">密码：</label>
            <div class="col-sm-8">
                <input id="password" name="password" class="form-control" type="password">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">确认密码：</label>
            <div class="col-sm-8">
                <input id="password_confirmation" name="password_confirmation" class="form-control" type="password">
                <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 请再次输入您的密码</span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-8 col-sm-offset-3">
                <button class="btn btn-w-m btn-primary" type="submit">提交</button>
            </div>
        </div>
        <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
        <input type="hidden" name="id" value="{{ info.id }}">
        <input type="hidden" name="avatar" value="{{ info.avatar }}">
        <input type="hidden" name="created_at" value="{{ info.created_at }}">
        <input type="hidden" name="updated_at" value="{{ date('Y-m-d H:i:s') }}">
        <input type="hidden" name="remember_token" value="{{ info.remember_token }}">
    </form>

    <input hidden id="x" name="x">
    <input hidden id="y" name="y">
    <input hidden id="w" name="w">
    <input hidden id="h" name="h">

{% endblock %}
{% block script %}
    <script src="/backend/assets/js/plugins/iCheck/icheck.min.js"></script>
    <script src="/backend/assets/js/plugins/bootstrap-fileinput/fileinput.min.js"></script>
    <script src="/backend/assets/js/plugins/jcrop/jquery.Jcrop.min.js"></script>
    <script>

        {% if(info.avatar) %}
        var initialPreview = ["<img width='213px' height='160px' src='{{ info.avatar }}' class='file-preview-image'>"];
        {% else %}
        var initialPreview = [];
        {% endif %}

        var initFileInput = function(target,post_to,data,allowedExtension,initialPreview,selected_callback,field){
            var element = $('#'+ target);
            element.fileinput({
                uploadUrl:post_to,
                uploadExtraData: data,
                overwriteInitial: true,
                showClose: false,
                showCaption: false,
                showUpload:false,
                browseLabel: '',
                maxFileCount:1,
                removeLabel: '',
                browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
                removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
                elErrorContainer: '#kv-avatar-errors-1',
                msgErrorClass: 'alert alert-block alert-danger',
                defaultPreviewContent: '<img src="/backend/img/profile_small.jpg">',
                layoutTemplates: {main2: '{preview} {remove} {browse}'},
                allowedFileExtensions: allowedExtension,
                initialPreview: initialPreview,
            }).on("filebatchselected", function(event, files) {
                selected_callback(event, files);
            }).on("fileuploaded", function(event, data) {
                var response = data.response;
                if(response.state == 1){
                    $('input[name="'+field+'"]').val(response.data.file_name);
                }
            });
        };
        var cut = function(dom,show_callback,select_callback,clear_callback){
            $(dom).Jcrop({
                bgOpacity: 0.5,
                bgColor: 'white',
                addClass: 'jcrop-light',
                onChange:   show_callback,
                onSelect:   select_callback,
                onRelease:  clear_callback
            },function(){
                api = this;
                api.setSelect([0,0,0+150,0+150]);
                api.setOptions({ bgFade: true });
                api.ui.selection.addClass('jcrop-selection');
            });
        }

        var api,params;
        $().ready(function() {
            initFileInput('avatar','/backend/uploads/avatar',function () {
                return {
                    sw: $('.jcrop-holder').css('width'),
                    sh: $('.jcrop-holder').css('height'),
                    x: $('#x').val(),
                    y: $('#y').val(),
                    w: $('#w').val(),
                    h: $('#h').val()
                }
            },["jpg", "png", "gif"],initialPreview,function (event, files) {
                var dom = $('.file-preview-frame img')[0];
                cut(dom,function (c) {
                    $('#x').val(c.x);
                    $('#y').val(c.y);
                    $('#w').val(c.w);
                    $('#h').val(c.h);
                },function (c) {
                    $('#x').val(c.x);
                    $('#y').val(c.y);
                    $('#w').val(c.w);
                    $('#h').val(c.h);
                },null);
            },'avatar');
            var e = "<i class='fa fa-times-circle'></i>";
            $("#aeForm").validate({
                rules: {
                    name: {
                        required: !0,
                        minlength: 2
                    },
                    nick: {
                        required: !0,
                        minlength: 2
                    },
                    password: {
                        required: !0,
                        minlength: 5
                    },
                    password_confirmation: {
                        required: !0,
                        minlength: 5,
                        equalTo: "#password"
                    },
                    email: {
                        required: !0,
                        email: !0
                    }
                },
                messages: {
                    name: {
                        required: e + "请输入您的用户名",
                        minlength: e + "用户名必须两个字符以上"
                    },
                    nick : {
                        required: e + "请输入您的昵称",
                        minlength: e + "昵称必须两个字符以上"
                    },
                    password: {
                        required: e + "请输入您的密码",
                        minlength: e + "密码必须5个字符以上"
                    },
                    password_confirmation: {
                        required: e + "请再次输入密码",
                        minlength: e + "密码必须5个字符以上",
                        equalTo: e + "两次输入的密码不一致"
                    },
                    email: e + "请输入您的E-mail"
                }
            })

            $(".i-checks").iCheck({
                radioClass:"iradio_square-green",
            });
        });
    </script>
{% endblock %}