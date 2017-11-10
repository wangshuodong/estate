<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../share/_meta.jsp" %>
<%@ include file="../share/_footer.jsp" %>


<div class="page-container">
    <form class="form form-horizontal" id="form-article-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>角色名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="" placeholder="角色名" name="roleName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">角色描述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="" placeholder="角色描述" name="">
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
            </div>
        </div>
    </form>
</div>
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
                pIdKey: "parentid"
            }
        }
    };
    var treeObj;
    var zNodes = ${menuList};
    console.info(zNodes);
    $(document).ready(function(){
        treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });

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
            async: false,
            success : function() {
                window.parent.location.reload();
            }
        });
    }
</script>