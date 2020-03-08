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
        $.post("<%=request.getContextPath()%>/user/expertShow",
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
                    html += "<td>";
                    html += "<input type = 'checkbox' name = 'id' value = '"+list.id+"'>";
                    html += "</td>";
                    html += "<td>"+list.id+"</td>";
                    html += "<td>"+list.userName+"</td>";
                    html += "<td>"+list.nickname+"</td>";
                    html += "<td>"+list.phone+"</td>";
                    html += "<td>"+list.email+"</td>";
                    html += "<td>";
                    html += list.sex == 1 ? "男":"女";
                    html += "</td>";
                    html += "<td>"+list.roleNameShow+"</td>";
                    html += "<td>";
                    html += list.status == 1 ? "激活":"未激活";
                    html += "</td>";
                    html += "<td>"+list.registerTime+"</td>";
                    html += list.lastloginTime != null ? "<td>"+list.lastloginTime+"</td>" : "<td>未登录记录</td>"
                    html += "</tr>";
                }
                $("#tbd").html(html);
        })
    }

    function isReport() {
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
        var index = layer.load(0, {shade:0.5});
        $.post(
            "<%=request.getContextPath()%>/resource/updateIsReport",
            {"id":id ,"_method" : "put"},
            function(data){
                layer.close(index);
                layer.msg(data.msg, function(){
                    if (data.code != 200) {
                        return;
                    }
                    window.location.href = "<%=request.getContextPath()%>/user/toShow";
                });

            })
    }

    function prevoir() {
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
        var index = layer.load(0, {shade:0.5});
        $.post(
            "<%=request.getContextPath()%>/resource/updatePrevoir",
            {"id":id ,"prevoir":"1", "_method" : "put"},
            function(data){
                layer.close(index);
                layer.msg(data.msg, function(){
                    if (data.code != 200) {
                        return;
                    }
                    window.location.href = "<%=request.getContextPath()%>/user/toShow";
                });

            })
    }

</script>
<body>
<shiro:hasPermission name="resource:report">
    <input type="button" value="举报" onclick = "isReport()">
</shiro:hasPermission>
<shiro:hasPermission name="resource:prevoir">
    <input type="button" value="预约" onclick = "prevoir()">
</shiro:hasPermission>

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
            <th style="background: aquamarine;">编号</th>
            <th style="background: aquamarine;">用户名</th>
            <th style="background: aquamarine;">昵称</th>
            <th style="background: aquamarine;">手机号</th>
            <th style="background: aquamarine;">邮箱</th>
            <th style="background: aquamarine;">性别</th>
            <th style="background: aquamarine;">级别</th>
            <th style="background: aquamarine;">状态</th>
            <th style="background: aquamarine;">注册时间</th>
            <th style="background: aquamarine;">最后登陆时间</th>
        </tr>
        </thead>
        <tbody id = "tbd">
        </tbody>
    </table>
</body>
</html>
