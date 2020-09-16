<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/12
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>经理页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">金桥学员跟踪系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">欢迎您${sessionScope.User.uname}
                <img src="../../static/imgs/2.jpg" class="layui-nav-img">

            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a href="toGetStudentByDeptno" target="mFrame">部门员工</a>
                </li>
                <li class="layui-nav-item">
                    <a href="">修改密码</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body" style="height:100%">
        <!-- 内容主体区域 -->
        <div>
            <iframe style="display: block;overflow: hidden" frameborder="0" class="layadmin-iframe"
                    width="100%" height="100%" name="mFrame" scrolling="false"></iframe>
        </div>
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>