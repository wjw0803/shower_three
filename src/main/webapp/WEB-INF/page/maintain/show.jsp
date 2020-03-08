<%--
  Created by IntelliJ IDEA.
  User: qinbb
  Date: 2020/1/28
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>


<html>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/css/layui.css"  media="all">
<head>
    <title>展示</title>
</head>
<script>
    var totalNum = 0;
    $(function(){
        show();
    })

    function show(){
        $.post("<%=request.getContextPath()%>/maintain/show",
            $("#fm").serialize(),
            function (data) {
                if (data.code != 200){
                    layer.msg(data.data.msg);
                    return;
                }
                totalNum = data.data.totalNum;
                var html = "";
                for (var i = 0; i < data.data.maintainList.length; i++) {
                    var list = data.data.maintainList[i];
                    html += "<tr>";
                    html += "<td>";
                    html += "<input type = 'checkbox' name = 'id' value = '"+list.id+"'>";
                    html += "</td>";
                    html += "<td>"+list.id+"</td>";
                    html += "<td>"+list.maintainTime+"</td>";
                    html += "<td>"+list.maintainId+"</td>";
                    html += "<td>"+list.projectShow+"</td>";
                    html += "<td>"+list.statusShow+"</td>";
                    html += "<td>";
                    <shiro:hasPermission name="maintain:cz">
                    html += list.status == 4 ? "维修完成👌" :"<button type='button' class='layui-btn layui-btn-xs layui-btn-normal' onclick='updateById("+list.id+")'>审核</button>";
                    </shiro:hasPermission>
                    html += "</td>";
                    html += "</tr>";
                }
                $("#tbd").html(html);
                var pageNo = $("#pageNo").val();
                var pageHtml = "<button type='button' class='layui-btn layui-btn-xs layui-btn-normal' onclick='page("+(parseInt(pageNo) - 1)+")'>上一页</button>";
                pageHtml += "<button type='button' class='layui-btn layui-btn-xs layui-btn-normal' onclick='page("+(parseInt(pageNo) + 1)+")')'>下一页</button>";
                $("#pageInfo").html(pageHtml);
        })
    }

    function page(page) {

        if (page < 1) {
            layer.msg('首页啦!', {icon:0});
            return;
        }
        if (page > totalNum) {
            layer.msg('已经到尾页啦!!', {icon:0});
            return;
        }
        $("#pageNo").val(page);
        show();

    }
    function find(){
        $("#pageNo").val(1);
        show();
    }


    //去修改
    function updateById(id){
            layer.open({
                type: 2,
                title: '修改页面',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath()%>/maintain/toUpdate/'+id
            });

    }



    //删除
    function del(){
        var length = $("input[name='id']:checked").length;

        if(length <= 0){
            layer.msg("至少选择一项", {icon: 5});
            return;
        }
        if(length > 1){
            layer.msg("只能选择一个", {icon: 5});
            return;
        }

        var id = $("input[name='id']:checked").val();
        layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function(index){
            //do something

            layer.close(index);

            $.post("<%=request.getContextPath()%>/maintain/del ",
                {"id":id, "isDel":0},
                function(data){
                    layer.close(index);
                    if (data.code == -1){
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    window.location.href="<%=request.getContextPath()%>/maintain/toShow";
                });
        });
    }



    //去修改
    function add(){
            layer.open({
                type: 2,
                title: '填写页面',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath()%>/maintain/toAdd'
            });
    }

</script>
<body>
<form id="fm">
    <div align="center">
        <input type="hidden" value="1" id="pageNo" name="pageNo">
<shiro:hasPermission name="maintain:find">
    状态<select name="status">
            <option value="0">--请选择--</option>
            <option value="2">已预约</option>
            <option value="3">待审核</option>
            <option value="4">已通过</option>
        </select><br><br>
    <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="find()">搜索</button><br><br>
</shiro:hasPermission>
        <shiro:hasPermission name="maintain:add">
            <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="add()">填写维修单</button>
        </shiro:hasPermission>
<shiro:hasPermission name="maintain:del">
    <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="del()">删除</button>
</shiro:hasPermission>
    </div>
</form>
    <table  class="layui-table">
        <colgroup>
            <col width="100">
            <col width="100">
            <col width="100">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th style="background: aquamarine;"></th>
            <th style="background: aquamarine;">预约编号</th>
            <th style="background: aquamarine;">预约时间</th>
            <th style="background: aquamarine;">预约单号</th>
            <th style="background: aquamarine;">维修项目</th>
            <th style="background: aquamarine;">状态</th>
            <shiro:hasPermission name="maintain:cz">
                <th style="background: aquamarine;">操作</th>
            </shiro:hasPermission>
        </tr>
        </thead>
        <tbody id = "tbd">
        </tbody>
    </table>
<div id="pageInfo" align="center">

</div>
</body>
</html>
