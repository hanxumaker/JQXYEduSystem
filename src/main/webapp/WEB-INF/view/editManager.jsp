<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/14
  Time: 13:45
  To change this template use File | Settings | File Templates.
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/6
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改经理</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js" ></script>
</head>
<body>
<form class="layui-form" >
    <div style="display: flex;justify-content: center">
        <div class="layui-form">
            <div align="center">
                <div class="layui-form-item" style="margin-top: 30px">
                    <label class="layui-form-label">序号</label>
                    <div class="layui-input-inline" hidden>
                        <input type="text" name="id" lay-verify="required" autocomplete="off"
                               class="layui-input" id="id" value="${id}">
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 30px">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mname" lay-verify="required" autocomplete="off"
                               class="layui-input" id="mname" value="${mname}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block" align="left">
                        <button type="button" class="layui-btn" id="add"  lay-filter="formDemo">提交</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    layui.use('form', function(){
        var form = layui.form;
        var layer = layui.layer;
        $ = layui.jquery;

        $("#add").click(function () {
            if ($("#mname").val() == null ||$("#mname").val() ==""){
                layer.msg("姓名不能为空")
            }else {
                $.ajax({
                    url:"editMan",
                    type:"post",
                    data:{
                        id:$("#id").val(),
                        mname:$("#mname").val(),
                    },
                    success:function (data) {
                        layer.msg(data);
                    },
                    error:function (data) {
                        layer.msg("执行失败");
                    }

                })
            }

        })


    });
</script>
</body>
</html>
