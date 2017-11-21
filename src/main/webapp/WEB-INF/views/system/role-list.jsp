<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/h-ui/common/jquery.editable-select.min.css" />

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理中心 <span class="c-gray en">&gt;</span> 角色管理
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<form class="codeView docs-example">
		<input type="text" placeholder="物业名称" class="input-text radius size-L" style="width:250px">
		<input type="text" placeholder="物业公司" class="input-text radius size-L" style="width:250px">
		<div class="form-group">
			<select class="form-control shift-info" id="selects1" style="width:250px">
				<option value="0">全部栏目</option>
				<option value="1">新闻资讯</option>
				<option value="11">├行业动态</option>
				<option value="12">├行业资讯</option>
				<option value="13">├行业新闻</option>
			</select>
		</div>
		<button type="submit" class="btn btn-secondary radius size-L">查&nbsp;询</button>
		<button type="button" class="btn btn-secondary radius size-L" onclick="addRole();">新&nbsp;增</button>
	</form>

	<div class="panel panel-default mt-20">
		<div class="panel-header">
			数据列表
		</div>
		<div class="panel-body">
			<table class="table table-border table-bg table-hover table-sort table-striped">
				<thead>
				<tr class="text-c">
					<th>ID</th>
					<th>角色名</th>
					<th>描述</th>
					<th>创建时间</th>
					<th width="120">操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${roleList}" var="item">
					<tr class="text-c">
						<td>${ item.id }</td>
						<td>${ item.name }</td>
						<td>${ item.description }</td>
						<td><fmt:formatDate value="${ item.createTime }"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>
							<a title="编辑" style="text-decoration:none" onClick="role_edit(${item.id })" href="javascript:;" class="c-success">编辑</a><span class="pipe"> |</span>
							<a title="删除" style="text-decoration:none" onclick="role_del(this, ${item.id })" href="javascript:;" class="c-success">删除</a>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/common/jquery.editable-select.min.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        ordering: false,
        lengthChange: false,
        language: {
            search: "关键字    ",
        }
    });

	$('#selects1').editableSelect({
		effects: 'slide',
		onSelect: function (element) {
			$('.shift-info').attr('data-val', element.val());
			//getCompanyAdress()
		}
	}).prop('placeholder', '请选择或输入筛选...');

	function addRole(){
		var index = layer.open({
			type: 2,
			title: "添加角色",
			content: "${pageContext.request.contextPath }/rest/role/openRole"
		});
		layer.full(index);
	}

    function role_edit(id){
        var index = layer.open({
            type: 2,
            title: "修改角色",
            content: "${pageContext.request.contextPath }/rest/role/openRole?roleId=" + id
        });
        layer.full(index);
    }

    function role_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath }/rest/role/deleteRole',
                dataType: 'json',
                data:{
                    roleId : id
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

