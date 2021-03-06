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
                    if (list.roleNameShow == "技师"){
                        html += "<td><a href='#' onclick='isReport("+list.isReport+")'>查看举报次数</a></td>";
                    } else if (list.roleNameShow == "普通用户"){
                        html += "<td><a href='#' onclick='accountMoney("+list.accountMoney+")'>查看余额</a></td>";
                    } else {
                        html += "<td>--------</td>";
                    }
                    html += "</tr>";
                }
                $("#tbd").html(html);
        })
    }

    //查看举报次数
    function isReport(isReport){
        layer.msg("您已被举报"+isReport+"次", {icon: 2});
    }

    //查看余额
    function accountMoney(accountMoney){
        layer.confirm('您的余额还有：'+accountMoney+'元，是否需要充值？', {icon: 3, title:'查看余额'}, function(index){
            layer.close(index);
            layer.open({
                type: 2,
                title: '充值页面',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath()%>/user/toAccountMoney/'+accountMoney
            });
        });
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

    //新增
    function toAddUser(){
        layer.open({
            type: 2,
            title: [
                '新增',
                'background-color:#8DCE16; color:#fff;'
            ],
            shadeClose: true,
            shade: 0.3,
            area: ['380px', '80%'],
            content: '<%=request.getContextPath()%>/user/toLevel' //iframe的url
        });
    }

    //去充值页面
    function toChong() {
        window.location.href = "<%=request.getContextPath()%>/user/toChong" //iframe的url
    }

    //领取新人福利方法

    //领取福利
    function getUserFu(){
        $.post("<%=request.getContextPath()%>/user/getUserFu",
            {"_method":"PUT"},
            function(data){
                if(data.code != 200){
                    alert(data.msg)
                    return;
                }
                alert(data.msg)
                window.location.href = "<%=request.getContextPath()%>/user/toShow";

            });
    }

    //预约技师
    function getPrevoir(){
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
        var expertId;
        $.post("<%=request.getContextPath()%>/user/expertShow",
            {},
            function(data){
                expertId = data.data[0].id;
                $.post("<%=request.getContextPath()%>/expertPrevoir/insert",
                    {"userId":id,"ordreType":0,"expertId":expertId,"prix":100,"_method":"PUT"},
                    function(data){
                        if(data.code != 200){
                            alert(data.msg)
                            return;
                        }
                        alert(data.msg)
                        window.location.href = "<%=request.getContextPath()%>/user/toShow";
                    });
            });

    }

</script>
<body>
<shiro:hasPermission name="user:show">
    <button type="button" class="layui-btn layui-btn-fluid" onclick="toAddUser()">员工信息注册</button><br>
<form id="fm" class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label"> 用户名/手机号/邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="userName" lay-verify="title" autocomplete="off" placeholder="模糊查字段" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block">
            <input type="radio" name="roleId" value="1" title="用户" >
            <input type="radio" name="roleId" value="2" title="管理员">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="1" title="男" >
            <input type="radio" name="sex" value="2" title="女">
        </div>
    </div>
   <div class="layui-inline">
       <label class="layui-form-label">状态</label>
       <div class="layui-input-inline">
           <select name="status" lay-verify="required" lay-search="">
               <option value="0">--请选择--</option>
               <option value="1">激活</option>
               <option value="-1">未激活</option>
           </select>
       </div>
   </div><br>
   <button type="button" class="layui-btn layui-btn-normal layui-btn-radius" onclick="show()">搜索</button>

</form>
</shiro:hasPermission>
<shiro:hasPermission name="user:update">
    <button type="button" class="layui-btn" onclick="updateById()"><i class="layui-icon"></i></button>
</shiro:hasPermission>
<shiro:hasPermission name="user:updateStatus">
    <button type="button" class="layui-btn layui-btn-normal" onclick="updateStatusById()">激活</button>
</shiro:hasPermission>
<shiro:hasPermission name="user:del">
    <button type="button" class="layui-btn layui-btn-danger" onclick="delByIds()"><i class="layui-icon"></i></button>
</shiro:hasPermission>
<shiro:hasPermission name="user:confer">
    <button type="button" class="layui-btn layui-btn-normal layui-btn-radius" onclick="confer()">授权</button>
</shiro:hasPermission>

<shiro:hasPermission name="user:getChong">
<button type="button" class="layui-btn layui-btn-warm layui-btn-radius" onclick="toChong()">充值vip</button>
</shiro:hasPermission>

<shiro:hasPermission name="user:getFu">
<input type="button" value="领取新人福利" onclick="getUserFu()"><br/>
</shiro:hasPermission>

<shiro:hasPermission name="expertPrevoir:insert">
    <input type="button" value="预约技师" onclick="getPrevoir()"><br/>
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
            <th style="background: aquamarine;">操作</th>
        </tr>
        </thead>
        <tbody id = "tbd">
        </tbody>
    </table>
<script>
    layui.use('form', function(){
        var form = layui.form;

        //各种基于事件的操作，下面会有进一步介绍
    });


</script>
</body>
</html>
