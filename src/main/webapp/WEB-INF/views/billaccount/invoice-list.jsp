<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理中心 <span class="c-gray en">&gt;</span> 账单管理
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<%--<form class="codeView docs-example" action="${pageContext.request.contextPath }/rest/billAccount/invoiceList" method="post">
		<div class="form-group">
			<select class="form-control shift-info" style="width:250px" name="ticketstatus">
				<option value='' disabled selected style='display:none;'>请选择发票状态</option>
				<option value="1" <c:if test="${query_status == 1 }">selected</c:if>>审核中</option>
				<option value="2" <c:if test="${query_status == 2 }">selected</c:if>>同意</option>
				<option value="3" <c:if test="${query_status == 3 }">selected</c:if>>拒绝</option>
				<option value="3" <c:if test="${query_status == 4 }">selected</c:if>>开票成功</option>
				<option value="4" <c:if test="${query_status == 5 }">selected</c:if>>开票失败</option>
			</select>
		</div>
		<button type="submit" class="btn btn-secondary radius size-L">查&nbsp;询</button>
	</form>--%>

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
					<th>账单编号</th>
					<th>业主名</th>
					<%--<th>手机号</th>--%>
					<%--<th>身份证号</th>--%>
					<th>费用类型</th>
					<th>账期</th>
					<th>金额</th>
					<th>付款类型</th>
					<th>支付宝付款编号</th>
					<th>微信付款编号</th>
					<th>付款时间</th>
					<th>开票状态</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${billaccountList}" var="item">
					<tr class="text-c">
						<td>${ item.housingName }</td>
						<td>${ item.roominfoAddress }</td>
						<td>${ item.id }</td>
						<td>${ item.ownerName }</td>
						<%--<td>${ item.ownerPhone }</td>--%>
						<%--<td>${ item.ownerCard }</td>--%>
						<td>${ item.costTypeName }</td>
						<td>${ item.acctPeriod }</td>
						<td>${ item.billEntryAmount }</td>
						<td>
							<c:if test="${ item.paytype == 1 }">现金</c:if>
							<c:if test="${ item.paytype == 2 }">支付宝</c:if>
							<c:if test="${ item.paytype == 3 }">微信</c:if>
							<c:if test="${ item.paytype == 4 }">POS机</c:if>
							<c:if test="${ item.paytype == 99 }">其他</c:if>
						</td>
						<td>${ item.alipayTradeNo }</td>
						<td>${ item.weixinTradeNo }</td>
						<td><fmt:formatDate value="${ item.paydate }"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>申请开票</td>
						<td>
							<c:if test="${ item.ticketstatus==1 }">
								<a title="同意" style="text-decoration:none" onclick="approve(${item.id }, 2)" href="javascript:;" class="c-success">同意</a><br>
								<a title="拒绝" style="text-decoration:none" onclick="approve(${item.id }, 3)" href="javascript:;" class="c-success">拒绝</a><br>
							</c:if>
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


    function approve(id, stat) {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath }/rest/alipay/billBatchUploadRequest',
            dataType: 'json',
            data:{
                id : id,
				ticketstatus : stat
            },
            beforeSubmit: function () {
                layer.load();
            },
            success: function(data){
                layer.closeAll('loading');
                if (data.success) {
                    window.location.reload();
                }else {
                    layer.alert(data.message, {icon: 5});
                }
            },
            error:function(data) {
                layer.closeAll('loading');
                layer.msg('error!',{icon:1,time:1000});
            }
        });
    }


</script>

