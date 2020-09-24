<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/9/23
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>进行工作评价页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<script>
    layui.use(['form', 'layer'], function () {
        var $ = layui.jquery;
        var dateId;
        switch (${student.state}) {
            case 9:
                $("#div").html("工作三年评价");
                dateId = 4;
                break;
            case 8:
                $("#div").html("工作两年评价");
                dateId = 3;
                break;
            case 7:
                $("#div").html("工作一年评价");
                dateId = 2;
                break;
            case 6:
                $("#div").html("转正工作评价");
                dateId = 1;
                break;
        }
    })
</script>
<div id="div" align="center" style="font-size: 28px;font-family: 华文楷体;font-weight: bold;"></div>
<div style="margin: 50px 100px 0px 450px">
    <div class="layui-form">
        <div class="layui-form-item">
            <c:forEach var="analytes" items="${aList}">
                <label class="layui-form-label">${analytes.aname}</label>
                <div class="layui-input-block">
                    <input type="text" name="evaluateScore" style="width: 100px" class="layui-input"><br>
                </div>
            </c:forEach>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">整体评价分数:</label>
            <div class="layui-input-inline">
                <input type="text" name="totalScore" id="totalScore" required lay-verify="required"
                       style="width: 100px" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">综合评价:</label>
            <div class="layui-input-inline">
            <textarea name="evaluateContent" id="evaluateContent" required lay-verify="required"
                      rows="10" cols="10" class="layui-input">
            </textarea>
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
        var evaluateScores = [];
        var dateId;//定义评价时间节点
        //通过员工当前状态确定评价时间节点是多少
        switch (${student.state}) {
            case 9:
                dateId = 4;
                break;
            case 8:
                dateId = 3;
                break;
            case 7:
                dateId = 2;
                break;
            case 6:
                dateId = 1;
                break;
        }
        $("#sub").click(function () {
            $("input[name='evaluateScore']").each(function (index) {
                var a = {};//定义一个对象,用来封装数据
                a.aid = ${aList.get(index).id};//获取评分项的id
                a.evaluateScore = $(this).val();//获取分数
                evaluateScores[index] = a;//把对象给数组
                if (a.evaluateScore === "" || $("#totalScore").val() === "" || $("#evaluateContent").val() === "") {
                    layer.msg("信息填写不完整,不能提交", {icon: 2, time: 2000});
                    return false;
                } else {
                    layer.confirm('确定提交吗?提交后将不能修改', {icon: 3, title: '提示'}, function () {
                        $.ajax({
                            url: "addWorkEvaluate",
                            type: "post",
                            data: {
                                sid: '${student.sid}',
                                evaluatePerson: '${sessionScope.User.uname}',
                                totalScore: $("#totalScore").val(),
                                evaluateContent: $("#evaluateContent").val(),
                                state: '${student.state}',
                                evaluateScores: JSON.stringify(evaluateScores),
                                dateId: dateId
                            },
                            success: function (data) {
                                layer.msg(data, {icon: 6, time: 3000}, function () {
                                    location.href = "toCheckEvaluation?sid=" + '${student.sid}'
                                });
                            },
                            error: function (data) {
                                layer.msg(data, {icon: 2, time: 2000});
                            }
                        })
                    })
                }
            });

        });
        $("input[name='evaluateScore']").blur(function () {
            $("input[name='evaluateScore']").each(function (index) {
                evaluateScores[index] = $(this).val();//获取每个input框的值
                var reg = /^[0-5]$/;
                if (evaluateScores[index] === "" || !reg.test(evaluateScores[index])) {
                    layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
                }
            });
        });
        $("#totalScore").blur(function () {
            var reg = /^[0-5]$/;
            if ($("#totalScore").val() === "" || !reg.test($("#totalScore").val())) {
                layer.msg("5分制，成绩必须为0-5之间的数字且不能为空", {icon: 2, time: 2000});
            }
        });
    })
</script>
</body>

</html>
