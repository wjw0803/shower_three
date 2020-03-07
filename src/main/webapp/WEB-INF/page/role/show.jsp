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
    $(function(){
        show();
    })

    function show(){
        $.post("<%=request.getContextPath()%>/role/show",
           $("#fm").serialize(),
            function (data) {
                if (data.code != 200){
                    layer.msg(data.data.msg);
                    return;
                }
                var html = "";
                for (var i = 0; i < data.data.length; i++) {
                    var list = data.data[i];
                    html += "<tr>";
                    html += "<td>"+list.id+"</td>";
                    html += "<td>"+list.roleName+"</td>";
                    html += "<td>";
                    html += "<input type = 'button' value = '修改' onclick = 'toUpdate("+list.id+")'>";
                    html += "<input type = 'button' value = '删除' onclick = 'del("+list.id+")'>";
                    html += "<input type = 'button' value = '关联资源' onclick = 'roleResource("+list.id+")'>";
                    html += "</td>";
                    html += "</tr>";
                }
                $("#tbd").html(html);
        })
    }

    //修改
    function toUpdate(id){
        layer.open({
            type: 2,
            title: [
                '修改',
                'background-color:#8DCE16; color:#fff;'
            ],
            shadeClose: true,
            shade: 0.3,
            area: ['380px', '100%'],
            content: '<%=request.getContextPath()%>/role/toUpdate/'+id //iframe的url
        });
    }

    //删除
    function del(id){
        var index = layer.load(1,{shade:0.5});
        layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function(index) {
            $.post(
                "<%=request.getContextPath()%>/role/update",
                {"id":id,"isDel":0},
                function (data) {
                    if (data.code != -1) {
                        layer.msg(data.msg, {icon: 6}, function () {
                            window.location.href = "<%=request.getContextPath()%>/role/toShow";
                        });
                        return;
                    }
                    layer.msg(data.msg, {icon: 5})
                    layer.close(index);
                }
            )
        })
        layer.close(index);
    }

    //新增
    function toAdd(){
        layer.open({
            type: 2,
            title: [
                '新增',
                'background-color:#8DCE16; color:#fff;'
            ],
            shadeClose: true,
            shade: 0.3,
            area: ['380px', '80%'],
            content: '<%=request.getContextPath()%>/role/toAdd' //iframe的url
        });
    }
    //关联资源
    function roleResource(roleId){
        layer.open({
            type: 2,
            title: '关联资源页面',
            shadeClose: true,
            shade: 0.8,
            area: ['380px', '90%'],
            content: '<%=request.getContextPath()%>/role/toRoleResList?roleId='+roleId
        });
    }

</script>
<body>
<shiro:hasPermission name="role:add">
    <input type="button" value="新增" onclick="toAdd()"><br>
</shiro:hasPermission>

    <form id="fm">
        角色搜索<input name="roleName" type="text">
        <input type="button" value="搜索" onclick="show()">
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
            <th style="background: aquamarine;">编号</th>
            <th style="background: aquamarine;">角色名称</th>
            <th style="background: aquamarine;">操作</th>
        </tr>
        </thead>
        <tbody id = "tbd">
        </tbody>
    </table>
</body>
</html>
