<h2>权限</h2>
<div class="row">
    <div class="form-group">
        <div class="col-sm-12">
            {% for perms_id in perms_ids%}
                <input type="hidden" name="old_perms_ids[]" value="{{ perms_id }}" />
            {% endfor %}
            {% for permission in permissions%}
                <label class="checkbox-inline i-checks">
                    <input type="checkbox" name="permission_ids[]" value="{{ permission.id }}" @if(in_array(permission.id,perms_ids))) checked="" @endif>
                    {{ permission.display_name }}
                </label>
            {% endfor %}
        </div>
    </div>
</div>
<script>
    $(".i-checks").iCheck({
        checkboxClass: "icheckbox_square-green",
        radioClass:"iradio_square-green"
    })
    $('input[name="role_id"]').on('ifChanged', function(event){
        var $rid = $(this).val(),$url = $('step[data-mode="async"]').attr('data-url');
        $("#form").steps('getStep',1).contentUrl = $url + '&rid=' + $rid;
    });
</script>