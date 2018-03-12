{% extends "_layouts/add.volt" %}
{% block style %}
    <link href="/backend/assets/css/plugins/iCheck/custom.css" rel="stylesheet">
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
    </form>
{% endblock %}
{% block script %}
    <script src="/backend/assets/js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $().ready(function() {
            var e = "<i class='fa fa-times-circle'></i> ";
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