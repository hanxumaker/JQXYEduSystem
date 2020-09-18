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
    <title>评价页面</title>
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

        .div {
            float: left;
            display: none;
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
    </table>
    <div id="div" style="float: left">
        <input type="button" id="btn" class="layui-btn" value="学校评价">
    </div>
    <div id="div1" class="div">
        <input type="button" id="btn1" class="layui-btn" value="转正评价">
    </div>
    <div id="div2" class="div">
        <input type="button" id="btn2" class="layui-btn" value="工作一年评价">
    </div>
    <div id="div3" class="div">
        <input type="button" id="btn3" class="layui-btn" value="工作两年评价">
    </div>
    <div id="div4" class="div">
        <input type="button" id="btn4" class="layui-btn" value="工作三年评价">
    </div>
</div>
<script>
    //控制工作评价按钮的显示与隐藏
    layui.use(['table', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
        $ = layui.jquery;
        switch (${student.state}) {
            case 9:
                $(".div").show();
                break;
            case 8:
                $("#div1").show();
                $("#div2").show();
                $("#div3").show();
                break;
            case 7:
                $("#div1").show();
                $("#div2").show();
                break;
            case 6:
                $("#div1").show();
                break;
        }
        //控制提交按钮的隐藏
        if (${wList[0].totalScore == null}) {
            $("#revise1").show();
        }
        if (${wList[5].totalScore == null}) {
            $("#revise2").show();
        }
        if (${wList[10].totalScore == null}) {
            $("#revise3").show();
        }
        if (${wList[15].totalScore == null}) {
            $("#revise4").show();
        }
    })
</script>
<div id="form" style="display: none">
    <form>
        <table class="layui-table">
            <thead>
            <tr>
                <th colspan="10" style="text-align: center">学校评价</th>
            </tr>
            <tr>
                <th rowspan="2">培训学校</th>
                <th rowspan="2">班期</th>
                <th rowspan="2">评价人</th>
                <th style="text-align: center" colspan="6">培训期间测试成绩</th>
                <th rowspan="2">整体评价分数</th>
            </tr>
            <tr>
                <th>HTML笔试</th>
                <th>oracle笔试</th>
                <th>JS笔试</th>
                <th>java基础笔试</th>
                <th>java高级笔试</th>
                <th>L1面试</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>学习评价</td>
                <td>${sList.get(0).get("classname")}</td>
                <td>${sList.get(0).get("tname")}</td>
                <td>${sList.get(0).get("score")}</td>
                <td>${sList.get(1).get("score")}</td>
                <td>${sList.get(2).get("score")}</td>
                <td>${sList.get(3).get("score")}</td>
                <td>${sList.get(4).get("score")}</td>
                <td>${sList.get(5).get("score")}</td>
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
                <th colspan="9" style="text-align: center">转正工作评价</th>
                <th>
                    <input style="display: none;align-self: center" type="button"
                           id="revise1" class="layui-btn layui-btn-sm" value="提交">
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
                <td>
                    <c:if test="${wList[0].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score0" required>
                    </c:if>
                    <c:if test="${wList[0].evaluateScore != null}">
                        ${wList[0].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[1].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score1" required>
                    </c:if>
                    <c:if test="${wList[1].evaluateScore != null}">
                        ${wList[1].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[2].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score2" required>
                    </c:if>
                    <c:if test="${wList[2].evaluateScore != null}">
                        ${wList[2].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[3].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score3" required>
                    </c:if>
                    <c:if test="${wList[3].evaluateScore != null}">
                        ${wList[3].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[4].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score4" required>
                    </c:if>
                    <c:if test="${wList[4].evaluateScore != null}">
                        ${wList[4].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[0].totalScore == null}">
                        <input type="text" class="layui-input" id="totalScore" required>
                    </c:if>
                    <c:if test="${wList[0].totalScore != null}">
                        ${wList[0].totalScore}
                    </c:if>
                </td>
            </tr>
            <tr style="height: 150px">
                <td>评价（包括主要优点及缺陷）</td>
                <td colspan="9">
                    <c:if test="${wList[0].evaluateContent == null}">
                        <textarea type="text" id="evaluateContent" required></textarea>
                    </c:if>
                    <c:if test="${wList[0].evaluateContent != null}">
                        ${wList[0].evaluateContent}
                    </c:if>
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
                <th colspan="9" style="text-align: center">工作1年评价</th>
                <th>
                    <input type="button" style="display: none" id="revise2" class="layui-btn layui-btn-sm" value="提交">
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
                <td>
                    <c:if test="${wList[5].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score0" required>
                    </c:if>
                    <c:if test="${wList[5].evaluateScore != null}">
                        ${wList[5].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[6].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score1" required>
                    </c:if>
                    <c:if test="${wList[6].evaluateScore != null}">
                        ${wList[6].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[7].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score2" required>
                    </c:if>
                    <c:if test="${wList[7].evaluateScore != null}">
                        ${wList[7].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[8].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score3" required>
                    </c:if>
                    <c:if test="${wList[8].evaluateScore != null}">
                        ${wList[8].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[9].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score4" required>
                    </c:if>
                    <c:if test="${wList[9].evaluateScore != null}">
                        ${wList[9].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[5].totalScore == null}">
                        <input type="text" class="layui-input" id="totalScore" required>
                    </c:if>
                    <c:if test="${wList[5].totalScore != null}">
                        ${wList[5].totalScore}
                    </c:if>
                </td>
            </tr>
            <tr style="height: 150px">
                <td>评价（包括主要优点及缺陷）</td>
                <td colspan="9">
                    <c:if test="${wList[5].evaluateContent == null}">
                        <textarea name="text" id="evaluateContent" rows="20" cols="170" required></textarea>
                    </c:if>
                    <c:if test="${wList[5].evaluateContent != null}">
                        ${wList[5].evaluateContent}
                    </c:if>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<div id="form3" style="display: none" ;>
    <form action="">
        <table class="layui-table">
            <thead>
            <tr>
                <th colspan="9" style="text-align: center">工作2年评价</th>
                <th>
                    <input type="button" style="display: none" id="revise3" class="layui-btn layui-btn-sm" value="提交">
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
                <td>
                    <c:if test="${wList[10].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score0" required>
                    </c:if>
                    <c:if test="${wList[10].evaluateScore != null}">
                        ${wList[10].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[11].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score1" required>
                    </c:if>
                    <c:if test="${wList[11].evaluateScore != null}">
                        ${wList[11].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[12].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score2" required>
                    </c:if>
                    <c:if test="${wList[12].evaluateScore != null}">
                        ${wList[12].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[13].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score3" required>
                    </c:if>
                    <c:if test="${wList[13].evaluateScore != null}">
                        ${wList[13].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[14].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score4" required>
                    </c:if>
                    <c:if test="${wList[14].evaluateScore != null}">
                        ${wList[14].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[10].totalScore == null}">
                        <input type="text" class="layui-input" id="totalScore" required>
                    </c:if>
                    <c:if test="${wList[10].totalScore != null}">
                        ${wList[10].totalScore}
                    </c:if>
                </td>
            </tr>
            <tr style="height: 150px">
                <td>评价（包括主要优点及缺陷）</td>
                <td colspan="9">
                    <c:if test="${wList[10].evaluateContent == null}">
                        <textarea name="text" id="evaluateContent" rows="20" cols="170" required></textarea>
                    </c:if>
                    <c:if test="${wList[10].evaluateContent != null}">
                        ${wList[10].evaluateContent}
                    </c:if>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<div id="form4" style="display: none">
    <form action="">
        <table class="layui-table">
            <thead>
            <tr>
                <th colspan="9" style="text-align: center">工作3年评价</th>
                <th>
                    <input type="button" style="display: none" id="revise4" class="layui-btn layui-btn-sm" value="提交">
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
                <td>
                    <c:if test="${wList[15].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score0" required>
                    </c:if>
                    <c:if test="${wList[15].evaluateScore != null}">
                        ${wList[15].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[16].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score1" required>
                    </c:if>
                    <c:if test="${wList[16].evaluateScore != null}">
                        ${wList[16].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[17].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score2" required>
                    </c:if>
                    <c:if test="${wList[17].evaluateScore != null}">
                        ${wList[17].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[18].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score3" required>
                    </c:if>
                    <c:if test="${wList[18].evaluateScore != null}">
                        ${wList[18].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[19].evaluateScore == null}">
                        <input type="text" class="layui-input" id="score4" required>
                    </c:if>
                    <c:if test="${wList[19].evaluateScore != null}">
                        ${wList[19].evaluateScore}
                    </c:if>
                </td>
                <td>
                    <c:if test="${wList[15].totalScore == null}">
                        <input type="text" class="layui-input" id="totalScore" required>
                    </c:if>
                    <c:if test="${wList[15].totalScore != null}">
                        ${wList[15].totalScore}
                    </c:if>
                </td>
            </tr>
            <tr style="height: 150px">
                <td>评价（包括主要优点及缺陷）</td>
                <td colspan="9">
                    <c:if test="${wList[15].evaluateContent == null}">
                        <textarea name="text" id="evaluateContent" rows="20" cols="170" required></textarea>
                    </c:if>
                    <c:if test="${wList[15].evaluateContent != null}">
                        ${wList[15].evaluateContent}
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
        $("#btn").click(function () {
            layer.open({
                type: 1,
                title: "学校评价",
                closeBtn: 1,
                shift: 2,
                area: ['80%', '75%'],
                shadeClose: true,
                content: $("#form"),
            });
        });
        $("#btn1").click(function () {
            layer.open({
                type: 1,
                title: "转正工作评价",
                closeBtn: 1,
                shift: 2,
                area: ['90%', '85%'],
                shadeClose: true,
                content: $("#form1"),
                success: function () {
                    $("#score0").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score0").val() == "" || !reg.test($("#score0").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score1").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score1").val() == "" || !reg.test($("#score1").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score2").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score2").val() == "" || !reg.test($("#score2").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score3").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score3").val() == "" || !reg.test($("#score3").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score4").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score4").val() == "" || !reg.test($("#score4").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#revise1").click(function () {
                        if ($("#score0").val() == "" || $("#score1").val() == "" || $("#score2").val() == "" ||
                            $("#score3").val() == "" || $("#score4").val() == "" || $("#totalScore").val() == "" ||
                            $("#evaluateContent").val() == "") {
                            layer.msg("成绩或综合评语不能为空", {icon: 2, time: 2000});
                            return false;
                        }
                        layer.confirm('确定提交吗?提交后将不能修改', {icon: 3, title: '提示'}, function () {
                            $.ajax({
                                type: 'get'
                                , url: '/addWorkEvaluate'
                                , data: {
                                    score0: $("#score0").val(),
                                    score1: $("#score1").val(),
                                    score2: $("#score2").val(),
                                    score3: $("#score3").val(),
                                    score4: $("#score4").val(),
                                    totalScore: $("#totalScore").val(),
                                    sid: '${student.sid}',
                                    evaluatePerson: '${User.uname}',
                                    evaluateContent: $("#evaluateContent").val(),
                                    dateId: 1,
                                    state: '${student.state}'//员工当前状态
                                }
                                , success: function (data) {
                                    layer.msg(data, {icon: 6, time: 3000}, function () {
                                        location.href = "toEvaluationPage?sid=" + '${student.sid}'
                                    });
                                },
                                error: function (data) {
                                    layer.msg(data, {icon: 2, time: 2000});
                                }
                            });
                        });
                    })
                }
            })
        });
        $("#btn2").click(function () {
            layer.open({
                type: 1,
                title: "工作一年评价",
                closeBtn: 1,
                shift: 2,
                area: ['90%', '85%'],
                shadeClose: true,
                content: $("#form2"),
                success: function () {
                    $("#score0").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score0").val() == "" || !reg.test($("#score0").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score1").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score1").val() == "" || !reg.test($("#score1").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score2").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score2").val() == "" || !reg.test($("#score2").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score3").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score3").val() == "" || !reg.test($("#score3").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score4").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score4").val() == "" || !reg.test($("#score4").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#revise2").click(function () {
                        if ($("#score0").val() == "" || $("#score1").val() == "" || $("#score2").val() == "" ||
                            $("#score3").val() == "" || $("#score4").val() == "" || $("#totalScore").val() == "" ||
                            $("#evaluateContent").val() == "") {
                            layer.msg("成绩或综合评语不能为空", {icon: 2, time: 2000});
                            return false;
                        }
                        layer.confirm('确定提交吗?提交后将不能修改', {icon: 3, title: '提示'}, function () {
                            $.ajax({
                                type: 'get'
                                , url: '/addWorkEvaluate'
                                , data: {
                                    score0: $("#score0").val(),
                                    score1: $("#score1").val(),
                                    score2: $("#score2").val(),
                                    score3: $("#score3").val(),
                                    score4: $("#score4").val(),
                                    totalScore: $("#totalScore").val(),
                                    sid: '${student.sid}',
                                    evaluatePerson: '${User.uname}',
                                    evaluateContent: $("#evaluateContent").val(),
                                    dateId: 2,
                                    state: '${student.state}'//员工当前状态
                                }
                                , success: function (data) {
                                    layer.msg(data, {icon: 6, time: 3000}, function () {
                                        location.href = "toEvaluationPage?sid=" + '${student.sid}'
                                    });
                                },
                                error: function (data) {
                                    layer.msg(data, {icon: 2, time: 2000});
                                }
                            });
                        });
                    })
                }
            })
        });
        $("#btn3").click(function () {
            layer.open({
                type: 1,
                title: "工作两年评价",
                closeBtn: 1,
                shift: 2,
                area: ['90%', '85%'],
                shadeClose: true,
                content: $("#form3"),
                success: function () {
                    $("#score0").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score0").val() == "" || !reg.test($("#score0").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score1").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score1").val() == "" || !reg.test($("#score1").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score2").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score2").val() == "" || !reg.test($("#score2").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score3").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score3").val() == "" || !reg.test($("#score3").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score4").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score4").val() == "" || !reg.test($("#score4").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#revise3").click(function () {
                        if ($("#score0").val() == "" || $("#score1").val() == "" || $("#score2").val() == "" ||
                            $("#score3").val() == "" || $("#score4").val() == "" || $("#totalScore").val() == "" ||
                            $("#evaluateContent").val() == "") {
                            layer.msg("成绩或综合评语不能为空", {icon: 2, time: 2000});
                            return false;
                        }
                        layer.confirm('确定提交吗?提交后将不能修改', {icon: 3, title: '提示'}, function () {
                            $.ajax({
                                type: 'get'
                                , url: '/addWorkEvaluate'
                                , data: {
                                    score0: $("#score0").val(),
                                    score1: $("#score1").val(),
                                    score2: $("#score2").val(),
                                    score3: $("#score3").val(),
                                    score4: $("#score4").val(),
                                    totalScore: $("#totalScore").val(),
                                    sid: '${student.sid}',
                                    evaluatePerson: '${User.uname}',
                                    evaluateContent: $("#evaluateContent").val(),
                                    dateId: 3,
                                    state:'${student.state}'//员工当前状态
                                }
                                , success: function (data) {
                                    layer.msg(data,{icon:6,time:3000},function () {
                                        location.href = "toEvaluationPage?sid=" + '${student.sid}'
                                    });
                                },
                                error: function (data) {
                                    layer.msg(data,{icon:2,time:2000});
                                }
                            });
                        });
                    })
                }
            })
        });
        $("#btn4").click(function () {
            layer.open({
                type: 1,
                title: "工作三年评价",
                closeBtn: 1,
                shift: 2,
                area: ['90%', '85%'],
                shadeClose: true,
                content: $("#form4"),
                success: function () {
                    $("#score0").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score0").val() == "" || !reg.test($("#score0").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score1").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score1").val() == "" || !reg.test($("#score1").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score2").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score2").val() == "" || !reg.test($("#score2").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score3").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score3").val() == "" || !reg.test($("#score3").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#score4").blur(function () {
                        var reg = /^[0-5]$/;
                        if ($("#score4").val() == "" || !reg.test($("#score4").val())) {
                            layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                        }
                    });
                    $("#revise4").click(function () {
                        if ($("#score0").val() == "" || $("#score1").val() == "" || $("#score2").val() == "" ||
                            $("#score3").val() == "" || $("#score4").val() == "" || $("#totalScore").val() == "" ||
                            $("#evaluateContent").val() == "") {
                            layer.msg("成绩或综合评语不能为空", {icon: 2, time: 2000});
                            return false;
                        }
                        layer.confirm('确定提交吗?提交后将不能修改', {icon: 3, title: '提示'}, function () {
                            $.ajax({
                                type: 'get'
                                , url: '/addWorkEvaluate'
                                , data: {
                                    score0: $("#score0").val(),
                                    score1: $("#score1").val(),
                                    score2: $("#score2").val(),
                                    score3: $("#score3").val(),
                                    score4: $("#score4").val(),
                                    totalScore: $("#totalScore").val(),
                                    sid: '${student.sid}',
                                    evaluatePerson: '${User.uname}',
                                    evaluateContent: $("#evaluateContent").val(),
                                    dateId: 4,
                                    state:'${student.state}'//员工当前状态
                                }
                                , success: function (data) {
                                    layer.msg(data,{icon:6,time:3000},function () {
                                        location.href = "toEvaluationPage?sid=" + '${student.sid}'
                                    });
                                },
                                error: function (data) {
                                    layer.msg(data,{icon:2,time:2000});
                                }
                            });
                        });
                    })
                }
            })
        })
    })
</script>
</body>
</html>
