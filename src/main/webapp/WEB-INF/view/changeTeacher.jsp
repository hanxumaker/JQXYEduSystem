<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/17
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加班级</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<form class="layui-form">
    <div style="display: flex;justify-content: center">
        <div class="layui-form">
            <div align="center">
                <div class="layui-form-item" style="margin-top: 30px">
                    <label class="layui-form-label">班级名称</label>
                    <div class="layui-input-inline">
                        <input type="text" lay-verify="required" class="layui-input" id="cid" value="${param.cid}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">老师</label>
                    <div class="layui-input-block">
                        <select id="teacherFilter" class="layui-form-select">
                            <option value="">请选择老师</option>
                            <c:forEach var="teacher" items="${teacher}">
                                <option value="${teacher.tid}">${teacher.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block" align="left">
                        <button type="button" class="layui-btn" id="add" lay-filter="formDemo">提交</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    layui.use('form', function () {
        var layer = layui.layer;
        $ = layui.jquery;

        $("#add").click(function () {
             if ($("#teacherFilter").val() ==null ||$("#teacherFilter").val() == ""){
                layer.msg("请为班级选择一个老师")
             } else {
                $.ajax({
                    url: "changeTea",
                    type: "post",
                    data: {
                        cid: $("#cid").val(),
                        tid: $("#teacherFilter").val()
                    },
                    success: function (data) {
                        layer.msg(data);
                        setTimeout('closeAdd()', 1000)
                    },
                    error: function (data) {
                        layer.msg("执行失败");
                        setTimeout('closeAdd()', 1000)
                    }
                })
            }
        })
    });
    function closeAdd() {
        parent.location.reload();//刷新父页面
    }

</script>
</body>
</html>

