<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/14
  Time: 11:24
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
    <title>添加经理</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js" ></script>
</head>
<body>
<form class="layui-form" >
    <div style="display: flex;justify-content: center">
        <div class="layui-form">
            <div align="center">
                <div class="layui-form-item" style="margin-top: 30px">
                    <label class="layui-form-label">*姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" lay-verify="required" autocomplete="off"
                               class="layui-input" id="name">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div>
                        <input type="radio" name="sex" value="男" title="男">
                        <input type="radio" name="sex" value="女" title="女" checked>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">*登录密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" id="password" lay-verify="required|pwd" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="phone" id="phone" lay-verify="required|telephone" autocomplete="off"
                               class="layui-input">
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

        //给数据添加验证信息
        form.verify({
            pwd: [/^[\S]{3,12}$/, "密码必须3到12位，且不能出现空格"]
            ,telephone:[/^1\d{10}$/, '手机必须11位，只能是数字！']
        });

        $("#add").click(function () {
            if ($("#name").val() == null ||$("#name").val() ==""){
                layer.msg("姓名不能为空")
            }else {
                if ($("#password").val() == null ||$("#password").val() ==""){
                    layer.msg("密码不能为空")
                }else {
                    $.ajax({
                        url:"addMan",
                        type:"post",
                        data:{
                            name:$("#name").val(),
                            password:$("#password").val()
                        },
                        success:function (data) {
                            layer.msg(data);
                            setTimeout('closeAdd()',1000)
                        },
                        error:function (data) {
                            layer.msg("执行失败");
                            setTimeout('closeAdd()',1000)
                        }

                    })
                }
            }

        })

        var closeAdd = function () {
            parent.location.reload();//刷新父页面
        }
    });
</script>
</body>
</html>
