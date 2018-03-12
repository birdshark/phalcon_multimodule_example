{% extends '_layouts/steps.volt' %}
{% block style %}
    <link href="/backend/assets/css/plugins/iCheck/custom.css" rel="stylesheet">
{% endblock %}
{% block content %}
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-content">
                    <h2>
                        管理员角色分配
                    </h2>
                    <form id="form" action="{{ url('/backend/role/assignment') }}" class="wizard-big" method="post">
                        <h1>选择管理员</h1>
                        <step>
                            <h2>管理员列表</h2>
                            <div class="row form-group">
                                <div class="col-sm-4">
                                    <label>管理员 *</label>
                                    <div class="input-group">
                                        <input id="admin" name="admin" type="text" class="form-control required" readonly>
                                        <input type="hidden" name="admin_id" value="">
                                        <span class="input-group-btn"><button type="button" class="btn btn-primary" id="user-search">搜索</button></span>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="text-center">
                                        <div style="margin-top: 20px">
                                            <i class="fa fa-sign-in" style="font-size: 180px;color: #e5e5e5 "></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </step>
                        <h1>选择角色</h1>
                        <step data-mode="async" data-url="/backend/backend/role">
                        </step>
                        <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                    </form>
                </div>
            </div>
        </div>

    </div>
{% endblock %}
{% block script %}
    <script src="/backend/assets/js/plugins/layer/layer.min.js"></script>
    <script src="/backend/assets/js/plugins/iCheck/icheck.min.js"></script>
    <script>

        $(document).ready(function () {
            $("#form").steps({
                loadingTemplate: '<span class="spinner"></span> #text#',
                labels:{
                    previous: "上一步",
                    next: "下一步",
                    finish: "完成",
                    cancel: "取消",
                    loading: "Loading ..."
                },
                bodyTag: "step",
                onStepChanging: function (event, currentIndex, newIndex) {
                    if(currentIndex == 0 && newIndex == 1){
                        var $aid = $('input[name="admin_id"]').val(),$url = $('step[data-mode="async"]').attr('data-url');
                        $("#form").steps('getStep',1).contentUrl = $url + '?aid=' + $aid;
                    }
                    if (currentIndex > newIndex) {
                        return true
                    }
                    var form = $(this);
                    if (currentIndex < newIndex) {
                        $(".body:eq(" + newIndex + ") label.error", form).remove();
                        $(".body:eq(" + newIndex + ") .error", form).removeClass("error")
                    }
                    form.validate().settings.ignore = ":disabled,:hidden";
                    return form.valid()
                },
                onStepChanged: function (event, currentIndex, priorIndex) {
                    if (currentIndex === 2 && priorIndex === 3) {
                        $(this).steps("previous")
                    }
                },
                onFinishing: function (event, currentIndex) {
                    var form = $(this);
                    form.validate().settings.ignore = ":disabled";
                    return form.valid()
                },
                onFinished: function (event, currentIndex) {
                    var form = $(this);
                    form.submit()
                }
            }).validate({
                errorPlacement: function (error, element) {
                    element.parent('.input-group').after(error);
                }, rules: {confirm: {equalTo: "#password"}}
            })
            $('#user-search').click(function () {
                layer.open({
                    type: 2,
                    title: '选择',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['80%', '80%'],
                    content: '/backend/backend/pick?tab=Win', //iframe的url
                })
            })
        });
    </script>
{% endblock %}