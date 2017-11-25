<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<link rel="stylesheet" href="https://cache.amap.com/lbs/static/main.css"/>
<style type="text/css">
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
    <form class="form form-horizontal" id="myform" action="" method="post">
        <input type="hidden" value="${department.id}" name="id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>小区名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${department.name}" placeholder="小区名称" name="name" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>上级物业：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="form-control" name="parentId" id="parentId" required>
                    <option value='' disabled selected style='display:none;'>请选择物业</option>
                    <c:forEach items="${parentList}" var="item">
                        <option value="${item.id}" <c:if test="${item.id == department.parentId}">selected</c:if>>${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">小区地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${department.address}" placeholder="小区地址" name="address">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>省份编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${department.provinceCode}" placeholder="省份编码" name="provinceCode" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>地级市编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${department.cityCode}" placeholder="地级市编码" name="cityCode" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>区县编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${department.districtCode}" placeholder="区县编码" name="districtCode" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>服务热线电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-L" value="${department.hotline}" placeholder="服务热线电话" name="hotline" required>
            </div>
        </div>
        <div class="row cl" style="height: 450px;">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>经纬度：</label>
            <div class="formControls col-xs-8 col-sm-9" style="height: 400px;">
                <input type="text" class="input-text radius size-L" value="${department.communityLocations}" placeholder="经纬度" name="communityLocations" id="poi" required>
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
        document.getElementById("poi").value = e.lnglat.getLng() + '|' + e.lnglat.getLat()
    });
    /*地图添加点*/

    $("#myform").validate({
        submitHandler:function(form) {
            $(form).ajaxSubmit({
                type: 'post',
                url: "${pageContext.request.contextPath }/rest/housing/saveOrUpdateHousing",
                beforeSubmit: function () {
                    layer.load();
                },
                success: function(data){
                    layer.closeAll('loading');
                    if (data.success) {
                        window.parent.location.reload();
                    }else {
                        layer.alert(data.message);
                    }
                },
                error: function(XmlHttpRequest, textStatus, errorThrown){
                    layer.closeAll('loading');
                    layer.alert('error!',{icon:1,time:1000});
                }
            });
        }
    });
</script>