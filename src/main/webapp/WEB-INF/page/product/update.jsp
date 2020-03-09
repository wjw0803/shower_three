<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/3/8
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
    <script src="<%=request.getContextPath()%>/static/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/static/My97DatePicker/WdatePicker.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/css/layui.css"  media="all">

    <script>
        function update(){
            var index = layer.load(0,{shade:0.3});
            $.post(
                "<%=request.getContextPath()%>/product/update",
                $("#fm").serialize(),
                function(data){
                    if(data.code != 200){
                        layer.close(index);
                        layer.msg(data.msg, {icon: 0});
                        return ;
                    }
                    layer.msg(data.msg, {icon: 6,time: 666 }, function(){
                        layer.close(index);
                        parent.window.location.href = "<%=request.getContextPath()%>/product/toShow"
                    });
                })
        }
    </script>
</head>
<body>
<form id = "fm">
    <input type = "hidden"  name="id" value="${product.id}" />
    商品名<input type = "text"  name="pName" value="${product.pName}" /><br/>
    商品说明<input type = "text"  name="message" value="${product.message}" id="pType"/><br/>
    商品价格<input type = "number"  name="price" value="${product.price}"  onkeyup="if(!this.value.match(/^\+?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:\+?\d+(?:\.\d+)?)?$/))this.o_value=this.value" maxlength="8"data-options="required:true" width="100px"  /><br/>
    <input type = "hidden" value = "1" name="status" />
    <input type = "hidden" value = "${user.id}" name="userId" />
    <input type = "hidden" value = "1" name="isDel" />
    <input type="button" value="提交" onclick="update()">

</form>
</body>
</html>
