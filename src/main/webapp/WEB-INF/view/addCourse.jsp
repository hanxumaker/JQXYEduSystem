<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/6
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加课程</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<form class="layui-form">
    <div style="display: flex;justify-content: center">
        <div class="layui-form">
            <div align="center">
                <div class="layui-form-item" style="margin-top: 30px">
                    <label class="layui-form-label">*课程</label>
                    <div class="layui-input-inline">
                        <input type="text" name="courseName" lay-verify="required" class="layui-input" id="courseName">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">课程状态</label>
                    <div class="layui-input-block">
                        <select name="state" lay-verify="required" id="state">
                            <option value="0">必选</option>
                            <option value="1">任选</option>
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
            if ($("#courseName").val() == null || $("#courseName").val() == "") {
                layer.msg("课程不能为空")
            }else {
                $.ajax({
                    url: "addCou",
                    type: "post",
                    data: {
                        courseName: $("#courseName").val(),
                        state: $("#state").val()
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
