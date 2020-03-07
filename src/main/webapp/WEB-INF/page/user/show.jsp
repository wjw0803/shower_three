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
        $.post("<%=request.getContextPath()%>/user/show",
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



    //去修改
    function updateById(){
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
        layer.confirm('确定修改吗?', {icon: 3, title:'提示'}, function(index){
            //do something

            layer.close(index);

            layer.open({
                type: 2,
                title: '修改页面',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath()%>/user/toUpdate/'+id
            });
        });
    }

  //授权
    function confer(){
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
        layer.confirm('确定授权吗?', {icon: 3, title:'提示'}, function(index){
            //do something

            layer.close(index);

            layer.open({
                type: 2,
                title: '页面',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath()%>/user/toConfer/'+id
            });
        });
    }

    //激活
    function updateStatusById(){
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
        layer.confirm('确定激活吗?', {icon: 3, title:'提示'}, function(index){
            //do something

            layer.close(index);

            $.post(
                '<%=request.getContextPath()%>/user/update',
                {"status":1,"id":id},
                function(data){
                    if (data.code != -1) {
                        layer.msg("激活成功!", {icon: 6}, function(){
                             window.location.href = "<%=request.getContextPath()%>/user/toShow";
                        });
                        return;
                    }
                    layer.msg("激活有误,联系管理员", {icon: 5})

                }
            )
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

            $.post("<%=request.getContextPath()%>/user/del ",
                {"id":id, "isDel":0},
                function(data){
                    layer.close(index);
                    if (data.code == -1){
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    window.location.href="<%=request.getContextPath()%>/user/toShow";
                });
        });
    }

    //批量刪除
    function delByIds(){
        var length = $("input[name='id']:checked").length;
        if(length <= 0){
            layer.msg('请至少选择一个!', {icon:0});
            return;
        }
        var str = "";
        $("input[name='id']:checked").each(function (index, item) {
            if ($("input[name='id']:checked").length-1==index) {
                str += $(this).val();
            } else {
                str += $(this).val() + ",";
            }
        });
        var id = $("input[name='id']:checked").val();
        layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function(index){
            var index = layer.load(1,{shade:0.5});
            $.post("<%=request.getContextPath()%>/user/delByIds",
                {"ids":str,"isDel": 0},
                function(data){
                    if(data.code == 200){
                        layer.msg(data.msg, {
                            icon: 6,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        }, function(){
                            window.location.href = "<%=request.getContextPath()%>/user/toShow";
                        });
                        return;
                    }
                    layer.msg(data.msg, {icon:5});
                    layer.close(index);
                });
        });
        layer.close(index);
    }

</script>
<body>
<form id="fm">
    用户名/手机号/邮箱<input name="userName" type="text"><br>
    角色:
    <input type="radio" name="roleId" value="1" >用户
    <input type="radio" name="roleId" value="2">管理员<br />
    性别:
    <input type="radio" name="sex" value="1">男
    <input type="radio" name="sex" value="2">女<br />
    状态<select name="status">
            <option value="0">--请选择--</option>
            <option value="1">激活</option>
            <option value="-1">未激活</option>
        </select><br>
    <input type="button" value="搜索" onclick="show()">
</form>
<shiro:hasPermission name="user:update">
    <input type="button" value="修改" onclick="updateById()">&nbsp;
</shiro:hasPermission>
<shiro:hasPermission name="user:updateStatus">
    <input type="button" value="激活" onclick="updateStatusById()">&nbsp;
</shiro:hasPermission>
<shiro:hasPermission name="user:del">
    <input type="button" value="删除" onclick = 'delByIds()'>&nbsp;
</shiro:hasPermission>
<shiro:hasPermission name="user:confer">
    <input type="button" value="授权" onclick = "confer()">
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
