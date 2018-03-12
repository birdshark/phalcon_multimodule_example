{% extends '_layouts/pick.volt' %}
{% block table %}
    <table id="table" data-mobile-responsive="true"
           data-toggle="table"
           data-height="420"
           data-toolbar="#exampleToolbar"
           data-search="true"
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
           data-url="/backend/admin/list"
           {#data-response-handler="responseHandler"#}
    >
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="id" data-halign="center" data-align="center">ID</th>
            <th data-field="name" data-halign="center" data-align="center">Name</th>
            <th data-field="email" data-halign="center" data-align="center">Email</th>
        </tr>
        </thead>
    </table>
{% endblock %}
{% block controller %}admin{% endblock %}
{% block script %}
<script>
    $('.btn').click(function(){
        var _this = $(this),$selections = $table.bootstrapTable('getSelections'),index = parent.layer.getFrameIndex(window.name);

        if(_this.hasClass('btn-primary')){
            parent.$('#admin').val($selections[0].email);
            parent.$('input[name="admin_id"]').val($selections[0].id);
            parent.layer.close(index);
        }else if(_this.hasClass('btn-info')){
            parent.layer.close(index);
        }
    });
</script>
{% endblock %}