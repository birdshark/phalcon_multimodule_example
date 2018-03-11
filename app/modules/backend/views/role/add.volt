@extends('backend._layouts.add')
@section('form')
    <form class="form-horizontal m-t" id="aeForm" method="post">
        <div class="form-group">
            <label class="col-sm-3 control-label">角色名称：</label>
            <div class="col-sm-8">
                <input id="name" name="name" class="form-control" type="text" aria-required="true" aria-invalid="true" class="valid" value="{{ @$name }}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">显示名称：</label>
            <div class="col-sm-8">
                <input id="display_name" name="display_name" class="form-control" type="text" aria-required="true" aria-invalid="true" class="valid" value="{{ @$display_name }}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">描述：</label>
            <div class="col-sm-8">
                <textarea id="description" name="description" class="form-control" required="" aria-required="true">{{ @$description }}</textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-8 col-sm-offset-3">
                <button class="btn btn-w-m btn-primary" type="submit">提交</button>
            </div>
        </div>
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <input type="hidden" name="id" value="{{ @$id }}">
    </form>
@stop
@section('script')
    <script>
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
@stop