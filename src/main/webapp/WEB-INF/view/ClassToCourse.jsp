<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/18
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div align="center">
    <h2 style="margin: 30px 0px 20px 0px">课程管理</h2>
    <div class="layui-form-item">
        <label class="layui-form-label">课程：</label>

    </div>
</div>
<div id="AllSubject">
</div>
<script>
    layui.use(['table', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;
        //第一个实例
        $.ajax({
            url: 'getAllC',
            dataType: 'json',
            type: 'post',
            success: function (data) {
                $.each(data, function (index,item) {
                    $("#AllSubject").html("<input type='checkbox' name='course' value='" + item.courseId + "' title='" + item.courseName + "'>" );
                });
                layui.form.render();
            },
            error: function () {
                layer.msg("执行失败")
            }
        });
    });
</script>

</body>

</html>