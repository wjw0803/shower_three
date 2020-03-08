<%--
  Created by IntelliJ IDEA.
  User: qinbb
  Date: 2020/1/29
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Titl</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
    <script src="<%=request.getContextPath()%>/static/validate/jquery.validate.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/css/layui.css"  media="all">
    <script>


        //修改
       function update() {
           var index = layer.load(1, {shade: 0.3}, {shadeClose: true}); //解决网络延迟的加载重复操作问题
           layer.msg('请稍等', {
               icon: 1,
               time: 2000, //2秒关闭（如果不配置，默认是3秒）
               shade: [0.8, '#393D49']
           }, function () {
               //do something

               $.post("<%=request.getContextPath()%>/maintain/update ",
                   $("#fm").serialize(),
                   function (data) {
                       layer.close(index);
                       if (data.code == -1) {
                           layer.msg(data.msg, {icon: 5});
                           return;
                       }
                       parent.window.location.href = "<%=request.getContextPath()%>/maintain/toShow";
                   });
           });
       }

    </script>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
<form id="fm">
    编号 ${maintain.maintainId} <br>
    填写维修时间${maintain.maintainTimeShow} <br>
    维修项目
    <c:forEach var="b" items="${basicData}">
        <c:if test="${maintain.maintainProject == b.id}">${b.baseName}</c:if>
    </c:forEach><br>
    状态
    <c:forEach var="bd" items="${basicData}">
        <c:if test="${maintain.status == bd.id}">${bd.baseName}</c:if>
    </c:forEach><br>
    审核:
    <c:if test="${roleId == 3}">
            <select name="status">
                <option value="3">待审核</option>
            </select>
    </c:if>
    <c:if test="${roleId == 2}">
         <select name="status">
            <option value="4">已通过</option>
         </select>
    </c:if>
        <input type="hidden" name="id" value="${maintain.id}"><br>
    <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="update()">修改</button>
</form>
</body>
</html>
