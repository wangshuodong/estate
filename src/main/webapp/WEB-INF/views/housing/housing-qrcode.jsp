<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<div class="page-container">
    <div class="form form-horizontal">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">二维码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <img src="${codeImage}">
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/common/jquery.qrcode.min.js"></script>
<script type="text/javascript">
    $(function() {
        var data = '${codeImage}';
        console.info(data);
        $('#code').qrcode(data);
    });
</script>