<!DOCTYPE html>
<html>

<head>

    {% include "public/seo.volt" %}
    {% include "public/style.volt" %}
    <meta name="{{ security.getTokenKey() }}" content="{{ security.getToken() }}"/>
    <link href="/backend/assets/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="/backend/assets/css/plugins/switch/bootstrap-switch.min.css" rel="stylesheet">
    {% block style %}{% endblock %}
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    {% block query %}{% endblock %}
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
                            {% block extra_btn %}{% endblock %}
                            {% block table %}{% endblock %}
                        </div>
                    </div>
                    <!-- End Example Toolbar -->
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
<script src="/backend/assets/js/plugins/switch/bootstrap-switch.js"></script>
<script>
    var $table = $('#table');

    var detailFormatter = function(index, row){
        var html = [];
        $.each(row, function (key, value) {
            html.push('<p><b>' + key + ':</b> ' + value + '</p>');
        });
        return html.join('');
    }

    var reloadTable = function(){
        $table.bootstrapTable('refresh');
    }

    window.operateEvents = {
        'click .like': function (e, value, row, index) {
            var id = row['id'];
            parent.layer.open({
                type: 2,
                title: '编辑',
                shadeClose: true,
                shade: 0.8,
                area: ['90%', '90%'],
                content: '/backend/{% block controller %}{% endblock %}/edit/' + id
            });
        },
        'click .remove': function (e, value, row, index) {
            layer.confirm('删除将无法恢复', {
              btn: ['确定', '取消']
            }, function(index){
                deleteData(row.id);
                this.close();
            }, function(index){
            });
            
        }
    };

    var deleteData = function(id){
        commonAjax('/backend/{% block controller %}{% endblock %}/delete',{id:id},function(json){
            layer.msg(json.msg);
            $table.bootstrapTable('remove', {
                field: 'id',
                values: [id]
            });
        })
    }

    var commonAjax = function (url,data,callback){
        $.ajax({
            url:url,
            data:data,
            type:'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            },
            dataType:'JSON',
            success:function(json){
                if(typeof callback == 'function'){
                    callback(json)
                }
            }
        })
    }

    var indexFormatter = function(value, row,index){
        return index+1;
    }

    var operateFormatter = function(value, row, index) {
        return [
            '<a class="like" href="javascript:void(0)" title="编辑">',
            '<i class="glyphicon glyphicon-edit"></i>',
            '</a>  ',
            '<a class="remove" href="javascript:void(0)" title="删除">',
            '<i class="glyphicon glyphicon-remove"></i>',
            '</a>'
        ].join('');
    }

    var operateFormatter_nodel = function(value, row, index) {
        return [
            '<a class="like" href="javascript:void(0)" title="编辑">',
            '<i class="glyphicon glyphicon-edit"></i>',
            '</a>  '
        ].join('');
    }

    var serializeArrayToObject = function(data){
        var format = {};
        for(var i in data){
            format[data[i].name] = data[i].value;
        }
        return format;
    }
</script>
{% block script %}{% endblock %}
</body>

</html>