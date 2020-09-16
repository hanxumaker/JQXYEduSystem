<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/12
  Time: 11:34
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/9/13
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
    <title>管理员页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">金桥学员跟踪系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">欢迎您
                <img src="../../static/imgs/2.jpg" class="layui-nav-img">
            </li>
            <li class="layui-nav-item"><a href="login">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="userList" target="show">用户信息</a></li>
                <li class="layui-nav-item"><a href="studentList" target="show">学生管理</a></li>
                <li class="layui-nav-item"><a href="teacherList" target="show">教师管理</a></li>
                <li class="layui-nav-item"><a href="managerList" target="show">经理管理</a></li>
                <li class="layui-nav-item"><a href="classList" target="show">班级管理</a></li>
                <li class="layui-nav-item"><a href="courseList" target="show">课程管理</a></li>
                <li class="layui-nav-item"><a href="analytesList" target="show">评分项管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 5px;">

            <iframe width="100%" height="800px" name="show" src="userList"></iframe>

        </div>
        <div class="layui-footer" align="center">
            <!-- 底部固定区域 -->
            ©  2020 金现代金桥工程. All Rights Reserved. 公司地址:山东省济南市高新区奥盛大厦2号楼
        </div>
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

</script>
</body>
</html>