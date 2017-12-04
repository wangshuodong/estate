<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理中心 <span class="c-gray en">&gt;</span> 账单管理
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<form class="codeView docs-example" action="${pageContext.request.contextPath }/rest/billAccount/invoiceList" method="post">
		<input type="text" placeholder="账单编号" class="input-text radius size-L" style="width:250px" name="id">
		<div class="form-group">
			<select class="form-control" style="width:250px" name="housingId" id="housingId">
				<option value=''>所有小区</option>
				<c:forEach items="${parentList}" var="item">
					<option value="${item.id}" <c:if test="${query.housingId==item.id }">selected</c:if>>${item.name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<select class="form-control shift-info" style="width:250px" name="costType">
				<option value=''>所有费用类型</option>
				<c:forEach items="${costList}" var="item">
					<option value="${item.id}" <c:if test="${query.costType==item.id }">selected</c:if>>${item.name}</option>
				</c:forEach>
			</select>
		</div>
		<br>
		<%--<div class="form-group" id="roomdoc">--%>
		<%--<select class="form-control shift-info" style="width:250px" name="roominfoId" id="roominfoId">--%>
		<%--<option value=''>所有房间</option>--%>
		<%--</select>--%>
		<%--</div>--%>
		<div class="form-group mt-20">
			<button type="submit" class="btn btn-secondary radius size-L">查&nbsp;询</button>
		</div>
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
						<td>未开票</td>
						<td>
							<c:if test="${ item.ticketstatus==0 }">
								<a title="开电子发票" style="text-decoration:none" onclick="approve(${item.id })" href="javascript:;" class="c-success">开电子发票</a><br>
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


    function approve(id) {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath }/rest/nuonuoInvoice',
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

