<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl">
            <span class="logo navbar-logo f-l mr-10 hidden-xs">管理后台</span>
            <span class="logo navbar-logo-m f-l mr-10 visible-xs">管理后台</span>
            <span class="logo navbar-slogan f-l mr-10 hidden-xs">v3.1</span>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li class="dropDown dropDown_hover">
                        <a href="#" class="dropDown_A">${sessionScope.userInfo.username} <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a data-title="基本信息" data-href="${pageContext.request.contextPath}/rest/employee/baseInfo" onclick="Hui_admin_tab(this)" href="javascript:;">基本信息</a></li>
                            <li><a href="#">密码修改</a></li>
                            <li><a href="${pageContext.request.contextPath}/rest/user/logout.do">退出</a></li>
                        </ul>
                    </li>
                    <%--<li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>--%>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>