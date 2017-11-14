<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>

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
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">联系地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${department.address}" placeholder="联系地址" name="address">
            </div>
        </div>
        <div class="row cl" style="height: 400px;">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>选择地址：</label>
            <div class="col-sm-4" style="height: 300px">
                <div><input style="width: 300px" type="text" class="input-text" placeholder="请输入关键字进行搜索" id="tipinput"></div>
                <div id="container" style="top: 35px"></div>
                <div class="button-group">
                    <input style="margin-bottom: -120px;margin-right: -30px;" type="button" class="button" value="删除点标记" id="clearMarker"/>
                </div>
                <div id="myPageTop" style="top: 330px;width:368px;margin-right: -10px">
                    <table>
                        <tr>
                            <td >
                                <label>经纬度：</label><input type="text" class="input-text" readonly="true" id="lnglat">
                            </td>
                        </tr>
                    </table>
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
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.1&key=b21500f54849d2d0d9a5c2057cca62be&plugin=AMap.Autocomplete"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<script type="text/javascript">
    /*地图添加点*/
    var marker;
    var markers =[];
    var longitude = null;//经度
    var latitude = null;//纬度
    var map = new AMap.Map("container", {
        resizeEnable: true
    });
    //为地图注册click事件获取鼠标点击出的经纬度坐标
    var clickEventListener = map.on('click', function(e) {
        document.getElementById("lnglat").value = e.lnglat.getLng() + ',' + e.lnglat.getLat()
        longitude = e.lnglat.getLng();
        latitude = e.lnglat.getLat();
        addMarker(e.lnglat.getLng(),e.lnglat.getLat());
    });
    var auto = new AMap.Autocomplete({
        input: "tipinput"
    });
    AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
    function select(e) {
        if (e.poi && e.poi.location) {
            map.setZoom(15);
            map.setCenter(e.poi.location);
        }
    }
    function addMarker(a,b) {
        marker = new AMap.Marker({
            icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
            position: [a, b]
        });
        marker.setMap(map);
        markers.push(marker);
    }
    AMap.event.addDomListener(document.getElementById('clearMarker'), 'click', function() {
        map.remove(markers);
        markers = [];
        $("#lnglat").val("");
    }, false);
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