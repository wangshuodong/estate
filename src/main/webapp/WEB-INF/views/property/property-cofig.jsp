<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<div class="page-container">
    <form class="form form-horizontal" id="myform" action="" method="post">
        <input type="hidden" value="${property.id}" name="id">
        <input type="hidden" value="${departmentId}" name="departmentId" id = "depid">
        <input type="hidden" value="1" name="type">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商户账号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${property.alipayLoginId}" placeholder="商户账号" name="alipayLoginId">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商户PID：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${property.appId}" placeholder="商户PID" name="appId">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">授权TOKEN：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${property.token}" placeholder="授权TOKEN" name="token">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">支付宝代扣协议编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${property.alipayDebitNum}" placeholder="支付宝代扣协议编号" name="alipayDebitNum">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">微信代扣协议编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${property.weixinDebitNum}" placeholder="微信代扣协议编号" name="weixinDebitNum">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">微信子商户：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${property.weixinChildrenNum}" placeholder="微信子商户" name="weixinChildrenNum">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">API：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${property.api}" placeholder="API" name="api">
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
    $("#myform").validate({
        submitHandler:function(form) {
            $(form).ajaxSubmit({
                type: 'post',
                url: "${pageContext.request.contextPath }/rest/department/saveOrUpdateProperty",
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