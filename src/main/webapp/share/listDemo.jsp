<%@ include file="../share/_meta.jsp" %>
<%@ include file="../share/_footer.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/h-ui/common/jquery.editable-select.min.css" />
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <form class="codeView docs-example">
        <input type="text" placeholder="物业名称" class="input-text radius size-L" style="width:250px">
        <input type="text" placeholder="物业公司" class="input-text radius size-L" style="width:250px">
        <div class="form-group">
            <select class="form-control shift-info" id="selects1" style="width:250px">
                <option value="0">全部栏目</option>
                <option value="1">新闻资讯</option>
                <option value="11">├行业动态</option>
                <option value="12">├行业资讯</option>
                <option value="13">├行业新闻</option>
            </select>
        </div>
        <button type="submit" class="btn btn-secondary radius size-L">查询</button>
        <button type="submit" class="btn btn-secondary radius size-L">新增</button>
    </form>

    <div class="panel panel-default mt-20">
        <div class="panel-header">
            数据列表
        </div>
        <div class="panel-body">
            <table class="table table-border table-bg table-hover table-sort table-striped">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="80">ID</th>
                    <th>标题</th>
                    <th width="80">分类</th>
                    <th width="80">来源</th>
                    <th width="120">更新时间</th>
                    <th width="75">浏览次数</th>
                    <th width="60">发布状态</th>
                    <th width="120">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr class="text-c">
                    <td><input type="checkbox" value="" name=""></td>
                    <td>10001</td>
                    <td><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10001')" title="查看">资讯标题</u></td>
                    <td>行业动态</td>
                    <td>H-ui</td>
                    <td>2014-6-11 11:11:42</td>
                    <td>21212</td>
                    <td class="td-status"><span class="label label-success radius">已发布</span></td>
                    <td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_stop(this,'10001')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                </tr>
                <tr class="text-c">
                    <td><input type="checkbox" value="" name=""></td>
                    <td>10002</td>
                    <td><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10002')" title="查看">资讯标题</u></td>
                    <td>行业动态</td>
                    <td>H-ui</td>
                    <td>2014-6-11 11:11:42</td>
                    <td>21212</td>
                    <td class="td-status"><span class="label label-success radius">草稿</span></td>
                    <td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_shenhe(this,'10001')" href="javascript:;" title="审核">审核</a> <a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                </tr>
                <tr class="text-c">
                    <td><input type="checkbox" value="" name=""></td>
                    <td>10002</td>
                    <td><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10002')" title="查看">资讯标题</u></td>
                    <td>行业动态</td>
                    <td>H-ui</td>
                    <td>2014-6-11 11:11:42</td>
                    <td>21212</td>
                    <td class="td-status"><span class="label label-success radius">草稿</span></td>
                    <td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_shenhe(this,'10001')" href="javascript:;" title="审核">审核</a> <a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                </tr>
                <tr class="text-c">
                    <td><input type="checkbox" value="" name=""></td>
                    <td>10002</td>
                    <td><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10002')" title="查看">资讯标题</u></td>
                    <td>行业动态</td>
                    <td>H-ui</td>
                    <td>2014-6-11 11:11:42</td>
                    <td>21212</td>
                    <td class="td-status"><span class="label label-success radius">草稿</span></td>
                    <td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_shenhe(this,'10001')" href="javascript:;" title="审核">审核</a> <a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                </tr>
                </tbody>
            </table>
            <br>
            <br>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/h-ui/common/jquery.editable-select.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('.table-sort').dataTable({
            scrollX: true,
            ordering: false,
            searching: 200
        });
        $('#selects1').editableSelect({
            effects: 'slide',
            onSelect: function (element) {
                $('.shift-info').attr('data-val', element.val());
                //getCompanyAdress()
            }
        }).prop('placeholder', '请选择或输入筛选...');
    });

</script>

