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
        $.post("<%=request.getContextPath()%>/product/show",
            $("#searchFm").serialize(),
            function(data){
                var html = "";
                for (var i = 0; i < data.data.data.length; i++) {
                    var p = data.data.data[i];
                    html += "<tr>"
                    html += "<td><input type='checkbox' name='ids' value='"+p.id+"' /></td>"
                    html += "<td>"+p.id+"</td>"
                    html += "<td>"+p.pName+"</td>"
                    html += "<td>"+p.message+"</td>"
                    html += "<td>"+p.price+"</td>"
                    html += p.status == 1 ? "<td>上架</td>":"<td>下架</td>"
                    html += "<td>"+p.creatTimeShow+"</td>"
                    html += "<td>"+p.updateTimeShow+"</td>"
                    <shiro:hasPermission name="product:purchase">
                        if (p.status == 1){
                            html += "<td><button type='button' 	class='layui-btn layui-btn-xs layui-btn-radius'  onclick = 'purchase("+p.id+","+p.price+")'><i class='layui-icon'>购买</i></button></td>";
                        }
                    </shiro:hasPermission>

                    html += "<input type = 'hidden' id = '"+p.id+"' value = '"+p.status+"'>";
                    html += "</tr>"
                }
                $("#tbd").html(html);
                //获取id为pageNum的value值
                var pageNum = $("#pageNum").val();
                var pageHtml = "<button type='button' 	class='layui-btn layui-btn-xs layui-btn-radius'  onclick='page("+(parseInt(pageNum) - 1)+","+data.data.totalNum+")'><i class='layui-icon'>上一页</i></button>"
                pageHtml += "<button type='button' 	class='layui-btn layui-btn-xs layui-btn-radius'    onclick='page("+(parseInt(pageNum) + 1)+","+data.data.totalNum+")'><i class='layui-icon'>下一页</i></button>" ;
                $("#pageInfo").html(pageHtml);
            })
    }

    //购买
    function purchase(id, price ) {
        var index = layer.load(0, {shade: 0.3}); //0代表加载的风格，支持0-2
        $.post("<%=request.getContextPath()%>/product/purchase",
            {"id":id, "price":price},
        function(data){
            if(data.code != 200){
                layer.close(index);
                layer.msg(data.msg, {icon: 0});
                return;
            }
            layer.msg(data.msg, {icon: 6,time: 666 }, function(){
                layer.close(index);
                /* alert(data.msg); */
                window.location.href = "<%=request.getContextPath()%>/product/toShow"
            });
        })
    }

    function page(pageNo,totalNum){
        if(pageNo < 1){
            layer.msg('前面木有了o(╥﹏╥)o', {icon: 5,time: 500});
            return;
        }
        if(totalNum < pageNo){
            layer.msg('已经到底啦￣□￣｜｜', {icon: 5,time: 500});
            return;
        }
        $("#pageNum").val(pageNo);
        search();
    }

    function insert(){
        //iframe层
        layer.open({
            type: 2,
            title: '增加商品信息',
            shadeClose: true,
            shade: 0.3,
            area: ['380px', '90%'],
            //iframe的url
            content: '<%=request.getContextPath()%>/product/toAdd'
        });
        <%-- window.location.href = "<%=request.getContextPath()%>/product/toAdd" --%>
    }
    function update(){
        var len = $("input[name='ids']:checked").length

        if(len <= 0){
            /* alert("请选择"); */
            layer.msg("请选择", {icon: 0});
            return;
        }
        if(len > 1){
            /* alert("不能多选"); */
            layer.msg("不能多选", {icon: 0});
            return;
        }

        var str = "";

        $("input[name='ids']:checked").each(function (index, item) {

            if ($("input[name='ids']:checked").length-1==index) {
                str += $(this).val();
            } else {
                str += $(this).val() + ",";
            }
        });
        layer.open({
            type: 2,
            title: '更改商品信息',
            shadeClose: true,
            shade: 0.3,
            area: ['380px', '90%'],
            //iframe的url
            content: "<%=request.getContextPath()%>/product/toUpd/"+str
        });
        <%-- window.location.href = "<%=request.getContextPath()%>/product/toUpd/"+str --%>
    }

    function updateStatus(){
        var len = $("input[name='ids']:checked").length;
        if(len <= 0){
            /* alert("请选择"); */
            layer.msg("请选择", {icon: 0});
            return;
        }
        if(len > 1){
            /* alert("只能选择一项") */
            layer.msg("只能选择一项", {icon: 0});
            return;
        }
        var str = "";
        $("input[name='ids']:checked").each(function (index, item) {
            if ($("input[name='ids']:checked").length-1==index) {
                str += $(this).val();
            }
        });
        var sta = $("#"+str).val();
        var msg = "您确定要设置为";

        var status = "";
        if(sta == 1){
            msg += "下架？";
            status = 0;
        } else {
            msg += "上架？"
            status = 1;
        }
        //弹窗
        var index = layer.load(0,{shade:0.3});
        layer.confirm(msg, {icon:3, title:'警告'}, function(index){

            $.post(
                "<%=request.getContextPath()%>/product/updateStatus",
                {"id":str,"status":status},
                function(data){
                    if(data.code != 200){
                        layer.close(index);
                        layer.msg(data.msg, {icon: 0});
                        return;
                    }
                    layer.msg(data.msg, {icon: 6,time: 666 }, function(){
                        layer.close(index);
                        /* alert(data.msg); */
                        window.location.href = "<%=request.getContextPath()%>/product/toShow"
                    });
                })
        });
        layer.close(index);
    }

    function del(){
        var len = $("input[name='ids']:checked").length

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
        });
        var index = layer.load(0,{shade:0.3});
        layer.confirm('确定删除?', {icon:3, title:'警告'}, function(index){
            //do something
            $.post(
                "<%=request.getContextPath()%>/product/del",
                {"ids":str,"isDel":0},
                function(data){
                    layer.msg(data.msg, {icon: 6,time: 1000 }, function(){
                        layer.close(index);
                        if(data.code != 200){
                            return ;
                        }
                        window.location.href = "<%=request.getContextPath()%>/product/toShow"
                    });
                })
        });
        layer.close(index);
    }

    function findName(){
        if($("#pName").val() != null){
            $("#pageNum").val(1);
        }
        search();
    }
