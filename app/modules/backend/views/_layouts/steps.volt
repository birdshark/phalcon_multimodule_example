<!DOCTYPE html>
<html>

<head>
    {% include "public/seo.volt" %}
    {% include "public/style.volt" %}
    {% block style %}{% endblock %}
    <link href="/backend/assets/css/plugins/steps/jquery.steps.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    {% block content %}{% endblock %}
</div>
{% include "public/script.volt" %}
<script src="/backend/assets/js/content.min.js"></script>
<script src="/backend/assets/js/plugins/steps/jquery.steps.min.js"></script>
<script src="/backend/assets/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/backend/assets/js/plugins/validate/messages_zh.min.js"></script>
{% block script %}{% endblock %}
</body>

</html>