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
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/md5/md5-min.js"></script>
    <script src="<%=request.getContextPath()%>/static/validate/jquery.validate.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/css/layui.css"  media="all">
    <script>

            //注册
        function add() {
                    var index = layer.load(1, {shade: 0.3}, {shadeClose: true}); //解决网络延迟的加载重复操作问题
                    layer.msg('请稍等', {
                        icon: 1,
                        time: 2000, //2秒关闭（如果不配置，默认是3秒）
                        shade: [0.8, '#393D49']
                    }, function () {
                        //密码加盐 md5(md5(pwd)+salt)
                        var pwd = $("#pwd").val();
                        //最终密码
                        var MD5 = md5(md5(pwd) + '${salt}');
                        $("#pwd").val(MD5);
                        $.post("<%=request.getContextPath()%>/maintain/add ",
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

</head>
<body>
<form id="fm">
    填写维修时间<input type="text"  name="maintainTime" onclick="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate:'%y-%M-{%d}', readOnly:true})"  class="Wdate" style="width:200px" ></input>	<br>
    维修项目
                <select name="maintainProject">
                    <c:forEach var="b" items="${basicDataList}">
                         <option value="${b.id}">${b.baseName}</option>
                    </c:forEach><br>
                </select>

        <input type="hidden" name="status" value="2">
        <input type="hidden" name="isDel" value="1"><br>
    <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="add()">注册</button>
</form>
</body>
</html>
