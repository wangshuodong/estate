<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理中心 <span class="c-gray en">&gt;</span> 用户管理
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<form class="codeView docs-example" action="${pageContext.request.contextPath }/rest/user/userList" method="post">
		<div class="form-group">
			<select class="form-control" name="roleId" style="width:250px">
				<option value="0">请选择角色</option>
				<c:forEach items="${roleList}" var="item">
					<option value="${item.id}" <c:if test="${item.id == query.roleId}">selected</c:if>>${item.name}</option>
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
					<th>登陆名</th>
					<th>用户昵称</th>
					<th>用户密码</th>
					<th>角色名称</th>
					<th>联系电话</th>
					<th>联系邮箱</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${userList}" var="item">
					<tr class="text-c">
						<td>${ item.username }</td>
						<td>${ item.name }</td>
						<td>${ item.password }</td>
						<td>${ item.roleName }</td>
						<td>${ item.phone }</td>
						<td>${ item.email }</td>
						<td class="td-status"><c:if test="${ item.enable == true }">已启用</c:if><c:if test="${ item.enable == false }">已禁用</c:if></td>
						<td class="td-manage" width="130">
							<c:if test="${item.enable == true}">
								<a style="text-decoration:none" onClick="admin_stop(this,${item.id })" href="javascript:;" title="停用" class="c-success">停用</a>
							</c:if>
							<c:if test="${item.enable == false}">
								<a style="text-decoration:none" onClick="admin_start(this,${item.id })" href="javascript:;" title="启用" class="c-success">启用</a>
							</c:if>
							<a title="编辑" style="text-decoration:none" onClick="info_edit(${item.id })" href="javascript:;" class="c-success">编辑</a>
							<a title="删除" style="text-decoration:none" onclick="info_del(this, ${item.id })" href="javascript:;" class="c-success">删除</a>
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
        language: {
            search: "关键字    ",
        }
    });

	function info_add(){
		var index = layer.open({
			type: 2,
			title: "新增用户",
			content: "${pageContext.request.contextPath }/rest/user/openUser"
		});
		layer.full(index);
	}

    function info_edit(id){
        var index = layer.open({
            type: 2,
            title: "修改用户",
            content: "${pageContext.request.contextPath }/rest/user/openUser?id=" + id
        });
        layer.full(index);
    }

    function info_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath }/rest/user/deleteUser',
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
                    console.log(data.msg);
                },
            });
        });
    }

	/*管理员-停用*/
    function admin_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            info_active(id, false);
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="admin_start(this,'+id+')" href="javascript:;" title="启用" class="c-success">启用</a>');
            $(obj).parents("tr").find(".td-status").html('已禁用');
            $(obj).remove();
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

	/*管理员-启用*/
    function admin_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            info_active(id, true);
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="admin_stop(this,'+id+')" href="javascript:;" title="停用" class="c-success">停用</a>');
            $(obj).parents("tr").find(".td-status").html('已启用');
            $(obj).remove();
            layer.msg('已启用!', {icon: 6,time:1000});
        });
    }

    function info_active(id, status){
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath }/rest/user/activeUser',
			dataType: 'json',
			data:{
				id : id,
                enable: status
			}
		});
    }
</script>

