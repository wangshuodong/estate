<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<div class="page-container">
    <form class="codeView docs-example" action="${pageContext.request.contextPath }/rest/billAccount/getAllGroupByStatus"
          method="post">
        <div class="form-group">
            <select class="form-control" name="housingId" style="width:250px">
                <option value='' disabled selected style='display:none;'>小区</option>
                <option></option>
                <c:forEach items="${housingList}" var="item">
                    <option value="${item.id}"
                            <c:if test="${query.housingId==item.id }">selected</c:if>>${item.name}</option>
                </c:forEach>
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
                <th>已同步数</th>
                <th>未同步数</th>
            </tr>
            <tbody>
                <tr class="text-c" style="height: 150px">
                    <td>${ billAccount.fkAmount }</td>
                    <td>${ billAccount.unfkAmount }</td>
                    <td>${ billAccount.fkCount }</td>
                    <td>${ billAccount.unfkCount }</td>
                    <td>${ billAccount.tbCount }</td>
                    <td>${ billAccount.untbCount }</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="panel mt-20">
        <table>
            <tr>
                <td><div id="container1" style="min-width: 400px;height: 400px"></div></td>
                <td><div id="container2" style="min-width: 400px;height: 400px"></div></td>
            </tr>
        </table>


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
    var payAmountList = ${payAmountList};
    var payCountList = ${payCountList};

    var chart1 = null; // 定义全局变量
    var chart2 = null; // 定义全局变量
    $(document).ready(function () {
        chart1 = new Highcharts.Chart({
            chart: {
                renderTo: 'container1',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '账单金额'
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
        chart2 = new Highcharts.Chart({
            chart: {
                renderTo: 'container2',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '账单笔数'
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
                name: '账单数量'
            }]
        });
        requestData();
    });

    function requestData() {
        var arr1 = [];
        var arr2 = [];
        $(payAmountList).each(function (index, item) {
            arr1.push([item.name, item.sumAmount]);
        });
        chart1.series[0].setData(arr1);
        $(payCountList).each(function (index, item) {
            arr2.push([item.name, item.sumNum]);
        });
        chart2.series[0].setData(arr2);
        <%--$.ajax({--%>
            <%--type: 'POST',--%>
            <%--url: '${pageContext.request.contextPath }/rest/billAccount/getAllGroupByStatus',--%>
            <%--success: function (data) {--%>
                <%--$(data.data).each(function (index, item) {--%>
                    <%--arr.push([item.name, item.sumAmount]);--%>
                <%--});--%>
                <%--chart.series[0].setData(arr);--%>
            <%--},--%>
            <%--cache: false--%>
        <%--});--%>
    }
</script>

