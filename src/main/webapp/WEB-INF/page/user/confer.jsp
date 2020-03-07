
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/css/layui.css" media="all">
<head>
    <title>展示</title>
</head>
<script type="text/javascript">

    function update (){
        var index = layer.load(1,{shade:0.5});
        $.post(
            "<%=request.getContextPath()%>/user/updateUserRole",
            $("#fm").serialize(),
            function(data){
                if (data.code != -1) {
                    layer.msg(data.msg, {icon: 6}, function(){
                        parent.window.location.href = "<%=request.getContextPath()%>/user/toShow";
                    });
                    return;
                }
                layer.msg(data.msg, {icon: 5})
                layer.close(index);

            }
        )
    }

</script>
<body>
<form id = "fm">
    <input type="button" value="确定" onclick="update()"><br />
    <input type="hidden" name="userId" value="${id}">
    <table border="1px">
        <tr>
            <th>编号</th>
            <th>角色名</th>
        </tr>
        <c:forEach items="${roleList}" var="r">
            <tr>
                <td>
                    <input type="radio" name="roleId" value="${r.id}" <c:if test="${r.id == userRole.roleId}">checked</c:if>>
                        ${r.id}
                </td>
                <td>${r.roleName}</td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>