<h2>角色</h2>
<div class="row">
    <div class="form-group">
        <div class="col-sm-10">
            @foreach($admin_roles as $admin_role)
                <input type="hidden" name="old_role_ids[]" value="{{ $admin_role }}">
            @endforeach
            @foreach($roles as $role)
                <label class="checkbox-inline i-checks">
                    <input type="checkbox" name="role_ids[]" value="{{ $role->id }}" @if(in_array($role->id,$admin_roles))) checked="" @endif >
                    {{ $role->name }}
                </label>
            @endforeach
        </div>
    </div>
</div>
<script>
    $(".i-checks").iCheck({
        checkboxClass:"iradio_square-green"
    });
</script>