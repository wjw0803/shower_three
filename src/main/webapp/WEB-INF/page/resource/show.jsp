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
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/zTree_v3/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/css/layui.css"  media="all">
<head>
    <title>展示</title>
</head>
<script type="text/javascript">
    var treeObj;
    var setting = {
        // check: {
        //     enable: true
        // },
        data: {
            simpleData: {
                enable: true,
                pIdKey: "pid",
            },
            key: {
                name: "resourceName",
                url: "resourceUrl"

            }
        },

    };

    $(function () {
        $.post(
            "<%=request.getContextPath()%>/resource/show",
            function (data) {
                treeObj = $.fn.zTree.init($("#tree"), setting, data);
            }
        )
    })


    //新增
    function save() {
        //获取树对象
        var treeOb = $.fn.zTree.getZTreeObj("tree");
        var pId = 0;
        //获取选中节点
        var nodes = treeOb.getSelectedNodes();
        if(nodes != undefined && nodes.length > 0){
            pId = nodes[0].id;
        }
        layer.open({
            type: 2,
            titel: "新增",
            area: ["400px", "400px"],
            content: "<%=request.getContextPath()%>/resource/toAdd/" + pId,
            end: function () {
                location.reload();
            }
        });
    }

    function updateRes(value) {
        var treeObj = $.fn.zTree.getZTreeObj("tree");
        var selectNode = treeObj.getSelectedNodes();
        if (selectNode.length <= 0) {
            layer.msg("至少选择一个节点操作");
            return false;
        }
        if (selectNode.length > 1) {
            layer.msg("只能选择一个节点操作");
            return false;
        }
        var id = selectNode[0].id;
        layer.open({
            type: 2,
            titel: "修改",
            area: ["400px", "400px"],
            content: "<%=request.getContextPath()%>/resource/toUpdate/"+id,
        });
    }

    function deleRes(value) {
        var treeObj = $.fn.zTree.getZTreeObj("tree");
        var selectNode = treeObj.getSelectedNodes();
        if (selectNode.length <= 0) {
            layer.msg("至少选择一个节点操作");
            return false;
        }
        if (selectNode.length > 1) {
            layer.msg("只能选择一个节点操作");
            return false;
        }
        var id = selectNode[0].id;
        $.post(
            "<%=request.getContextPath() %>/resource/delById",
            {"id": id, "isDel":0},
            function (data) {
                if (data.code == 200) {
                    layer.msg(data.msg, {
                        icon: 6,
                    }, function () {
                        window.location.href = "<%=request.getContextPath()%>/resource/toShow";
                    });
                } else {
                    layer.msg(data.msg, {icon: 5});
                }
            })
    }

    <%--function deleRes() {--%>
    <%--    // 获取选中的节点--%>
    <%--    var treeObj = $.fn.zTree.getZTreeObj("tree");--%>
    <%--    var selectNode = treeObj.getSelectedNodes()[0];--%>
    <%--    if (selectNode == null) {--%>
    <%--        layer.msg("至少选择一个节点操作");--%>
    <%--        return false;--%>
    <%--    }--%>

    <%--    // // 如果当前选中的节点是 父节点 要获取全部的后代节点信息--%>
    <%--    // var ids = "";--%>
    <%--    // if (selectNode.isParent) {--%>
    <%--    //     ids = getChildNode(selectNode);--%>
    <%--    // }--%>
    <%--    // ids += selectNode.id;--%>
    <%--    //获取父节点--%>
    <%--    var id = selectNode[0].id;--%>
    <%--    layer.msg('确定删除?', {--%>
    <%--        time: 0 //不自动关闭--%>
    <%--        , btn: ['确定', '取消']--%>
    <%--        , yes: function () {--%>
    <%--            $.post(--%>
    <%--                "<%=request.getContextPath() %>/resource/delById",--%>
    <%--                {"id": id, "isDel":0},--%>
    <%--                function (data) {--%>
    <%--                    if (data.code == 200) {--%>
    <%--                        layer.msg(data.msg, {--%>
    <%--                            icon: 6,--%>
    <%--                        }, function () {--%>
    <%--                            window.location.href = "<%=request.getContextPath()%>/resource/toShow";--%>
    <%--                        });--%>
    <%--                    } else {--%>
    <%--                        layer.msg(data.msg, {icon: 5});--%>
    <%--                    }--%>
    <%--                })--%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>

    //递归自我调用
    function getChildNode(parentNode) {
        var ids = "";
        // 获取子节点
        var childs = parentNode.children;
        for (var i = 0; i < childs.length; i++) {
            ids += childs[i].id + ",";
            if (childs[i].isParent) {
                ids += getChildNode(childs[i]);
            }
        }
        return ids;
    }


</script>
<body>
<shiro:hasPermission name="resource:add">
    <input type="button" value="新增" onclick="save()">
</shiro:hasPermission>
<shiro:hasPermission name="resource:update">
    <input type="button" value="修改" onclick="updateRes()">
</shiro:hasPermission>
<shiro:hasPermission name="resource:del">
    <input type="button" value="删除" onclick="deleRes()">
</shiro:hasPermission>



<div id="tree" class="ztree">

</div>
</body>
</html>