<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<div class="page-container">
    <form class="form form-horizontal" id="myform">
        <input type="hidden" value="${propertyinfo.id}" name="id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>物业名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${propertyinfo.name}" placeholder="物业名称" name="name" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>上级服务商或物业：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="form-control" name="parentId" id="parentId" required>
                    <option value='' disabled selected style='display:none;'>请选择服务商或物业</option>
                    <c:forEach items="${parentList}" var="item">
                        <option value="${item.id}" <c:if test="${item.id == propertyinfo.parentId}">selected</c:if>>${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">联系人：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${propertyinfo.contactPeople}" placeholder="联系人" name="contactPeople">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">联系电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${propertyinfo.contactPhone}" placeholder="联系电话" name="contactPhone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">联系地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${propertyinfo.contactAddress}" placeholder="联系地址" name="contactAddress">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商户账号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${propertyinfo.alipayLoginId}" placeholder="商户账号" name="alipayLoginId">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商户PID：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${propertyinfo.appId}" placeholder="商户PID" name="appId">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">授权TOKEN：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${propertyinfo.token}" placeholder="授权TOKEN" name="token">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">支付宝代扣协议编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${propertyinfo.alipayDebitNum}" placeholder="支付宝代扣协议编号" name="alipayDebitNum">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">微信代扣协议编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${propertyinfo.weixinDebitNum}" placeholder="微信代扣协议编号" name="weixinDebitNum">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">微信子商户：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${propertyinfo.weixinChildrenNum}" placeholder="微信子商户" name="weixinChildrenNum">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">API：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${propertyinfo.api}" placeholder="API" name="api">
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
                url: "${pageContext.request.contextPath }/rest/property/saveOrUpdateProperty" ,
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