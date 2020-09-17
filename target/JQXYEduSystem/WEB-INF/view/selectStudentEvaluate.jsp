<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/15
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看学生整体评价页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="display: flex;justify-content: center">
    <div class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">整体分数</label>
            <div class="layui-input-block">
                <input type="text" name="finalScore" value="${schoolEvaluate.finalScore}" class="layui-input">
            </div>
        </div>
        <div class="layui-input-item">
            <label class="layui-form-label">综合评价</label>
            <textarea rows="8" cols="25" name="comment">
                ${schoolEvaluate.comment}
            </textarea>
        </div>
    </div>
</div>
<script>
    layui.use('form', function(){
        var form = layui.form;
        })
</script>
</body>
</html>