<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理中心 <span
        class="c-gray en">&gt;</span> 小区管理
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
       href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
    <form class="codeView docs-example" action="${pageContext.request.contextPath }/rest/housing/housingList"
          method="post">
        <div class="form-group">
            <select class="form-control" name="parentId" id="parentId" style="width:250px">
                <option value='' disabled selected style='display:none;'>物业</option>
                <option></option>
                <c:forEach items="${parentList}" var="item">
                    <option value="${item.id}"
                            <c:if test="${query.parentId==item.id }">selected</c:if>>${item.name}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-secondary radius size-L">查&nbsp;询</button>
        <button type="button" class="btn btn-secondary radius size-L" onclick="info_add();">新&nbsp;增</button>
    </form>

    <div class="panel panel-default mt-20">
        <div class="panel-header">
            数据列表
        </div>
        <div class="panel-body">
            <table class="table table-border table-bordered table-bg table-hover table-sort table-striped">
                <thead>
                <tr class="text-c">
                    <th>小区名称</th>
                    <th>支付宝编号</th>
                    <th>小区地址</th>
                    <th>热线电话</th>
                    <th>短信条数</th>
                    <th>打印机名称</th>
                    <th>创建时间</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${housingList}" var="item">
                    <tr class="text-c">
                        <td>${ item.name }</td>
                        <td>${ item.communityId }</td>
                        <td>${ item.address }</td>
                        <td>${ item.hotline }</td>
                        <td>${ item.messageNum }</td>
                        <td>${ item.printName }</td>
                        <td><fmt:formatDate value="${ item.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>
                            <c:if test="${ item.status==1 }">未同步</c:if>
                            <c:if test="${ item.status==2 }">已同步</c:if>
                            <c:if test="${ item.status==3 }">已初始化</c:if>
                            <c:if test="${ item.status==4 }">已上线</c:if>
                        </td>
                        <td>
                                <%--<a title="编辑" style="text-decoration:none" onClick="info_edit(${item.id })" href="javascript:;" class="c-success">编辑</a>--%>
                            <c:if test="${ item.status==1 }">
                                <a title="同步支付宝" style="text-decoration:none" onclick="housing_sync(${item.id })"
                                   href="javascript:;" class="c-success">同步支付宝</a><br>

                            </c:if>
                            <c:if test="${ item.status==2 }">
                                <a title="初始化" style="text-decoration:none" onclick="initialize(${item.id })"
                                   href="javascript:;" class="c-success">初始化</a><br>
                            </c:if>
                            <c:if test="${ item.status==3}">
                                <a title="申请服务上线" style="text-decoration:none" onclick="basicservice(${item.id })"
                                   href="javascript:;" class="c-success">申请服务上线</a><br>
                            </c:if>
                            <c:if test="${ item.status > 2}">
                                <a title="二维码" style="text-decoration:none" onclick="my_qrcode(${item.id })"
                                   href="javascript:;" class="c-success">二维码</a><br>
                            </c:if>
                            <a title="配置打印机" style="text-decoration:none" onclick="printinfo_edit(${item.id })"
                               href="javascript:;" class="c-success">配置打印机</a><br>
                            <shiro:hasAnyRoles name="super_admin">
                                <a title="短信充值" style="text-decoration:none" onclick="sms_deposit(${item.id })"
                                   href="javascript:;" class="c-success">短信充值</a><br>
                            </shiro:hasAnyRoles>
                            <a title="删除" style="text-decoration:none" onclick="info_del(this, ${item.id })"
                               href="javascript:;" class="c-success">删除</a>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br>
            <br>
        </div>
    </div>
</div>

<script type="text/javascript"
        src="${pageContext.request.contextPath}/h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/common/laydate.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        ordering: false,
        lengthChange: false,
        language: {
            search: "关键字    ",
        }
    });

    function info_add() {
        var index = layer.open({
            type: 2,
            title: "添加小区",
            content: "${pageContext.request.contextPath }/rest/housing/openHousing"
        });
        layer.full(index);
    }

    function info_edit(id) {
        var index = layer.open({
            type: 2,
            title: "修改小区",
            content: "${pageContext.request.contextPath }/rest/housing/openHousing?id=" + id
        });
        layer.full(index);
    }

    function info_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath }/rest/housing/deleteHousing',
                dataType: 'json',
                data: {
                    id: id
                },
                success: function (data) {
                    if (data.success) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    }
                },
                error: function (data) {
                    layer.msg('error!', {icon: 1, time: 1000});
                },
            });
        });
    }

    function housing_sync(id) {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath }/rest/alipay/communityCreateRequest',
            dataType: 'json',
            data: {
                id: id
            },
            success: function (data) {
                if (data.success) {
                    window.location.reload();
                    layer.msg(data.message, {icon: 1});
                } else {
                    layer.msg(data.message, {icon: 5});
                }
            },
            error: function (data) {
                layer.msg('error!', {icon: 1, time: 1000});
            },
        });
    }

    function initialize(id) {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath }/rest/alipay/basicserviceInitializeRequest',
            dataType: 'json',
            data: {
                id: id
            },
            success: function (data) {
                if (data.success) {
                    window.location.reload();
                    layer.msg(data.message, {icon: 1});
                } else {
                    layer.msg(data.message, {icon: 5});
                }
            },
            error: function (data) {
                layer.msg('error!', {icon: 1, time: 1000});
            },
        });
    }

    function basicservice(id) {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath }/rest/alipay/basicserviceModifyRequest',
            dataType: 'json',
            data: {
                id: id
            },
            success: function (data) {
                if (data.success) {
                    window.location.reload();
                    layer.msg(data.message, {icon: 1});
                } else {
                    layer.msg(data.message, {icon: 5});
                }
            },
            error: function (data) {
                layer.msg('error!', {icon: 1, time: 1000});
            },
        });
    }
    function printinfo_edit(id) {
        var index = layer.open({
            type: 2,
            title: "配置打印机",
            content: "${pageContext.request.contextPath }/rest/housing/updatePrintinfo?id=" + id
        });
        layer.full(index);
    }
    function sms_deposit(id) {
        var index = layer.open({
            type: 2,
            title: "短信充值",
            content: "${pageContext.request.contextPath }/rest/housing/smsDeposit?id=" + id
        });
        layer.full(index);
    }

    function my_qrcode(id) {
        layer_show("二维码", "${pageContext.request.contextPath }/rest/alipay/qrcode?id=" + id, 800, 500);
    }

</script>

