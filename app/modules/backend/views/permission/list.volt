{% extends "_layouts/list.volt" %}

{% block table %}
    <table id="table" data-mobile-responsive="true"
           data-toggle="table"
           data-toolbar="#exampleToolbar"
           data-search="true"
           data-height="420"
           data-show-refresh="true"
           data-show-toggle="true"
           data-show-columns="true"
           data-show-export="true"
           data-detail-view="true"
           data-detail-formatter="detailFormatter"
           data-minimum-count-columns="2"
           data-show-pagination-switch="true"
           data-pagination="true"
           data-id-field="id"
           data-page-size="5"
           data-page-list="[10, 25, 50, 100, ALL]"
           data-show-footer="false"
           data-side-pagination="server"
           data-url="/backend/permission/list"
           {#data-response-handler="responseHandler"#}
            >
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="id" data-halign="center" data-align="center">ID</th>
            <th data-field="name" data-halign="center" data-align="center">角色名称</th>
            <th data-field="display_name" data-halign="center" data-align="center">显示名称</th>
            <th data-field="description" data-halign="center" data-align="center">描述</th>
            <th data-field="showOrHide" data-halign="center" data-align="center" data-formatter="showOrHideFormatter">显示</th>
            <th data-field="operate" data-halign="center" data-align="center" data-formatter="operateFormatter" data-events="operateEvents">操作</th>
        </tr>
        </thead>
    </table>
{% endblock %}
{% block controller %}permission{% endblock %}
{% block script %}
    <script>
        var showOrHideFormatter = function(value, row, index) {
            var checked ='';
            if(row.show == 1){
                checked = 'checked';
            }
            return [
                '<input type="checkbox" data-id="'+row.id+'" data-name="'+row.name+'" name="my-checkbox" '+checked+'>'
            ].join('');
        }
        var showOrHide = function(id,show,name){
            commonAjax('{{url('/backend/permission/edit/')}}/' + id,{id:id,show:show,name:name})
        }
        $table.on('post-body.bs.table', function (data) {
            $($table[0]).find('tbody').find("[name='my-checkbox']").bootstrapSwitch();
            $('input[name="my-checkbox"]').on('switchChange.bootstrapSwitch', function(event, state) {
                var id = $(this).attr('data-id'),name = $(this).attr('data-name');
                var show = 0;
                if(state == true){
                    show = 1;
                }
                showOrHide(id,show,name);
            });
        });
    </script>
{% endblock %}