<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/share/_meta.jsp" %>
    <title>管理系统</title>
</head>
<body>
<div class="page-container">
    <div class="text-c">
        <img src="${pageContext.request.contextPath}/h-ui/common/images/alipay.png">
    </div>
<form class="form form-horizontal" id="myform">
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">发票金额：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" value="${bill.billEntryAmount}" name="billEntryAmount" readonly>
        </div>
    </div>
    <div class="row cl">
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
    </div>
    <div class="cl pd-10 bg-1 bk-gray radius mt-20">
        请输入相关信息
    </div>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">单位名称：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" value="${bill.createTime}" name="createTime">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">单位税号：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" value="${bill.createTime}" name="createTime">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">你的电话：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" value="${bill.createTime}" name="createTime">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">你的邮箱：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" value="${bill.createTime}" name="createTime">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-3 col-sm-2">备注：</label>
        <div class="formControls col-xs-9 col-sm-9">
            <input type="text" class="input-text radius size-L" value="${bill.createTime}" name="createTime">
        </div>
    </div>
    <div class="row cl">
        <div>
            <button type="submit" class="btn btn-secondary radius size-L btn-block">立即开票</button>
        </div>
    </div>
</form>
</div>
<%@ include file="/share/_footer.jsp" %>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">

</script>
</body>
</html>