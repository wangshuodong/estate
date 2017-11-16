<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<div class="page-container">
    <form class="form form-horizontal" id="form-serviceinfo-add" action="${pageContext.request.contextPath }/rest/department/saveOrUpdateService" method="post">
        <input type="hidden" value="${serviceinfo.id}" name="id">
        <input type="hidden" value="${departmentId}" name="departmentId" id = "depid">
        <input type="hidden" value="1" name="type">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">应用ID：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${serviceinfo.appId}" placeholder="应用ID" name="appId">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商户私钥：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${serviceinfo.merchantPrivateKey}" placeholder="商户私钥" name="merchantPrivateKey">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">支付宝公钥：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${serviceinfo.alipayPublicKey}" placeholder="支付宝公钥" name="alipayPublicKey">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">签名方式：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${serviceinfo.signType}" placeholder="签名方式" name="signType">
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
<script type="text/javascript">
    $(function(){
    });

    $("#form-serviceinfo-add").validate({
        submitHandler:function(form) {
            var options = {
                dataType:'json',
                success:  successRes
            };
            $(form).ajaxSubmit(options);
            //非常重要，如果是false，则表明是不跳转
            //在本页上处理，也就是ajax，如果是非false，则传统的form跳转。
            return false;
        }
    });

    function successRes(data) {
        if (data.success) {
            window.parent.location.reload();
        }else {
            layer.alert(data.msg);
        }
    }

</script>