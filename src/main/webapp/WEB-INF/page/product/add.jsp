<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/3/8
  Time: 21:49
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

        $(function(){
            $("#fm").validate({
                errorPlacement: function(error, element) {
                    if (element.is("[name='pType']")){ //如果需要验证的元素名为userHobby
                        error.appendTo($("#aa"));   //错误增加在id为'checkbox-lang'中
                    } /* else if(element.is("[name='userSex']")){//如果需要验证的元素名为userSex
					 error.appendTo($("#sexError"));   //错误信息增加在id为‘radio-lang’中
				  } */ else {
                        error.insertAfter(element);//其他的就显示在添加框后
                    }

                },
                rules:{
                    pName:{
                        required:true,

                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                            type: 'POST',
                            url: "<%=request.getContextPath()%>/product/findByName",
                            data:{
                                pName:function() {
                                    return $("#pName").val();
                                },
                                dataType:"json",
                                dataFilter:function(data,type){
                                    if (data == 'true'){
                                        return true;
                                    }else {
                                        return false	;
                                    }
                                }

                            }
                        }
                    },
                    price:{
                        required:true
                    },
                    pType:{
                        required:true
                    }

                },
                messages:{
                    pName:{
                        required:"请填写商品名",
                        remote:"商品名已存在"
                    },
                    price:{
                        required:"请填写商品价格"
                    },
                    pType:{
                        required:"请填写商品种类"
                    }
                }

            })

        })


        $.validator.setDefaults({
            submitHandler: function() {

                /*	/!*注释：把表单里的密码md5一下传到后台，后台再加密*!/
                    var password = md5($("#aa").val());
                    $("#aa").val(password);*/

                $.post("<%=request.getContextPath() %>/product/add",
                    $("#fm").serialize(),
                    function(data){

                        if(data.code != 200){
                            alert(data.msg)
                            return;
                        }
                        alert(data.msg);
                        parent.window.location.href = "<%=request.getContextPath()%>/product/toShow";
                    })
            }
        });

    </script>

    <style>
        .error{
            color: red;
        }

    </style>
</head>
<body>
<form id = "fm">
    <input type = "hidden"  name="id" />
    商品名<input type = "text"  name="pName" id="pName"/><br/>
    商品说明<input type = "text"  name="message" id="message"/><br/>
    商品价格<input type = "number"  name="price"  onkeyup="if(!this.value.match(/^\+?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:\+?\d+(?:\.\d+)?)?$/))this.o_value=this.value" maxlength="8"data-options="required:true" width="100px"  /><br/>
    <input type = "hidden" value = "1" name="status" />
    <input type = "hidden" value = "${user.id}" name="userId" />
    <input type = "hidden" value = "1" name="isDel" />
    <button type="submit" class="layui-btn layui-btn-xs layui-btn-normal" >提交</button>
</form>
</body>
</html>
