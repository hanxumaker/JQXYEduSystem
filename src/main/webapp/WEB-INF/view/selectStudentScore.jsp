<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/14
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看学生成绩页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-table-tool-self{
            display: none;
        }
        .layui-icon-ok{
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div align="center">
    <table id="demo" lay-filter="test"></table>
</div>
<script>
    layui.use(['table','layer','jquery'], function() {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;

        //第一个实例
        table.render({
            elem: '#demo'
            , url: '/getStudentScore' //数据接口
            , page: false
            , cols: [[ //表头
                  {field: 'coursename', title: '课程', width: 164, sort: true, align: 'center'}
                , {field: 'score', title: '分数', width: 180, align: 'center'}
            ]]
        });
    })
</script>
</body>
</html>

