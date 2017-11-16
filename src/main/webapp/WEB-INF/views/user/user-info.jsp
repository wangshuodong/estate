<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<div class="page-container">
    <form class="form form-horizontal" id="form-user-add" action="${pageContext.request.contextPath }/rest/user/saveOrUpdateUser" method="post">
        <input type="hidden" value="${user.id}" name="id">
        <input type="hidden" value="1" name="type">
        <input type="hidden" value="${user.departmentId}" id="selectId1">

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>登陆名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${user.username}" placeholder="用户名" id="nameId" name="username"
                       onblur="checkUsername();" <c:if test="${user.username!=null }">disabled</c:if> required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>部门名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="form-control" name="departmentId" id="parentId">
                    <c:forEach items="${parentDepartment}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">用户昵称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${user.name}" placeholder="用户昵称" name="name" >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">联系电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${user.phone}" placeholder="联系电话" name="phone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">联系邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${user.email}" placeholder="联系邮箱" name="email">
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
        var parent = $("#selectId1").val();
        console.log(parent);
        if(parent != null){
            $("#parentId").val(parent);
        }
    });

    $("#form-user-add").validate({
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

    function checkUsername() {
        $.ajax({
            url : '${pageContext.request.contextPath }/rest/user/checkUserName',
            type : 'post',
            data : {
                'username': $('#nameId').val()
            },
            success : function(data) {
                if (data.success) {
                }else {
                    layer.alert(data.message);
                }
            }
        });
    }

</script>