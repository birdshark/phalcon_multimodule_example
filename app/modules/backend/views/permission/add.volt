{% extends "_layouts/add.volt" %}
{% block style %}
    {#<link href="/admin/assets/js/plugins/switchery/switchery.min.css" rel="stylesheet" />#}
{% endblock %}
{% block form %}
    <form class="form-horizontal m-t" id="aeForm" method="post">
        <div class="form-group">
            <label class="col-sm-3 control-label">权限名称：</label>
            <div class="col-sm-8">
                <input id="name" name="name" class="form-control" type="text" aria-required="true" aria-invalid="true" class="valid" value="{{ info.name }}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">显示名称：</label>
            <div class="col-sm-8">
                <input id="display_name" name="display_name" class="form-control" type="text" aria-required="true" aria-invalid="true" class="valid" value="{{ info.display_name }}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">章节：</label>
            <div class="col-sm-8">
                <input id="section" name="section" class="form-control" type="text" aria-required="true" aria-invalid="true" class="valid" value="{{ info.section }}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">图标：</label>
            <div class="col-sm-8">
                <input id="flag" name="flag" class="form-control" type="text" aria-required="true" aria-invalid="true" class="valid" value="{{ info.flag }}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">显隐模式：</label>
            <div class="col-sm-8">
                <select class="form-control m-b" name="show" id="show">
                    <option value="1" @if(info.show == 1) selected @endif>显</option>
                    <option value="0" @if(info.show == 0) selected @endif>隐</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">类型：</label>
            <div class="col-sm-8">
                {#<input type="checkbox" class="js-switch" checked />#}
                <select class="form-control m-b" name="mode" id="mode">
                    <option value="common" @if(info.mode == 'common') selected @endif>普通</option>
                    <option value="system" @if(info.mode == 'system') selected @endif>系统</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">描述：</label>
            <div class="col-sm-8">
                <textarea id="description" name="description" class="form-control" required="" aria-required="true">{{ info.description }}</textarea>
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
    {#<script src="/admin/assets/js/plugins/switchery/switchery.min.js"></script>#}
    <script>
//        var elem = document.querySelector('.js-switch');
//        console.log(elem);
//        var init = new Switchery(elem);
//
//        elem.onchange = function() {
//            console.log(elem.checked);
//        };
        $().ready(function() {
            var e = "<i class='fa fa-times-circle'></i> ";
            $("#aeForm").validate({
                rules: {
                    name: {
                        required: !0,
                        minlength: 2
                    }
                },
                messages: {
                    name: {
                        required: e + "请输入角色名称",
                        minlength: e + "角色名称名必须两个字符以上"
                    }
                }
            })
        });
    </script>
{% endblock %}