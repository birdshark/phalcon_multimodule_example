<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <span><img alt="image" width="64px" height="64px" class="img-circle" src="{{  session.get('auth')['avatar']|default('/backend/img/profile_small.jpg') }}"/></span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear">
                                <span class="block m-t-xs">
                                    <strong class="font-bold">{{ session.get('auth')['name'] }}</strong>
                                </span>
                            </span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a class="J_menuItem" href="/backend/user/avatar">修改头像</a></li>
                        <li class="divider"></li>
                        <li><a href="/backend/auth/logout">安全退出</a></li>
                    </ul>
                </div>
                <div class="logo-element">H+
                </div>
            </li>
            {% for menu in menus %}
                <li class="{{ menu['mode'] }}">
                    <a href="#">
                        <i class="fa {{ menu['flag']|default('fa-user') }}"></i>
                        <span class="nav-label">{{ menu['section'] }}管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        {% for page in menu['pages'] %}
                        <li><a class="J_menuItem" href="/backend/{{ str_replace('-','/',page['name']) }}" data-index="0">{{ page['display_name'] }}</a></li>
                        {% endfor %}
                    </ul>
                </li>
            {% endfor %}
        </ul>
    </div>
    <div class="nav-close"><i class="fa fa-times-circle"></i>
    </div>
</nav>