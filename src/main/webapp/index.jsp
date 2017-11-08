<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="share/_meta.jsp" %>
    <title>管理系统</title>
</head>
<body>
<%@ include file="share/_header.jsp" %>
<!-- 菜单 -->
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <c:forEach items="${menuList}" var="item">
            <dl id="menu-product">
                <dt><i class="Hui-iconfont">${ item.iconCls }</i>${ item.menuName }<i
                        class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                        <c:forEach items="${item.sonMenu}" var="sonItem">
                            <li><a data-href="${pageContext.request.contextPath}${ sonItem.url }"
                                   data-title="${ sonItem.menuName }"
                                   href="javascript:;void(0)">${ sonItem.menuName }</a></li>
                        </c:forEach>
                    </ul>
                </dd>
            </dl>
        </c:forEach>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
<!-- 菜单 -->
<!-- 首页桌面 -->
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active">
                    <span title="我的桌面" data-href="welcome.jsp">我的桌面</span>
                    <em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S"
                                                  href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a
                id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">
            &#xe6d7;</i></a></div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="${pageContext.request.contextPath}/welcome.jsp"></iframe>
        </div>
    </div>
</section>
<!-- 首页桌面 -->
<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前</li>
        <li id="closeall">关闭全部</li>
    </ul>
</div>
<%@ include file="share/_footer.jsp" %>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/h-ui/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">

</script>
</body>
</html>