<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/3/8
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/zTree_v3/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/css/layui.css"  media="all">
<head>
    <title>商品展示</title>
</head>
<script>

    $(function(){
        search();
    })

    function search(){
        $.post("<%=request.getContextPath()%>/order/show",
            $("#searchFm").serialize(),
            function(data){
                var html = "";
                for (var i = 0; i < data.data.data.length; i++) {
                    var p = data.data.data[i];
                    html += "<tr>"
                    html += "<td><input type='checkbox' name='ids' value='"+p.id+"' /></td>"
                    html += "<td>"+p.id+"</td>"
                    html += "<td>"+p.productName+"</td>"
                    html += "<td>"+p.userName+"</td>"
                    html += "<td>"+p.price+"</td>"
                    <shiro:hasPermission name="order:updateStatus">
                        html += "<td><button type='button' 	class='layui-btn layui-btn-xs layui-btn-radius'  onclick = 'updateIsDel("+p.id+","+p.price+")'><i class='layui-icon'>退单</i></button></td>";
                    </shiro:hasPermission>
                    html += "</tr>"
                }
                $("#tbd").append(html);
                //获取id为pageNum的value值
                var pageNum = $("#start").val();
                var pageHtml = "<button type='button' id='many'	class='layui-btn layui-btn-xs layui-btn-radius'  onclick='page("+(parseInt(pageNum) + 1)+","+data.data.totalNum+")'><i class='layui-icon'>加载更多</i></button>"
                /*pageHtml += "<button type='button' 	class='layui-btn layui-btn-xs layui-btn-radius'    onclick='page("+(parseInt(pageNum) + 1)+","+data.data.totalNum+")'><i class='layui-icon'>下一页</i></button>" ;*/
                $("#pageInfo").html(pageHtml);
            })
    }


    function page(pageNo,totalNum){
        $("#start").val(pageNo);
        if(totalNum < $("#start").val()){
            layer.msg("我是有底线的", {icon: 5,time: 500});
            return;
        }
        /*$("#many").val("我是有底线的")*/
        search();
    }





    function updateIsDel(id,price){
        /*var len = $("input[name='ids']:checked").length

        if(len <= 0){
            layer.msg("请选择", {icon: 0});
            return;
        }

        var str = "";

        $("input[name='ids']:checked").each(function (index, item) {

            if ($("input[name='ids']:checked").length-1==index) {
                str += $(this).val();
            } else {
                str += $(this).val() + ",";
            }
        });*/
        var index = layer.load(0,{shade:0.3});
        layer.confirm('确定退单吗?', {icon:3, title:'警告'}, function(index){
            //do something
            $.post(
                "<%=request.getContextPath()%>/order/updatedel",
                {"id":id,"price":price},
                function(data){
                    layer.msg(data.msg, {icon: 6,time: 1000 }, function(){
                        layer.close(index);
                        if(data.code != 200){
                            return ;
                        }
                        window.location.href = "<%=request.getContextPath()%>/order/toShow"
                    });
                })
        });
        layer.close(index);
    }


</script>
<body>
<form id="searchFm">
    <input type = "hidden" value = "1" id ="start" name ="pageNum" />
    <input type = "hidden" value = "1" id ="isDel" name ="isDel" />
    <%--<input type="text" name="productName" id = "pName" />--%>
   <%-- <button type='button' 	class='layui-btn layui-btn-xs layui-btn-radius'  onclick="search()"><i class='layui-icon'>按商品名查询</i></button>--%>
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
        <th style="background: aqua;"></th>
        <th style="background: aqua;">编号</th>
        <th style="background: aqua;">商品名</th>
        <th style="background: aqua;">购买人</th>
        <th style="background: aqua;">商品价格</th>
        <shiro:hasPermission name="order:updateStatus">
            <th style="background: aquamarine;">操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody id = "tbd">
    </tbody>
</table>
<div id="pageInfo"></div>


</body>
</html>
