@extends('backend._layouts.list')

@section('table')
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
           data-url="/backend/role/list"
           {#data-response-handler="responseHandler"#}
            >
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="id" data-halign="center" data-align="center">ID</th>
            <th data-field="name" data-halign="center" data-align="center">角色名称</th>
            <th data-field="operate" data-halign="center" data-align="center" data-formatter="operateFormatter" data-events="operateEvents">操作</th>
        </tr>
        </thead>
    </table>
@stop
@section('controller','role')
@section('script')
@stop