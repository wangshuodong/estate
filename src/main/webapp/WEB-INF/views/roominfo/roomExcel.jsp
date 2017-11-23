<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>

<div class="page-container">
    <form class="form form-horizontal" id="myform" enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所属小区：</label>
            <div class="formControls col-xs-8 col-sm-9">
				<span class="btn-upload form-group">
				    <input class="input-text upload-url radius size-L" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！">
				    <a href="#" class="btn btn-secondary radius upload-btn size-L"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				    <input type="file" multiple name="upfile" id="upfile" class="input-file" required>
				</span>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button type="button" class="btn btn-secondary radius size-L" id="fileUpload">上&nbsp;传</button>
                <%--<button type="submit" class="btn btn-secondary radius size-L" onclick="return checkData()">保&nbsp;存</button>--%>
                <button type="button" class="btn btn-secondary radius size-L" onclick="layer_close();">取&nbsp;消</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">

    $('#fileUpload').click(function(){
        if(checkData()){
            $('#myform').ajaxSubmit({
                type: 'post',
                url: ${pageContext.request.contextPath }'/rest/uploadExcel',
                dataType: 'json',
                beforeSubmit: function () {
                    layer.load();
                },
                success: function(data){
                    layer.closeAll('loading');
                    console.info(data);
                    console.info(data.success);
                    console.info(data.message);
                    if (data.success) {
                        layer.alert(data.message);
                    }else {
                        layer.alert("aa" + data.message);
                    }
                },
                error: function(XmlHttpRequest, textStatus, errorThrown){
                    layer.closeAll('loading');
                    layer.alert('导入excel出错！!');
                }
            });
        }
    });

    //JS校验form表单信息
    function checkData(){
        var fileDir = $("#upfile").val();
        var suffix = fileDir.substr(fileDir.lastIndexOf("."));
        if("" == fileDir){
            layer.alert("选择需要导入的Excel文件！");
            return false;
        }
        if(".xls" != suffix && ".xlsx" != suffix ){
            layer.alert("选择Excel格式的文件导入！");
            return false;
        }
        return true;
    }
</script>