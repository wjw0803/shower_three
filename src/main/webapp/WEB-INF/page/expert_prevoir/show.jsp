<%--
  Created by IntelliJ IDEA.
  User: songyusheng
  Date: 2020/3/9
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/css/layui.css"  media="all">
    <script>
        $(function(){
            show();
        })

        function show(){
            $.post("<%=request.getContextPath()%>/expertPrevoir/show",
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
                        html += "<td>"+list.expertId+"</td>";
                        html += "<td>"+list.userId+"</td>";
                        html += "<td>"+list.prevoirDate+"</td>";
                        html += "<td>";
                        html +=list.accepterDate == null ? "没有接单":list.accepterDate;
                        html += "</td>";
                        html += "<td>";
                        html += list.ordreType == 0 ? "预约":list.ordreType == 1 ? "已接单":"完成";
                        html += "</td>";
                        html += "<td>"+list.prix+"</td>";
                        html += "</tr>";
                    }
                    $("#tbd").html(html);
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

        function updateOrdreType(ordreType) {
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
                "<%=request.getContextPath()%>/expertPrevoir/updateOrdreType",
                {"id":id ,"ordreType":ordreType, "_method" : "put"},
                function(data){
                    layer.close(index);
                    layer.msg(data.msg, function(){
                        if (data.code != 200) {
                            return;
                        }
                        window.location.href = "<%=request.getContextPath()%>/expertPrevoir/toShow";
                    });

                })
        }
    </script>
</head>
<body>
<shiro:hasPermission name="expertPrevoir:updateOrdreType">
    <input type="button" value="接单" onclick = "updateOrdreType(1)">
</shiro:hasPermission>
<shiro:hasPermission name="expertPrevoir:updateOrdreTypeTwo">
    <input type="button" value="服务完成" onclick = "updateOrdreType(2)">
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
        <th style="background: aquamarine;">技师</th>
        <th style="background: aquamarine;">用户</th>
        <th style="background: aquamarine;">预约时间</th>
        <th style="background: aquamarine;">接单时间</th>
        <th style="background: aquamarine;">订单状态</th>
        <th style="background: aquamarine;">价格</th>
    </tr>
    </thead>
    <tbody id = "tbd">
    </tbody>
</table>
</body>
</html>
