<!DOCTYPE html>
<html>
<head>
    {% include "public/seo.volt" %}
    {% include "public/style.volt" %}
    <link href="/backend/assets/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>列表</h5>
        </div>
        <div class="ibox-content">
            <div class="row row-lg">
                <div class="col-sm-12">
                    <!-- Example Toolbar -->
                    <div class="example-wrap">
                        <div class="example">
                            <div class="btn-group hidden-xs" id="exampleToolbar" role="group">
                                <button type="button" class="btn btn-outline btn-default">
                                    <a href="add"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i></a>
                                </button>
                            </div>
                            @yield('table')
                        </div>
                    </div>
                    <!-- End Example Toolbar -->
                </div>
                <div class="row row-lg">
                    <div class="col-md-9 col-md-offset-8">
                        <button type="button" class="btn btn-w-m btn-primary">确定</button>
                        <button type="button" class="btn btn-w-m btn-info">取消</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- End Panel Other -->
</div>
{% include "public/script.volt" %}
<script src="/backend/assets/js/content.min.js"></script>
<script src="/backend/assets/js/plugins/layer/layer.min.js"></script>
<script src="/backend/assets/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="/backend/assets/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="/backend/assets/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script>
    var $table = $('#table');

    var detailFormatter = function(index, row){
        var html = [];
        $.each(row, function (key, value) {
            html.push('<p><b>' + key + ':</b> ' + value + '</p>');
        });
        return html.join('');
    }
</script>
@yield('script')
</body>

</html>