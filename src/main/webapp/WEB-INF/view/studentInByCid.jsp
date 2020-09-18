<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/17
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生详细信息</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div class="layui-col-md8 layui-col-md-offset2">
    <table align="center" class="layui-table">
        <tr>
            <td>姓名</td>
            <td>${student.sname}</td>
            <td>性别</td>
            <td>${student.sex}</td>
            <td>民族</td>
            <td>${student.nation}</td>
            <td rowspan="4">
                <img src="${student.photo}" style="width: 100px;height: 140px">
            </td>
        </tr>
        <tr>
            <td>出生年月</td>
            <td>${student.birthday}</td>
            <td>籍贯</td>
            <td>${student.address}</td>
            <td>婚否</td>
            <td>${student.married}</td>
        </tr>
        <tr>
            <td>联系电话</td>
            <td colspan="2">${student.phone}</td>
            <td>身份证号码</td>
            <td colspan="2">${student.idCard}</td>
        </tr>
        <tr>
            <td>毕业院校</td>
            <td colspan="2">${student.school}</td>
            <td>专业</td>
            <td colspan="2">${student.major}</td>
        </tr>
    </table>
</div>
</body>
</html>
