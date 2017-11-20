<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理中心 <span class="c-gray en">&gt;</span> 账单管理
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
					<th>小区名称</th>
					<th>完整门牌</th>
					<th>业主名</th>
					<th>手机号</th>
					<th>身份证号</th>
					<th>同步状态</th>
					<th>费用类型</th>
					<th>账期</th>
					<th>应收金额</th>
					<th>付款类型</th>
					<th>付款状态</th>
					<th>支付宝付款编号</th>
					<th>微信付款编号</th>
					<th>付款时间</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${billaccountList}" var="item">
					<tr class="text-c">
						<td>${ item.deptName }</td>
						<td>${ item.roominfoaddress }</td>
						<td>${ item.ownerName }</td>
						<td>${ item.ownerPhone }</td>
						<td>${ item.ownerCard }</td>
						<td>${ item.status }</td>
						<td>${ item.costType }</td>
						<td>${ item.acctPeriod }</td>
						<td>${ item.billEntryAmount }</td>
						<td>${ item.paytype }</td>
						<td>${ item.paystatus }</td>
						<td>${ item.alipayTradeNo }</td>
						<td>${ item.weixinTradeNo }</td>
						<td>${ item.paydate }</td>
						<td width="130">
							<a title="编辑" style="text-decoration:none" onClick="info_edit(${item.id });" href="javascript:;" class="c-success">编辑</a>
							<a title="删除" style="text-decoration:none" onclick="info_del(this, ${item.id });" href="javascript:;" class="c-success">删除</a>
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
			title: "新增账单",
			content: "${pageContext.request.contextPath }/rest/billAccount/addBillAccount"
		});
		layer.full(index);
	}

    function info_edit(id){
        var index = layer.open({
            type: 2,
            title: "修改账单",
            content: "${pageContext.request.contextPath }/rest/billAccount/updateBillAccount?id=" + id
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

