<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理中心 <span class="c-gray en">&gt;</span> 小区管理
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<form class="codeView docs-example" action="${pageContext.request.contextPath }/rest/department/housingList" method="post">
		<div class="form-group">
			<select class="form-control" name="parentId" id="parentId" style="width:250px">
				<option value="0">请选择所属物业</option>
				<c:forEach items="${parentList}" var="item">
					<option value="${item.id}" <c:if test="${query.parentId==item.id }">selected</c:if>>${item.name}</option>
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
					<th>上级名称</th>
					<th>区域</th>
					<th>联系地址</th>
					<th>联系电话</th>
					<th>创建时间</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${departmentList}" var="item">
					<tr class="text-c">
						<td>${ item.name }</td>
						<td>${ item.parentName }</td>
						<td>${ item.region }</td>
						<td>${ item.address }</td>
						<td>${ item.phone }</td>
						<td><fmt:formatDate value="${ item.createTime }"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<c:if test="${ item.status=='NEW' }"><td>未同步</td></c:if>
						<c:if test="${ item.status=='PENDING_ONLINE' }"><td>待上线</td></c:if>
						<c:if test="${ item.status=='ONLINE' }"><td>上线</td></c:if>
						<c:if test="${ item.status=='MAINTAIN' }"><td>维护中</td></c:if>
						<c:if test="${ item.status=='OFFLINE' }"><td>下线</td></c:if>
						<td width="120">
							<a title="编辑" style="text-decoration:none" onClick="info_edit(${item.id })" href="javascript:;" class="c-success">编辑</a>
							<a title="删除" style="text-decoration:none" onclick="info_del(this, ${item.id })" href="javascript:;" class="c-success">删除</a><br>
							<a title="参数配置" style="text-decoration:none" onclick="housing_sync(${item.id })" href="javascript:;" class="c-success">同步支付宝</a>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/common/laydate.js"></script>
<script type="text/javascript">
	$('.table-sort').dataTable({
		scrollX: true,
		ordering: false
	});

	function info_add(){
		var index = layer.open({
			type: 2,
			title: "添加小区",
			content: "${pageContext.request.contextPath }/rest/department/addDepartment?type=3"
		});
		layer.full(index);
	}

    function info_edit(id){
        var index = layer.open({
            type: 2,
            title: "修改小区",
            content: "${pageContext.request.contextPath }/rest/department/updateDepartment?id=" + id + "&type=3"
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

    function housing_sync(id) {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath }/rest/alipay/alipayEcoCplifeCommunityCreateRequest',
            dataType: 'json',
            data:{
                deptId : id
            },
            success: function(data){
                if (data.success) {
                    window.location.reload();
                    layer.msg(data.message, {icon: 1});
                }else {
                    layer.msg(data.message, {icon: 5});
                }
            },
            error:function(data) {
                console.log(data.msg);
            },
        });
    }
</script>

