<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/h-ui/common/jquery.editable-select.min.css" />
<div class="page-container">
    <form class="form form-horizontal" id="myform" action="" method="post">
        <input type="hidden" value="${billaccount.id}" name="id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所属小区：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.housingName}" name="housingName" disabled>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所属房间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.roominfoAddress}" name="roominfoAddress" disabled>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>费用类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="form-control shift-info" name="costType" required>
                    <option value='' disabled selected style='display:none;'>请选择费用类型</option>
                    <option value="1" <c:if test="${billaccount.costType==1 }">selected</c:if>>物业管理费</option>
                    <option value="2" <c:if test="${billaccount.costType==2 }">selected</c:if>>水电公摊费</option>
                    <option value="3" <c:if test="${billaccount.costType==3 }">selected</c:if>>垃圾清运费</option>
                    <option value="4" <c:if test="${billaccount.costType==4 }">selected</c:if>>公共照明费</option>
                    <option value="5" <c:if test="${billaccount.costType==5 }">selected</c:if>>水费</option>
                    <option value="6" <c:if test="${billaccount.costType==6 }">selected</c:if>>电费</option>
                    <option value="7" <c:if test="${billaccount.costType==7 }">selected</c:if>>蒸汽费</option>
                    <option value="99" <c:if test="${billaccount.costType==99 }">selected</c:if>>其他</option>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>账期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.acctPeriod}" placeholder="yyyy-MM" name="acctPeriod" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>出账日期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.releaseDay}" placeholder="yyyy-MM-dd" name="releaseDay" id="releaseDay" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>缴费截止日期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.deadline}" placeholder="yyyy-MM-dd" name="deadline" id="deadline" required>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>账单金额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="layui-input input-text radius size-L" value="${billaccount.billEntryAmount}" placeholder="账单金额" name="billEntryAmount" id="billEntryAmount">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/common/laydate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/common/jquery.editable-select.min.js"></script>
<script type="text/javascript">
    $(function(){
//        laydate.render({
//            elem: '#acctPeriod' //指定元素
//            ,type: 'month'
//            ,format: 'yyyy年MM'
//        });
        laydate.render({
            elem: '#releaseDay' //指定元素
            ,format: 'yyyyMMdd'
        });
        laydate.render({
            elem: '#deadline' //指定元素
            ,format: 'yyyyMMdd'
        });
        roomEdit();
    });

    function roomEdit() {
        $('#roominfoId').editableSelect({
            effects: 'default',
            onSelect: function (element) {
                $('.shift-info').attr('data-val', element.val());
            }
        }).prop('placeholder', '请选择房间');
    }

    //注册小区下拉框事件
    $("#housingId").change(function(){
        changChild($(this).val());
    });

    function changChild(tid){
        $.post("${pageContext.request.contextPath }/rest/roominfo/queryParentRoomById",{"housingId":tid},function(json){
            $("#roomdoc").html("");
            var $dom_one = "<select class=\"form-control shift-info\" name=\"roominfoId\" id=\"roominfoId\" required>";
            for(var i=0;i<json.length;i++){
                //添加一个房屋
                $dom_one += "<option value='"+json[i].id+"'>"+json[i].name+"</option>";
            }
            $dom_one += "</select>";
            $("#roomdoc").html($dom_one);
            roomEdit();
        },'json');
    }

    $("#myform").validate({
        rules:{
            billEntryAmount : {
                required: true,
                number : true
            }
        },
        submitHandler:function(form) {
            var temp = $('.shift-info').attr('data-val');
            $("#roominfoId").val(temp);
            $(form).ajaxSubmit({
                type: 'post',
                url: "${pageContext.request.contextPath }/rest/billAccount/saveOrUpdateBillAccount",
                beforeSubmit: function () {
                    layer.load();
                },
                success: function(data){
                    layer.closeAll('loading');
                    if (data.success) {
                        window.parent.location.reload();
                    }else {
                        layer.alert("修改失败");
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