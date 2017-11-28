﻿<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<div class="page-container">
    <form class="codeView docs-example" action="${pageContext.request.contextPath }/rest/roominfo/roominfoList"
          method="post">
        <div class="form-group">
            <select class="form-control" name="parentId" style="width:250px">
                <option value='' disabled selected style='display:none;'>小区</option>
                <option></option>
                <c:forEach items="${parentList}" var="item">
                    <option value="${item.id}"
                            <c:if test="${query.parentId==item.id }">selected</c:if>>${item.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <select class="form-control" name="status" style="width:250px">
                <option value='' disabled selected style='display:none;'>状态</option>
                <option></option>
                <option value="0" <c:if test="${query.status == false }">selected</c:if>>未同步</option>
                <option value="1" <c:if test="${query.status == true }">selected</c:if>>已同步</option>
            </select>
        </div>

        <button type="submit" class="btn btn-secondary radius size-L">查&nbsp;询</button>
    </form>

    <div class="panel panel-default mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <tr class="text-c active" style="height: 50px">
                <th>收款金额</th>
                <th>未收款金额</th>
                <th>已收账单数</th>
                <th>未收账单数</th>
                <th>未同步数</th>
                <th>已同步数</th>
            </tr>
            <tr class="text-c" style="height: 150px">
                <td>10001</td>
                <td>10001</td>
                <td>10001</td>
                <td>10001</td>
                <td>10001</td>
                <td>10001</td>
            </tr>
        </table>
    </div>
    <div class="panel mt-20">
        <span id="container" style="min-width: 400px;height: 400px"></span>
        <span id="container2" style="min-width: 400px;height: 400px"></span>
    </div>
</div>

<%--<script type="text/javascript"
        src="${pageContext.request.contextPath}/h-ui/lib/hcharts/Highcharts/5.0.6/js/highcharts-zh_CN.js"></script>--%>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/h-ui/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/h-ui/lib/hcharts/Highcharts/5.0.6/js/themes/grid-light.js"></script>
<%--<script type="text/javascript"--%>
<%--src="${pageContext.request.contextPath}/h-ui/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>--%>
<script type="text/javascript">
    var chart = null; // 定义全局变量
    $(document).ready(function () {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '账单金额占比'
            },
            tooltip: {
                headerFormat: '{series.name}<br>',
                pointFormat: '{point.name}(<b>{point.percentage:.1f}%</b>)',
                style: {                      // 文字内容相关样式
                    color: "#ff0000",
                    fontSize: "14px",
                    fontWeight: "blod",
                    fontFamily: "Courir new"
                }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            credits: {
                enabled: false // 禁用版权信息
            },
            series: [{
                type: 'pie',
                name: '金额'
            }]
        });
        requestData();
    });

    function requestData() {
        var arr = [];
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath }/rest/billAccount/getAllGroupByPayType',
            success: function (data) {
                console.info(data);
                $(data.data).each(function (index, item) {
                    arr.push([item.name, item.sumAmount]);
                });
                chart.series[0].setData(arr);
            },
            cache: false
        });
    }
</script>

