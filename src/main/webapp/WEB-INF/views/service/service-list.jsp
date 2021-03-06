﻿﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理中心 <span class="c-gray en">&gt;</span> 服务商管理
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<div class="codeView docs-example">
		<button type="button" class="btn btn-secondary radius size-L" onclick="info_add();">新&nbsp;增</button>
	</div>

	<div class="panel panel-default mt-20">
		<div class="panel-header">
			数据列表
		</div>
		<div class="panel-body">
			<table class="table table-border table-bordered table-bg table-hover table-sort table-striped">
				<thead>
				<tr class="text-c">
					<th>ID</th>
					<th>服务商名称</th>
					<th>区域</th>
					<th>联系人</th>
					<th>联系地址</th>
					<th>联系电话</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${serviceList}" var="item">
					<tr class="text-c">
						<td>${ item.id }</td>
						<td>${ item.name }</td>
						<td>${ item.region }</td>
						<td>${ item.contactPeople }</td>
						<td>${ item.contactAddress }</td>
						<td>${ item.contactPhone }</td>
						<td width="130">
							<a title="编辑" style="text-decoration:none" onClick="info_edit(${item.id });" href="javascript:;" class="c-success">编辑</a>
							<a title="删除" style="text-decoration:none" onclick="info_del(this, ${item.id });" href="javascript:;" class="c-success">删除</a>
							<shiro:hasAnyRoles name="super_admin">
								<a title="配置公钥" style="text-decoration:none" onclick="key_edit(${item.id });" href="javascript:;" class="c-success">配置公钥</a>
							</shiro:hasAnyRoles>
							<%--<shiro:hasPermission name="service:create">
								<span class="pipe"> |</span>
								<a title="应用信息" style="text-decoration:none" onclick="role_del(this, ${item.id })" href="javascript:;" class="c-success">应用信息1</a>
							</shiro:hasPermission>--%>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	$('.table-sort').dataTable({
		ordering: false,
        lengthChange: false,
        iDisplayLength: 20,
        language: {
            search: "关键字    ",
		}
	});

	function info_add(){
		var index = layer.open({
			type: 2,
			title: "新增服务商",
			content: "${pageContext.request.contextPath }/rest/service/openService"
		});
		layer.full(index);
	}

    function info_edit(id){
        var index = layer.open({
            type: 2,
            title: "修改服务商",
            content: "${pageContext.request.contextPath }/rest/service/openService?id=" + id
        });
        layer.full(index);
    }

    function info_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath }/rest/service/deleteServicer',
                dataType: 'json',
                data:{
                    id : id
                },
                success: function(data){
                    if (data.success) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!',{icon:1,time:1000});
                    }
                },
                error:function(data) {
                    layer.msg('error!',{icon:1,time:1000});
                },
            });
        });
    }

    function key_edit(id){
        var index = layer.open({
            type: 2,
            title: "配置公钥",
            content: "${pageContext.request.contextPath }/rest/service/updateServicekey?id=" + id,
        });
        layer.full(index);
    }
</script>

