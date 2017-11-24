<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理中心 <span class="c-gray en">&gt;</span> 账单管理
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<form class="codeView docs-example" action="${pageContext.request.contextPath }/rest/billAccount/billAccountList" method="post">
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
				<option value="1">物业管理费</option>
				<option value="2">水电公摊费</option>
				<option value="3">垃圾清运费</option>
				<option value="4">公共照明费</option>
				<option value="5">水费</option>
				<option value="6">电费</option>
				<option value="7">蒸汽费</option>
				<option value="99">其他</option>
			</select>
		</div>
		<div class="form-group">
			<select class="form-control shift-info" style="width:250px" name="paystatus">
				<option value=''>付款状态</option>
				<option value="0" <c:if test="${query.paystatus == false }">selected</c:if>>未付款</option>
				<option value="1" <c:if test="${query.paystatus == true }">selected</c:if>>已付款</option>
			</select>
		</div>
		<div class="form-group">
			<select class="form-control shift-info" style="width:250px" name="status">
				<option value=''>同步状态</option>
				<option value="0" <c:if test="${query.status == false }">selected</c:if>>未同步</option>
				<option value="1" <c:if test="${query.status == true }">selected</c:if>>已同步</option>
			</select>
		</div>
		<%--<div class="form-group" id="roomdoc">--%>
			<%--<select class="form-control shift-info" style="width:250px" name="roominfoId" id="roominfoId">--%>
				<%--<option value=''>所有房间</option>--%>
			<%--</select>--%>
		<%--</div>--%>
		<div class="form-group mt-20">
		<button type="submit" class="btn btn-secondary radius size-L">查&nbsp;询</button>
		<button type="button" class="btn btn-secondary radius size-L" onclick="info_add();">新&nbsp;增</button>
		<button type="button" class="btn btn-secondary radius size-L" onclick="room_list_sync();">批量同步</button>
		<button type="button" class="btn btn-warning radius size-L" onclick="excel_upload();">导入账单</button>
		<button type="button" class="btn btn-warning radius size-L" onclick="excel_download();">下载模板</button>
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
					<th>应收金额</th>
					<th>付款类型</th>
					<th>付款状态</th>
					<th>支付宝付款编号</th>
					<th>微信付款编号</th>
					<th>付款时间</th>
					<th>创建时间</th>
					<th>同步状态</th>
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
						<td>
							<c:if test="${ item.costType == 1 }">物业管理费</c:if>
							<c:if test="${ item.costType == 2 }">水电公摊费</c:if>
							<c:if test="${ item.costType == 3 }">垃圾清运费</c:if>
							<c:if test="${ item.costType == 4 }">公共照明费</c:if>
							<c:if test="${ item.costType == 5 }">水费</c:if>
							<c:if test="${ item.costType == 6 }">电费</c:if>
							<c:if test="${ item.costType == 7 }">蒸汽费</c:if>
							<c:if test="${ item.costType == 99 }">其他</c:if>
						</td>
						<td>${ item.acctPeriod }</td>
						<td>${ item.billEntryAmount }</td>
						<td>${ item.paytype }</td>
						<td>
							<c:if test="${ item.paystatus == false }">未付款</c:if>
							<c:if test="${ item.paystatus == true }">已付款</c:if>
						</td>
						<td>${ item.alipayTradeNo }</td>
						<td>${ item.weixinTradeNo }</td>
						<td>${ item.paydate }</td>
						<td><fmt:formatDate value="${ item.createTime }"  pattern="yyyy-MM-dd"/></td>
						<td>
							<c:if test="${ item.status == false }">未同步</c:if>
							<c:if test="${ item.status == true }">已同步</c:if>
						</td>
						<td>
							<c:if test="${ item.paystatus==false }">
								<c:if test="${ item.status==false }">
									<a title="同步支付宝" style="text-decoration:none" onclick="room_sync(${item.id })" href="javascript:;" class="c-success">同步支付宝</a><br>
								</c:if>
								<a title="账单收款" style="text-decoration:none" onclick="bill_receiv(${item.id })" href="javascript:;" class="c-success">账单收款</a><br>
								<a title="编辑" style="text-decoration:none" onClick="info_edit(${item.id });" href="javascript:;" class="c-success">编辑</a>
								<a title="删除" style="text-decoration:none" onclick="info_del(this, ${item.id });" href="javascript:;" class="c-success">删除</a>
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

    <%--function roomEdit() {--%>
        <%--$('#roominfoId').editableSelect({--%>
            <%--effects: 'default',--%>
            <%--onSelect: function (element) {--%>
                <%--$('.shift-info').attr('data-val', element.val());--%>
            <%--}--%>
        <%--}).prop('placeholder', '房间');--%>
    <%--}--%>

    <%--//注册小区下拉框事件--%>
    <%--$("#housingId").change(function(){--%>
        <%--changChild($(this).val());--%>
    <%--});--%>

    <%--function changChild(tid){--%>
        <%--$.post("${pageContext.request.contextPath }/rest/roominfo/queryParentRoomById",{"housingId":tid},function(json){--%>
            <%--$("#roomdoc").html("");--%>
            <%--var $dom_one = "<select class=\"form-control shift-info\" style=\"width:250px\" name=\"roominfoId\" id=\"roominfoId\">" +--%>
				<%--"<option value=''>所有房间</option>";--%>
            <%--for(var i=0;i<json.length;i++){--%>
                <%--//添加一个房屋--%>
                <%--$dom_one += "<option value='"+json[i].id+"'>"+json[i].name+"</option>";--%>
            <%--}--%>
            <%--$dom_one += "</select>";--%>
            <%--$("#roomdoc").html($dom_one);--%>
            <%--roomEdit();--%>
        <%--},'json');--%>
    <%--}--%>

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

    function bill_receiv(id){
        var index = layer.open({
            type: 2,
            title: "账单收款",
            content: "${pageContext.request.contextPath }/rest/billAccount/receivBillAccount?id=" + id
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

