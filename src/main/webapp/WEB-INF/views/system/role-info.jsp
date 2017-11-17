<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/h-ui/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css">

<div class="page-container">
    <form class="form form-horizontal" id="form-role-add" action="${pageContext.request.contextPath }/rest/role/saveOrUpdateRole" method="post">
        <input type="hidden" value="${role.id}" name="id" id="id">
        <input type="hidden" name="menuIds" id="menuIds">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>角色名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${role.name}" placeholder="角色名" id="name" name="name" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">角色描述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${role.description}" placeholder="角色描述" id="description" name="description">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">菜单权限：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <ul id="treeDemo" class="ztree"></ul>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript">
    var setting = {
        check: {
            enable: true
        },
        view: {
            showLine: false
        },
        data: {
            simpleData: {
                enable: true,
                pIdKey: "parentId"
            }
        }
    };
    var treeObj;
    var zNodes = ${menuList};
    //console.info(zNodes);
    $(document).ready(function(){
        treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });

    $("#form-role-add").validate({
        submitHandler:function(form){
            saveOrUpdate();
        }
    });

    function successRes(jsonData) {
        console.info(jsonData);
        //window.parent.location.reload();
    }
    
    function saveOrUpdate() {
        var nodes=treeObj.getCheckedNodes(true);
        var menuIds = "";
        for(var i=0;i<nodes.length;i++) {
            if (i == nodes.length-1) {
                menuIds += nodes[i].id
            }else {
                menuIds += nodes[i].id + ","
            }
        }
        $.ajax({
            url : '${pageContext.request.contextPath }/rest/role/saveOrUpdateRole',
            type : 'post',
            data : {
                'id': $('#id').val(),
                'name': $('#name').val(),
                'description': $('#description').val(),
                'menuIds' : menuIds
            },
            success : function(data) {
                if (data.success) {
                    window.parent.location.reload();
                }
            }
        });
    }
</script>