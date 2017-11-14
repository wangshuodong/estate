<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<link rel="stylesheet" href="https://cache.amap.com/lbs/static/main.css"/>
<style type="text/css">
    body {
        font-size: 12px;
    }
    #tip {
        background-color: #ddf;
        color: #333;
        border: 1px solid silver;
        box-shadow: 3px 4px 3px 0px silver;
        position: absolute;
        top: 55px;
        right: 10px;
        border-radius: 5px;
        overflow: hidden;
        line-height: 20px;
    }
    #tip input[type="text"] {
        height: 40px;
        border: 0;
        padding-left: 5px;
        width: 280px;
        border-radius: 3px;
        outline: none;
    }
</style>
<div class="page-container">
    <form class="form form-horizontal" id="form-department-add" action="${pageContext.request.contextPath }/rest/department/saveOrUpdateDepartment" method="post">
        <input type="hidden" value="${department.id}" name="id">
        <input type="hidden" value="3" name="type">
        <input type="hidden" value="${department.parentId}" id="selectId1">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>小区名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${department.name}" placeholder="服务商名称" name="name" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>上级物业：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="form-control" name="parentId" id="parentId" validate="required:true" min="1">
                    <option value="0">请选择</option>
                    <c:forEach items="${parentDepartment}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">区域：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${department.region}" placeholder="区域" name="region">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">联系人：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${department.contactPeople}" placeholder="联系人" name="contactPeople">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">联系电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${department.phone}" placeholder="联系电话" name="phone">
            </div>
        </div>

        <div class="row cl" style="height: 450px;">
            <label class="form-label col-xs-4 col-sm-2">经纬度：</label>
            <div class="formControls col-xs-8 col-sm-9" style="height: 400px;">
                <input type="text" class="input-text radius size-L" value="${department.phone}" placeholder="经纬度" name="communityLocations" id="poi">
                <div id="mapContainer" class="bk-gray" style="margin-left:15px;margin-top:45px;"></div>
                <div id="tip">
                    <input type="text" id="keyword" name="keyword" value="请输入关键字：(选定后搜索)" onfocus='this.value=""'/>
                </div>
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
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.1&key=44dee8ce7187e4a17d7351341daff62c"></script>
<script type="text/javascript" src="https://webapi.amap.com/demos/js/liteToolbar.js"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<script type="text/javascript">
    /*地图添加点*/
    var windowsArr = [];
    var marker = [];
    var map = new AMap.Map("mapContainer", {
        resizeEnable: true,
//        center: [116.40, 39.91],//地图中心点
//        zoom: 13,//地图显示的缩放级别
//        keyboardEnable: false
    });
    AMap.plugin(['AMap.Autocomplete','AMap.PlaceSearch'],function(){
        var autoOptions = {
            city: "", //城市，默认全国
            input: "keyword"//使用联想输入的input的id
        };
        autocomplete= new AMap.Autocomplete(autoOptions);
        var placeSearch = new AMap.PlaceSearch({
            city:'',
            map:map
        })
        AMap.event.addListener(autocomplete, "select", function(e){
            //TODO 针对选中的poi实现自己的功能
            //placeSearch.setCity(e.poi.adcode);
            //placeSearch.search(e.poi.name)
            map.setZoom(15);
            map.setCenter(e.poi.location);
        });
    });
    var clickEventListener = map.on('click', function(e) {
        document.getElementById("poi").value = e.lnglat.getLng() + ',' + e.lnglat.getLat()
    });
    /*地图添加点*/


    $(function(){
        var parent = $("#selectId1").val();;
        if(parent != null){
            $("#parentId").val(parent);
        }
    });

    $("#form-department-add").validate({
        messages: {
            parentId: {
                min: "必须选择上级服务商"
            }
        },
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
            url : '${pageContext.request.contextPath }/rest/department/saveOrUpdateRole',
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