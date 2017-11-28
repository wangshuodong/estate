<%@ include file="/share/_meta.jsp" %>
<%@ include file="/share/_footer.jsp" %>
<div class="page-container">
	<p class="f-20 text-success">欢迎使用H-ui.admin <span class="f-14">v3.1</span>后台模版！</p>
	<p>登录次数：18 </p>
	<p>上次登录IP：222.35.131.79.1  上次登录时间：2014-6-14 11:19:55</p>
	<table class="table table-border table-bordered table-bg">
		<thead>
		<tr>
			<th colspan="7" scope="col">信息统计</th>
		</tr>
		<tr class="text-c">
			<th>统计</th>
			<th>资讯库</th>
			<th>图片库</th>
			<th>产品库</th>
			<th>用户</th>
			<th>管理员</th>
		</tr>
		</thead>
		<tbody>
		<tr class="text-c">
			<td>总数</td>
			<td>92</td>
			<td>9</td>
			<td>0</td>
			<td>8</td>
			<td>20</td>
		</tr>
		<tr class="text-c">
			<td>今日</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
		</tr>
		<tr class="text-c">
			<td>昨日</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
		</tr>
		<tr class="text-c">
			<td>本周</td>
			<td>2</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
		</tr>
		<tr class="text-c">
			<td>本月</td>
			<td>2</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
		</tr>
		</tbody>
	</table>

	<table class="table table-border table-bordered table-bg mt-20">
		<thead>
		<tr>
			<th colspan="2" scope="col">服务器信息</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<th width="30%">服务器计算机名</th>
			<td><span id="lbServerName">http://127.0.0.1/</span></td>
		</tr>
		<tr>
			<td>服务器IP地址</td>
			<td>192.168.1.1</td>
		</tr>
		<tr>
			<td>服务器域名</td>
			<td>www.h-ui.net</td>
		</tr>
		<tr>
			<td>服务器端口 </td>
			<td>80</td>
		</tr>
		<tr>
			<td>服务器IIS版本 </td>
			<td>Microsoft-IIS/6.0</td>
		</tr>
		<tr>
			<td>本文件所在文件夹 </td>
			<td>D:\WebSite\HanXiPuTai.com\XinYiCMS.Web\</td>
		</tr>
		<tr>
			<td>服务器操作系统 </td>
			<td>Microsoft Windows NT 5.2.3790 Service Pack 2</td>
		</tr>
		<tr>
			<td>系统所在文件夹 </td>
			<td>C:\WINDOWS\system32</td>
		</tr>
		<tr>
			<td>服务器脚本超时时间 </td>
			<td>30000秒</td>
		</tr>
		<tr>
			<td>服务器的语言种类 </td>
			<td>Chinese (People's Republic of China)</td>
		</tr>
		<tr>
			<td>.NET Framework 版本 </td>
			<td>2.050727.3655</td>
		</tr>
		<tr>
			<td>服务器当前时间 </td>
			<td>2014-6-14 12:06:23</td>
		</tr>
		<tr>
			<td>服务器IE版本 </td>
			<td>6.0000</td>
		</tr>
		<tr>
			<td>服务器上次启动到现在已运行 </td>
			<td>7210分钟</td>
		</tr>
		<tr>
			<td>逻辑驱动器 </td>
			<td>C:\D:\</td>
		</tr>
		<tr>
			<td>CPU 总数 </td>
			<td>4</td>
		</tr>
		<tr>
			<td>CPU 类型 </td>
			<td>x86 Family 6 Model 42 Stepping 1, GenuineIntel</td>
		</tr>
		<tr>
			<td>虚拟内存 </td>
			<td>52480M</td>
		</tr>
		<tr>
			<td>当前程序占用内存 </td>
			<td>3.29M</td>
		</tr>
		<tr>
			<td>Asp.net所占内存 </td>
			<td>51.46M</td>
		</tr>
		<tr>
			<td>当前Session数量 </td>
			<td>8</td>
		</tr>
		<tr>
			<td>当前SessionID </td>
			<td>gznhpwmp34004345jz2q3l45</td>
		</tr>
		<tr>
			<td>当前系统用户名 </td>
			<td>NETWORK SERVICE</td>
		</tr>
		</tbody>
	</table>
	<body>
	<div id = "container" style = "min-width: 400px;height: 400px"></div>
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/lib/hcharts/Highcharts/5.0.6/js/highcharts-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
	<script type="text/javascript">
        $(function () {
            var chart;
            $(document).ready(function() {
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
                    pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            formatter: function() {
                                //Highcharts.numberFormat(this.percentage,2)格式化数字，保留2位精度
                                return '<b>'+ this.point.name +'</b>: '+Highcharts.numberFormat(this.percentage,2) +' %';
                            }
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: '账单金额占比',
                }]
            });
        });
            //异步请求数据
            $.ajax({
                type:"GET",
                url:'${pageContext.request.contextPath }/rest/billAccount/getAllGroupByPayType',//提供数据的Servlet
                success:function(data){
                    //定义一个数组
					alert(data);
                    browsers = [],
                        //迭代，把异步获取的数据放到数组中
                        $.each($.parseJSON(data),function(i,d){
                            browsers.push([d.sumAmount,d.paystatus]);
                        });
                    //设置数据
					alert(browsers);
                    chart.series[0].setData(browsers);
                },
                error:function(e){
                    alert(e);
                }
            });
        });
	</script>
</div>
