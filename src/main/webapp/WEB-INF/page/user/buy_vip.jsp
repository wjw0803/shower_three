<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/3/8
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/gVerify.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>欢迎充值</h4>
充值说明1日vip:3元<br/>
1月vip:30元<br/>
1年vip:256元<br/>

<form id="fm">
    <input type="hidden" name="_method" value="PUT">
    <select name="vipType">
        <option value="">==请选择==</option>
        <option value="0">1日vip</option>
        <option value="1">1月vip</option>
        <option value="2">1年vip</option>
    </select><br/>
    <%--<div id="v_container" style="width: 200px;height: 50px;"></div>
    <input type="text" id="code_input" name="tuCode" value="" placeholder="请输入验证码"/><button id="my_button">验证</button>--%>
    <input type="button" value="确认充值" onclick="buyVip()" >
</form>

</body>
<script>

/*    var verifyCode = new GVerify("v_container");

    document.getElementById("my_button").onclick = function(){

        var res = verifyCode.validate(document.getElementById("code_input").value);

        if(res){
            alert("验证正确");
        }else{
            alert("验证码错误");
            window.location.href = "<%=request.getContextPath()%>/user/toChong";
        }
    }*/


    //购买vip方法
    function buyVip() {

   /*     $("#my_button").trigger('click');*/

        $.post("<%=request.getContextPath()%>/user/buyVip",

            $("#fm").serialize(),

            function(data){

                if(data.code != 200){
                    alert(data.msg)
                    return;
                }
                alert(data.msg)
                window.location.href = "<%=request.getContextPath()%>/user/toShow";

            });
    }


</script>
</html>
