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
    <style>
        .layui-form-label.layui-required:after {
            content: "*";
            color: red;
            position: absolute;
            top: 5px;
            left: 15px;
        }
    </style>
</head>
<body>
<div style="margin: 200px 100px 0px 450px">
    <div class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名:</label>
            <div class="layui-input-inline">
                <input type="text" name="uname" id="uname" readonly value="${sessionScope.User.uname}"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">旧密码:</label>
            <div class="layui-input-inline">
                <input type="password" name="password" id="password" placeholder="请输入旧密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码:</label>
            <div class="layui-input-inline">
                <input type="password" name="password1" id="password1" required lay-verify="required"
                       placeholder="请输入新密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码:</label>
            <div class="layui-input-inline">
                <input type="password" name="password2" id="password2" required lay-verify="required"
                       placeholder="请确认新密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" class="layui-btn" lay-submit lay-filter="formDemo" id="sub">
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var layer = layui.layer;
        //判断旧密码是否输入正确
        $("#password").blur(function () {
            if ($("#password").val() != ${sessionScope.User.password}) {
                layer.msg("旧密码输入错误", {icon: 2}, function () {
                    $("#password").val("");
                });
                return false;
            }
        });
        //判断两次输入的密码是否一致
        $("#password2").blur(function () {
            if ($("#password1").val() != $("#password2").val()) {
                layer.msg("两次密码输入不一致,请重新输入", {icon: 2, time: 2000}, function () {
                    $("#password2").val("");
                    return false;
                });
            }
        });
        //点击提交按钮，判断密码输入、确认密码输入是否为空，不为空执行ajax请求
        $("#sub").click(function () {
            if ($("#password").val() == "" || $("#password1").val() == "" || $("#password2").val() == "") {
                layer.msg("信息填写不完整,不能提交", {icon: 2, time: 2000});
            } else {
                $.ajax({
                    url: "updateManagerPwd",
                    type: "post",
                    data: {
                        uname: '${sessionScope.User.uname}',
                        password: $("#password").val()
                    },
                    success: function (data) {
                        if (data) {
                            layer.msg("修改成功,您需要重新登录", {icon: 6, time: 2000}, function () {
                                top.location.href = "login2";/* 在顶层页面打开url(跳出框架)*/
                            });
                        } else {
                            layer.msg("修改失败")
                        }
                    },
                    error: function (data) {
                        layer.msg("执行失败")
                    }
                })
            }
        })
    })
</script>
</body>
</html>
