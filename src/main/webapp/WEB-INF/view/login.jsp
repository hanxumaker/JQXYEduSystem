<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/11
  Time: 7:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        body {
            text-align: center; /*把整体的页面居中*/
            background-image: url("../../static/imgs/5.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
            background-attachment: fixed;
            overflow:hidden;
             /*取消滚动条*/
        }

        #div1 {
            border: #F0F0F0 solid;
            width: 400px;
            margin: 200px auto;
            background-color: #F0F0F0;
        }

        #div2 {
            display: inline-block;
            font-size: 20px;
            margin-top: 15px;
            margin-bottom: 5px;
            color: #6AA2E0;
            width: 80%;
        }

        #div3 {
            display: inline-block;
            font-size: 15px;
            margin-top: 15px;
            margin-bottom: 5px;
            color: #6AA2E0;
            width: 80%;
            right: 28px;
            position: relative;
        }

        #div4 {
            display: inline-block;
            font-size: 15px;
            margin-top: 15px;
            margin-bottom: 5px;
            color: #6AA2E0;
            width: 80%;
            right: 28px;
            position: relative;
        }

    </style>
</head>

<body>
<!--action表示当前表单提交到哪里去
action的值对应地是url-pattern-->
<div class="layui-row layui-col-space10" id="div1">
    <div class="layui-form">
        <div id="div2">金桥学员追踪系统</div>
        <div class="layui-form-item" id="div3">
            <label class="layui-form-label">
                <i class="layui-icon layui-icon-username " style="font-size: 30px; color: #1E9FFF;"></i>
            </label>
            <div class="layui-input-block">
                <input type="text" name="uname" id="uname" required lay-verify="required" placeholder="请输入用户名"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" id="div4">
            <label class="layui-form-label">
                <i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i>
            </label>
            <div class="layui-input-block">
                <input type="password" name="password" id="password" required lay-verify="required" class="layui-input"
                       placeholder="请输入密码">
            </div>
        </div>

        <div class="layui-form-item" align="center">
            <button class="layui-btn layui-btn-radius layui-btn-normal  layui-btn-sm" type="button" id="sub">登录</button>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        var layer = layui.layer;
        $ = layui.jquery;
        $("#sub").click(function () {
            if ($("#uname").val() == "" || $("#password").val() == "") {
                layer.msg("信息填写不完整,无法登录", {offset: '100px', icon: 2,time:2000 });//offset:只定义top坐标，水平保持居中
            } else {
                $.ajax({
                    url: "checkUser",
                    type: "post",
                    data: {
                        uname: $("#uname").val(),
                        password: $("#password").val()
                    },
                    success: function (data) {
                        if (data === "admin") {
                            location.href = "toAdmin";
                        } else if (data === "teacher") {
                            location.href = "toTeacher";
                        } else if (data === "manager") {
                            location.href = "toManager";
                        } else {
                            layer.msg(data,{icon:2,time:2000},function () {
                                $("#uname").val("");
                                $("#password").val("");
                            });

                        }
                    },
                    error: function (data) {
                        layer.msg("执行失败")
                    }
                })
            }
        });
    })
</script>
</body>
</html>
