<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/13
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-form-label.layui-required:after{
            content:"*";
            color:red;
            position: absolute;
            top:10px; left:45px;
        }
    </style>
</head>
<body>
<div style="margin-top: 150px">
<div style="display: flex;justify-content: center">
    <div class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">老师姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="ename" id="ename" required lay-verify="required" value="${sessionScope.tname}" readonly autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label layui-required">旧密码</label>
            <div class="layui-input-inline">
                <input type="password" name="oldPwd" id="oldPwd" placeholder="请输入密码" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label layui-required">新密码</label>
            <div class="layui-input-inline">
                <input type="password" name="newPwd" id="newPwd" placeholder="请输入密码" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="formDemo" id="update">提交</button>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    //Demo
    layui.use(['layer', 'form'], function(){
        var form = layui.form;
        var layer = layui.layer;
        form.render();
        $ = layui.jquery;
        //点击提交按钮
        $("#update").click(function (){
            if($("#oldPwd").val() != "" && $("#newPwd").val() != ""){
                $.ajax({
                    url:'updatePwd',
                    type:'post',
                    data:{
                        newPwd:$("#newPwd").val()
                    },
                    success:function (data) {
                        if(data){
                            layer.msg('修改成功,请重新登录',{icon:6});
                        }else{
                            layer.msg('修改失败');
                        }
                    },
                    error:function (data) {
                        layer.msg("执行失败");
                    }
                })
            }
            })
        })
    var closeAdd = function () {
        parent.location.reload();//刷新父页面
    }
</script>
</body>
</html>
