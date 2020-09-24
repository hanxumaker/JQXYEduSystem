<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/9/14
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看评价页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-input {
            width: 90px;
            height: 65px;
        }

        textarea {
            width: 740px;
            height: 150px;
            padding-left: 0px;
            padding-top: 0px;
        }

        table {
            background-color: #ffffff;
            border-collapse: collapse;
        }

        table td {
            width: 100px;
            text-align: center;
            height: 35px;
            border: 1px solid;
        }

        table th {
            text-align: center;
        }
    </style>
</head>
<body>
<div align="center" style="font-size: 28px;font-family: 华文楷体;font-weight: bold;">员工基本信息表</div>
<br><br>
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
<script>
    //控制工作评价表的显示与隐藏
    layui.use(['table', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
        $ = layui.jquery;
        switch (${student.state}) {
            case 9:
                $("#form").show();
                $("#form1").show();
                $("#form2").show();
                $("#form3").show();
                break;
            case 8:
                $("#form").show();
                $("#form1").show();
                $("#form2").show();
                break;
            case 7:
                $("#form").show();
                $("#form1").show();
                break;
            case 6:
                $("#form").show();
                break;
        }
        /*将学校评价中的课程名循环进该行中*/
        <c:forEach var="schoolEvaluate" items="${sList}" >
        var cne = "${schoolEvaluate.coursename}";
        $("#mtable tr:eq(2)").append("<td>" + cne + "</td>");
        </c:forEach>
    })
</script>
<div id="form" style="display: none">
    <form>
        <table id="mtable" class="layui-table">
            <thead>
            <tr>
                <th colspan="10" style="text-align: center">学校评价</th>
            </tr>
            <tr>
                <th rowspan="2">培训学校</th>
                <th rowspan="2">班期</th>
                <th rowspan="2">评价人</th>
                <th style="text-align: center" colspan="${sList.size()}">培训期间测试成绩</th>
                <th rowspan="2">整体评价分数</th>
            </tr>
            <tr>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>学习评价</td>
                <td>${sList.get(0).get("classname")}</td>
                <td>${sList.get(0).get("tname")}</td>
                <c:forEach var="schoolEvaluation" items="${sList}">
                    <td>${schoolEvaluation.score}</td>
                </c:forEach>
                <td>${sList.get(0).get("finalscore")}</td>
            </tr>
            <tr style="height: 150px">
                <td>评价（包括主要优点及缺陷）</td>
                <td colspan="9">
                    ${sList.get(0).get("comment")}
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<div id="form1" style="display: none">
    <form action="">
        <table class="layui-table">
            <thead>
            <tr>
                <th colspan="10" style="text-align: center">转正工作评价</th>
            </tr>
            <tr>
                <th rowspan="2">项目</th>
                <th rowspan="2">员工部门</th>
                <th rowspan="2">员工职务</th>
                <th rowspan="2">评价人</th>
                <th style="text-align: center" colspan="5">评价分项</th>
                <th rowspan="2">整体评价分数</th>
            </tr>
            <tr>
                <th>能力</th>
                <th>积极性</th>
                <th>沟通交流</th>
                <th>人品</th>
                <th>性格</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>工作评价</td>
                <td>${dname}</td>
                <td>员工</td>
                <td>${sessionScope.User.uname}</td>
                <td>
                    ${wList[0].evaluateScore}
                </td>
                <td>
                    ${wList[1].evaluateScore}
                </td>
                <td>
                    ${wList[2].evaluateScore}
                </td>
                <td>
                    ${wList[3].evaluateScore}
                </td>
                <td>
                    ${wList[4].evaluateScore}
                </td>
                <td>
                    ${wList[0].totalScore}
                </td>
            </tr>
            <tr style="height: 150px">
                <td>评价（包括主要优点及缺陷）</td>
                <td colspan="9">
                    ${wList[0].evaluateContent}
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<div id="form2" style="display: none">
    <form action="">
        <table class="layui-table">
            <thead>
            <tr>
                <th colspan="10" style="text-align: center">工作1年评价</th>
            </tr>
            <tr>
                <th rowspan="2">项目</th>
                <th rowspan="2">员工部门</th>
                <th rowspan="2">员工职务</th>
                <th rowspan="2">评价人</th>
                <th style="text-align: center" colspan="5">评价分项</th>
                <th rowspan="2">整体评价分数</th>
            </tr>
            <tr>
                <th>能力</th>
                <th>积极性</th>
                <th>沟通交流</th>
                <th>人品</th>
                <th>性格</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>工作评价</td>
                <td>${dname}</td>
                <td>员工</td>
                <td>${sessionScope.User.uname}</td>
                <td>
                    ${wList[5].evaluateScore}
                </td>
                <td>
                    ${wList[6].evaluateScore}
                </td>
                <td>
                    ${wList[7].evaluateScore}
                </td>
                <td>
                    ${wList[8].evaluateScore}
                </td>
                <td>
                    ${wList[9].evaluateScore}
                </td>
                <td>
                    ${wList[5].totalScore}
                </td>
            </tr>
            <tr style="height: 150px">
                <td>评价（包括主要优点及缺陷）</td>
                <td colspan="9">
                    ${wList[5].evaluateContent}
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<div id="form3" style="display: none">
    <form action="">
        <table class="layui-table">
            <thead>
            <tr>
                <th colspan="10" style="text-align: center">工作2年评价</th>
            </tr>
            <tr>
                <th rowspan="2">项目</th>
                <th rowspan="2">员工部门</th>
                <th rowspan="2">员工职务</th>
                <th rowspan="2">评价人</th>
                <th style="text-align: center" colspan="5">评价分项</th>
                <th rowspan="2">整体评价分数</th>
            </tr>
            <tr>
                <th>能力</th>
                <th>积极性</th>
                <th>沟通交流</th>
                <th>人品</th>
                <th>性格</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>工作评价</td>
                <td>${dname}</td>
                <td>员工</td>
                <td>${sessionScope.User.uname}</td>
                <td>
                    ${wList[10].evaluateScore}
                </td>
                <td>
                    ${wList[11].evaluateScore}
                </td>
                <td>
                    ${wList[12].evaluateScore}
                </td>
                <td>
                    ${wList[13].evaluateScore}
                </td>
                <td>
                    ${wList[14].evaluateScore}
                </td>
                <td>
                    ${wList[10].totalScore}
                </td>
            </tr>
            <tr style="height: 150px">
                <td>评价（包括主要优点及缺陷）</td>
                <td colspan="9">
                    ${wList[10].evaluateContent}
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
</body>
</html>
