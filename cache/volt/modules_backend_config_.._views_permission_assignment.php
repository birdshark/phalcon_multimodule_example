<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>后台</title>
<meta name="keywords" content="">
<meta name="description" content="">
    <link href="/backend/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="/backend/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="/backend/assets/css/animate.min.css" rel="stylesheet">
<link href="/backend/assets/css/style.min.css" rel="stylesheet">
    
    <link href="/backend/assets/css/plugins/iCheck/custom.css" rel="stylesheet">

    <link href="/backend/assets/css/plugins/steps/jquery.steps.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-content">
                    <h2>
                        角色权限分配
                    </h2>
                    <form id="form" action="<?= $this->url->get('/backend/permission/assignment') ?>" method="post" class="wizard-big">
                        <h1>选择角色</h1>
                        <step>
                            <h2>角色</h2>
                            <div class="row">
                                <div class="col-sm-10">
                                    <div class="form-group">

                                        <div class="radio i-checks">
                                            <?php foreach ($roles as $role) { ?>
                                            <label><input type="radio" value="<?= $role->id ?>" name="role_id"> <i></i> <?= $role->name ?></label>
                                            <?php } ?>
                                        </div>
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
                        <h1>选择权限</h1>
                        <step data-mode="async" data-url="/backend/role/permission?_token=<?= $this->security->getToken() ?>">
                        </step>
                        <input type="hidden" name="<?= $this->security->getTokenKey() ?>" value="<?= $this->security->getToken() ?>">
                    </form>
                </div>
            </div>
        </div>

    </div>

</div>
<script src="/backend/assets/js/jquery.min.js"></script>
<script src="/backend/assets/js/bootstrap.min.js"></script>
<script src="/backend/assets/js/content.min.js"></script>
<script src="/backend/assets/js/plugins/steps/jquery.steps.min.js"></script>
<script src="/backend/assets/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/backend/assets/js/plugins/validate/messages_zh.min.js"></script>

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
                },
                rules: {confirm: {equalTo: "#password"}}
            })

            $(".i-checks").iCheck({
                radioClass:"iradio_square-green",
                checkboxClass: "icheckbox_square-green",
            });
            $('input[name="role_id"]').on('ifChanged', function(event){
                var $rid = $(this).val(),$url = $('step[data-mode="async"]').attr('data-url');
                $("#form").steps('getStep',1).contentUrl = $url + '&rid=' + $rid;
            });
        });
    </script>

</body>

</html>