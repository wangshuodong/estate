<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理中心 <span class="c-gray en">&gt;</span> 角色管理
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<form class="codeView docs-example" action="${pageContext.request.contextPath }/rest/roominfo/roominfoList" method="post">
		<div class="form-group">
			<select class="form-control" name="departmentId" style="width:250px">
				<option value="0">请选择所属小区</option>
				<c:forEach items="${parentList}" var="item">
					<option value="${item.id}" <c:if test="${query.departmentId==item.id }">selected</c:if>>${item.name}</option>
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
					<th>支付宝房屋编号</th>
					<th>组团</th>
					<th>楼栋</th>
					<th>单元</th>
					<th>房号</th>
					<th>完整门牌</th>
					<th>业主姓名</th>
					<th>业主身份证</th>
					<th>业主电话</th>
					<th>入住时间</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${roominfoList}" var="item">
					<tr class="text-c">
						<td>${ item.deptName }</td>
						<td>${ item.roomId }</td>
						<td>${ item.groupName }</td>
						<td>${ item.building }</td>
						<td>${ item.unit }</td>
						<td>${ item.room }</td>
						<td>${ item.address }</td>
						<td>${ item.ownerName }</td>
						<td>${ item.ownerCard }</td>
						<td>${ item.ownerPhone }</td>
						<td><fmt:formatDate value="${ item.entrydate }"  pattern="yyyy-MM-dd"/></td>
						<td width="130">
							<a title="编辑" style="text-decoration:none" onClick="info_edit(${item.id })" href="javascript:;" class="c-success">编辑</a>
							<a title="删除" style="text-decoration:none" onclick="info_del(this, ${item.id })" href="javascript:;" class="c-success">删除</a>
							<a title="参数配置" style="text-decoration:none" onclick="role_del(this, ${item.id })" href="javascript:;" class="c-success">参数配置</a>
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
		scrollX: true,
		ordering: false
	});

	function info_add(){
		var index = layer.open({
			type: 2,
			title: "新增房屋信息",
			content: "${pageContext.request.contextPath }/rest/roominfo/addRoominfo",
		});
		layer.full(index);
	}

    function info_edit(id){
        var index = layer.open({
            type: 2,
            title: "修改角色",
            content: "${pageContext.request.contextPath }/rest/roominfo/updateRoominfo?id=" + id,
        });
        layer.full(index);
    }

    function info_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath }/rest/department/deleteDepartment',
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
</script>

