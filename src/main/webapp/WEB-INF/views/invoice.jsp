<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/share/_meta.jsp" %>
    <title>发票页面</title>
</head>
<body>
<div class="page-container">
<form class="form form-horizontal" id="myform" method="post" action="${pageContext.request.contextPath }/rest/page/invoiceAdd">
    <input type="hidden" value="${bill.id}" name="billaccountId">
    <div class="cl pd-10 bg-1 bk-gray radius mt-20">
        请输入相关信息
    </div>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">发票类型：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" value="增值税普通电子发票" disabled>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">发票金额：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" value="${bill.billEntryAmount}" name="amount" readonly>
        </div>
    </div>
    <%--<div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">订单号：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" value="${bill.id}" name="id" readonly>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">订单日期：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" value="${bill.createTime}" name="createTime" readonly>
        </div>
    </div>--%>
    <%--<div class="row cl">--%>
        <%--<label class="form-label col-xs-3 col-sm-2">选择抬头：</label>--%>
        <%--<div class="formControls col-xs-9 col-sm-9">--%>
            <%--<input type="text" class="input-text radius size-L" value="${bill.createTime}" name="createTime">--%>
        <%--</div>--%>
    <%--</div>--%>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">抬头类型：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <select class="form-control shift-info" name="type" required>
                <option value="0">企业</option>
                <option value="1">个人</option>
            </select>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">发票抬头：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" value="增值税普通电子发票" name="titleName" required>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">税号：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" name="registerNo">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">你的电话：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" name="phone">
        </div>
    </div>
    <div class="cl mt-20">
        <button type="submit" class="btn btn-secondary radius size-L btn-block">立即开票</button>
    </div>
</form>
</div>
<%@ include file="/share/_footer.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">

</script>
</body>
</html>