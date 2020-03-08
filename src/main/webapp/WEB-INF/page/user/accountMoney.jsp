<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/3/8
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
<script>

    function updateAccountMoney() {
        var index = layer.load(1, {shade: 0.3}, {shadeClose: true}); //解决网络延迟的加载重复操作问题
        layer.msg('请稍等', {
            icon: 1,
            time: 2000, //2秒关闭（如果不配置，默认是3秒）
            shade: [0.8, '#393D49']
        }, function () {
            $.post("<%=request.getContextPath()%>/user/accountMoney",
                $("#fm").serialize(),
                function (data) {
                    layer.close(index);
                    layer.msg(data.msg, {icon: 6});
                    if (data.code == -1) {
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    parent.window.location.href = "<%=request.getContextPath()%>/user/toShow";
                });
        });
    }


</script>
<body>

    <form id = "fm">
        <input type="hidden" name="accountMoney" value="${accountMoney}"/>
        当前余额：${accountMoney}<br />
        请输入充值的金额：<input type="text" name="userMoney"/>
        <input type="button" value="确定" onclick="updateAccountMoney()"/>
    </form>
</body>
</html>