</script>
<body>
<form id="searchFm">
    <input type = "hidden" value = "1" id ="pageNum" name ="pageNum" />
    <input type = "hidden" value = "1" id ="isDel" name ="isDel" />
    <input type="text" name="pName" id = "pName" />
    <button type='button' 	class='layui-btn layui-btn-xs layui-btn-radius'  onclick="findName()"><i class='layui-icon'>按商品名查询</i></button>
</form>
<shiro:hasPermission name="product:insert">
    <input type="button" value="新增" onclick = 'insert()'>&nbsp;
</shiro:hasPermission>
<shiro:hasPermission name="product:update">
    <input type="button" value="修改" onclick = 'update()'>&nbsp;
</shiro:hasPermission>
<shiro:hasPermission name="product:updateStatus">
    <input type="button" value="上架/下架" onclick = 'updateStatus()'>&nbsp;
</shiro:hasPermission>
<shiro:hasPermission name="product:del">
    <input type="button" value="删除" onclick = 'del()'>&nbsp;
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
        <th style="background: aqua;"></th>
        <th style="background: aqua;">编号</th>
        <th style="background: aqua;">商品名</th>
        <th style="background: aqua;">商品说明</th>
        <th style="background: aqua;">商品价格</th>
        <th style="background: aqua;">上架/下架</th>
        <th style="background: aqua;">创建时间</th>
        <th style="background: aqua;">更新时间</th>
        <shiro:hasPermission name="product:purchase">
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
