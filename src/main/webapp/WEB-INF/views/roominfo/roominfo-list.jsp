<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理中心 <span class="c-gray en">&gt;</span> 小区信息
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<form class="codeView docs-example" action="${pageContext.request.contextPath }/rest/roominfo/roominfoList" method="post">
		<div class="form-group">
			<select class="form-control" name="parentId" style="width:250px">
				<option value='' disabled selected style='display:none;'>小区</option>
				<option></option>
				<c:forEach items="${parentList}" var="item">
					<option value="${item.id}" <c:if test="${query.parentId==item.id }">selected</c:if>>${item.name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<select class="form-control" name="status" style="width:250px">
				<option value='' disabled selected style='display:none;'>状态</option>
				<option></option>
				<option value="0" <c:if test="${query.status == false }">selected</c:if>>未同步</option>
				<option value="1" <c:if test="${query.status == true }">selected</c:if>>已同步</option>
			</select>
		</div>

		<button type="submit" class="btn btn-secondary radius size-L">查&nbsp;询</button>
		<button type="button" class="btn btn-secondary radius size-L" onclick="info_add();">新&nbsp;增</button>
		<button type="button" class="btn btn-secondary radius size-L" onclick="room_list_sync();">批量同步</button>
		<button type="button" class="btn btn-warning radius size-L" onclick="excel_upload();">导入房屋</button>
		<button type="button" class="btn btn-warning radius size-L" onclick="excel_download();">下载模板</button>
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
					<th>状态</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${roominfoList}" var="item">
					<tr class="text-c">
						<td>${ item.housingName }</td>
						<td>${ item.roomId }</td>
						<td>${ item.groupName }</td>
						<td>${ item.building }</td>
						<td>${ item.unit }</td>
						<td>${ item.room }</td>
						<td>${ item.address }</td>
						<td>${ item.ownerName }</td>
						<td>${ item.ownerCard }</td>
						<td>${ item.ownerPhone }</td>
						<td>${ item.entrydate }</td>
						<td>
							<c:if test="${ item.status==false }">未同步</c:if>
							<c:if test="${ item.status==true }">已同步</c:if>
						</td>
						<td>
							<c:if test="${ item.status==false }">
								<a title="同步支付宝" style="text-decoration:none" onclick="room_sync(${item.id })" href="javascript:;" class="c-success">同步支付宝</a>
							</c:if>
							<a title="业主入住" style="text-decoration:none" onClick="info_edit(${item.id })" href="javascript:;" class="c-success">业主入住</a>
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
			title: "新增房屋信息",
			content: "${pageContext.request.contextPath }/rest/roominfo/openRoominfo",
		});
		layer.full(index);
	}

    function info_edit(id){
        var index = layer.open({
            type: 2,
            title: "修改小区信息",
            content: "${pageContext.request.contextPath }/rest/roominfo/openRoominfo?id=" + id,
        });
        layer.full(index);
    }

    function info_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath }/rest/roominfo/deleteRoominfo',
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

    function room_sync(id) {
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath }/rest/alipay/roominfoUploadRequest',
			dataType: 'json',
			data:{
				id : id
			},
			beforeSubmit: function () {
				layer.load();
			},
			success: function(data){
				layer.closeAll('loading');
				if (data.success) {
                    window.location.reload();
//					layer.msg("同步支付宝成功!", {icon: 1});
//					$("#stat").html("已同步");
				}else {
					layer.msg("同步支付宝失败!", {icon: 5});
				}
			},
			error:function(data) {
				layer.closeAll('loading');
				layer.msg('error!',{icon:1,time:1000});
			},
		});
    }

    function room_list_sync() {
        layer.confirm('确认要同步吗？',function(index){
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath }/rest/alipay/allRoominfoUploadRequest',
				dataType: 'json',
				success: function(data){
					if (data.success) {
						window.location.reload();
					}else {
						layer.msg("同步支付宝失败!", {icon: 5});
					}
				},
				error:function(data) {
					layer.msg('error!',{icon:1,time:1000});
				},
			});
        });
    }
    
    function excel_upload() {
        layer_show("导入房屋","${pageContext.request.contextPath }/rest/openRoomExcel", 800, 500);
    }

    function excel_download() {
        window.location.href="${pageContext.request.contextPath }/rest/downloadRoominfo";
    }
</script>

