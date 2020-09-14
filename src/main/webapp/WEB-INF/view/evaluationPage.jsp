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
    <title>评价页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-table-tool-self {
            display: none;
        }

        .layui-table-cell .layui-form-checkbox[lay-skin="primary"] {
            top: 50%;
            transform: translateY(-50%)
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
        table th{
            align-content: center;
        }
    </style>
</head>
<body>
<div align="center" style="font-size: 30px">员工基本信息表</div>
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
        <tr>
            <td colspan="1">
                <input type="button" id="btn1" class="layui-btn" value="转正评价">
            </td>
            <td colspan="2">
                <input type="button" id="btn2" class="layui-btn" value="工作1年评价">
            </td>
            <td colspan="2">
                <input type="button" id="btn3" class="layui-btn" value="工作2年评价">
            </td>
            <td colspan="2">
                <input type="button" id="btn4" class="layui-btn" value="工作3年评价">
            </td>
        </tr>
    </table>
</div>
<div id="form1" style="display: none">
    <form action="">
        <table class="layui-table" >
            <thead>
            <tr>
                <th colspan="9" style="text-align: center">转正工作评价</th>
                <th>
                    <c:if test="${jobEvaluations[0].evaluatePerson ==null}">
                        <input type="button" id="revise1" class="layui-btn layui-btn-sm" value="提交">
                    </c:if>
                    <c:if test="${jobEvaluations[0].evaluatePerson !=null}">
                        已评
                    </c:if>

                </th>
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
                <td>${User.uname}</td>
                <td>${optionScore1[0].score}</td>
                <td>${optionScore1[1].score}</td>
                <td>${optionScore1[2].score}</td>
                <td>${optionScore1[3].score}</td>
                <td>${optionScore1[4].score}</td>
                <td>
                    <c:if test="${jobEvaluations[0].totalScore == null}">
                        <input type="text" class="layui-input" id="score" required autocomplete="off">
                    </c:if>
                    <c:if test="${jobEvaluations[0].totalScore != null}">
                        ${jobEvaluations[0].totalScore}
                    </c:if>
                </td>
            </tr>
            <tr style="height: 150px">
                <td>评价（包括主要优点及缺陷）</td>
                <td colspan="9">
                    <c:if test="${jobEvaluations[0].jobEvaluateContent == null}">
                        <textarea name="text" id="content" rows="20" cols="170"></textarea>
                    </c:if>
                    <c:if test="${jobEvaluations[0].jobEvaluateContent != null}">
                        ${jobEvaluations[0].jobEvaluateContent}
                    </c:if>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<script>
    layui.use(['table', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
        $ = layui.jquery;
        $("#btn1").click(function () {
            layer.open({
                type: 1,
                title: "工作评价",
                closeBtn: 1,
                shift: 2,
                area: ['80%', '75%'],
                shadeClose: true,
                content: $("#form1"),
                success: function () {
                }
            })
        });
    })
</script>
</body>
</html>
