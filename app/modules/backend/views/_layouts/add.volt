<!DOCTYPE html>
<html>
<head>
    {% include "public/seo.volt" %}
    {% include "public/style.volt" %}
    {% block style %}{% endblock %}
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>信息编辑</h5>
                </div>
                <div class="ibox-content">
                    {% block form %}{% endblock %}
                </div>
            </div>
        </div>
    </div>
</div>
{% include "public/script.volt" %}
<script src="/backend/assets/js/content.min.js"></script>
<script src="/backend/assets/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/backend/assets/js/plugins/validate/messages_zh.min.js"></script>
{% block script %}{% endblock %}
</body>

</html>