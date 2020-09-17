<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/9/17
  Time: 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="margin: 250px 100px 0px 400px">
    <div class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名:</label>
            <div class="layui-input-inline">
                <input type="text" name="uname" id="uname" readonly value="${sessionScope.User.uname}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">旧密码:</label>
            <div class="layui-input-inline">
                <input type="text" value="${sessionScope.User.password}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码:</label>
            <div class="layui-input-inline">
                <input type="password" name="password" id="password" required lay-verify="required"
                       placeholder="请输入新密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" class="layui-btn" lay-submit lay-filter="formDemo" id="sub"></input>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form','layer'], function () {
         $ = layui.jquery;
        var layer = layui.layer;
        $("#sub").click(function () {
            $.ajax({
                url:"updateManagerPwd",
                type:"post",
                data:{
                    uname:'${sessionScope.User.uname}',
                    password:$("#password").val()
                },
                success:function (data) {
                    if(data){
                        layer.msg("修改成功,密码已修改，您需要退出重新登录",{icon:6,time:2000})
                    }else {
                        layer.msg("修改失败")
                    }
                },
                error:function (data) {
                    layer.msg("执行失败")
                }
            })
        })
    })
</script>

</body>
</html>
