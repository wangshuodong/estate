<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl">
            <%--<span class="logo navbar-logo f-l mr-10 hidden-xs">
                <img style="margin-left: -15px" src="${pageContext.request.contextPath}/h-ui/common/images/bqcl_logo.png">
                |&nbsp;&nbsp;&nbsp;&nbsp;在线物业管理系统
            </span>--%>

            <span class="logo navbar-logo f-l mr-10 hidden-xs">
                <img style="margin-left: 0px; height: 40px" src="${pageContext.request.contextPath}/h-ui/common/images/logo.96820e6.png">
                &nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;在线物业管理系统
            </span>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li class="dropDown dropDown_hover">
                        <a href="#" class="dropDown_A">${sessionScope.userInfo.username} <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <%--<li><a data-title="基本信息" data-href="${pageContext.request.contextPath}/rest/employee/baseInfo" onclick="Hui_admin_tab(this)" href="javascript:;">基本信息</a></li>--%>
                            <li><a data-href="${pageContext.request.contextPath}/rest/user/changePassword" data-title="密码修改" onclick="Hui_admin_tab(this)">密码修改</a></li>
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