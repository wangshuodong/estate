<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<div class="page-container">
    <form class="form form-horizontal" id="myform" action="" method="post">
        <input type="hidden" value="${roominfo.id}" name="id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所属小区：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="form-control" name="departmentId" required>
                    <option></option>
                    <c:forEach items="${parentList}" var="item">
                        <option value="${item.id}" <c:if test="${billaccount.departmentId==item.id }">selected</c:if>>${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">组团：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${roominfo.groupName}" placeholder="组团" name="groupName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>楼栋：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${roominfo.building}" placeholder="楼栋" name="building" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>单元：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${roominfo.unit}" placeholder="单元" name="unit" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>房号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${roominfo.room}" placeholder="房号" name="room" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">业主姓名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${roominfo.ownerName}" placeholder="业主姓名" name="ownerName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">业主身份证：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${roominfo.ownerCard}" placeholder="业主身份证" name="ownerCard">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">业主电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${roominfo.ownerPhone}" placeholder="业主电话" name="ownerPhone">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">同步状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.status}" placeholder="同步状态" name="status" id="status">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">费用类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.costType}" placeholder="费用类型" name="costType" id="costType">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">账期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.acctPeriod}" placeholder="账期" name="acctPeriod" id="acctPeriod">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">应收金额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.billEntryAmount}" placeholder="应收金额" name="billEntryAmount" id="billEntryAmount">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">付款类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.paytype}" placeholder="付款类型" name="paytype" id="paytype">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">付款状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.paystatus}" placeholder="付款状态" name="paystatus" id="paystatus">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">支付宝回传编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.alipayTradeNo}" placeholder="支付宝回传编号" name="alipayTradeNo" id="alipayTradeNo">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">微信回传编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.weixinTradeNo}" placeholder="微信回传编号" name="weixinTradeNo" id="weixinTradeNo">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">付款时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.paydate}" placeholder="付款时间" name="paydate" id="paydate">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button type="submit" class="btn btn-secondary radius size-L">保&nbsp;存</button>
                <button type="button" class="btn btn-secondary radius size-L" onclick="layer_close();">取&nbsp;消</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/common/laydate.js"></script>
<script type="text/javascript">
    $(function(){
        laydate.render({
            elem: '#entrydate' //指定元素
        });
    });

    $("#myform").validate({
        submitHandler:function(form) {
            $(form).ajaxSubmit({
                type: 'post',
                url: "${pageContext.request.contextPath }/rest/roominfo/saveOrUpdateRoominfo",
                beforeSubmit: function () {
                    layer.load();
                },
                success: function(data){
                    if (data.success) {
                        window.parent.location.reload();
                    }else {
                        layer.msg(data.message);
                    }
                },
                error: function(XmlHttpRequest, textStatus, errorThrown){
                    layer.closeAll('loading');
                    layer.msg('error!',{icon:1,time:1000});
                }
            });
        }
    });
</script>